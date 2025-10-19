import { Injectable } from '@angular/core';
import { EMPTY, Observable } from 'rxjs';
import { expand, map, reduce } from 'rxjs/operators';
import { HttpClient } from '@angular/common/http';
import { ScryfallCard, ScryfallSet } from './catalogo.dtos';
import { Set } from '../../interfaces/set';
import { mapCardFromScryfall, mapSetFromScryfall } from './catalogo.mappers';
import { Carta } from '../../interfaces/carta';


interface ScryfallListResponse<T> {
	data: T[];
	has_more: boolean;
	next_page?: string;
}

@Injectable({ providedIn: 'root' })
export class CatalogoService {

	api = 'https://api.scryfall.com/';

	constructor(
		private http: HttpClient
	) { }


	public GetSets(): Observable<Set[]> {
		return this.http.get<{ data: ScryfallSet[] }>(`${this.api}/sets`).pipe(
			map(response => response.data.map(mapSetFromScryfall))
		);
	}


	public GetCartasSet(codigo: string): Observable<Carta[]> {
		const url = `${this.api}cards/search?order=set&unique=prints&q=e:${encodeURIComponent(codigo)}`;
		return this.http.get<ScryfallListResponse<ScryfallCard>>(url).pipe(
			expand(res => (res.has_more && res.next_page)
				? this.http.get<ScryfallListResponse<ScryfallCard>>(res.next_page)
				: EMPTY
			),
			map(res => res.data.map(mapCardFromScryfall)),
			reduce((acc, page) => acc.concat(page), [] as Carta[])
		);

	}
}
