import { inject } from '@angular/core';
import { ActivatedRouteSnapshot, CanActivateFn, Router, UrlTree } from '@angular/router';
import { UtilidadService } from '../reutilizable/utilidad.service';

export const RolGuard: CanActivateFn = (route: ActivatedRouteSnapshot): boolean | UrlTree => {
	const util = inject(UtilidadService);
	const router = inject(Router);

	const sesion = util.ObtenerUsuarioSesion();
	const rol = (sesion as any)?.rolDescripcion ?? (sesion as any)?.RolDescripcion;
	const permitidos: string[] = route.data['roles'] ?? [];

	return permitidos.length === 0 || permitidos.includes(rol) ? true : router.parseUrl('/pages');
};
