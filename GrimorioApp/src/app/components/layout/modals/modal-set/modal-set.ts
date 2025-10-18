import { Component, Inject, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { MAT_DIALOG_DATA, MatDialogRef } from '@angular/material/dialog';
import { Set } from '../../../../interfaces/set';
import { UtilidadService } from '../../../../reutilizable/utilidad.service';
import { SHARED_IMPORTS } from '../../../../reutilizable/shared.imports';
import { SetsService } from '../../../../services/sets.service';
import { SET_COLORES as SET_COLORES_CONST } from '../../../../reutilizable/set.colores';

@Component({
	selector: 'app-modal-set',
	standalone: true,
	imports: [...SHARED_IMPORTS],
	templateUrl: './modal-set.html',
	styleUrl: './modal-set.css'
})
export class ModalSet implements OnInit {

	form: FormGroup;
	titulo = 'Crear';

	DEFAULT_LOGO = 'https://svgs.scryfall.io/sets/one.svg';

	readonly COLORES = SET_COLORES_CONST;

	constructor(
		private modal: MatDialogRef<ModalSet>,
		@Inject(MAT_DIALOG_DATA) public set: Set | null,
		private fb: FormBuilder,
		private _setsService: SetsService,
		private _util: UtilidadService
	) {
		this.form = this.fb.group({
			nombre: ['', [Validators.required]],
			esActivo: [true],
			codigo: ['', [Validators.required]],
			logo: [this.DEFAULT_LOGO],
			fechaSalida: ['', [Validators.required]],
			color: [this.COLORES[0].color, [Validators.required]]
		});

		if (this.set) this.titulo = 'Editar';
	}

	ngOnInit(): void {
		if (this.set) {
			this.form.patchValue({
				nombre: this.set.nombre,
				esActivo: this.set.esActivo,
				codigo: this.set.codigo,
				logo: this.set.logo || this.DEFAULT_LOGO,
				fechaSalida: this.onlyDate(this.set.fechaSalida), // solo 10 chars
				color: this.set.color
			});
		}
	}

	// Toma los 10 primeros caracteres y normaliza si viene como yyyy-MM-dd
	private onlyDate(v?: string): string {
		if (!v) return '';
		const raw = v.substring(0, 10);
		// Si viene como yyyy-MM-dd -> convertir a dd/MM/yyyy
		const iso = /^(\d{4})-(\d{2})-(\d{2})$/;
		const dmY = /^(\d{2})\/(\d{2})\/(\d{4})$/;

		if (iso.test(raw)) {
			const [, y, m, d] = raw.match(iso)!;
			return `${d}/${m}/${y}`;
		}
		if (dmY.test(raw)) return raw;

		// cualquier otra cosa, intentar limpiar: 07/10/2002 de "07/10/2002 0:00:00"
		return raw.replaceAll('-', '/');
	}

	onFechaInput(ev: Event) {
		const input = ev.target as HTMLInputElement;
		this.form.patchValue({ fechaSalida: this.onlyDate(input.value) }, { emitEvent: false });
	}

	public Guardar() {
		const v = this.form.value;

		const data: Set = {
			idSet: this.set?.idSet ?? 0,
			nombre: v.nombre,
			esActivo: v.esActivo,
			codigo: v.codigo,
			logo: v.logo || this.DEFAULT_LOGO,
			fechaSalida: this.onlyDate(v.fechaSalida),
			color: v.color,
			cartas: [],
			numCartas: 0
		};

		const obs = this.set ? this._setsService.Editar(data) : this._setsService.Crear(data);
		const okMsg = this.set ? 'Set editado' : 'Set creado';

		obs.subscribe({
			next: res => {
				if (res.status) {
					this._util.MostarAlerta(okMsg, 'Success');
					this.modal.close(true);
				} else {
					this._util.MostarAlerta(res.msg, 'Error');
					this.modal.close(false);
				}
			},
			error: err => console.log(err)
		});
	}

	isImporting = false;

	public Importar() {
		const codigoRaw: string = this.form.value.codigo ?? '';
		const codigo = codigoRaw.trim().toUpperCase();

		if (!codigo) {
			this._util.MostarAlerta('Introduce un código para importar', 'Advertencia');
			return;
		}

		// opcional: valida 2-5 letras/números
		if (!/^[A-Z0-9]{2,5}$/.test(codigo)) {
			this._util.MostarAlerta('Código inválido. Usa 2–5 letras/números (ej: ONS)', 'Advertencia');
			return;
		}

		this.isImporting = true;

		this._setsService.Importar(codigo).subscribe({
			next: (mtgSet) => {
				this.isImporting = false;

				if (!mtgSet) {
					this._util.MostarAlerta(`No se encontró ningún set con código ${codigo}`, 'Info');
					return;
				}

				// Rellenamos el form (solo fecha dd/MM/yyyy)
				this.form.patchValue({
					nombre: mtgSet.nombre,
					logo: mtgSet.logo,
					fechaSalida: mtgSet.fechaSalida?.substring(0, 10) ?? ''
				});

				this._util.MostarAlerta(`Set ${codigo} importado correctamente`, 'Success');
			},
			error: (err) => {
				console.error(err);
				this.isImporting = false;
				this._util.MostarAlerta('Error consultando la API de MTG', 'Error');
			}
		});
	}

}
