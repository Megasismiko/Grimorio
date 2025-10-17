import { Routes } from '@angular/router';
import { LayoutComponent } from './components/layout/layout';
import { DashboardComponent } from './components/layout/pages/dashboard/dashboard';
import { UsuariosComponent } from './components/layout/pages/usuarios/usuarios';
import { CartasComponent } from './components/layout/pages/cartas/cartas';
import { VentasComponent } from './components/layout/pages/ventas/ventas';
import { HistorialComponent } from './components/layout/pages/historial/historial';
import { ReporteComponent } from './components/layout/pages/reporte/reporte';
import { LoginComponent } from './components/login/login';

export const routes: Routes = [
	{ path: '', redirectTo: 'login', pathMatch: 'full' },
	{ path: 'login', component: LoginComponent },
	{
		path: 'pages',
		component: LayoutComponent,
		children: [
			{ path: '', redirectTo: 'dashboard', pathMatch: 'full' },
			{ path: 'dashboard', component: DashboardComponent },
			{ path: 'usuarios', component: UsuariosComponent },
			{ path: 'cartas', component: CartasComponent },
			{ path: 'ventas', component: VentasComponent },
			{ path: 'historial', component: HistorialComponent },
			{ path: 'reporte', component: ReporteComponent }
		]
	},
	{ path: '**', redirectTo: 'login' }
];
