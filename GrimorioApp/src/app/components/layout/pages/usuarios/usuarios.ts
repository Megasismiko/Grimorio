import { AfterViewInit, Component, OnInit, ViewChild } from '@angular/core';
import { Usuario } from '../../../../interfaces/usuario';
import { MatTableDataSource } from '@angular/material/table';
import { MatPaginator } from '@angular/material/paginator';
import { UsuariosService } from '../../../../services/usuarios.service';
import { ModalUsuario } from '../../modals/modal-usuario/modal-usuario';
import { SHARED_IMPORTS } from '../../../../reutilizable/shared.imports';
import { MatDialog } from '@angular/material/dialog';
import { UtilidadService } from '../../../../reutilizable/utilidad.service';
import { MatSort } from '@angular/material/sort';
import Swal from 'sweetalert2';

@Component({
	selector: 'app-usuarios',
	imports: [...SHARED_IMPORTS],
	templateUrl: './usuarios.html',
	styleUrl: './usuarios.css'
})
export class UsuariosComponent implements OnInit, AfterViewInit {

	columnas: string[] = ['nombreCompleto', 'correo', 'rolDescripcion', 'estado', 'acciones']
	usuarios: Usuario[] = [];
	tablaUsuarios = new MatTableDataSource(this.usuarios);
	@ViewChild(MatPaginator) paginator!: MatPaginator;
	@ViewChild(MatSort) sort!: MatSort;

	constructor(
		private _usuario: UsuariosService,
		private dialog: MatDialog,
		private _util: UtilidadService
	) {

	}

	private ObtenerUsuarios() {
		this._usuario.Lista().subscribe({
			next: res => {
				if (res.status) {
					this.usuarios = res.value;
					this.tablaUsuarios.data = this.usuarios;
				}
			},
			error: err => console.log(err)
		});
	}

	ngOnInit(): void {
		this.ObtenerUsuarios();
	}

	ngAfterViewInit(): void {
		this.tablaUsuarios.paginator = this.paginator;
		this.tablaUsuarios.sort = this.sort;
	}

	public AplicarFiltro(event: Event) {
		const filtro = (event.target as HTMLInputElement).value;
		this.tablaUsuarios.filter = filtro.trim().toLocaleLowerCase();
	}

	public LimpiarFiltro() {
		const input = document.querySelector('.filter input') as HTMLInputElement | null;
		if (input) {
			input.value = '';
			this.tablaUsuarios.filter = ''; // limpia también el filtro de la tabla
		}
	}

	public CrearUsuario() {
		this.dialog.open(ModalUsuario, {
			disableClose: true
		}).afterClosed().subscribe(res => {
			if (res) this.ObtenerUsuarios();
		});
	}

	public EditarUsuario(usuario: Usuario) {
		this.dialog.open(ModalUsuario, {
			disableClose: true,
			data: usuario
		}).afterClosed().subscribe(res => {
			if (res) this.ObtenerUsuarios();
		});
	}

	public EliminarUsuario(usuario: Usuario) {
		Swal.fire({
			title: '¿Desea eliminar el usuario?',
			text: usuario.nombreCompleto,
			icon: 'warning',
			confirmButtonColor: '#3085d6',
			confirmButtonText: 'Eliminar',
			showCancelButton: true,
			cancelButtonColor: '#d33',
			cancelButtonText: 'Cancelar'
		}).then(res => {
			if (res.isConfirmed) {
				this._usuario.Eliminar(usuario.idUsuario).subscribe({
					next: res => {
						if (res.status) {
							this._util.MostarAlerta('Usuario eliminado', 'Success');
							this.ObtenerUsuarios();
						} else {
							this._util.MostarAlerta('No se puedo eliminar el usuario', 'Error');
						}
					},
					error: err => console.log(err)
				})
			}
		})
	}
}
