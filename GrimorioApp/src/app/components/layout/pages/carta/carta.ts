import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';

@Component({
	standalone: true,
	selector: 'app-carta',
	imports: [],
	templateUrl: './carta.html',
	styleUrl: './carta.css'
})
export class CartaComponent implements OnInit {

	constructor(private route: ActivatedRoute) { }

	ngOnInit() {
		const idSet = this.route.snapshot.paramMap.get('idSet');
		const idCarta = this.route.snapshot.paramMap.get('idCarta');
	}
}
