import { Component, OnInit, inject, computed, signal, Inject } from '@angular/core';
import { ActivatedRoute, RouterModule } from '@angular/router';
import { SetsService } from '../../../../services/sets.service';
import { Set } from '../../../../interfaces/set';
import { Carta } from '../../../../interfaces/carta';
import { SHARED_IMPORTS } from '../../../../reutilizable/shared.imports';
import { CabeceraSetComponent } from '../../../reutilizable/cabecera-set/cabecera-set';
import { CatalogoService } from '../../../../services/catalogo/catalogo.service';
import { CartasService } from '../../../../services/cartas.service';
import { ModalCatalogoCartasSet } from '../../modals/modal-catalogo-cartas-set/modal-catalogo-cartas-set';
import { MatDialog } from '@angular/material/dialog';


@Component({
	selector: 'app-cartas',
	standalone: true,
	imports: [
		...SHARED_IMPORTS,
		RouterModule,
		CabeceraSetComponent
	],
	templateUrl: './cartas.html',
	styleUrls: ['./cartas.css'],
})
export class CartasComponent implements OnInit {
	private route = inject(ActivatedRoute);
	private setsService = inject(SetsService);
	private cartasService = inject(CartasService);
	private dialog = inject(MatDialog);
	idSet = 0;

	// estado
	loading = signal<boolean>(true);
	setSignal = signal<Set | null>(null);

	// filtros (signals)
	searchTerm = signal<string>('');
	rareza = signal<string | 'todas'>('todas');

	// cartas filtradas
	filteredCartas = computed<Carta[]>(() => {
		const s = this.setSignal();
		if (!s?.cartas) return [];
		const term = this.searchTerm().trim().toLowerCase();
		const rareza = this.rareza();

		return s.cartas.filter(c => {
			const matchesText =
				!term ||
				(c.nombre ?? '').toLowerCase().includes(term) ||
				(c.tipo ?? '').toLowerCase().includes(term) ||
				(c.rareza ?? '').toLowerCase().includes(term);

			const matchesRareza =
				rareza === 'todas' || (c.rareza ?? '').toLowerCase() === rareza?.toLowerCase();

			return matchesText && matchesRareza;
		});
	});

	ngOnInit() {
		const idParam = this.route.snapshot.paramMap.get('idSet');
		this.idSet = Number(idParam);

		if (isNaN(this.idSet)) {
			console.error('idSet inválido en la ruta');
			this.loading.set(false);
			return;
		}
		this.Obtener();
	}

	private Obtener() {
		this.loading.set(true);
		this.setsService.GetSetById(this.idSet).subscribe({
			next: (res) => {
				if (res?.status) {
					this.setSignal.set(res.value as Set);
				} else {
					console.error('Error al cargar el set');
					this.setSignal.set(null);
				}
				this.loading.set(false);
			},
			error: (err) => {
				console.error(err);
				this.loading.set(false);
			},
		});
	}

	// util para *ngFor
	trackByCarta = (_: number, c: Carta) => c.idCarta;


	public Catalogo() {
		const set = this.setSignal();
		if (set) {
			this.dialog.open(ModalCatalogoCartasSet, {
				disableClose: true,
				width: '90vw',
				maxWidth: '1200px',
				height: 'auto',
				data: {
					codigo: set.codigo,
					id: set.idSet,
					nombre: set.nombre
				}
			}).afterClosed().subscribe((cartas: Carta[]) => {
				if (cartas) {
					this.cartasService.CrearLote(cartas).subscribe({
						next: ok => {
							if (ok) {
								this.Obtener();
							}
						},
						error: err => {
							console.error(err);
						}
					});
				}
			});
		}


	}
}

