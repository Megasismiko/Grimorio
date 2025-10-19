import { Component, Inject, inject, signal, computed, OnInit, ViewChild, ElementRef } from '@angular/core';
import { MAT_DIALOG_DATA, MatDialogRef } from '@angular/material/dialog';
import { SHARED_IMPORTS } from '../../../../reutilizable/shared.imports';
import { Set } from '../../../../interfaces/set';
import { CatalogoService } from '../../../../services/catalogo/catalogo.service';
import { from, of, Subject } from 'rxjs';
import { concatMap, catchError, finalize, tap, switchMap } from 'rxjs/operators';
import { SetsService } from '../../../../services/sets.service';
import { CartasService } from '../../../../services/cartas.service';


export interface ImportarDialogData {
	sets: Set[];
	onSetProcessed?: Subject<void>;
}

export type SetProcessedEvent = void;

@Component({
	selector: 'app-modal-progreso-importacion',
	standalone: true,
	imports: [...SHARED_IMPORTS],
	templateUrl: './modal-progreso-importacion.html',
	styleUrls: ['./modal-progreso-importacion.css']
})

export class ModalProgresoImportacion implements OnInit {


	private dialogRef = inject(MatDialogRef<ModalProgresoImportacion>);
	private catalogo = inject(CatalogoService);
	private setsApi = inject(SetsService);
	private cartasApi = inject(CartasService);

	@ViewChild('logBox') logBox!: ElementRef<HTMLDivElement>;

	sets: Set[] = [];
	totalSets = 0;

	constructor(@Inject(MAT_DIALOG_DATA) public data: ImportarDialogData) {
		this.sets = data.sets ?? [];
		this.totalSets = this.sets.length;
	}

	currentIndex = signal(0);
	completedSets = signal(0);
	currentSetNombre = signal<string>('');
	currentSetCodigo = signal<string>('');
	currentSetProgress = signal<number>(0); // % dentro del set
	overallProgress = computed(() => {
		if (!this.totalSets) return 100;
		const done = this.completedSets();            // sets ya completados (1-based efectivo)
		const part = this.currentSetProgress() / 100; // fracción del set actual
		return Math.round(((done + part) / this.totalSets) * 100);
	});

	logs = signal<string[]>([]);
	isRunning = signal(false);
	isDone = signal(false);
	hadErrors = signal(false);

	ngOnInit() {
		this.run();
	}

	private run() {
		if (!this.totalSets) { this.isDone.set(true); return; }

		this.isRunning.set(true);
		this.logs.set([]);

		from(this.sets).pipe(
			concatMap((set, idx) =>
				this.procesarSet(set, idx).pipe(
					catchError(err => {
						this.hadErrors.set(true);
						this.log(`✖ Error en ${set.codigo}: ${err?.message || err}`);
						this.data.onSetProcessed?.next();
						this.completedSets.update(n => n + 1);
						return of(null);
					})
				)
			),
			finalize(() => {
				this.isRunning.set(false);
				this.isDone.set(true);
				this.log(this.hadErrors() ? 'Finalizado con incidencias.' : 'Importación completada.');
				this.scrollLogsBottom();
			})
		).subscribe();
	}


	private procesarSet(set: Set, idx: number) {
		this.currentIndex.set(idx);
		this.currentSetNombre.set(set.nombre);
		this.currentSetCodigo.set(set.codigo);
		this.currentSetProgress.set(0);
		this.log(`Procesando set ${set.nombre} [${set.codigo}]…`);

		return this.crearSet(set).pipe(
			switchMap((idSet) => {
				this.log(`→ Set listo (Id=${idSet}). Descargando cartas desde Scryfall…`);

				return this.catalogo.GetCartasSet(set.codigo).pipe(
					switchMap((cartas) => {
						const payload = (cartas ?? []).map(c => ({ ...c, idSet }));
						const total = payload.length;

						this.log(`→ ${total} cartas obtenidas. Enviando a la API en lotes…`);
						if (total === 0) {
							this.currentSetProgress.set(100);
							return of(true);
						}

						const batches = this.chunk(payload, 200);
						let enviados = 0;

						return from(batches).pipe(
							concatMap(batch =>
								this.cartasApi.CrearLote(batch).pipe(
									tap((ok) => {
										if (ok) {
											enviados += batch.length;
											const p = Math.round((enviados / total) * 100);
											this.currentSetProgress.set(p);
										}
									})
								)
							),
							finalize(() => {
								// por si quedó en 99% por redondeos
								this.currentSetProgress.set(100);
								this.log(`✓ Set ${set.codigo} completado (${enviados}/${total}).`);
								this.data.onSetProcessed?.next();
								this.completedSets.update(n => n + 1);
							})
						);
					})
				);
			})
		);
	}



	private crearSet(set: Set) {
		return this.setsApi.Crear(set).pipe(
			switchMap((res) => {
				if (res.status === false) throw new Error(res.msg || 'Error creando set');
				const id = res.value?.idSet;
				if (!id) throw new Error('El backend no devolvió IdSet.');
				return of(id);
			})
		);
	}

	// utils
	private chunk<T>(arr: T[], size: number): T[][] {
		if (size <= 0) return [arr];
		const out: T[][] = [];
		for (let i = 0; i < arr.length; i += size) out.push(arr.slice(i, i + size));
		return out;
	}

	private log(msg: string) {
		this.logs.update(x => [...x, msg]);
		this.scrollLogsBottom();
	}

	private scrollLogsBottom() {
		queueMicrotask(() => {
			const el = this.logBox?.nativeElement;
			if (el) el.scrollTop = el.scrollHeight;
		});
	}

	cerrar() { this.dialogRef.close(); }
}
