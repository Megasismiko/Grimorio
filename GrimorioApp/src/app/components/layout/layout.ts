import { Component } from '@angular/core';
import { RouterOutlet, RouterLink, RouterLinkActive } from '@angular/router';
import { SHARED_IMPORTS } from '../../reutilizable/shared.imports';
import { MenuService } from '../../services/menu.service';
import { Menu } from '../../interfaces/menu';
import { map, shareReplay } from 'rxjs/operators';
import { Observable } from 'rxjs';

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
export class Layout {
	menu$!: Observable<Menu[]>;

	constructor(private _menu: MenuService) {
		this.menu$ = this._menu.Lista(1).pipe(
			map(res => res.value),
			shareReplay(1)
		);
	}

	trackByRoute = (_: number, it: Menu) => it.url;

}
