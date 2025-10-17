export interface VentaSemana {
	id: number;
	fecha: string | Date;
	total: number;
}

export interface Resumen {
	totalVentas: number;
	totalIngresos: string | number;
	ventasUltimaSemana: VentaSemana[];
	totalProductos: number;
}