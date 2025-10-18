import { HttpInterceptorFn } from '@angular/common/http';
import { inject } from '@angular/core';
import { UtilidadService } from '../reutilizable/utilidad.service';

export const AuthInterceptor: HttpInterceptorFn = (req, next) => {
	const util = inject(UtilidadService);
	const sesion = util.ObtenerUsuarioSesion();
	const token = sesion?.token; // por si viene distinto

	if (token) {
		req = req.clone({
			setHeaders: { Authorization: `Bearer ${token}` }
		});
	}

	return next(req);
};
