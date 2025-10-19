import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { map, Observable } from 'rxjs';
import { enviroment } from '../../enviroments/enviroment';
import { ResponseApi } from '../interfaces/response-api';
import { Set } from '../interfaces/set';

@Injectable({
	providedIn: 'root'
})
export class SetsService {


	private url: string = `${enviroment.endpoint}sets/`;

	constructor(
		private _http: HttpClient
	) {
	}

	public GetSets(): Observable<ResponseApi> {
		return this._http.get<ResponseApi>(this.url);
	}

	public GetSetById(id: number): Observable<ResponseApi> {
		return this._http.get<ResponseApi>(`${this.url}set/${id}`);
	}

	public Crear(data: Set): Observable<ResponseApi> {
		return this._http.post<ResponseApi>(`${this.url}crear`, data);
	}

	public CrearLote(data: Set[]): Observable<ResponseApi> {
		return this._http.post<ResponseApi>(`${this.url}crear/lote`, data);
	}

	public Editar(data: Set): Observable<ResponseApi> {
		return this._http.put<ResponseApi>(`${this.url}editar`, data);
	}

	public Eliminar(data: number): Observable<ResponseApi> {
		return this._http.delete<ResponseApi>(`${this.url}eliminar/${data}`);
	}
}
