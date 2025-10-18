import { Component, OnInit, inject, computed, signal } from '@angular/core';
import { ActivatedRoute, RouterModule } from '@angular/router';
import { SetsService } from '../../../../services/sets.service';
import { Set } from '../../../../interfaces/set';
import { Carta } from '../../../../interfaces/carta';
import { SHARED_IMPORTS } from '../../../../reutilizable/shared.imports';

@Component({
	selector: 'app-cartas',
	standalone: true,
	imports: [
		...SHARED_IMPORTS,
		RouterModule
	],
	templateUrl: './cartas.html',
	styleUrls: ['./cartas.css'],
})
export class CartasComponent implements OnInit {
	private route = inject(ActivatedRoute);
	private setsService = inject(SetsService);

	idSet = 0;

	// estado
	loading = signal<boolean>(true);
	set = signal<Set | null>(null);

	// filtros (signals)
	searchTerm = signal<string>('');
	rareza = signal<string | 'todas'>('todas');

	// cartas filtradas
	filteredCartas = computed<Carta[]>(() => {
		const s = this.set();
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

		this.loadSet();
	}

	private loadSet() {
		this.loading.set(true);
		this.setsService.GetSetById(this.idSet).subscribe({
			next: (res) => {
				if (res?.status) {
					this.set.set(res.value as Set);
				} else {
					console.error('Error al cargar el set');
					this.set.set(null);
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
}
