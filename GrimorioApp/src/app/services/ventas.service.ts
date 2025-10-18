import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { enviroment } from '../../enviroments/enviroment';
import { ResponseApi } from '../interfaces/response-api';
import { Venta } from '../interfaces/venta';

@Injectable({
	providedIn: 'root'
})
export class VentasService {
	private url: string = `${enviroment.endpoint}ventas/`;

	constructor(
		private _http: HttpClient
	) {
	}

	public Crear(data: Venta): Observable<ResponseApi> {
		return this._http.post<ResponseApi>(`${this.url}crear`, data);
	}

	public Historial(buscarPor: string, numeroVenta: string, fechaInicio: string, fechaFin: string): Observable<ResponseApi> {
		return this._http.get<ResponseApi>(`${this.url}historial?buscarPor=${buscarPor}&numeroVenta=${numeroVenta}&fechaInicio=${fechaInicio}&fechaFin=${fechaFin}`);
	}

	public Reporte(fechaInicio: string, fechaFin: string): Observable<ResponseApi> {
		return this._http.get<ResponseApi>(`${this.url}reporte?fechaInicio=${fechaInicio}&fechaFin=${fechaFin}`);
	}

}
