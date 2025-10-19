import { Component, inject, ViewChild, AfterViewInit } from '@angular/core';
import { MatDialogRef } from '@angular/material/dialog';
import { MatTableDataSource } from '@angular/material/table';
import { MatPaginator } from '@angular/material/paginator';
import { MatSort } from '@angular/material/sort';
import { SelectionModel } from '@angular/cdk/collections';
import { CatalogoService } from '../../../../services/catalogo/catalogo.service';
import { SHARED_IMPORTS } from '../../../../reutilizable/shared.imports';
import { Set } from '../../../../interfaces/set';

@Component({
	selector: 'app-modal-catalogo-sets',
	standalone: true,
	imports: [
		...SHARED_IMPORTS
	],
	styleUrls: ['./modal-catalogo-sets.css'],
	templateUrl: './modal-catalogo-sets.html',
})
export class ModalCatalogoSets implements AfterViewInit {

	private dialogRef = inject(MatDialogRef<ModalCatalogoSets>);
	private catalogoService = inject(CatalogoService);

	filtro = '';

	displayedColumns: string[] = ['select', 'logo', 'codigo', 'nombre', 'fechaSalida', 'numCartas'];
	dataSource = new MatTableDataSource<Set>([]);
	selection = new SelectionModel<Set>(true, []);
	loading = true;
	errorMsg = '';

	@ViewChild(MatPaginator) paginator!: MatPaginator;
	@ViewChild(MatSort) sort!: MatSort;

	ngAfterViewInit(): void {
		// filtro por codigo o nombre
		this.dataSource.filterPredicate = (row, filter) => {
			const term = (filter ?? '').trim().toLowerCase();
			return (
				(row.codigo ?? '').toLowerCase().includes(term) ||
				(row.nombre ?? '').toLowerCase().includes(term)
			);
		};

		this.cargarSets();
	}

	private cargarSets(): void {
		this.loading = true;
		this.errorMsg = '';
		this.catalogoService.GetSets().subscribe({
			next: (sets) => {
				this.dataSource.data = sets ?? [];
				this.dataSource.paginator = this.paginator;
				this.dataSource.sort = this.sort;

				// orden por defecto: nombre asc
				if (this.sort) {
					this.sort.active = 'nombre';
					this.sort.direction = 'asc';
					this.sort.sortChange.emit({ active: 'nombre', direction: 'asc' });
				}
				this.loading = false;
			},
			error: (err) => {
				this.errorMsg = 'No se pudieron cargar los sets. Inténtalo de nuevo.';
				console.error(err);
				this.loading = false;
			},
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

	checkboxLabel(row?: Set): string {
		if (!row) return `${this.isAllSelected() ? 'deseleccionar' : 'seleccionar'} todos`;
		return `${this.selection.isSelected(row) ? 'deseleccionar' : 'seleccionar'} ${row.codigo}`;
	}

	trackById = (_: number, item: Set) => item.idSet;

	confirmar(): void {
		this.dialogRef.close(this.selection.selected);
	}

	cancelar(): void {
		this.dialogRef.close(null);
	}
}
