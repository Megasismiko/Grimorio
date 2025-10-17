import { Routes } from '@angular/router';
import { Layout } from './components/layout/layout';
import { Dashboard } from './components/layout/pages/dashboard/dashboard';
import { Usuario } from './components/layout/pages/usuario/usuario';
import { Carta } from './components/layout/pages/carta/carta';
import { Venta } from './components/layout/pages/venta/venta';
import { Historial } from './components/layout/pages/historial/historial';
import { Reporte } from './components/layout/pages/reporte/reporte';
import { Login } from './components/login/login';

export const routes: Routes = [
	{ path: '', redirectTo: 'login', pathMatch: 'full' },
	{ path: 'login', component: Login },
	{
		path: 'pages',
		component: Layout,
		children: [
			{ path: '', redirectTo: 'dashboard', pathMatch: 'full' },
			{ path: 'dashboard', component: Dashboard },
			{ path: 'usuarios', component: Usuario },
			{ path: 'cartas', component: Carta },
			{ path: 'ventas', component: Venta },
			{ path: 'historial', component: Historial },
			{ path: 'reporte', component: Reporte }
		]
	},
	{ path: '**', redirectTo: 'login' }
];
