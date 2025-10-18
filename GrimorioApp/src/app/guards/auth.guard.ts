import { inject } from '@angular/core';
import { CanActivateFn, Router, UrlTree } from '@angular/router';
import { UtilidadService } from '../reutilizable/utilidad.service';

export const AuthGuard: CanActivateFn = (): boolean | UrlTree => {
	const util = inject(UtilidadService);
	const router = inject(Router);

	const sesion = util.ObtenerUsuarioSesion();
	const token = (sesion as any)?.token ?? (sesion as any)?.Token;
	return token ? true : router.parseUrl('/login');
};
