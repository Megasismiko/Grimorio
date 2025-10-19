import { ReactiveFormsModule, FormsModule } from '@angular/forms';
import { MatCardModule } from '@angular/material/card';
import { MatInputModule } from '@angular/material/input';
import { MatSelectModule } from '@angular/material/select';
import { MatProgressBarModule } from '@angular/material/progress-bar';
import { MatProgressSpinnerModule } from '@angular/material/progress-spinner';
import { MatGridListModule } from '@angular/material/grid-list';
import { LayoutModule } from '@angular/cdk/layout';
import { MatToolbarModule } from '@angular/material/toolbar';
import { MatSidenavModule } from '@angular/material/sidenav';
import { MatButtonModule } from '@angular/material/button';
import { MatIconModule } from '@angular/material/icon';
import { MatListModule } from '@angular/material/list';
import { MatTableModule } from '@angular/material/table';
import { MatPaginatorModule } from '@angular/material/paginator';
import { MatDialogModule } from '@angular/material/dialog';
import { MatSnackBarModule } from '@angular/material/snack-bar';
import { MatTooltipModule } from '@angular/material/tooltip';
import { MatAutocompleteModule } from '@angular/material/autocomplete';
import { MatDatepickerModule } from '@angular/material/datepicker';
import { MatNativeDateModule } from '@angular/material/core';
import { MomentDateModule } from '@angular/material-moment-adapter';
import { MatDividerModule } from '@angular/material/divider';
import { CommonModule } from '@angular/common';
import { MatSort, MatSortModule } from '@angular/material/sort';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatSlideToggleModule } from '@angular/material/slide-toggle';
import { MatChipsModule } from '@angular/material/chips';
import { MatCheckboxModule } from '@angular/material/checkbox';

export const DEFAULT_CARD_IMAGE = 'https://gatherer.wizards.com/assets/card_back.webp';

export const DEFAULT_SET_LOGO = 'https://svgs.scryfall.io/sets/one.svg';

export const COLORES_SET = [
	{ color: '#8B0000', descripcion: 'Granate' },
	{ color: '#B23A48', descripcion: 'Rojo Oscuro' },
	{ color: '#C2A878', descripcion: 'Arena Dorada' },
	{ color: '#D4AF37', descripcion: 'Oro Antiguo' },
	{ color: '#2F5233', descripcion: 'Verde Bosque' },
	{ color: '#2E4A7D', descripcion: 'Azul Arcano' },
	{ color: '#3D2C8D', descripcion: 'Índigo' },
	{ color: '#4C1A57', descripcion: 'Morado Profundo' },
	{ color: '#5A5A5A', descripcion: 'Gris Hierro' },
	{ color: '#1C1C1C', descripcion: 'Carbón Oscuro' }
];

export const SHARED_IMPORTS = [
	FormsModule,
	ReactiveFormsModule,
	MatCardModule,
	MatInputModule,
	MatSelectModule,
	MatProgressBarModule,
	MatProgressSpinnerModule,
	MatGridListModule,
	LayoutModule,
	MatToolbarModule,
	MatSidenavModule,
	MatButtonModule,
	MatIconModule,
	MatListModule,
	MatTableModule,
	MatPaginatorModule,
	MatDialogModule,
	MatSnackBarModule,
	MatTooltipModule,
	MatAutocompleteModule,
	MatDatepickerModule,
	MatNativeDateModule,
	MomentDateModule,
	MatDividerModule,
	CommonModule,
	MatSortModule,
	MatSort,
	MatFormFieldModule,
	MatSlideToggleModule,
	MatChipsModule,
	MatCheckboxModule

] as const;
