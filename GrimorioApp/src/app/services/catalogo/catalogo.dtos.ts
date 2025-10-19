

export type ScryfallSet = {
	name: string;
	code: string;
	released_at?: string;
	icon_svg_uri?: string;
	id: string,
	uri: string
	scryfall_uri: string,
	search_uri: string,
	set_type: string,
	card_count: number,
	parent_set_code: string,
	digital: boolean
	nonfoil_only: boolean,
	foil_only: boolean
};

export type ScryfallCard = {
	id: string;
	name: string;
	set: string;
	set_name?: string;
	oracle_text?: string;
	artist?: string;
	collector_number?: string;
	power?: string;
	toughness?: string;
	rarity?: 'common' | 'uncommon' | 'rare' | 'mythic' | string;
	image_uris?: { small?: string; normal?: string; art_crop?: string };
	type_line?: string;
	mana_cost?: string;
};
