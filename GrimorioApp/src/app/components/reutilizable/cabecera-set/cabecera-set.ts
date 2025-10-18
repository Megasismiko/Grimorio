import { ChangeDetectionStrategy, Component, Input } from '@angular/core';
import { MatCardModule } from '@angular/material/card';
import { MatIconModule } from '@angular/material/icon';
import { ChipEsActivoComponent } from '../chip-es-activo/chip-es-activo';
import { Set } from '../../../interfaces/set';

@Component({
	selector: 'app-cabecera-set',
	standalone: true,
	imports: [
		MatCardModule,
		MatIconModule,
		ChipEsActivoComponent
	],
	templateUrl: './cabecera-set.html',
	styleUrls: ['./cabecera-set.css'],
	changeDetection: ChangeDetectionStrategy.OnPush,
})
export class CabeceraSetComponent {
	@Input() set: Set | null = null;
}
