import { AfterViewInit, Component, OnInit, ViewChild } from '@angular/core';
import { DashboardService } from '../../../../services/dashboard.service';
import { SHARED_IMPORTS } from '../../../../reutilizable/shared.imports';
import { Resumen } from '../../../../interfaces/resumen';
import { MatSort } from '@angular/material/sort';
import { MatPaginator } from '@angular/material/paginator';
import { MatTableDataSource } from '@angular/material/table';

@Component({
	standalone: true,
	selector: 'app-dashboard',
	imports: [...SHARED_IMPORTS],
	templateUrl: './dashboard.html',
	styleUrl: './dashboard.css'
})
export class DashboardComponent implements OnInit, AfterViewInit {
	// 1) Define primero el resumen (ya con datos)
	resumen: Resumen = {
		totalIngresos: '5369,66',
		totalProductos: 398,
		totalVentas: 29,
		ventasUltimaSemana: [
			{ id: 101, fecha: '2025-10-11T10:30:00', total: 245.80 },
			{ id: 102, fecha: '2025-10-12T16:45:00', total: 189.99 },
			{ id: 103, fecha: '2025-10-13T12:10:00', total: 315.50 },
			{ id: 104, fecha: '2025-10-14T09:15:00', total: 428.00 },
			{ id: 105, fecha: '2025-10-15T18:30:00', total: 159.75 },
			{ id: 106, fecha: '2025-10-16T13:00:00', total: 512.40 },
			{ id: 107, fecha: '2025-10-17T11:20:00', total: 367.20 }
		]
	};

	displayedColumns: string[] = ['id', 'fecha', 'total'];

	// 2) Inicializa después, ya con resumen definido
	ventasData = new MatTableDataSource(this.resumen.ventasUltimaSemana);
	totalSemana = 0;

	@ViewChild(MatSort) sort!: MatSort;
	@ViewChild(MatPaginator) paginator!: MatPaginator;

	trackById = (_: number, v: { id: number }) => v.id;

	constructor(private _dashboard: DashboardService) { }

	ngOnInit(): void {
		// Si tiras de API, actualiza la dataSource tras recibir:
		this._dashboard.Resumen().subscribe(res => {
			this.resumen = res.value;
			this.ventasData.data = this.resumen.ventasUltimaSemana ?? [];
			this.totalSemana = this.ventasData.data.reduce((acc, v: any) => acc + (+v.total || 0), 0);
		});

		// Con datos locales:
		this.ventasData.data = this.resumen.ventasUltimaSemana;
		this.totalSemana = this.ventasData.data.reduce((acc, v: any) => acc + (+v.total || 0), 0);
	}

	ngAfterViewInit(): void {
		this.ventasData.sort = this.sort;
		this.ventasData.paginator = this.paginator;
	}

}
