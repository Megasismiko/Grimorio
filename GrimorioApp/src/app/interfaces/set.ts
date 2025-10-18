import { Carta } from "./carta"

export interface Set {
	idSet: number,
	nombre: string,
	esActivo: boolean,
	codigo: string
	logo: string
	fechaSalida: string,
	color: string,
	cartas?: Carta[]
	numCartas?: number
}
