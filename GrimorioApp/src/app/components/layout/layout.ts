import { Component } from '@angular/core';
import { SHARED_IMPORTS } from '../../reutilizable/shared.imports';
import { RouterOutlet } from '@angular/router';

@Component({
	standalone: true,
	selector: 'app-layout',
	imports: [
    ...SHARED_IMPORTS,
    RouterOutlet
],
	templateUrl: './layout.html',
	styleUrls: ['./layout.css']
})
export class Layout {

}
