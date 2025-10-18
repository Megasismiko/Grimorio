import { Component, inject } from '@angular/core';
import { RouterOutlet, RouterLink, RouterLinkActive, Router } from '@angular/router';
import { SHARED_IMPORTS } from '../../reutilizable/shared.imports';
import { MenuService } from '../../services/menu.service';
import { Menu } from '../../interfaces/menu';
import { map, shareReplay } from 'rxjs/operators';
import { Observable } from 'rxjs';
import { UtilidadService } from '../../reutilizable/utilidad.service';

@Component({
	standalone: true,
	selector: 'app-layout',
	imports: [
		...SHARED_IMPORTS,
		RouterOutlet,
		RouterLink,
		RouterLinkActive,
	],
	templateUrl: './layout.html',
	styleUrls: ['./layout.css'],
})
export class LayoutComponent {

	private util = inject(UtilidadService);
	private router = inject(Router);
	private menuService = inject(MenuService);

	menu$!: Observable<Menu[]>;
	sesion = this.util.ObtenerUsuarioSesion();

	constructor() {
		if (!this.sesion?.token) this.router.navigate(['/login']);
		this.menu$ = this.menuService.Lista(this.sesion?.idUsuario ?? 0).pipe(
			map(res => (res?.status && Array.isArray(res.value)) ? res.value : []),
			shareReplay({ bufferSize: 1, refCount: true })
		);
	}

	trackByRoute(index: number, it: Menu) { return it.url ?? index; }

	logout() {
		this.util.EliminarUsuarioSesion();
		this.sesion = null;
		this.router.navigate(['/login']);
	}

}
