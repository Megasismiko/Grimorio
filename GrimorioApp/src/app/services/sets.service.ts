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

	public Editar(data: Set): Observable<ResponseApi> {
		return this._http.put<ResponseApi>(`${this.url}editar`, data);
	}

	public Eliminar(data: number): Observable<ResponseApi> {
		return this._http.delete<ResponseApi>(`${this.url}eliminar/${data}`);
	}

	public Importar(codigo: string) {
		const code = (codigo ?? '').trim();
		return this._http.get<any>(`https://api.magicthegathering.io/v1/sets/${encodeURIComponent(code)}`)
			.pipe(
				map(resp => {
					const s = resp?.set;
					if (!s) return null;

					return {
						idSet: 0,
						nombre: s.name,
						codigo: s.code,
						esActivo: true,
						logo: `https://svgs.scryfall.io/sets/${(s.code ?? '').toLowerCase()}.svg`,
						fechaSalida: this.toDDMMYYYY(s.releaseDate),
						color: ''
					} as Set;
				})
			);
	}

	private toDDMMYYYY(dateStr?: string): string {
		if (!dateStr) return '';
		const m = /^(\d{4})-(\d{2})-(\d{2})$/.exec(dateStr);
		if (!m) return dateStr.substring(0, 10);
		const [, y, mm, dd] = m;
		return `${dd}/${mm}/${y}`;
	}

}
