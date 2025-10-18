import { Component, inject, OnInit } from '@angular/core';
import { SHARED_IMPORTS } from '../../reutilizable/shared.imports';
import { Validators, NonNullableFormBuilder } from '@angular/forms';
import { UsuariosService } from '../../services/usuarios.service';
import { UtilidadService } from '../../reutilizable/utilidad.service';
import { Router } from '@angular/router';
import { Login } from '../../interfaces/login';
import { finalize } from 'rxjs';

type LoginForm = ReturnType<typeof buildForm>;

function buildForm(fb: NonNullableFormBuilder) {
	return fb.group({
		email: fb.control('', { validators: [Validators.required, Validators.email] }),
		password: fb.control('', { validators: [Validators.required, Validators.minLength(4)] }),
	});
}

@Component({
	standalone: true,
	selector: 'app-login',
	imports: [...SHARED_IMPORTS],
	templateUrl: './login.html',
	styleUrls: ['./login.css']
})
export class LoginComponent implements OnInit {

	// UI state
	hide = true;
	loading = false;

	private fb = inject(NonNullableFormBuilder);
	private usuario = inject(UsuariosService);
	private util = inject(UtilidadService);
	private router = inject(Router);

	form: LoginForm = buildForm(this.fb);
	get fc() { return this.form.controls; }

	ngOnInit() {
		const sesion = this.util.ObtenerUsuarioSesion(); // unificada
		if (sesion) {
			this.router.navigate(['pages']);
		}
	}

	onSubmit() {
		if (this.loading) return;
		if (this.form.invalid) {
			this.form.markAllAsTouched();
			return;
		}

		this.loading = true;
		this.form.disable();

		const { email, password } = this.form.getRawValue();
		const payload: Login = {
			correo: email.trim(),
			clave: password.trim(),
		};

		this.usuario.Login(payload).pipe(
			finalize(() => {
				this.loading = false;
				this.form.enable();
			})
		).subscribe({
			next: (res: any) => {
				if (res?.status && res?.value?.token) {
					// Guarda toda la sesión (incluye token y expira)
					this.util.GuardarUsuarioSesion(res.value);
					this.router.navigate(['pages']);
				} else {
					const msg = res?.message ?? res?.msg ?? 'Credenciales incorrectas o token no emitido';
					this.util.MostarAlerta(msg, 'Error');
				}
			},
			error: (err: any) => {
				const msg =
					err?.error?.message ??
					err?.error?.msg ??
					err?.message ??
					err?.msg ??
					'Ocurrió un error al iniciar sesión';
				this.util.MostarAlerta(msg, 'Error');
			}
		});
	}
}
