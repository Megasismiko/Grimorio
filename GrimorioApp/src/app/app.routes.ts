import { Routes } from '@angular/router';
import { LayoutComponent } from './components/layout/layout';
import { DashboardComponent } from './components/layout/pages/dashboard/dashboard';
import { UsuariosComponent } from './components/layout/pages/usuarios/usuarios';
import { CartasComponent } from './components/layout/pages/cartas/cartas';
import { VentasComponent } from './components/layout/pages/ventas/ventas';
import { HistorialComponent } from './components/layout/pages/historial/historial';
import { ReporteComponent } from './components/layout/pages/reporte/reporte';
import { LoginComponent } from './components/login/login';
import { SetsComponent } from './components/layout/pages/sets/sets';
import { CartaComponent } from './components/layout/pages/carta/carta';

// 👇 importa guards
import { AuthGuard } from './guards/auth.guard';
import { RolGuard } from './guards/rol.guard';
import { LoginRedirectGuard } from './guards/login-redirect.guard';

export const routes: Routes = [
	{ path: '', redirectTo: 'login', pathMatch: 'full' },
	{ path: 'login', component: LoginComponent, canActivate: [LoginRedirectGuard] },
	{
		path: 'pages',
		component: LayoutComponent,
		canActivate: [AuthGuard],
		children: [
			{ path: '', redirectTo: 'dashboard', pathMatch: 'full' },
			{ path: 'dashboard', component: DashboardComponent },

			// Solo Administrador
			{ path: 'usuarios', component: UsuariosComponent, canActivate: [RolGuard], data: { roles: ['Administrador'] } },

			{ path: 'sets', component: SetsComponent },
			{ path: 'set/:idSet', component: CartasComponent },
			{ path: 'set/:idSet/carta/:idCarta', component: CartaComponent },
			{ path: 'set/:idSet/carta/nueva', component: CartaComponent },
			{ path: 'ventas', component: VentasComponent },
			{ path: 'historial', component: HistorialComponent },
			{ path: 'reporte', component: ReporteComponent }
		]
	},

	{ path: '**', redirectTo: 'login' }
];
