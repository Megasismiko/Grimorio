import { ChangeDetectionStrategy, Component, Input } from '@angular/core';
import { CommonModule } from '@angular/common';
import { MatIconModule } from '@angular/material/icon';

@Component({
	selector: 'app-chip-es-activo',
	standalone: true,
	imports: [CommonModule, MatIconModule],
	templateUrl: './chip-es-activo.html',
	styleUrl: './chip-es-activo.css',
	changeDetection: ChangeDetectionStrategy.OnPush,
})
export class ChipEsActivoComponent {
	@Input() esActivo: boolean | null = null;

	/** Etiquetas personalizables */
	@Input() trueLabel = 'Activo';
	@Input() falseLabel = 'Inactivo';

	/** Iconos personalizables */
	@Input() trueIcon = 'check_circle';
	@Input() falseIcon = 'cancel';
}
