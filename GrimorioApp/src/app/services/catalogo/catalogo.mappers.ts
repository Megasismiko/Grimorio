import { Carta } from '../../interfaces/carta';
import { Set } from '../../interfaces/set';
import { DateUtil } from '../../reutilizable/date.util';
import { COLORES_SET, DEFAULT_CARD_IMAGE, DEFAULT_SET_LOGO } from '../../reutilizable/shared.imports';
import { ScryfallCard, ScryfallSet } from './catalogo.dtos';

export const mapSetFromScryfall = (s: ScryfallSet): Set => ({
	idSet: 0,
	nombre: s.name,
	esActivo: true,
	codigo: s.code?.toUpperCase().trim(),
	logo: s.icon_svg_uri || DEFAULT_SET_LOGO,
	fechaSalida: DateUtil.formatDateString(s.released_at),
	color: COLORES_SET[Math.floor(Math.random() * COLORES_SET.length)].color,
	cartas: [],
	numCartas: s.card_count || 0
});


export const mapCardFromScryfall = (c: ScryfallCard): Carta => ({
	idCarta: 0,
	idSet: 0,
	descripcionSet: '',
	nombre: c.name || '',
	precio: parseFloat(c.prices?.eur || c.prices?.eur_foil || c.prices?.usd || c.prices?.usd || c.prices?.usd_foil || c.prices?.usd_etched || c.prices?.tix || '0'),
	stock: 0,
	tipo: c.type_line || '',
	rareza: c.rarity || '',
	coste: c.mana_cost || '',
	texto: c.oracle_text || '',
	artista: c.artist || '',
	numero: c.collector_number || '',
	poder: c.power || '',
	resistencia: c.toughness || '',
	imagenUrl: c.image_uris?.normal || DEFAULT_CARD_IMAGE,
	esActivo: true,
});
