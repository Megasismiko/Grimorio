import { Component, Inject, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { MAT_DIALOG_DATA, MatDialogRef } from '@angular/material/dialog';
import { Rol } from '../../../../interfaces/rol';
import { Usuario } from '../../../../interfaces/usuario';
import { UsuariosService } from '../../../../services/usuarios.service';
import { RolesService } from '../../../../services/roles.service';
import { UtilidadService } from '../../../../reutilizable/utilidad.service';
import { SHARED_IMPORTS } from '../../../../reutilizable/shared.imports';

@Component({
	selector: 'app-modal-usuario',
	imports: [...SHARED_IMPORTS],
	templateUrl: './modal-usuario.html',
	styleUrl: './modal-usuario.css'
})
export class ModalUsuario implements OnInit {

	form: FormGroup;
	titulo: string = "Crear";
	roles: Rol[] = [];

	constructor(
		private modal: MatDialogRef<ModalUsuario>,
		@Inject(MAT_DIALOG_DATA) public usuario: Usuario,
		private fb: FormBuilder,
		private _usuario: UsuariosService,
		private _rol: RolesService,
		private _util: UtilidadService
	) {
		this.form = this.fb.group({
			nombreCompleto: ['', [Validators.required]],
			correo: ['', [Validators.required, Validators.email]],
			idRol: ['', [Validators.required]],
			clave: ['', [Validators.required]],
			esActivo: [true]
		});

		if (this.usuario) {
			this.titulo = "Editar";
		}

		this._rol.Lista().subscribe({
			next: res => {
				if (res.status) {
					this.roles = res.value
				}
			},
			error: err => console.log(err)
		});
	}

	ngOnInit(): void {
		if (this.usuario) {
			this.form.patchValue({
				nombreCompleto: this.usuario.nombreCompleto,
				correo: this.usuario.correo,
				idRol: this.usuario.idRol,
				clave: this.usuario.clave,
				esActivo: this.form.value.esActivo
			})
		}
	}

	public Guardar() {
		const data: Usuario = {
			idUsuario: this.usuario?.idUsuario ?? 0,
			nombreCompleto: this.form.value.nombreCompleto,
			correo: this.form.value.correo,
			idRol: this.form.value.idRol,
			clave: this.form.value.clave,
			rolDescripcion: '',
			esActivo: this.form.value.esActivo
		};

		if (this.usuario) {
			this._usuario.Editar(data).subscribe({
				next: res => {
					if (res.status) {
						this._util.MostarAlerta('Usuario editado', 'Success');
						this.modal.close(true);
					} else {
						this._util.MostarAlerta('No se pudo editar el usuario', 'Error');
						this.modal.close(false);
					}
				},
				error: err => console.log(err)
			});
		} else {
			this._usuario.Crear(data).subscribe({
				next: res => {
					if (res.status) {
						this._util.MostarAlerta('Usuario creado', 'Success');
						this.modal.close(true);
					} else {
						this._util.MostarAlerta('No se pudo crear el usuario', 'Error');
						this.modal.close(false);
					}
				},
				error: err => console.log(err)
			});
		}



	}

}
