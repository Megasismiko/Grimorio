import { Injectable } from '@angular/core';

import { MatSnackBar } from '@angular/material/snack-bar';
import { Sesion } from '../interfaces/sesion';

@Injectable({
	providedIn: 'root'

})
export class UtilidadService {
	

	constructor(
		private _snackbar: MatSnackBar
	) {

	}

	public MostarAlerta(msg: string, tipo: string) {
		this._snackbar.open(msg, tipo, {
			horizontalPosition: 'center',
			verticalPosition: 'top',
			duration: 3000
		});
	}

	public GuardarUsuarioSesion(sesion: Sesion) {
		localStorage.setItem('usuario', JSON.stringify(sesion));
	}

	public ObtenerUsuarioSesion(): Sesion {
		const data = localStorage.getItem('usuario');
		const usuario: Sesion = JSON.parse(data!);
		return usuario;
	}

	public EliminarUsuarioSesion() {
		localStorage.removeItem('usuario');
	}
}
