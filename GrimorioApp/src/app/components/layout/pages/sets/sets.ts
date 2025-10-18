import { ChangeDetectorRef, Component, OnInit, computed, signal } from '@angular/core';
import { SHARED_IMPORTS } from '../../../../reutilizable/shared.imports';
import { SetsService } from '../../../../services/sets.service';
import { Set } from '../../../../interfaces/set';
import { FormControl } from '@angular/forms';
import { debounceTime, startWith } from 'rxjs/operators';
import { RouterModule } from '@angular/router';
import { MatProgressSpinnerModule } from '@angular/material/progress-spinner';
import { ModalSet } from '../../modals/modal-set/modal-set';
import { MatDialog } from '@angular/material/dialog';
import Swal from 'sweetalert2';
import { UtilidadService } from '../../../../reutilizable/utilidad.service';

@Component({
	standalone: true,
	selector: 'app-sets',
	imports: [
		...SHARED_IMPORTS,
		RouterModule,
		MatProgressSpinnerModule
	],
	templateUrl: './sets.html',
	styleUrl: './sets.css'
})
export class SetsComponent implements OnInit {

	sets: Set[] = [];
	isLoading = false;


	filterCtrl = new FormControl('', { nonNullable: true });

	private setsSignal = signal<Set[]>([]);

	filterText = signal<string>('');

	filteredSets = computed(() => {
		const q = this.filterText().trim().toLowerCase();
		if (!q) return this.setsSignal();
		return this.setsSignal().filter(s =>
			(s.nombre?.toLowerCase().includes(q)) ||
			(s.codigo?.toLowerCase().includes(q))
		);
	});

	constructor(
		private setsService: SetsService,
		private cdr: ChangeDetectorRef,
		private dialog: MatDialog,
		private utilidadService: UtilidadService
	) { }

	ngOnInit(): void {
		this.isLoading = true;
		this.Obtener();
		this.filterCtrl.valueChanges
			.pipe(startWith(this.filterCtrl.value), debounceTime(200))
			.subscribe(v => this.filterText.set(v ?? ''));
	}

	private Obtener() {
		this.setsService.GetSets().subscribe({
			next: res => {
				if (res.status) {
					this.sets = res.value;
					this.setsSignal.set(this.sets);
				}
				this.isLoading = false;
				this.cdr.detectChanges();
			},
			error: err => {
				console.log(err);
				this.isLoading = false;
				this.cdr.detectChanges();
			}
		});
	}

	trackById = (_: number, item: Set) => item.idSet;

	public Crear() {
		this.dialog.open(ModalSet, {
			disableClose: true
		}).afterClosed().subscribe(res => {
			if (res) this.Obtener();
		});
	}

	public Editar(set: Set) {
		this.dialog.open(ModalSet, {
			disableClose: true,
			data: set
		}).afterClosed().subscribe(res => {
			if (res) this.Obtener();
		});
	}

	public Eliminar(set: Set) {
		Swal.fire({
			title: '¿Desea eliminar el set?',
			text: set.nombre,
			icon: 'warning',
			confirmButtonColor: '#3085d6',
			confirmButtonText: 'Eliminar',
			showCancelButton: true,
			cancelButtonColor: '#d33',
			cancelButtonText: 'Cancelar'
		}).then(res => {
			if (res.isConfirmed) {
				this.setsService.Eliminar(set.idSet).subscribe({
					next: res => {
						if (res.status) {
							this.utilidadService.MostarAlerta('set eliminado', 'Success');
							this.Obtener();
						} else {
							this.utilidadService.MostarAlerta('No se puedo eliminar el set', 'Error');
						}
					},
					error: err => console.log(err)
				})
			}
		})
	}

}
