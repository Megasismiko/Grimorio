import { AfterViewInit, Component, Inject, ViewChild, inject, signal } from '@angular/core';
import { MAT_DIALOG_DATA, MatDialogRef } from '@angular/material/dialog';
import { SHARED_IMPORTS } from '../../../../reutilizable/shared.imports';
import { CatalogoService } from '../../../../services/catalogo/catalogo.service';
import { MatTableDataSource } from '@angular/material/table';
import { SelectionModel } from '@angular/cdk/collections';
import { MatPaginator } from '@angular/material/paginator';
import { MatSort } from '@angular/material/sort';
import { Carta } from '../../../../interfaces/carta';

export interface CartasSetDialogData {
	codigo: string;
	id: number;
	nombre: string;
}

@Component({
	selector: 'app-modal-catalogo-cartas-set',
	standalone: true,
	imports: [...SHARED_IMPORTS],
	templateUrl: './modal-catalogo-cartas-set.html',
	styleUrls: ['./modal-catalogo-cartas-set.css']
})
export class ModalCatalogoCartasSet implements AfterViewInit {

	private dialogRef = inject(MatDialogRef<ModalCatalogoCartasSet>);
	private catalogoService = inject(CatalogoService);


	displayedColumns: string[] = ['select', 'imagen', 'numero', 'nombre', 'tipo', 'rareza'];
	dataSource = new MatTableDataSource<Carta>([]);
	selection = new SelectionModel<Carta>(true, []);

	filtro = '';
	loading = signal(true);
	errorMsg = signal('');

	@ViewChild(MatPaginator) paginator!: MatPaginator;
	@ViewChild(MatSort) sort!: MatSort;

	constructor(@Inject(MAT_DIALOG_DATA) public data: CartasSetDialogData) { }

	ngAfterViewInit(): void {
		this.dataSource.filterPredicate = (row, filter) => {
			const t = (filter ?? '').trim().toLowerCase();
			return (
				(row.nombre ?? '').toLowerCase().includes(t) ||
				(row.numero ?? '').toLowerCase().includes(t) ||
				(row.rareza ?? '').toLowerCase().includes(t)
			);
		};

		this.cargarCartas();
	}

	private cargarCartas(): void {
		this.loading.set(true);
		this.errorMsg.set('');

		const setCode = (this.data.codigo ?? '').trim();
		if (!setCode) {
			this.errorMsg.set('Código de set no proporcionado.');
			this.loading.set(false);
			return;
		}

		this.catalogoService.GetCartasSet(setCode).subscribe({
			next: (cards) => {
				const visibles = (cards ?? []).filter(c => (c.nombre ?? '').trim().length > 0);
				this.dataSource.data = visibles;

				this.dataSource.paginator = this.paginator;
				this.dataSource.sort = this.sort;

				if (this.sort) {
					// por defecto ordenamos por número ascendente
					this.sort.active = 'numero';
					this.sort.direction = 'asc';
					this.sort.sortChange.emit({ active: 'numero', direction: 'asc' });
				}

				this.loading.set(false);
			},
			error: (err) => {
				console.error(err);
				this.errorMsg.set('No se pudieron cargar las cartas del set.');
				this.loading.set(false);
			}
		});
	}

	aplicarFiltro(valor: string) {
		this.dataSource.filter = (valor ?? '').trim().toLowerCase();
		if (this.dataSource.paginator) this.dataSource.paginator.firstPage();
	}

	// selección
	isAllSelected(): boolean {
		const numSelected = this.selection.selected.length;
		const numRows = this.dataSource.filteredData.length;
		return numSelected === numRows && numRows > 0;
	}

	masterToggle(): void {
		if (this.isAllSelected()) this.selection.clear();
		else this.selection.select(...this.dataSource.filteredData);
	}

	checkboxLabel(row?: Carta): string {
		if (!row) return `${this.isAllSelected() ? 'deseleccionar' : 'seleccionar'} todas`;
		return `${this.selection.isSelected(row) ? 'deseleccionar' : 'seleccionar'} ${row.nombre}`;
	}

	trackById = (_: number, item: Carta) => item.idCarta;

	// imagen miniatura
	getThumbUrl(card: Carta): string | undefined {
		return card.imagenUrl || undefined;
	}

	confirmar(): void {
		this.dialogRef.close(this.selection.selected.map(s => {
			s.idSet = this.data.id;
			return s;
		}));
	}

	cancelar(): void {
		this.dialogRef.close(null);
	}
}
