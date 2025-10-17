import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { enviroment } from '../../enviroments/enviroment';
import { ResponseApi } from '../interfaces/response-api';

@Injectable({
  providedIn: 'root'
})
export class RolService {

  private url: string = `${enviroment.endpoint}rol/`;

  constructor(
    private _http: HttpClient
  ) {
  }

  public Lista(): Observable<ResponseApi> {
    return this._http.get<ResponseApi>(`${this.url}lista`);
  }

}
