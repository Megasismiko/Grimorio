import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { enviroment } from '../../enviroments/enviroment';
import { ResponseApi } from '../interfaces/response-api';
import { Carta } from '../interfaces/carta';

@Injectable({
	providedIn: 'root'
})
export class CartasService {

	private url: string = `${enviroment.endpoint}cartas/`;

	constructor(
		private _http: HttpClient
	) {
	}

	public GetCartaById(id: number): Observable<ResponseApi> {
		return this._http.get<ResponseApi>(`${this.url}carta/${id}`);
	}

	public Crear(data: Carta): Observable<ResponseApi> {
		return this._http.post<ResponseApi>(`${this.url}crear`, data);
	}

	public CrearLote(data: Carta[]): Observable<ResponseApi> {
		return this._http.post<ResponseApi>(`${this.url}crear/lote`, data);
	}

	public Editar(data: Carta): Observable<ResponseApi> {
		return this._http.put<ResponseApi>(`${this.url}editar`, data);
	}

	public Eliminar(data: number): Observable<ResponseApi> {
		return this._http.delete<ResponseApi>(`${this.url}eliminar/${data}`);
	}

}
