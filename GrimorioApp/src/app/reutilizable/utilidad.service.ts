import { Injectable } from '@angular/core';
import { MatSnackBar } from '@angular/material/snack-bar';
import { Sesion } from '../interfaces/sesion';

@Injectable({
	providedIn: 'root'
})
export class UtilidadService {

	private readonly KEY_USUARIO = 'usuario';

	constructor(private _snackbar: MatSnackBar) { }

	public MostarAlerta(msg: string, tipo: string) {
		this._snackbar.open(msg, tipo, {
			horizontalPosition: 'center',
			verticalPosition: 'top',
			duration: 3000
		});
	}

	public GuardarUsuarioSesion(sesion: Sesion) {
		localStorage.setItem(this.KEY_USUARIO, JSON.stringify(sesion));
	}

	public ObtenerUsuarioSesion(): Sesion | null {
		const data = localStorage.getItem(this.KEY_USUARIO);
		return data ? JSON.parse(data) as Sesion : null;
	}

	public EliminarUsuarioSesion() {
		localStorage.removeItem(this.KEY_USUARIO);
	}

	public HaySesion(): boolean {
		return this.ObtenerUsuarioSesion() !== null;
	}
}
