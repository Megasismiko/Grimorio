import { Component, OnInit, inject, signal, computed } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { FormBuilder, Validators, FormControl } from '@angular/forms';
import { MatSnackBar } from '@angular/material/snack-bar';
import { CartasService } from '../../../../services/cartas.service';
import { SHARED_IMPORTS } from '../../../../reutilizable/shared.imports';
import { Set } from '../../../../interfaces/set';
import { SetsService } from '../../../../services/sets.service';
@Component({
	standalone: true,
	selector: 'app-carta',
	imports: [
		...SHARED_IMPORTS
	],
	templateUrl: './carta.html',
	styleUrls: ['./carta.css'],
})
export class CartaComponent implements OnInit {


	private route = inject(ActivatedRoute);
	private router = inject(Router);
	private fb = inject(FormBuilder);
	private snack = inject(MatSnackBar);

	set = signal<Set | null>(null);
	idSet = 0;
	idCarta: number | null = null;
	imgError = signal<boolean>(false);

	loading = signal<boolean>(false);
	saving = signal<boolean>(false);
	isEdit = computed(() => this.idCarta !== null && !Number.isNaN(this.idCarta));

	form = this.fb.group({
		nombre: ['', [Validators.required, Validators.maxLength(120)]],
		precio: [null as number | null, [Validators.min(0)]],
		stock: [0, [Validators.min(0)]],
		tipo: [''],
		rareza: [''],
		coste: [''],
		texto: [''],
		artista: [''],
		numero: [''],
		poder: [''],
		resistencia: [''],
		imagenUrl: [''],
		esActivo: [true],
	});

	// para vista previa de imagen
	imagenPreview = computed(() => this.form.controls.imagenUrl.value || '');

	get imagenUrlCtrl(): FormControl<string | null> {
		return this.form.get('imagenUrl') as FormControl<string | null>;
	}
	safeImageUrl = computed<string | null>(() => {
		const raw = (this.imagenUrlCtrl?.value ?? '').trim();
		return raw ? raw : null;
	});


	constructor(
		private setsService: SetsService,
		private cartasService: CartasService
	) {

	}
	onImgError() {
		this.imgError.set(true);
	}
	onImgLoad() {
		this.imgError.set(false);
	}

	eliminar() {

	}

	ngOnInit() {
		const idSetParam = this.route.snapshot.paramMap.get('idSet');
		const idCartaParam = this.route.snapshot.paramMap.get('idCarta');

		this.idSet = Number(idSetParam);
		this.idCarta = idCartaParam ? Number(idCartaParam) : null;

		if (Number.isNaN(this.idSet)) {
			this.snack.open('idSet inválido', 'Cerrar', { duration: 2500 });
			this.router.navigate(['/pages/set']);
			return;
		} else {
			this.loadSet()
		}

		if (this.isEdit()) {
			this.cargarCarta(this.idCarta!);
		}
	}


	private loadSet() {
		this.loading.set(true);
		this.setsService.GetSetById(this.idSet).subscribe({
			next: (res) => {
				if (res?.status) {
					this.set.set(res.value as Set);
				} else {
					console.error('Error al cargar el set');
					this.set.set(null);
				}
				this.loading.set(false);
			},
			error: (err) => {
				console.error(err);
				this.loading.set(false);
			},
		});
	}


	private cargarCarta(id: number) {
		this.loading.set(true);
		this.cartasService.GetCartaById(id).subscribe({
			next: (res) => {
				if (res?.status && res.value) {
					// adapta los nombres si tu API devuelve strings/formatos distintos
					const c = res.value;
					this.form.patchValue({
						nombre: c.nombre,
						precio: Number((c.precio ?? '').toString().replace(',', '.')) || null,
						stock: c.stock ?? 0,
						tipo: c.tipo ?? '',
						rareza: c.rareza ?? '',
						coste: c.coste ?? '',
						texto: c.texto ?? '',
						artista: c.artista ?? '',
						numero: c.numero ?? '',
						poder: c.poder ?? '',
						resistencia: c.resistencia ?? '',
						imagenUrl: c.imagenUrl ?? '',
						esActivo: c.esActivo ?? true,
					});
				} else {
					this.snack.open('No se pudo cargar la carta', 'Cerrar', { duration: 2500 });
				}
				this.loading.set(false);
			},
			error: (err) => {
				console.error(err);
				this.snack.open('Error al cargar la carta', 'Cerrar', { duration: 2500 });
				this.loading.set(false);
			},
		});
	}

	guardar() {
		if (this.form.invalid) {
			this.form.markAllAsTouched();
			this.snack.open('Revisa los campos obligatorios', 'Cerrar', { duration: 2500 });
			return;
		}

		const dto: any = {
			idCarta: this.isEdit() ? this.idCarta ?? 0 : 0,
			idSet: this.idSet,
			descripcionSet: '',
			...this.form.value,
		};

		this.saving.set(true);

		const obs = this.isEdit()
			? this.cartasService.Editar(dto)
			: this.cartasService.Crear(dto);

		obs.subscribe({
			next: (res: any) => {
				if (res?.status) {
					this.snack.open(this.isEdit() ? 'Carta actualizada' : 'Carta creada', 'Cerrar', { duration: 2000 });
					// vuelve a la lista del set
					this.router.navigate(['/pages/set', this.idSet]);
				} else {
					this.snack.open(res?.message || 'No se pudo guardar', 'Cerrar', { duration: 2500 });
				}
				this.saving.set(false);
			},
			error: (err: any) => {
				console.error(err);
				this.snack.open('Error al guardar', 'Cerrar', { duration: 2500 });
				this.saving.set(false);
			},
		});
	}

	cancelar() {
		this.router.navigate(['/pages/set', this.idSet]);
	}
}
