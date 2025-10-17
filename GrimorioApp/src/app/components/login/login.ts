import { Component } from '@angular/core';
import { SHARED_IMPORTS } from '../../reutilizable/shared.imports';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { UsuarioService } from '../../services/usuario.service';
import { Login } from '../../interfaces/login';
import { UtilidadService } from '../../reutilizable/utilidad.service';
import { Router } from '@angular/router';
import { finalize, take } from 'rxjs/operators';

@Component({
	standalone: true,
	selector: 'app-login',
	imports: [...SHARED_IMPORTS],
	templateUrl: './login.html',
	styleUrls: ['./login.css'] // 👈 importante: plural
})
export class LoginComponent {
	hide = true;
	form: FormGroup;
	loading = false;

	constructor(
		private fb: FormBuilder,
		private _usuario: UsuarioService,
		private _util: UtilidadService,
		private router: Router
	) {
		this.form = this.fb.group({
			email: ['', [Validators.required, Validators.email]],
			password: ['', [Validators.required]]
		});
	}

	onSubmit() {
		if (this.form.invalid || this.loading) return;

		this.loading = true;
		this.form.disable();

		const data: Login = {
			correo: (this.form.value.email ?? '').trim(),
			clave: (this.form.value.password ?? '').trim()
		};

		this._usuario.Login(data).pipe(
			take(1),
			finalize(() => {
				this.loading = false;
				this.form.enable();
			})
		).subscribe({
			next: (res: any) => {
				if (res?.status) {
					this._util.GuardarUsuarioSesion(res.value);
					this.router.navigate(['pages']);
				} else {
					this._util.MostarAlerta(res?.msg ?? 'Credenciales incorrectas', 'Error');
				}
			},
			error: (err: any) => {
				const msg = err?.error?.msg ?? err?.msg ?? 'Ocurrió un error al iniciar sesión';
				this._util.MostarAlerta(msg, 'Error');
			}
		});
	}
}
