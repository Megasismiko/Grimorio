import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { enviroment } from '../../enviroments/enviroment';
import { ResponseApi } from '../interfaces/response-api';

@Injectable({
  providedIn: 'root'
})
export class DashboardService {

  private url: string = `${enviroment.endpoint}dashboard/`;

  constructor(
    private _http: HttpClient
  ) {
  }

  public Resumen(): Observable<ResponseApi> {
    return this._http.get<ResponseApi>(`${this.url}resumen`);
  }
}
