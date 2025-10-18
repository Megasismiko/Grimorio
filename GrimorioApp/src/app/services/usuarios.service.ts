import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { enviroment } from '../../enviroments/enviroment';
import { ResponseApi } from '../interfaces/response-api';
import { Login } from '../interfaces/login';
import { Usuario } from '../interfaces/usuario';

@Injectable({
	providedIn: 'root'
})
export class UsuariosService {

	private url: string = `${enviroment.endpoint}usuarios/`;

	constructor(
		private _http: HttpClient
	) {
	}

	public Login(data: Login): Observable<ResponseApi> {
		return this._http.post<ResponseApi>(`${this.url}login`, data);
	}

	public Lista(): Observable<ResponseApi> {
		return this._http.get<ResponseApi>(`${this.url}lista`);
	}

	public Crear(data: Usuario): Observable<ResponseApi> {
		console.log(data);
		debugger;
		return this._http.post<ResponseApi>(`${this.url}crear`, data);
	}

	public Editar(data: Usuario): Observable<ResponseApi> {
		return this._http.put<ResponseApi>(`${this.url}editar`, data);
	}

	public Eliminar(data: number): Observable<ResponseApi> {
		return this._http.delete<ResponseApi>(`${this.url}eliminar/${data}`);
	}

}
