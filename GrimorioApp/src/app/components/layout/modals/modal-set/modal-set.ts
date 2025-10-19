import { Component, Inject, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { MAT_DIALOG_DATA, MatDialogRef } from '@angular/material/dialog';
import { Set } from '../../../../interfaces/set';
import { UtilidadService } from '../../../../reutilizable/utilidad.service';
import { COLORES_SET, DEFAULT_SET_LOGO, SHARED_IMPORTS } from '../../../../reutilizable/shared.imports';
import { SetsService } from '../../../../services/sets.service';

import { CatalogoService } from '../../../../services/catalogo/catalogo.service';
import { DateUtil } from '../../../../reutilizable/date.util';

@Component({
	selector: 'app-modal-set',
	standalone: true,
	imports: [...SHARED_IMPORTS],
	templateUrl: './modal-set.html',
	styleUrl: './modal-set.css'
})
export class ModalSet implements OnInit {

	COLORES_SET = COLORES_SET;
	form: FormGroup;
	titulo = 'Crear';

	constructor(
		private modal: MatDialogRef<ModalSet>,
		@Inject(MAT_DIALOG_DATA) public set: Set | null,
		private fb: FormBuilder,
		private setsService: SetsService,
		private utilidadService: UtilidadService
	) {
		this.form = this.fb.group({
			nombre: ['', [Validators.required]],
			esActivo: [true],
			codigo: ['', [Validators.required]],
			logo: [DEFAULT_SET_LOGO],
			fechaSalida: ['', [Validators.required]],
			color: [COLORES_SET[0].color, [Validators.required]]
		});

		if (this.set) this.titulo = 'Editar';
	}

	ngOnInit(): void {
		if (this.set) {
			this.form.patchValue({
				nombre: this.set.nombre,
				esActivo: this.set.esActivo,
				codigo: this.set.codigo,
				logo: this.set.logo || DEFAULT_SET_LOGO,
				fechaSalida: DateUtil.formatDateString(this.set.fechaSalida),
				color: this.set.color
			});
		}
	}




	onFechaInput(ev: Event) {
		const input = ev.target as HTMLInputElement;
		this.form.patchValue({ fechaSalida: DateUtil.formatDateString(input.value) }, { emitEvent: false });
	}

	public Guardar() {
		const v = this.form.value;

		const data: Set = {
			idSet: this.set?.idSet ?? 0,
			nombre: v.nombre,
			esActivo: v.esActivo,
			codigo: v.codigo,
			logo: v.logo || DEFAULT_SET_LOGO,
			fechaSalida: DateUtil.formatDateString(v.fechaSalida),
			color: v.color,
			cartas: [],
			numCartas: 0
		};

		const obs = this.set ? this.setsService.Editar(data) : this.setsService.Crear(data);
		const okMsg = this.set ? 'Set editado' : 'Set creado';

		obs.subscribe({
			next: res => {
				if (res.status) {
					this.utilidadService.MostarAlerta(okMsg, 'Success');
					this.modal.close(true);
				} else {
					this.utilidadService.MostarAlerta(res.msg, 'Error');
					this.modal.close(false);
				}
			},
			error: err => console.log(err)
		});
	}

	isImporting = false;

	public Importar() {
		/* 	const codigoRaw: string = this.form.value.codigo ?? '';
			const codigo = codigoRaw.trim().toUpperCase();
	
			if (!codigo) {
				this.utilidadService.MostarAlerta('Introduce un código para importar', 'Advertencia');
				return;
			}
	
			// opcional: valida 2-5 letras/números
			if (!/^[A-Z0-9]{2,5}$/.test(codigo)) {
				this.utilidadService.MostarAlerta('Código inválido. Usa 2–5 letras/números (ej: ONS)', 'Advertencia');
				return;
			}
	
			this.isImporting = true;
	
			this.catalogoService.GetSet(codigo).subscribe({
				next: (set: Set) => {
					this.isImporting = false;
	
					if (!set) {
						this.utilidadService.MostarAlerta(`No se encontró ningún set con código ${codigo}`, 'Info');
						return;
					}
	
					// Rellenamos el form (solo fecha dd/MM/yyyy)
					this.form.patchValue({
						nombre: set.nombre,
						logo: set.logo,
						fechaSalida: set.fechaSalida?.substring(0, 10) ?? ''
					});
	
					this.utilidadService.MostarAlerta(`Set ${codigo} importado correctamente`, 'Success');
				},
				error: (err) => {
					this.isImporting = false;
					this.utilidadService.MostarAlerta('Error consultando la API de MTG', 'Error');
				}
			}); */
	}

}
