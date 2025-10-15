USE GrimorioDB
GO
BEGIN TRY
	BEGIN TRANSACTION;

	DECLARE @IDSET AS INT = 0;



	-------------------------------------------------------------------------------------------------------------------------------------------------------

	INSERT INTO Sets (Nombre, Tipo, Codigo, FechaSalida, Logo)
	VALUES ('War of the Spark', 'expansion', 'WAR', '20190503', 'https://svgs.scryfall.io/sets/war.svg');

	SET @IDSET = SCOPE_IDENTITY();

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Karn, the Great Creator', '{4}', 'Legendary Planeswalker — Karn', 'Rare', 'Activated abilities of artifacts your opponents control can''t be activated.
	[+1]: Until your next turn, up to one target noncreature artifact becomes an artifact creature with power and toughness each equal to its mana value.
	[−2]: You may reveal an artifact card you own from outside the game or choose a face-up artifact card you own in exile. Put that card into your hand.', 'Wisnu Tan', '1', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=460928&type=card', 43, 147.65);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Ugin, the Ineffable', '{6}', 'Legendary Planeswalker — Ugin', 'Rare', 'Colorless spells you cast cost {2} less to cast.
	[+1]: Exile the top card of your library face down and look at it. Create a 2/2 colorless Spirit creature token. When that token leaves the battlefield, put the exiled card into your hand.
	[−3]: Destroy target permanent that''s one or more colors.', 'Daarken', '2', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=460929&type=card', 28, 181.78);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Ugin''s Conjurant', '{X}', 'Creature — Spirit Monk', 'Uncommon', 'Ugin''s Conjurant enters the battlefield with X +1/+1 counters on it.
	If damage would be dealt to Ugin''s Conjurant while it has a +1/+1 counter on it, prevent that damage and remove that many +1/+1 counters from Ugin''s Conjurant.', 'Ryan Yee', '3', '0', '0', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=460930&type=card', 43, 81.41);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Ajani''s Pridemate', '{1}{W}', 'Creature — Cat Soldier', 'Uncommon', 'Whenever you gain life, put a +1/+1 counter on Ajani''s Pridemate.', 'Sidharth Chaturvedi', '4', '2', '2', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=460931&type=card', 6, 56.53);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Battlefield Promotion', '{1}{W}', 'Instant', 'Common', 'Put a +1/+1 counter on target creature. That creature gains first strike until end of turn. You gain 2 life.', 'Scott Murphy', '5', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=460932&type=card', 36, 5.69);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Bond of Discipline', '{4}{W}', 'Sorcery', 'Uncommon', 'Tap all creatures your opponents control. Creatures you control gain lifelink until end of turn.', 'Zezhou Chen', '6', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=460933&type=card', 40, 68.49);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Bulwark Giant', '{5}{W}', 'Creature — Giant Soldier', 'Common', 'When Bulwark Giant enters the battlefield, you gain 5 life.', 'Victor Adame Minguez', '7', '3', '6', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=460934&type=card', 11, 40.99);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Charmed Stray', '{W}', 'Creature — Cat', 'Common', 'Lifelink
	When Charmed Stray enters the battlefield, put a +1/+1 counter on each other creature you control named Charmed Stray.', 'Chris Rahn', '8', '1', '1', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=460935&type=card', 34, 44.30);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Defiant Strike', '{W}', 'Instant', 'Common', 'Target creature gets +1/+0 until end of turn.
	Draw a card.', 'Gabor Szikszai', '9', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=460936&type=card', 8, 28.22);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Divine Arrow', '{1}{W}', 'Instant', 'Common', 'Divine Arrow deals 4 damage to target attacking or blocking creature.', 'Kieran Yanner', '10', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=460937&type=card', 27, 13.00);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Enforcer Griffin', '{4}{W}', 'Creature — Griffin', 'Common', 'Flying', 'Johan Grenier', '11', '3', '4', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=460938&type=card', 14, 12.41);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Finale of Glory', '{X}{W}{W}', 'Sorcery', 'Mythic', 'Create X 2/2 white Soldier creature tokens with vigilance. If X is 10 or more, also create X 4/4 white Angel creature tokens with flying and vigilance.', 'Stanton Feng', '12', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=460939&type=card', 18, 257.13);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Gideon Blackblade', '{1}{W}{W}', 'Legendary Planeswalker — Gideon', 'Mythic', 'As long as it''s your turn, Gideon Blackblade is a 4/4 Human Soldier creature with indestructible that''s still a planeswalker.
	Prevent all damage that would be dealt to Gideon Blackblade during your turn.
	[+1]: Up to one other target creature you control gains your choice of vigilance, lifelink, or indestructible until end of turn.
	[−6]: Exile target nonland permanent.', 'Viktor Titov', '13', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=460940&type=card', 2, 397.66);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Gideon''s Sacrifice', '{W}', 'Instant', 'Common', 'Choose a creature or planeswalker you control. All damage that would be dealt this turn to you and permanents you control is dealt to the chosen permanent instead (if it''s still on the battlefield).', 'Chris Rallis', '14', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=460941&type=card', 43, 5.02);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Gideon''s Triumph', '{1}{W}', 'Instant', 'Uncommon', 'Target opponent sacrifices a creature that attacked or blocked this turn. If you control a Gideon planeswalker, that player sacrifices two of those creatures instead.', 'Kieran Yanner', '15', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=460942&type=card', 23, 103.53);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'God-Eternal Oketra', '{3}{W}{W}', 'Legendary Creature — Zombie God', 'Mythic', 'Double strike
	Whenever you cast a creature spell, create a 4/4 black Zombie Warrior creature token with vigilance.
	When God-Eternal Oketra dies or is put into exile from the battlefield, you may put it into its owner''s library third from the top.', 'Grzegorz Rutkowski', '16', '3', '6', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=460943&type=card', 36, 258.99);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Grateful Apparition', '{1}{W}', 'Creature — Spirit', 'Uncommon', 'Flying
	Whenever Grateful Apparition deals combat damage to a player or planeswalker, proliferate. (Choose any number of permanents and/or players, then give each another counter of each kind already there.)', 'Izzy', '17', '1', '1', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=460944&type=card', 40, 69.16);



	-------------------------------------------------------------------------------------------------------------------------------------------------------

	INSERT INTO Sets (Nombre, Tipo, Codigo, FechaSalida, Logo)
	VALUES ('Tempest', 'expansion', 'TMP', '19971014', 'https://svgs.scryfall.io/sets/tmp.svg');

	SET @IDSET = SCOPE_IDENTITY();

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Advance Scout', '{1}{W}', 'Creature — Human Soldier Scout', 'Common', 'First strike
	{W}: Target creature gains first strike until end of turn.', 'Heather Hudson', '1', '1', '1', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=4857&type=card', 47, 11.89);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Angelic Protector', '{3}{W}', 'Creature — Angel', 'Uncommon', 'Flying
	Whenever Angelic Protector becomes the target of a spell or ability, Angelic Protector gets +0/+3 until end of turn.', 'DiTerlizzi', '2', '2', '2', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=4858&type=card', 2, 108.82);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Anoint', '{W}', 'Instant', 'Common', 'Buyback {3} (You may pay an additional {3} as you cast this spell. If you do, put this card into your hand as it resolves.)
	Prevent the next 3 damage that would be dealt to target creature this turn.', 'Eric David Anderson', '3', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=4859&type=card', 8, 46.25);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Armor Sliver', '{2}{W}', 'Creature — Sliver', 'Uncommon', 'All Sliver creatures have "{2}: This creature gets +0/+1 until end of turn."', 'Scott Kirschner', '4', '2', '2', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=4689&type=card', 46, 72.22);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Armored Pegasus', '{1}{W}', 'Creature — Pegasus', 'Common', 'Flying', 'Una Fricker', '5', '1', '2', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=4861&type=card', 41, 2.50);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Auratog', '{1}{W}', 'Creature — Atog', 'Rare', 'Sacrifice an enchantment: Auratog gets +2/+2 until end of turn.', 'Jeff Miracola', '6', '1', '2', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=4862&type=card', 38, 235.71);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Avenging Angel', '{3}{W}{W}', 'Creature — Angel', 'Rare', 'Flying
	When Avenging Angel dies, you may put it on top of its owner''s library.', 'Matthew D. Wilson', '7', '3', '3', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=4863&type=card', 45, 136.67);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Circle of Protection: Black', '{1}{W}', 'Enchantment', 'Common', '{1}: The next time a black source of your choice would deal damage to you this turn, prevent that damage.', 'Harold McNeill', '8', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=4864&type=card', 26, 40.51);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Circle of Protection: Blue', '{1}{W}', 'Enchantment', 'Common', '{1}: The next time a blue source of your choice would deal damage to you this turn, prevent that damage.', 'Harold McNeill', '9', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=4865&type=card', 9, 5.94);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Circle of Protection: Green', '{1}{W}', 'Enchantment', 'Common', '{1}: The next time a green source of your choice would deal damage to you this turn, prevent that damage.', 'Harold McNeill', '10', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=4866&type=card', 29, 1.18);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Circle of Protection: Red', '{1}{W}', 'Enchantment', 'Common', '{1}: The next time a red source of your choice would deal damage to you this turn, prevent that damage.', 'Harold McNeill', '11', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=4867&type=card', 23, 21.67);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Circle of Protection: Shadow', '{1}{W}', 'Enchantment', 'Common', '{1}: The next time a creature of your choice with shadow would deal damage to you this turn, prevent that damage.', 'Harold McNeill', '12', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=4868&type=card', 13, 8.69);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Circle of Protection: White', '{1}{W}', 'Enchantment', 'Common', '{1}: The next time a white source of your choice would deal damage to you this turn, prevent that damage.', 'Harold McNeill', '13', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=4869&type=card', 29, 27.38);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Clergy en-Vec', '{1}{W}', 'Creature — Human Cleric', 'Common', '{T}: Prevent the next 1 damage that would be dealt to any target this turn.', 'Heather Hudson', '14', '1', '1', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=4870&type=card', 37, 6.94);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Cloudchaser Eagle', '{3}{W}', 'Creature — Bird', 'Common', 'Flying
	When Cloudchaser Eagle enters the battlefield, destroy target enchantment.', 'Una Fricker', '15', '2', '2', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=4871&type=card', 25, 43.62);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Disenchant', '{1}{W}', 'Instant', 'Common', 'Destroy target artifact or enchantment.', 'Allen Williams', '16', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=4872&type=card', 34, 4.69);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Elite Javelineer', '{2}{W}', 'Creature — Human Soldier', 'Common', 'Whenever Elite Javelineer blocks, it deals 1 damage to target attacking creature.', 'Mark Poole', '17', '2', '2', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=4873&type=card', 43, 6.91);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Field of Souls', '{2}{W}{W}', 'Enchantment', 'Rare', 'Whenever a nontoken creature is put into your graveyard from the battlefield, create a 1/1 white Spirit creature token with flying.', 'Richard Kane Ferguson', '18', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=4874&type=card', 22, 171.91);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Flickering Ward', '{W}', 'Enchantment — Aura', 'Uncommon', 'Enchant creature
	As Flickering Ward enters the battlefield, choose a color.
	Enchanted creature has protection from the chosen color. This effect doesn''t remove Flickering Ward.
	{W}: Return Flickering Ward to its owner''s hand.', 'Greg Simanson', '19', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=4875&type=card', 19, 94.52);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Gallantry', '{1}{W}', 'Instant', 'Uncommon', 'Target blocking creature gets +4/+4 until end of turn.
	Draw a card.', 'Douglas Shuler', '20', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=4876&type=card', 12, 52.30);



	-------------------------------------------------------------------------------------------------------------------------------------------------------

	INSERT INTO Sets (Nombre, Tipo, Codigo, FechaSalida, Logo)
	VALUES ('Hour of Devastation', 'expansion', 'HOU', '20170714', 'https://svgs.scryfall.io/sets/hou.svg');

	SET @IDSET = SCOPE_IDENTITY();

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Act of Heroism', '{1}{W}', 'Instant', 'Common', 'Untap target creature. It gets +2/+2 until end of turn and can block an additional creature this turn.', 'Magali Villeneuve', '1', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=430690&type=card', 7, 35.92);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Adorned Pouncer', '{1}{W}', 'Creature — Cat', 'Rare', 'Double strike
	Eternalize {3}{W}{W} ({3}{W}{W}, Exile this card from your graveyard: Create a token that''s a copy of it, except it''s a 4/4 black Zombie Cat with no mana cost. Eternalize only as a sorcery.)', 'Slawomir Maniak', '2', '1', '1', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=430691&type=card', 16, 206.05);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Angel of Condemnation', '{2}{W}{W}', 'Creature — Angel', 'Rare', 'Flying, vigilance
	{2}{W}, {T}: Exile another target creature. Return that card to the battlefield under its owner''s control at the beginning of the next end step.
	{2}{W}, {T}, Exert Angel of Condemnation: Exile another target creature until Angel of Condemnation leaves the battlefield. (An exerted creature won''t untap during your next untap step.)', 'Slawomir Maniak', '3', '3', '3', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=430692&type=card', 8, 129.20);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Angel of the God-Pharaoh', '{4}{W}{W}', 'Creature — Angel', 'Uncommon', 'Flying
	Cycling {2} ({2}, Discard this card: Draw a card.)', 'E. M. Gist', '4', '4', '4', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=430693&type=card', 27, 74.60);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Aven of Enduring Hope', '{4}{W}', 'Creature — Bird Cleric', 'Common', 'Flying
	When Aven of Enduring Hope enters the battlefield, you gain 3 life.', 'James Ryman', '5', '3', '3', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=430694&type=card', 29, 27.59);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Crested Sunmare', '{3}{W}{W}', 'Creature — Horse', 'Mythic', 'Other Horses you control have indestructible.
	At the beginning of each end step, if you gained life this turn, create a 5/5 white Horse creature token.', 'Lucas Graciano', '6', '5', '5', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=430695&type=card', 10, 334.84);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Dauntless Aven', '{2}{W}', 'Creature — Bird Warrior', 'Common', 'Flying
	Whenever Dauntless Aven attacks, untap target creature you control.', 'Zack Stella', '7', '2', '1', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=430696&type=card', 4, 37.10);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Desert''s Hold', '{2}{W}', 'Enchantment — Aura', 'Uncommon', 'Enchant creature
	When Desert''s Hold enters the battlefield, if you control a Desert or there is a Desert card in your graveyard, you gain 3 life.
	Enchanted creature can''t attack or block, and its activated abilities can''t be activated.', 'Sara Winters', '8', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=430697&type=card', 42, 70.00);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Disposal Mummy', '{2}{W}', 'Creature — Zombie Jackal', 'Common', 'When Disposal Mummy enters the battlefield, exile target card from an opponent''s graveyard.', 'Gabor Szikszai', '9', '2', '3', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=430698&type=card', 38, 31.94);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Djeru, With Eyes Open', '{3}{W}{W}', 'Legendary Creature — Human Warrior', 'Rare', 'Vigilance
	When Djeru, With Eyes Open enters the battlefield, you may search your library for a planeswalker card, reveal it, put it into your hand, then shuffle.
	If a source would deal damage to a planeswalker you control, prevent 1 of that damage.', 'Kieran Yanner', '10', '4', '3', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=430699&type=card', 37, 157.73);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Djeru''s Renunciation', '{1}{W}', 'Instant', 'Common', 'Tap up to two target creatures.
	Cycling {W} ({W}, Discard this card: Draw a card.)', 'Kieran Yanner', '11', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=430700&type=card', 5, 16.74);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Gideon''s Defeat', '{W}', 'Instant', 'Uncommon', 'Exile target white creature that''s attacking or blocking. If it was a Gideon planeswalker, you gain 5 life.', 'Kieran Yanner', '13', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=430702&type=card', 14, 99.52);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'God-Pharaoh''s Faithful', '{W}', 'Creature — Human Wizard', 'Common', 'Whenever you cast a blue, black, or red spell, you gain 1 life.', 'Bastien L. Deharme', '14', '0', '4', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=430703&type=card', 49, 32.42);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Hour of Revelation', '{3}{W}{W}{W}', 'Sorcery', 'Rare', 'This spell costs {3} less to cast if there are ten or more nonland permanents on the battlefield.
	Destroy all nonland permanents.', 'Raymond Swanland', '15', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=430704&type=card', 37, 236.31);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Mummy Paramount', '{1}{W}', 'Creature — Zombie', 'Common', 'Whenever another Zombie enters the battlefield under your control, Mummy Paramount gets +1/+1 until end of turn.', 'Josu Hernaiz', '16', '2', '2', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=430705&type=card', 39, 47.47);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Oketra''s Avenger', '{1}{W}', 'Creature — Human Warrior', 'Common', 'You may exert Oketra''s Avenger as it attacks. When you do, prevent all combat damage that would be dealt to it this turn. (An exerted creature won''t untap during your next untap step.)', 'Anthony Palumbo', '17', '3', '1', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=430706&type=card', 43, 15.31);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Oketra''s Last Mercy', '{1}{W}{W}', 'Sorcery', 'Rare', 'Your life total becomes equal to your starting life total. Lands you control don''t untap during your next untap step.', 'Howard Lyon', '18', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=430707&type=card', 18, 126.75);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Overwhelming Splendor', '{6}{W}{W}', 'Enchantment — Aura Curse', 'Mythic', 'Enchant player
	Creatures enchanted player controls lose all abilities and have base power and toughness 1/1.
	Enchanted player can''t activate abilities that aren''t mana abilities or loyalty abilities.', 'Richard Wright', '19', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=430708&type=card', 34, 399.78);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Sandblast', '{2}{W}', 'Instant', 'Common', 'Sandblast deals 5 damage to target attacking or blocking creature.', 'Seb McKinnon', '20', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=430709&type=card', 23, 31.55);



	-------------------------------------------------------------------------------------------------------------------------------------------------------

	INSERT INTO Sets (Nombre, Tipo, Codigo, FechaSalida, Logo)
	VALUES ('Onslaught', 'expansion', 'ONS', '20021007', 'https://svgs.scryfall.io/sets/ons.svg');

	SET @IDSET = SCOPE_IDENTITY();

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Akroma''s Blessing', '{2}{W}', 'Instant', 'Uncommon', 'Choose a color. Creatures you control gain protection from the chosen color until end of turn.
	Cycling {W} ({W}, Discard this card: Draw a card.)', 'Adam Rex', '1', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=41162&type=card', 17, 78.12);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Akroma''s Vengeance', '{4}{W}{W}', 'Sorcery', 'Rare', 'Destroy all artifacts, creatures, and enchantments.
	Cycling {3} ({3}, Discard this card: Draw a card.)', 'Greg Hildebrandt & Tim Hildebrandt', '2', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=41168&type=card', 40, 178.90);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Ancestor''s Prophet', '{4}{W}', 'Creature — Human Cleric', 'Rare', 'Tap five untapped Clerics you control: You gain 10 life.', 'Kev Walker', '3', '1', '5', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=39882&type=card', 22, 133.78);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Astral Slide', '{2}{W}', 'Enchantment', 'Uncommon', 'Whenever a player cycles a card, you may exile target creature. If you do, return that card to the battlefield under its owner''s control at the beginning of the next end step.', 'Ron Spears', '4', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=41148&type=card', 46, 85.24);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Aura Extraction', '{1}{W}', 'Instant', 'Uncommon', 'Put target enchantment on top of its owner''s library.
	Cycling {2} ({2}, Discard this card: Draw a card.)', 'Luca Zontini', '5', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=35326&type=card', 34, 111.85);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Aurification', '{2}{W}{W}', 'Enchantment', 'Rare', 'Whenever a creature deals damage to you, put a gold counter on it.
	Each creature with a gold counter on it is a Wall in addition to its other creature types and has defender. (Those creatures can''t attack.)
	When Aurification leaves the battlefield, remove all gold counters from all creatures.', 'Gary Ruddell', '6', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=39900&type=card', 13, 137.08);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Aven Brigadier', '{3}{W}{W}{W}', 'Creature — Bird Soldier', 'Rare', 'Flying
	Other Bird creatures get +1/+1.
	Other Soldier creatures get +1/+1.', 'Greg Staples', '7', '3', '5', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=40131&type=card', 12, 212.42);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Aven Soulgazer', '{3}{W}{W}', 'Creature — Bird Cleric', 'Uncommon', 'Flying
	{2}{W}: Look at target face-down creature.', 'John Avon', '8', '3', '3', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=39520&type=card', 4, 60.19);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Battlefield Medic', '{1}{W}', 'Creature — Human Cleric', 'Common', '{T}: Prevent the next X damage that would be dealt to target creature this turn, where X is the number of Clerics on the battlefield.', 'Matt Thompson', '9', '1', '1', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=39430&type=card', 26, 25.69);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Catapult Master', '{3}{W}{W}', 'Creature — Human Soldier', 'Rare', 'Tap five untapped Soldiers you control: Exile target creature.', 'Terese Nielsen', '10', '3', '3', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=19680&type=card', 29, 127.57);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Catapult Squad', '{1}{W}', 'Creature — Human Soldier', 'Uncommon', 'Tap two untapped Soldiers you control: Catapult Squad deals 2 damage to target attacking or blocking creature.', 'Brian Snõddy', '11', '2', '1', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=39702&type=card', 48, 56.45);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Chain of Silence', '{1}{W}', 'Instant', 'Uncommon', 'Prevent all damage target creature would deal this turn. That creature''s controller may sacrifice a land. If the player does, they may copy this spell and may choose a new target for that copy.', 'Randy Gallegos', '12', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=12446&type=card', 34, 93.14);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Circle of Solace', '{3}{W}', 'Enchantment', 'Rare', 'As Circle of Solace enters the battlefield, choose a creature type.
	{1}{W}: The next time a creature of the chosen type would deal damage to you this turn, prevent that damage.', 'Greg Hildebrandt & Tim Hildebrandt', '13', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=39615&type=card', 32, 155.81);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Convalescent Care', '{1}{W}{W}', 'Enchantment', 'Rare', 'At the beginning of your upkeep, if you have 5 or less life, you gain 3 life and draw a card.', 'Greg Hildebrandt & Tim Hildebrandt', '14', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=19122&type=card', 1, 230.22);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Crowd Favorites', '{6}{W}', 'Creature — Human Soldier', 'Uncommon', '{3}{W}: Tap target creature.
	{3}{W}: Crowd Favorites gets +0/+5 until end of turn.', 'Roger Raupp', '15', '4', '4', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=40653&type=card', 25, 109.36);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Crown of Awe', '{1}{W}', 'Enchantment — Aura', 'Common', 'Enchant creature
	Enchanted creature has protection from black and from red.
	Sacrifice Crown of Awe: Enchanted creature and other creatures that share a creature type with it gain protection from black and from red until end of turn.', 'Randy Elliott', '16', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=39431&type=card', 9, 2.56);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Crude Rampart', '{3}{W}', 'Creature — Wall', 'Uncommon', 'Defender (This creature can''t attack.)
	Morph {4}{W} (You may cast this card face down as a 2/2 creature for {3}. Turn it face up any time for its morph cost.)', 'Sam Wood', '17', '4', '5', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=39425&type=card', 23, 70.27);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Daru Cavalier', '{3}{W}', 'Creature — Human Soldier', 'Common', 'First strike
	When Daru Cavalier enters the battlefield, you may search your library for a card named Daru Cavalier, reveal it, put it into your hand, then shuffle.', 'Dany Orizio', '18', '2', '2', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=39523&type=card', 30, 31.28);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Daru Healer', '{2}{W}', 'Creature — Human Cleric', 'Common', '{T}: Prevent the next 1 damage that would be dealt to any target this turn.
	Morph {W} (You may cast this card face down as a 2/2 creature for {3}. Turn it face up any time for its morph cost.)', 'Dany Orizio', '19', '1', '2', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=39717&type=card', 39, 32.18);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Daru Lancer', '{4}{W}{W}', 'Creature — Human Soldier', 'Common', 'First strike
	Morph {2}{W}{W} (You may cast this card face down as a 2/2 creature for {3}. Turn it face up any time for its morph cost.)', 'Brian Snõddy', '20', '3', '4', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=39705&type=card', 39, 3.52);



	-------------------------------------------------------------------------------------------------------------------------------------------------------

	INSERT INTO Sets (Nombre, Tipo, Codigo, FechaSalida, Logo)
	VALUES ('Kaldheim', 'expansion', 'KHM', '20210205', 'https://svgs.scryfall.io/sets/khm.svg');

	SET @IDSET = SCOPE_IDENTITY();

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Axgard Braggart', '{3}{W}', 'Creature — Dwarf Warrior', 'Common', 'Boast — {1}{W}: Untap Axgard Braggart. Put a +1/+1 counter on it. (Activate only if this creature attacked this turn and only once each turn.)', 'Svetlin Velinov', '1', '3', '3', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=503605&type=card', 41, 37.20);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Battershield Warrior', '{2}{W}', 'Creature — Human Warrior', 'Uncommon', 'Boast — {1}{W}: Creatures you control get +1/+1 until end of turn. (Activate only if this creature attacked this turn and only once each turn.)', 'Colin Boyer', '2', '2', '2', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=503606&type=card', 36, 68.65);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Battlefield Raptor', '{W}', 'Creature — Bird', 'Common', 'Flying, first strike', 'Mike Bierek', '3', '1', '2', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=503607&type=card', 46, 21.09);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Beskir Shieldmate', '{1}{W}', 'Creature — Human Warrior', 'Common', 'When Beskir Shieldmate dies, create a 1/1 white Human Warrior creature token.', 'Manuel Castañón', '4', '2', '1', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=503608&type=card', 32, 26.48);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Bound in Gold', '{2}{W}', 'Enchantment — Aura', 'Common', 'Enchant permanent
	Enchanted permanent can''t attack, block, or crew Vehicles, and its activated abilities can''t be activated unless they''re mana abilities.', 'Victor Adame Minguez', '5', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=503609&type=card', 0, 7.87);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Clarion Spirit', '{1}{W}', 'Creature — Spirit', 'Uncommon', 'Whenever you cast your second spell each turn, create a 1/1 white Spirit creature token with flying.', 'Anastasia Ovchinnikova', '6', '2', '2', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=503610&type=card', 0, 107.01);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Codespell Cleric', '{W}', 'Creature — Human Cleric', 'Common', 'Vigilance
	When Codespell Cleric enters the battlefield, if it was the second spell you cast this turn, put a +1/+1 counter on target creature.', 'Manuel Castañón', '7', '1', '1', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=503611&type=card', 41, 30.36);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Divine Gambit', '{W}{W}', 'Sorcery', 'Uncommon', 'Exile target artifact, creature, or enchantment an opponent controls. That player may put a permanent card from their hand onto the battlefield.', 'Joe Slucher', '8', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=503612&type=card', 25, 64.91);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Doomskar', '{3}{W}{W}', 'Sorcery', 'Rare', 'Destroy all creatures.
	Foretell {1}{W}{W} (During your turn, you may pay {2} and exile this card from your hand face down. Cast it on a later turn for its foretell cost.)', 'Piotr Dura', '9', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=503613&type=card', 48, 183.91);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Doomskar Oracle', '{2}{W}', 'Creature — Human Cleric', 'Common', 'Whenever you cast your second spell each turn, you gain 2 life.
	Foretell {W} (During your turn, you may pay {2} and exile this card from your hand face down. Cast it on a later turn for its foretell cost.)', 'Taylor Ingvarsson', '10', '3', '2', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=503614&type=card', 23, 16.29);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Giant Ox', '{1}{W}', 'Creature — Ox', 'Common', 'Giant Ox crews Vehicles using its toughness rather than its power.', 'Joe Slucher', '11', '0', '6', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=503615&type=card', 40, 25.37);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Glorious Protector', '{2}{W}{W}', 'Creature — Angel Cleric', 'Rare', 'Flash
	Flying
	When Glorious Protector enters the battlefield, you may exile any number of non-Angel creatures you control until Glorious Protector leaves the battlefield.
	Foretell {2}{W}', 'PINDURSKI', '12', '3', '4', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=503616&type=card', 37, 164.48);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Gods'' Hall Guardian', '{5}{W}', 'Creature — Cat', 'Common', 'Vigilance
	Foretell {3}{W} (During your turn, you may pay {2} and exile this card from your hand face down. Cast it on a later turn for its foretell cost.)', 'Sidharth Chaturvedi', '13', '3', '6', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=503617&type=card', 5, 33.19);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Goldmaw Champion', '{2}{W}', 'Creature — Dwarf Warrior', 'Common', 'Boast — {1}{W}: Tap target creature. (Activate only if this creature attacked this turn and only once each turn.)', 'Slawomir Maniak', '14', '2', '3', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=503618&type=card', 27, 43.75);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Halvar, God of Battle // Sword of the Realms', '{2}{W}{W}', 'Legendary Creature — God', 'Mythic', 'Creatures you control that are enchanted or equipped have double strike.
	At the beginning of each combat, you may attach target Aura or Equipment attached to a creature you control to target creature you control.', 'Lie Setiawan', '15', '4', '4', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=503619&type=card', 27, 256.39);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Halvar, God of Battle // Sword of the Realms', '{1}{W}', 'Legendary Artifact — Equipment', 'Mythic', 'Equipped creature gets +2/+0 and has vigilance.
	Whenever equipped creature dies, return it to its owner''s hand.
	Equip {1}{W}', 'Lie Setiawan', '15', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=503620&type=card', 35, 383.01);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Invoke the Divine', '{2}{W}', 'Instant', 'Common', 'Destroy target artifact or enchantment. You gain 4 life.', 'Campbell White', '16', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=503621&type=card', 29, 36.38);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Iron Verdict', '{2}{W}', 'Instant', 'Common', 'Iron Verdict deals 5 damage to target tapped creature.
	Foretell {W} (During your turn, you may pay {2} and exile this card from your hand face down. Cast it on a later turn for its foretell cost.)', 'Bryan Sola', '17', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=503622&type=card', 46, 8.11);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Kaya''s Onslaught', '{2}{W}', 'Instant', 'Uncommon', 'Target creature gets +1/+1 and gains double strike until end of turn.
	Foretell {W} (During your turn, you may pay {2} and exile this card from your hand face down. Cast it on a later turn for its foretell cost.)', 'Daarken', '18', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=503623&type=card', 35, 78.62);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Master Skald', '{4}{W}', 'Creature — Dwarf Warrior', 'Common', 'When Master Skald enters the battlefield, you may exile a creature card from your graveyard. If you do, return target artifact or enchantment card from your graveyard to your hand.', 'Svetlin Velinov', '19', '4', '4', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=503624&type=card', 38, 41.16);



	-------------------------------------------------------------------------------------------------------------------------------------------------------

	INSERT INTO Sets (Nombre, Tipo, Codigo, FechaSalida, Logo)
	VALUES ('Conflux', 'expansion', 'CON', '20090206', 'https://svgs.scryfall.io/sets/con.svg');

	SET @IDSET = SCOPE_IDENTITY();

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Aerie Mystics', '{4}{W}', 'Creature — Bird Wizard', 'Uncommon', 'Flying
	{1}{G}{U}: Creatures you control gain shroud until end of turn. (They can''t be the targets of spells or abilities.)', 'Mark Zug', '1', '3', '3', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=153946&type=card', 42, 64.28);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Asha''s Favor', '{2}{W}', 'Enchantment — Aura', 'Common', 'Enchant creature
	Enchanted creature has flying, first strike, and vigilance.', 'Donato Giancola', '2', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=150826&type=card', 34, 49.80);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Aven Squire', '{1}{W}', 'Creature — Bird Soldier', 'Common', 'Flying
	Exalted (Whenever a creature you control attacks alone, that creature gets +1/+1 until end of turn.)', 'David Palumbo', '3', '1', '1', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=184992&type=card', 13, 15.22);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Aven Trailblazer', '{2}{W}', 'Creature — Bird Soldier', 'Common', 'Flying
	Domain — Aven Trailblazer''s toughness is equal to the number of basic land types among lands you control.', 'Chris Rahn', '4', '2', '*', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=180278&type=card', 6, 12.36);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Celestial Purge', '{1}{W}', 'Instant', 'Uncommon', 'Exile target black or red permanent.', 'David Palumbo', '5', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=183055&type=card', 24, 87.57);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Court Homunculus', '{W}', 'Artifact Creature — Homunculus', 'Common', 'Court Homunculus gets +1/+1 as long as you control another artifact.', 'Matt Cavotta', '6', '1', '1', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=182607&type=card', 12, 44.09);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Darklit Gargoyle', '{1}{W}', 'Artifact Creature — Gargoyle', 'Common', 'Flying
	{B}: Darklit Gargoyle gets +2/-1 until end of turn.', 'Howard Lyon', '7', '1', '2', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=180334&type=card', 4, 39.08);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Gleam of Resistance', '{4}{W}', 'Instant', 'Common', 'Creatures you control get +1/+2 until end of turn. Untap those creatures.
	Basic landcycling {1}{W} ({1}{W}, Discard this card: Search your library for a basic land card, reveal it, put it into your hand, then shuffle.)', 'Matt Stewart', '8', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=179505&type=card', 15, 29.43);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Lapse of Certainty', '{2}{W}', 'Instant', 'Common', 'Counter target spell. If that spell is countered this way, put it on top of its owner''s library instead of into that player''s graveyard.', 'Anthony Francisco', '9', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=175026&type=card', 2, 40.41);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Mark of Asylum', '{1}{W}', 'Enchantment', 'Rare', 'Prevent all noncombat damage that would be dealt to creatures you control.', 'Sal Villagran', '10', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=186615&type=card', 15, 149.92);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Martial Coup', '{X}{W}{W}', 'Sorcery', 'Rare', 'Create X 1/1 white Soldier creature tokens. If X is 5 or more, destroy all other creatures.', 'Greg Staples', '11', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=178560&type=card', 35, 140.49);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Mirror-Sigil Sergeant', '{5}{W}', 'Creature — Rhino Soldier', 'Mythic', 'Trample
	At the beginning of your upkeep, if you control a blue permanent, you may create a token that''s a copy of Mirror-Sigil Sergeant.', 'Chris Rahn', '12', '4', '4', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=158598&type=card', 40, 394.23);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Nacatl Hunt-Pride', '{5}{W}', 'Creature — Cat Warrior', 'Uncommon', 'Vigilance
	{R}, {T}: Target creature can''t block this turn.
	{G}, {T}: Target creature blocks this turn if able.', 'Steve Prescott', '13', '5', '4', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=138571&type=card', 42, 89.34);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Paragon of the Amesha', '{2}{W}', 'Creature — Human Knight', 'Uncommon', 'First strike
	{W}{U}{B}{R}{G}: Until end of turn, Paragon of the Amesha becomes an Angel, gets +3/+3, and gains flying and lifelink.', 'Chris Rahn', '14', '2', '2', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=179878&type=card', 15, 83.77);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Path to Exile', '{W}', 'Instant', 'Uncommon', 'Exile target creature. Its controller may search their library for a basic land card, put that card onto the battlefield tapped, then shuffle.', 'Todd Lockwood', '15', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=179235&type=card', 12, 114.44);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Rhox Meditant', '{3}{W}', 'Creature — Rhino Monk', 'Common', 'When Rhox Meditant enters the battlefield, if you control a green permanent, draw a card.', 'Donato Giancola', '16', '2', '4', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=159634&type=card', 6, 42.43);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Scepter of Dominance', '{1}{W}{W}', 'Artifact', 'Rare', '{W}, {T}: Tap target permanent.', 'Howard Lyon', '17', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=174792&type=card', 21, 238.30);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Sigil of the Empty Throne', '{3}{W}{W}', 'Enchantment', 'Rare', 'Whenever you cast an enchantment spell, create a 4/4 white Angel creature token with flying.', 'Cyril Van Der Haegen', '18', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=180271&type=card', 38, 129.45);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Wall of Reverence', '{3}{W}', 'Creature — Spirit Wall', 'Rare', 'Defender, flying
	At the beginning of your end step, you may gain life equal to the power of target creature you control.', 'Wayne Reynolds', '20', '1', '6', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=189874&type=card', 27, 246.96);



	-------------------------------------------------------------------------------------------------------------------------------------------------------

	INSERT INTO Sets (Nombre, Tipo, Codigo, FechaSalida, Logo)
	VALUES ('Antiquities', 'expansion', 'ATQ', '19940304', 'https://svgs.scryfall.io/sets/atq.svg');

	SET @IDSET = SCOPE_IDENTITY();

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Argivian Archaeologist', '{1}{W}{W}', 'Creature — Human Artificer', 'Rare', '{W}{W}, {T}: Return target artifact card from your graveyard to your hand.', 'Amy Weber', '1', '1', '1', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=1064&type=card', 45, 190.18);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Argivian Blacksmith', '{1}{W}{W}', 'Creature — Human Artificer', 'Common', '{T}: Prevent the next 2 damage that would be dealt to target artifact creature this turn.', 'Kerstin Kaman', '2', '2', '2', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=1065&type=card', 37, 25.50);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Artifact Ward', '{W}', 'Enchantment — Aura', 'Common', 'Enchant creature
	Enchanted creature can''t be blocked by artifact creatures.
	Prevent all damage that would be dealt to enchanted creature by artifact sources.
	Enchanted creature can''t be the target of abilities from artifact sources.', 'Douglas Shuler', '3', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=1066&type=card', 6, 47.24);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Circle of Protection: Artifacts', '{1}{W}', 'Enchantment', 'Uncommon', '{2}: The next time an artifact source of your choice would deal damage to you this turn, prevent that damage.', 'Pete Venters', '4', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=1067&type=card', 15, 81.10);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Damping Field', '{2}{W}', 'Enchantment', 'Uncommon', 'Players can''t untap more than one artifact during their untap steps.', 'Justin Hampton', '5', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=1068&type=card', 39, 58.71);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Martyrs of Korlis', '{3}{W}{W}', 'Creature — Human', 'Uncommon', 'As long as Martyrs of Korlis is untapped, all damage that would be dealt to you by artifacts is dealt to Martyrs of Korlis instead.', 'Margaret Organ-Kean', '6', '1', '6', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=1069&type=card', 39, 111.07);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Reverse Polarity', '{W}{W}', 'Instant', 'Common', 'You gain X life, where X is twice the damage dealt to you so far this turn by artifacts.', 'Justin Hampton', '7', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=1070&type=card', 8, 31.52);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Drafna''s Restoration', '{U}', 'Sorcery', 'Common', 'Put any number of target artifact cards from target player''s graveyard on top of their library in any order.', 'Amy Weber', '8', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=1037&type=card', 32, 6.28);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Energy Flux', '{2}{U}', 'Enchantment', 'Uncommon', 'All artifacts have "At the beginning of your upkeep, sacrifice this artifact unless you pay {2}."', 'Kaja Foglio', '9', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=1038&type=card', 3, 101.58);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Hurkyl''s Recall', '{1}{U}', 'Instant', 'Rare', 'Return all artifacts target player owns to their hand.', 'NéNé Thomas', '10', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=1041&type=card', 7, 189.57);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Power Artifact', '{U}{U}', 'Enchantment — Aura', 'Uncommon', 'Enchant artifact
	Enchanted artifact''s activated abilities cost {2} less to activate. This effect can''t reduce the mana in that cost to less than one mana.', 'Douglas Shuler', '11', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=1043&type=card', 6, 77.45);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Reconstruction', '{U}', 'Sorcery', 'Common', 'Return target artifact card from your graveyard to your hand.', 'Anson Maddocks', '12', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=1045&type=card', 30, 14.51);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Sage of Lat-Nam', '{1}{U}', 'Creature — Human Artificer', 'Common', '{T}, Sacrifice an artifact: Draw a card.', 'Pete Venters', '13', '1', '2', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=1046&type=card', 34, 29.76);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Transmute Artifact', '{U}{U}', 'Sorcery', 'Uncommon', 'Sacrifice an artifact. If you do, search your library for an artifact card. If that card''s mana value is less than or equal to the sacrificed artifact''s mana value, put it onto the battlefield. If it''s greater, you may pay {X}, where X is the difference. If you do, put it onto the battlefield. If you don''t, put it into its owner''s graveyard. Then shuffle.', 'Anson Maddocks', '14', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=1047&type=card', 7, 71.72);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Artifact Possession', '{2}{B}', 'Enchantment — Aura', 'Common', 'Enchant artifact
	Whenever enchanted artifact becomes tapped or a player activates an ability of enchanted artifact without {T} in its activation cost, Artifact Possession deals 2 damage to that artifact''s controller.', 'Christopher Rush', '15', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=1036&type=card', 48, 12.31);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Gate to Phyrexia', '{B}{B}', 'Enchantment', 'Uncommon', 'Sacrifice a creature: Destroy target artifact. Activate only during your upkeep and only once each turn.', 'Sandra Everingham', '16', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=1039&type=card', 50, 60.51);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Haunting Wind', '{3}{B}', 'Enchantment', 'Uncommon', 'Whenever an artifact becomes tapped or a player activates an artifact''s ability without {T} in its activation cost, Haunting Wind deals 1 damage to that artifact''s controller.', 'Jeff A. Menges', '17', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=1040&type=card', 12, 85.58);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Phyrexian Gremlins', '{2}{B}', 'Creature — Phyrexian Gremlin', 'Common', 'You may choose not to untap Phyrexian Gremlins during your untap step.
	{T}: Tap target artifact. It doesn''t untap during its controller''s untap step for as long as Phyrexian Gremlins remains tapped.', 'Amy Weber', '18', '1', '1', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=1042&type=card', 11, 33.91);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Priest of Yawgmoth', '{1}{B}', 'Creature — Phyrexian Human Cleric', 'Common', '{T}, Sacrifice an artifact: Add an amount of {B} equal to the sacrificed artifact''s mana value.', 'Mark Tedin', '19', '1', '2', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=1044&type=card', 40, 35.84);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Xenic Poltergeist', '{1}{B}{B}', 'Creature — Spirit', 'Uncommon', '{T}: Until your next upkeep, target noncreature artifact becomes an artifact creature with power and toughness each equal to its mana value.', 'Dan Frazier', '20', '1', '1', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=1048&type=card', 12, 103.92);



	-------------------------------------------------------------------------------------------------------------------------------------------------------

	INSERT INTO Sets (Nombre, Tipo, Codigo, FechaSalida, Logo)
	VALUES ('Champions of Kamigawa', 'expansion', 'CHK', '20041001', 'https://svgs.scryfall.io/sets/chk.svg');

	SET @IDSET = SCOPE_IDENTITY();

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Blessed Breath', '{W}', 'Instant — Arcane', 'Common', 'Target creature you control gains protection from the color of your choice until end of turn.
	Splice onto Arcane {W} (As you cast an Arcane spell, you may reveal this card from your hand and pay its splice cost. If you do, add this card''s effects to that spell.)', 'Tsutomu Kawade', '1', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=50451&type=card', 35, 18.47);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Bushi Tenderfoot // Kenzo the Hardhearted', '{W}', 'Creature — Human Soldier', 'Uncommon', 'When a creature dealt damage by Bushi Tenderfoot this turn dies, flip Bushi Tenderfoot.', 'Mark Zug', '2', '1', '1', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=78600&type=card', 22, 108.96);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Cage of Hands', '{2}{W}', 'Enchantment — Aura', 'Common', 'Enchant creature
	Enchanted creature can''t attack or block.
	{1}{W}: Return Cage of Hands to its owner''s hand.', 'Mark Tedin', '3', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=50233&type=card', 13, 43.50);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Call to Glory', '{1}{W}', 'Instant', 'Common', 'Untap all creatures you control. Samurai creatures you control get +1/+1 until end of turn.', 'Wayne Reynolds', '4', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=77140&type=card', 18, 35.19);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Candles'' Glow', '{1}{W}', 'Instant — Arcane', 'Uncommon', 'Prevent the next 3 damage that would be dealt to any target this turn. You gain life equal to the damage prevented this way.
	Splice onto Arcane {1}{W} (As you cast an Arcane spell, you may reveal this card from your hand and pay its splice cost. If you do, add this card''s effects to that spell.)', 'Alan Pollack', '5', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=80292&type=card', 12, 96.28);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Cleanfall', '{2}{W}', 'Sorcery — Arcane', 'Uncommon', 'Destroy all enchantments.', 'Daren Bader', '6', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=80500&type=card', 17, 73.21);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Devoted Retainer', '{W}', 'Creature — Human Samurai', 'Common', 'Bushido 1 (Whenever this creature blocks or becomes blocked, it gets +1/+1 until end of turn.)', 'Greg Hildebrandt', '7', '1', '1', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=50440&type=card', 13, 11.19);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Eight-and-a-Half-Tails', '{W}{W}', 'Legendary Creature — Fox Cleric', 'Rare', '{1}{W}: Target permanent you control gains protection from white until end of turn.
	{1}: Target spell or permanent becomes white until end of turn.', 'Daren Bader', '8', '2', '2', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=50296&type=card', 27, 157.81);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Ethereal Haze', '{W}', 'Instant — Arcane', 'Common', 'Prevent all damage that would be dealt by creatures this turn.', 'Chris Appelhans', '9', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=80526&type=card', 3, 47.41);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Ghostly Prison', '{2}{W}', 'Enchantment', 'Uncommon', 'Creatures can''t attack you unless their controller pays {2} for each creature they control that''s attacking you.', 'Lars Grant-West', '10', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=75328&type=card', 38, 74.12);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Harsh Deceiver', '{3}{W}', 'Creature — Spirit', 'Common', '{1}: Look at the top card of your library.
	{2}: Reveal the top card of your library. If it''s a land card, untap Harsh Deceiver and it gets +1/+1 until end of turn. Activate only once each turn.', 'Heather Hudson', '11', '1', '4', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=50343&type=card', 12, 2.59);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Hikari, Twilight Guardian', '{3}{W}{W}', 'Legendary Creature — Spirit', 'Rare', 'Flying
	Whenever you cast a Spirit or Arcane spell, you may exile Hikari, Twilight Guardian. If you do, return it to the battlefield under its owner''s control at the beginning of the next end step.', 'Glen Angus', '12', '4', '4', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=79222&type=card', 3, 172.73);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Hold the Line', '{1}{W}{W}', 'Instant', 'Rare', 'Blocking creatures get +7/+7 until end of turn.', 'Ron Spears', '13', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=79144&type=card', 27, 228.52);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Honden of Cleansing Fire', '{3}{W}', 'Legendary Enchantment — Shrine', 'Uncommon', 'At the beginning of your upkeep, you gain 2 life for each Shrine you control.', 'Greg Staples', '14', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=79159&type=card', 8, 78.92);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Horizon Seed', '{4}{W}', 'Creature — Spirit', 'Uncommon', 'Whenever you cast a Spirit or Arcane spell, regenerate target creature.', 'Matt Cavotta', '15', '2', '1', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=79226&type=card', 35, 53.96);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Hundred-Talon Kami', '{4}{W}', 'Creature — Spirit', 'Common', 'Flying
	Soulshift 4 (When this creature dies, you may return target Spirit card with mana value 4 or less from your graveyard to your hand.)', 'Paolo Parente', '16', '2', '3', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=79145&type=card', 17, 5.33);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Indomitable Will', '{1}{W}', 'Enchantment — Aura', 'Common', 'Flash
	Enchant creature
	Enchanted creature gets +1/+2.', 'Christopher Rush', '17', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=50499&type=card', 13, 33.62);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Innocence Kami', '{3}{W}{W}', 'Creature — Spirit', 'Uncommon', '{W}, {T}: Tap target creature.
	Whenever you cast a Spirit or Arcane spell, untap Innocence Kami.', 'Mark Zug', '18', '2', '3', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=76636&type=card', 19, 57.79);



	-------------------------------------------------------------------------------------------------------------------------------------------------------

	INSERT INTO Sets (Nombre, Tipo, Codigo, FechaSalida, Logo)
	VALUES ('Streets of New Capenna', 'expansion', 'SNC', '20220429', 'https://svgs.scryfall.io/sets/snc.svg');

	SET @IDSET = SCOPE_IDENTITY();

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Angelic Observer', '{5}{W}', 'Creature — Angel Advisor', 'Uncommon', 'This spell costs {1} less to cast for each Citizen you control.
	Flying', 'Zack Stella', '1', '3', '3', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=555202&type=card', 18, 104.48);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Backup Agent', '{1}{W}', 'Creature — Human Citizen', 'Common', 'When Backup Agent enters the battlefield, put a +1/+1 counter on target creature.', 'Aaron J. Riley', '2', '1', '1', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=555203&type=card', 47, 33.88);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Ballroom Brawlers', '{3}{W}{W}', 'Creature — Human Warrior', 'Uncommon', 'Whenever Ballroom Brawlers attacks, Ballroom Brawlers and up to one other target creature you control both gain your choice of first strike or lifelink until end of turn.', 'John Stanko', '3', '3', '5', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=555204&type=card', 36, 91.89);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Boon of Safety', '{W}', 'Instant', 'Common', 'Put a shield counter on target creature. (If it would be dealt damage or destroyed, remove a shield counter from it instead.)
	Scry 1.', 'Robin Olausson', '4', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=555205&type=card', 13, 46.67);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Brokers Initiate', '{W}', 'Creature — Cat Citizen', 'Common', '{4}{G/U}: Brokers Initiate has base power and toughness 5/5 until end of turn.', 'Viko Menezes', '5', '0', '4', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=555206&type=card', 40, 28.47);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Buy Your Silence', '{4}{W}', 'Sorcery', 'Common', 'Exile target nonland permanent. Its controller creates a Treasure token. (It''s an artifact with "{T}, Sacrifice this artifact: Add one mana of any color.")', 'Tony Foti', '6', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=555207&type=card', 34, 8.55);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Celebrity Fencer', '{3}{W}', 'Creature — Elf Druid', 'Common', 'Alliance — Whenever another creature enters the battlefield under your control, put a +1/+1 counter on Celebrity Fencer.', 'Inka Schulz', '7', '3', '2', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=555208&type=card', 39, 8.34);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Citizen''s Crowbar', '{1}{W}', 'Artifact — Equipment', 'Uncommon', 'When Citizen''s Crowbar enters the battlefield, create a 1/1 green and white Citizen creature token, then attach Citizen''s Crowbar to it.
	Equipped creature gets +1/+1 and has "{W}, {T}, Sacrifice Citizen''s Crowbar: Destroy target artifact or enchantment."
	Equip {2} ({2}: Attach to target creature you control. Equip only as a sorcery.)', 'Slawomir Maniak', '8', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=555209&type=card', 36, 81.50);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Dapper Shieldmate', '{3}{W}', 'Creature — Human Soldier', 'Common', 'Dapper Shieldmate enters the battlefield with a shield counter on it. (If it would be dealt damage or destroyed, remove a shield counter from it instead.)
	As long as it''s your turn, Dapper Shieldmate gets +2/+0.', 'Greg Opalinski', '9', '2', '2', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=555210&type=card', 45, 6.09);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Depopulate', '{2}{W}{W}', 'Sorcery', 'Rare', 'Each player who controls a multicolored creature draws a card. Then destroy all creatures.', 'Jokubas Uogintas', '10', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=555211&type=card', 7, 155.32);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Elspeth Resplendent', '{3}{W}{W}', 'Legendary Planeswalker — Elspeth', 'Mythic', '[+1]: Choose up to one target creature. Put a +1/+1 counter and a counter from among flying, first strike, lifelink, or vigilance on it.
	[−3]: Look at the top seven cards of your library. You may put a permanent card with mana value 3 or less from among them onto the battlefield with a shield counter on it. Put the rest on the bottom of your library in a random order.
	[−7]: Create five 3/3 white Angel creature tokens with flying.', 'Anna Steinbauer', '11', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=555212&type=card', 8, 362.79);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Extraction Specialist', '{2}{W}', 'Creature — Human Rogue', 'Rare', 'Lifelink
	When Extraction Specialist enters the battlefield, return target creature card with mana value 2 or less from your graveyard to the battlefield. That creature can''t attack or block for as long as you control Extraction Specialist.', 'Irina Nordsol', '12', '3', '2', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=555213&type=card', 6, 168.43);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Gathering Throng', '{2}{W}', 'Creature — Human Citizen', 'Common', 'When Gathering Throng enters the battlefield, you may search your library for any number of cards named Gathering Throng, reveal them, put them into your hand, then shuffle.', 'Randy Vargas', '13', '3', '1', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=555214&type=card', 8, 10.63);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Giada, Font of Hope', '{1}{W}', 'Legendary Creature — Angel', 'Rare', 'Flying, vigilance
	Each other Angel you control enters the battlefield with an additional +1/+1 counter on it for each Angel you already control.
	{T}: Add {W}. Spend this mana only to cast an Angel spell.', 'Eric Deschamps', '14', '2', '2', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=555215&type=card', 20, 190.91);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Halo Fountain', '{2}{W}', 'Artifact', 'Mythic', '{W}, {T}, Untap a tapped creature you control: Create a 1/1 green and white Citizen creature token.
	{W}{W}, {T}, Untap two tapped creatures you control: Draw a card.
	{W}{W}{W}{W}{W}, {T}, Untap fifteen tapped creatures you control: You win the game.', 'Anastasia Ovchinnikova', '15', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=555216&type=card', 12, 398.53);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Hold for Ransom', '{1}{W}', 'Enchantment — Aura', 'Common', 'Enchant creature
	Enchanted creature can''t attack or block and has "{7}: Hold for Ransom''s controller sacrifices it and draws a card. Activate only as a sorcery."', 'Néstor Ossandón Leal', '16', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=555217&type=card', 3, 35.42);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Illuminator Virtuoso', '{1}{W}', 'Creature — Human Rogue', 'Uncommon', 'Double strike
	Whenever Illuminator Virtuoso becomes the target of a spell you control, it connives. (Draw a card, then discard a card. If you discarded a nonland card, put a +1/+1 counter on this creature.)', 'John Stanko', '17', '1', '1', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=555218&type=card', 0, 81.64);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Inspiring Overseer', '{2}{W}', 'Creature — Angel Cleric', 'Common', 'Flying
	When Inspiring Overseer enters the battlefield, you gain 1 life and draw a card.', 'Irina Nordsol', '18', '2', '1', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=555219&type=card', 27, 14.39);



	-------------------------------------------------------------------------------------------------------------------------------------------------------

	INSERT INTO Sets (Nombre, Tipo, Codigo, FechaSalida, Logo)
	VALUES ('Saviors of Kamigawa', 'expansion', 'SOK', '20050603', 'https://svgs.scryfall.io/sets/sok.svg');

	SET @IDSET = SCOPE_IDENTITY();

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Aether Shockwave', '{3}{W}', 'Instant', 'Uncommon', 'Choose one —
	• Tap all Spirits.
	• Tap all non-Spirit creatures.', 'Stephen Tappin', '1', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=74208&type=card', 34, 52.14);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Araba Mothrider', '{1}{W}', 'Creature — Human Samurai', 'Common', 'Flying
	Bushido 1 (Whenever this creature blocks or becomes blocked, it gets +1/+1 until end of turn.)', 'Anthony S. Waters', '2', '1', '1', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=74050&type=card', 29, 7.91);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Celestial Kirin', '{2}{W}{W}', 'Legendary Creature — Kirin Spirit', 'Rare', 'Flying
	Whenever you cast a Spirit or Arcane spell, destroy all permanents with that spell''s mana value.', 'Adam Rex', '3', '3', '3', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=84380&type=card', 26, 133.01);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Charge Across the Araba', '{4}{W}', 'Instant — Arcane', 'Uncommon', 'Sweep — Return any number of Plains you control to their owner''s hand. Creatures you control get +1/+1 until end of turn for each Plains returned this way.', 'Dany Orizio', '4', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=74186&type=card', 41, 56.04);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Cowed by Wisdom', '{W}', 'Enchantment — Aura', 'Common', 'Enchant creature
	Enchanted creature can''t attack or block unless its controller pays {1} for each card in your hand.', 'Daren Bader', '5', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=74132&type=card', 41, 39.32);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Curtain of Light', '{1}{W}', 'Instant', 'Common', 'Cast this spell only during combat after blockers are declared.
	Target unblocked attacking creature becomes blocked. (This spell works on creatures that can''t be blocked.)
	Draw a card.', 'Chippy', '6', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=87329&type=card', 13, 25.08);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Descendant of Kiyomaro', '{1}{W}{W}', 'Creature — Human Soldier', 'Uncommon', 'As long as you have more cards in hand than each opponent, Descendant of Kiyomaro gets +1/+2 and has "Whenever this creature deals combat damage, you gain 3 life."', 'Christopher Rush', '7', '2', '3', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=89400&type=card', 23, 80.42);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Eiganjo Free-Riders', '{3}{W}', 'Creature — Human Soldier', 'Uncommon', 'Flying
	At the beginning of your upkeep, return a white creature you control to its owner''s hand.', 'Kev Walker', '8', '3', '4', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=74373&type=card', 23, 102.93);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Enduring Ideal', '{5}{W}{W}', 'Sorcery', 'Rare', 'Search your library for an enchantment card, put it onto the battlefield, then shuffle.
	Epic (For the rest of the game, you can''t cast spells. At the beginning of each of your upkeeps, copy this spell except for its epic ability.)', 'Daren Bader', '9', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=87598&type=card', 25, 190.71);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Ghost-Lit Redeemer', '{W}', 'Creature — Spirit', 'Uncommon', '{W}, {T}: You gain 2 life.
	Channel — {1}{W}, Discard Ghost-Lit Redeemer: You gain 4 life.', 'Shishizaru', '10', '1', '1', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=74082&type=card', 28, 102.26);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Hail of Arrows', '{X}{W}', 'Instant', 'Uncommon', 'Hail of Arrows deals X damage divided as you choose among any number of target attacking creatures.', 'Anthony S. Waters', '11', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=74137&type=card', 43, 64.54);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Hand of Honor', '{W}{W}', 'Creature — Human Samurai', 'Uncommon', 'Protection from black
	Bushido 1 (Whenever this creature blocks or becomes blocked, it gets +1/+1 until end of turn.)', 'Kev Walker', '12', '2', '2', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=74173&type=card', 41, 63.58);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Inner-Chamber Guard', '{1}{W}', 'Creature — Human Samurai', 'Uncommon', 'Bushido 2 (Whenever this creature blocks or becomes blocked, it gets +2/+2 until end of turn.)', 'Brian Snõddy', '13', '0', '2', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=74002&type=card', 32, 90.67);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Kataki, War''s Wage', '{1}{W}', 'Legendary Creature — Spirit', 'Rare', 'All artifacts have "At the beginning of your upkeep, sacrifice this artifact unless you pay {1}."', 'Matt Thompson', '14', '2', '1', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=74190&type=card', 9, 247.73);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Kitsune Bonesetter', '{2}{W}', 'Creature — Fox Cleric', 'Common', '{T}: Prevent the next 3 damage that would be dealt to target creature this turn. Activate only if you have more cards in hand than each opponent.', 'Heather Hudson', '15', '0', '1', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=74046&type=card', 20, 22.64);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Kitsune Dawnblade', '{4}{W}', 'Creature — Fox Samurai', 'Common', 'Bushido 1 (Whenever this creature blocks or becomes blocked, it gets +1/+1 until end of turn.)
	When Kitsune Dawnblade enters the battlefield, you may tap target creature.', 'Carl Critchlow', '16', '2', '3', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=80530&type=card', 20, 28.00);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Kitsune Loreweaver', '{1}{W}', 'Creature — Fox Cleric', 'Common', '{1}{W}: Kitsune Loreweaver gets +0/+X until end of turn, where X is the number of cards in your hand.', 'Eric Polak', '17', '2', '1', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=74213&type=card', 12, 37.55);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Kiyomaro, First to Stand', '{3}{W}{W}', 'Legendary Creature — Spirit', 'Rare', 'Kiyomaro, First to Stand''s power and toughness are each equal to the number of cards in your hand.
	As long as you have four or more cards in hand, Kiyomaro has vigilance.
	Whenever Kiyomaro deals damage, if you have seven or more cards in hand, you gain 7 life.', 'Kev Walker', '18', '*', '*', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=74054&type=card', 6, 121.46);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Michiko Konda, Truth Seeker', '{3}{W}', 'Legendary Creature — Human Advisor', 'Rare', 'Whenever a source an opponent controls deals damage to you, that player sacrifices a permanent.', 'Christopher Moeller', '19', '2', '2', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=84359&type=card', 46, 191.57);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Moonwing Moth', '{1}{W}{W}', 'Creature — Insect', 'Common', 'Flying
	{W}: Moonwing Moth gets +0/+1 until end of turn.', 'Franz Vohwinkel', '20', '2', '1', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=84643&type=card', 36, 43.73);



	-------------------------------------------------------------------------------------------------------------------------------------------------------

	INSERT INTO Sets (Nombre, Tipo, Codigo, FechaSalida, Logo)
	VALUES ('Mirrodin Besieged', 'expansion', 'MBS', '20110204', 'https://svgs.scryfall.io/sets/mbs.svg');

	SET @IDSET = SCOPE_IDENTITY();

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Accorder Paladin', '{1}{W}', 'Creature — Human Knight', 'Uncommon', 'Battle cry (Whenever this creature attacks, each other attacking creature gets +1/+0 until end of turn.)', 'Kekai Kotaki', '1', '3', '1', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=213818&type=card', 44, 115.17);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Ardent Recruit', '{W}', 'Creature — Human Soldier', 'Common', 'Metalcraft — Ardent Recruit gets +2/+2 as long as you control three or more artifacts.', 'Mike Bierek', '2', '1', '1', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=213794&type=card', 15, 9.89);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Banishment Decree', '{3}{W}{W}', 'Instant', 'Common', 'Put target artifact, creature, or enchantment on top of its owner''s library.', 'James Ryman', '3', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=213792&type=card', 29, 37.68);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Choking Fumes', '{2}{W}', 'Instant', 'Uncommon', 'Put a -1/-1 counter on each attacking creature.', 'Scott Chou', '4', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=213808&type=card', 11, 95.15);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Divine Offering', '{1}{W}', 'Instant', 'Common', 'Destroy target artifact. You gain life equal to its mana value.', 'Terese Nielsen', '5', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=213760&type=card', 40, 37.82);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Frantic Salvage', '{3}{W}', 'Instant', 'Common', 'Put any number of target artifact cards from your graveyard on top of your library.
	Draw a card.', 'Scott Chou', '6', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=213791&type=card', 17, 2.11);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Gore Vassal', '{2}{W}', 'Creature — Phyrexian Dog', 'Uncommon', 'Sacrifice Gore Vassal: Put a -1/-1 counter on target creature. Then if that creature''s toughness is 1 or greater, regenerate it.', 'Matt Cavotta', '7', '2', '1', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=213798&type=card', 28, 114.50);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Hero of Bladehold', '{2}{W}{W}', 'Creature — Human Knight', 'Mythic', 'Battle cry (Whenever this creature attacks, each other attacking creature gets +1/+0 until end of turn.)
	Whenever Hero of Bladehold attacks, create two 1/1 white Soldier creature tokens that are tapped and attacking.', 'Austin Hsu', '8', '3', '4', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=214064&type=card', 0, 326.97);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Kemba''s Legion', '{5}{W}{W}', 'Creature — Cat Soldier', 'Uncommon', 'Vigilance
	Kemba''s Legion can block an additional creature each combat for each Equipment attached to Kemba''s Legion.', 'Anthony Francisco', '9', '4', '6', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=214056&type=card', 7, 59.54);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Leonin Relic-Warder', '{W}{W}', 'Creature — Cat Cleric', 'Uncommon', 'When Leonin Relic-Warder enters the battlefield, you may exile target artifact or enchantment.
	When Leonin Relic-Warder leaves the battlefield, return the exiled card to the battlefield under its owner''s control.', 'Greg Staples', '10', '2', '2', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=222860&type=card', 3, 68.00);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Leonin Skyhunter', '{W}{W}', 'Creature — Cat Knight', 'Common', 'Flying', 'Jana Schirmer & Johannes Voss', '11', '2', '2', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=213770&type=card', 18, 41.66);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Loxodon Partisan', '{4}{W}', 'Creature — Elephant Soldier', 'Common', 'Battle cry (Whenever this creature attacks, each other attacking creature gets +1/+0 until end of turn.)', 'Matt Stewart', '12', '3', '4', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=213761&type=card', 9, 30.82);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Master''s Call', '{2}{W}', 'Instant', 'Common', 'Create two 1/1 colorless Myr artifact creature tokens.', 'David Rapoza', '13', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=221554&type=card', 11, 6.40);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Mirran Crusader', '{1}{W}{W}', 'Creature — Human Knight', 'Rare', 'Double strike, protection from black and from green', 'Eric Deschamps', '14', '2', '2', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=213802&type=card', 43, 153.15);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Phyrexian Rebirth', '{4}{W}{W}', 'Sorcery', 'Rare', 'Destroy all creatures, then create an X/X colorless Phyrexian Horror artifact creature token, where X is the number of creatures destroyed this way.', 'Scott Chou', '15', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=214048&type=card', 26, 137.14);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Priests of Norn', '{2}{W}', 'Creature — Phyrexian Cleric', 'Common', 'Vigilance
	Infect (This creature deals damage to creatures in the form of -1/-1 counters and to players in the form of poison counters.)', 'Igor Kieryluk', '16', '1', '4', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=213814&type=card', 36, 10.78);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Tine Shrike', '{3}{W}', 'Creature — Phyrexian Bird', 'Common', 'Flying
	Infect (This creature deals damage to creatures in the form of -1/-1 counters and to players in the form of poison counters.)', 'Adrian Smith', '17', '2', '1', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=213758&type=card', 1, 40.60);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Victory''s Herald', '{3}{W}{W}{W}', 'Creature — Angel', 'Rare', 'Flying
	Whenever Victory''s Herald attacks, attacking creatures gain flying and lifelink until end of turn.', 'rk post', '18', '4', '4', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=214030&type=card', 10, 132.86);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'White Sun''s Zenith', '{X}{W}{W}{W}', 'Instant', 'Rare', 'Create X 2/2 white Cat creature tokens. Shuffle White Sun''s Zenith into its owner''s library.', 'Mike Bierek', '19', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=221555&type=card', 42, 244.55);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Blue Sun''s Zenith', '{X}{U}{U}{U}', 'Instant', 'Rare', 'Target player draws X cards. Shuffle Blue Sun''s Zenith into its owner''s library.', 'Izzy', '20', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=221556&type=card', 13, 205.28);



	-------------------------------------------------------------------------------------------------------------------------------------------------------

	INSERT INTO Sets (Nombre, Tipo, Codigo, FechaSalida, Logo)
	VALUES ('Weatherlight', 'expansion', 'WTH', '19970609', 'https://svgs.scryfall.io/sets/wth.svg');

	SET @IDSET = SCOPE_IDENTITY();

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Abeyance', '{1}{W}', 'Instant', 'Rare', 'Until end of turn, target player can''t cast instant or sorcery spells, and that player can''t activate abilities that aren''t mana abilities.
	Draw a card.', 'Thomas Gianni', '1', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=4563&type=card', 10, 171.78);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Alabaster Dragon', '{4}{W}{W}', 'Creature — Dragon', 'Rare', 'Flying
	When Alabaster Dragon dies, shuffle it into its owner''s library.', 'Bob Eggleton', '2', '4', '4', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=4564&type=card', 1, 227.53);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Alms', '{W}', 'Enchantment', 'Common', '{1}, Exile the top card of your graveyard: Prevent the next 1 damage that would be dealt to target creature this turn.', 'Rogério Vilela', '3', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=4565&type=card', 27, 5.82);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Angelic Renewal', '{1}{W}', 'Enchantment', 'Common', 'Whenever a creature is put into your graveyard from the battlefield, you may sacrifice Angelic Renewal. If you do, return that card to the battlefield.', 'Rebecca Guay', '4', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=4566&type=card', 39, 34.78);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Ardent Militia', '{4}{W}', 'Creature — Human Soldier', 'Common', 'Vigilance', 'Zina Saunders', '5', '2', '5', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=4567&type=card', 21, 2.34);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Argivian Find', '{W}', 'Instant', 'Uncommon', 'Return target artifact or enchantment card from your graveyard to your hand.', 'Roger Raupp', '6', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=4568&type=card', 19, 104.74);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Aura of Silence', '{1}{W}{W}', 'Enchantment', 'Uncommon', 'Artifact and enchantment spells your opponents cast cost {2} more to cast.
	Sacrifice Aura of Silence: Destroy target artifact or enchantment.', 'D. Alexander Gregory', '7', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=4569&type=card', 26, 100.95);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Benalish Infantry', '{2}{W}', 'Creature — Human Soldier', 'Common', 'Banding (Any creatures with banding, and up to one without, can attack in a band. Bands are blocked as a group. If any creatures with banding you control are blocking or being blocked by a creature, you divide that creature''s combat damage, not its controller, among any of the creatures it''s being blocked by or is blocking.)', 'Dan Frazier', '8', '1', '3', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=4570&type=card', 33, 42.23);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Benalish Knight', '{2}{W}', 'Creature — Human Knight', 'Common', 'Flash (You may cast this spell any time you could cast an instant.)
	First strike (This creature deals combat damage before creatures without first strike.)', 'Zina Saunders', '9', '2', '2', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=4571&type=card', 42, 14.00);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Benalish Missionary', '{W}', 'Creature — Human Cleric', 'Common', '{1}{W}, {T}: Prevent all combat damage that would be dealt by target blocked creature this turn.', 'Pete Venters', '10', '1', '1', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=4572&type=card', 6, 28.02);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Debt of Loyalty', '{1}{W}{W}', 'Instant', 'Rare', 'Regenerate target creature. You gain control of that creature if it regenerates this way.', 'Pete Venters', '11', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=4573&type=card', 18, 210.52);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Duskrider Falcon', '{1}{W}', 'Creature — Bird', 'Common', 'Flying, protection from black', 'Cecil Fernando', '12', '1', '1', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=4574&type=card', 9, 45.27);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Empyrial Armor', '{1}{W}{W}', 'Enchantment — Aura', 'Common', 'Enchant creature
	Enchanted creature gets +1/+1 for each card in your hand.', 'D. Alexander Gregory', '13', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=4575&type=card', 14, 32.69);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Foriysian Brigade', '{3}{W}', 'Creature — Human Soldier', 'Uncommon', 'Foriysian Brigade can block an additional creature each combat.', 'Kev Walker', '14', '2', '4', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=4576&type=card', 44, 67.62);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Gerrard''s Wisdom', '{2}{W}{W}', 'Sorcery', 'Uncommon', 'You gain 2 life for each card in your hand.', 'Heather Hudson', '15', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=4577&type=card', 29, 94.71);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Guided Strike', '{1}{W}', 'Instant', 'Common', 'Target creature gets +1/+0 and gains first strike until end of turn.
	Draw a card.', 'Gary Leach', '16', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=4578&type=card', 4, 29.50);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Heavy Ballista', '{3}{W}', 'Creature — Human Soldier', 'Common', '{T}: Heavy Ballista deals 2 damage to target attacking or blocking creature.', 'Ron Spencer', '17', '2', '3', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=4579&type=card', 35, 43.76);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Inner Sanctum', '{1}{W}{W}', 'Enchantment', 'Rare', 'Cumulative upkeep—Pay 2 life. (At the beginning of your upkeep, put an age counter on this permanent, then sacrifice it unless you pay its upkeep cost for each age counter on it.)
	Prevent all damage that would be dealt to creatures you control.', 'D. Alexander Gregory', '18', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=4580&type=card', 27, 171.62);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Kithkin Armor', '{W}', 'Enchantment — Aura', 'Common', 'Enchant creature
	Enchanted creature can''t be blocked by creatures with power 3 or greater.
	Sacrifice Kithkin Armor: The next time a source of your choice would deal damage to enchanted creature this turn, prevent that damage.', 'Charles Gillespie', '19', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=4581&type=card', 35, 12.97);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Master of Arms', '{2}{W}', 'Creature — Human Soldier', 'Uncommon', 'First strike
	{1}{W}: Tap target creature blocking Master of Arms.', 'Dan Frazier', '20', '2', '2', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=4582&type=card', 40, 104.90);



	-------------------------------------------------------------------------------------------------------------------------------------------------------

	INSERT INTO Sets (Nombre, Tipo, Codigo, FechaSalida, Logo)
	VALUES ('March of the Machine', 'expansion', 'MOM', '20230421', 'https://svgs.scryfall.io/sets/mom.svg');

	SET @IDSET = SCOPE_IDENTITY();

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Invasion of Ravnica // Guildpact Paragon', '{5}', 'Battle — Siege', 'Mythic', '(As a Siege enters, choose an opponent to protect it. You and others can attack it. When it''s defeated, exile it, then cast it transformed.)
	When Invasion of Ravnica enters the battlefield, exile target nonland permanent an opponent controls that isn''t exactly two colors.', 'Leon Tukker', '1', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=607011&type=card', 26, 341.25);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Aerial Boost', '{1}{W}', 'Instant', 'Common', 'Convoke (Your creatures can help cast this spell. Each creature you tap while casting this spell pays for {1} or one mana of that creature''s color.)
	Target creature gets +2/+2 and gains flying until end of turn.', 'Artur Nakhodkin', '2', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=607013&type=card', 24, 46.98);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Alabaster Host Intercessor', '{5}{W}', 'Creature — Phyrexian Samurai', 'Common', 'When Alabaster Host Intercessor enters the battlefield, exile target creature an opponent controls until Alabaster Host Intercessor leaves the battlefield.
	Plainscycling {2} ({2}, Discard this card: Search your library for a Plains card, reveal it, put it into your hand, then shuffle.)', 'Konstantin Porubov', '3', '3', '4', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=607014&type=card', 44, 24.65);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Alabaster Host Sanctifier', '{1}{W}', 'Creature — Phyrexian Cleric', 'Common', 'Lifelink', 'Konstantin Porubov', '4', '2', '2', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=607015&type=card', 31, 12.60);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Angelic Intervention', '{1}{W}', 'Instant', 'Common', 'Target creature or planeswalker you control gains protection from colorless or from the color of your choice until end of turn. If it''s a creature, put a +1/+1 counter on it. (It can''t be blocked, targeted, dealt damage, enchanted, or equipped by anything with that quality.)', 'Awanqi (Angela Wang)', '5', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=607016&type=card', 14, 9.39);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Archangel Elspeth', '{2}{W}{W}', 'Legendary Planeswalker — Elspeth', 'Mythic', '[+1]: Create a 1/1 white Soldier creature token with lifelink.
	[−2]: Put two +1/+1 counters on target creature. It becomes an Angel in addition to its other types and gains flying.
	[−6]: Return all nonland permanent cards with mana value 3 or less from your graveyard to the battlefield.', 'Cynthia Sheppard', '6', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=607017&type=card', 0, 337.26);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Attentive Skywarden', '{2}{W}', 'Creature — Phyrexian Kor', 'Common', 'Flying
	Whenever Attentive Skywarden deals combat damage to a player or battle, transform up to one target Incubator token you control.', 'Jodie Muir', '7', '2', '2', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=607018&type=card', 48, 47.34);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Bola Slinger', '{3}{W}', 'Creature — Cat Soldier', 'Common', 'Backup 1 (When this creature enters the battlefield, put a +1/+1 counter on target creature. If that''s another creature, it gains the following ability until end of turn.)
	Whenever this creature attacks, tap target artifact or creature an opponent controls.', 'Hendry Iwanaga', '8', '2', '2', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=607019&type=card', 13, 14.49);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Boon-Bringer Valkyrie', '{3}{W}{W}', 'Creature — Angel Warrior', 'Rare', 'Backup 1 (When this creature enters the battlefield, put a +1/+1 counter on target creature. If that''s another creature, it gains the following abilities until end of turn.)
	Flying, first strike, lifelink', 'Heonhwa Choe', '9', '4', '4', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=607020&type=card', 29, 228.28);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Cut Short', '{2}{W}', 'Instant', 'Common', 'Convoke (Your creatures can help cast this spell. Each creature you tap while casting this spell pays for {1} or one mana of that creature''s color.)
	Destroy target planeswalker that was activated this turn or tapped creature.', 'Tran Nguyen', '10', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=607021&type=card', 25, 43.10);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Dusk Legion Duelist', '{1}{W}', 'Creature — Vampire Soldier', 'Rare', 'Vigilance
	Whenever one or more +1/+1 counters are put on Dusk Legion Duelist, draw a card. This ability triggers only once each turn.', 'Ryan Valle', '11', '2', '2', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=607022&type=card', 9, 165.40);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Elesh Norn // The Argent Etchings', '{2}{W}{W}', 'Legendary Creature — Phyrexian Praetor', 'Mythic', 'Vigilance
	Whenever a source an opponent controls deals damage to you or a permanent you control, that source''s controller loses 2 life unless they pay {1}.
	{2}{W}, Sacrifice three other creatures: Exile Elesh Norn, then return it to the battlefield transformed under its owner''s control. Activate only as a sorcery.', 'Magali Villeneuve', '12', '3', '5', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=607023&type=card', 1, 366.31);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Elspeth''s Smite', '{W}', 'Instant', 'Uncommon', 'Elspeth''s Smite deals 3 damage to target attacking or blocking creature. If that creature would die this turn, exile it instead.', 'Livia Prima', '13', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=607025&type=card', 32, 77.40);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Enduring Bondwarden', '{W}', 'Creature — Human Scout', 'Common', 'Backup 1 (When this creature enters the battlefield, put a +1/+1 counter on target creature. If that''s another creature, it gains the following ability until end of turn.)
	When this creature dies, put its counters on target creature you control.', 'Kim Sokol', '14', '0', '1', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=607026&type=card', 30, 7.39);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Golden-Scale Aeronaut', '{4}{W}', 'Creature — Dwarf Pilot', 'Common', 'Backup 1 (When this creature enters the battlefield, put a +1/+1 counter on target creature. If that''s another creature, it gains the following ability until end of turn.)
	Flying', 'Javier Charro', '15', '2', '3', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=607027&type=card', 41, 49.28);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Guardian of Ghirapur', '{2}{W}', 'Creature — Angel', 'Rare', 'Flying
	When Guardian of Ghirapur enters the battlefield, exile up to one other target creature or artifact you control. Return it to the battlefield under its owner''s control at the beginning of the next end step.', 'Cynthia Sheppard', '16', '3', '3', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=607028&type=card', 24, 189.99);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Heliod, the Radiant Dawn // Heliod, the Warped Eclipse', '{2}{W}{W}', 'Legendary Enchantment Creature — God', 'Rare', 'When Heliod, the Radiant Dawn enters the battlefield, return target enchantment card that isn''t a God from your graveyard to your hand.
	{3}{U/P}: Transform Heliod, the Radiant Dawn. Activate only as a sorcery. ({U/P} can be paid with either {U} or 2 life.)', 'Victor Adame Minguez', '17', '4', '4', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=607029&type=card', 49, 125.60);



	-------------------------------------------------------------------------------------------------------------------------------------------------------

	INSERT INTO Sets (Nombre, Tipo, Codigo, FechaSalida, Logo)
	VALUES ('Born of the Gods', 'expansion', 'BNG', '20140207', 'https://svgs.scryfall.io/sets/bng.svg');

	SET @IDSET = SCOPE_IDENTITY();

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Acolyte''s Reward', '{1}{W}', 'Instant', 'Uncommon', 'Prevent the next X damage that would be dealt to target creature this turn, where X is your devotion to white. If damage is prevented this way, Acolyte''s Reward deals that much damage to any target. (Each {W} in the mana costs of permanents you control counts toward your devotion to white.)', 'Slawomir Maniak', '1', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=378373&type=card', 15, 70.59);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Akroan Phalanx', '{3}{W}', 'Creature — Human Soldier', 'Uncommon', 'Vigilance
	{2}{R}: Creatures you control get +1/+0 until end of turn.', 'Steve Prescott', '2', '3', '3', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=378374&type=card', 28, 87.48);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Akroan Skyguard', '{1}{W}', 'Creature — Human Soldier', 'Common', 'Flying
	Heroic — Whenever you cast a spell that targets Akroan Skyguard, put a +1/+1 counter on Akroan Skyguard.', 'Mark Winters', '3', '1', '1', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=378375&type=card', 42, 38.65);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Archetype of Courage', '{1}{W}{W}', 'Enchantment Creature — Human Soldier', 'Uncommon', 'Creatures you control have first strike.
	Creatures your opponents control lose first strike and can''t have or gain first strike.', 'Willian Murai', '4', '2', '2', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=378376&type=card', 14, 71.25);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Brimaz, King of Oreskos', '{1}{W}{W}', 'Legendary Creature — Cat Soldier', 'Mythic', 'Vigilance
	Whenever Brimaz, King of Oreskos attacks, create a 1/1 white Cat Soldier creature token with vigilance that''s attacking.
	Whenever Brimaz blocks a creature, create a 1/1 white Cat Soldier creature token with vigilance that''s blocking that creature.', 'Peter Mohrbacher', '5', '3', '4', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=378377&type=card', 35, 332.95);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Dawn to Dusk', '{2}{W}{W}', 'Sorcery', 'Uncommon', 'Choose one or both —
	• Return target enchantment card from your graveyard to your hand.
	• Destroy target enchantment.', 'Robbie Trevino', '6', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=378378&type=card', 6, 104.65);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Eidolon of Countless Battles', '{1}{W}{W}', 'Enchantment Creature — Spirit', 'Rare', 'Bestow {2}{W}{W} (If you cast this card for its bestow cost, it''s an Aura spell with enchant creature. It becomes a creature again if it''s not attached to a creature.)
	Eidolon of Countless Battles and enchanted creature each get +1/+1 for each creature you control and +1/+1 for each Aura you control.', 'Raymond Swanland', '7', '0', '0', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=378379&type=card', 44, 161.58);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Elite Skirmisher', '{2}{W}', 'Creature — Human Soldier', 'Common', 'Heroic — Whenever you cast a spell that targets Elite Skirmisher, you may tap target creature.', 'Mark Winters', '8', '3', '1', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=378380&type=card', 9, 29.29);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Ephara''s Radiance', '{W}', 'Enchantment — Aura', 'Common', 'Enchant creature
	Enchanted creature has "{1}{W}, {T}: You gain 3 life."', 'James Ryman', '9', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=378381&type=card', 49, 10.08);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Excoriate', '{3}{W}', 'Sorcery', 'Common', 'Exile target tapped creature.', 'Johann Bodin', '10', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=378382&type=card', 43, 26.97);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Fated Retribution', '{4}{W}{W}{W}', 'Instant', 'Rare', 'Destroy all creatures and planeswalkers. If it''s your turn, scry 2. (Look at the top two cards of your library, then put any number of them on the bottom of your library and the rest on top in any order.)', 'Jonas De Ro', '11', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=378383&type=card', 4, 195.47);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Ghostblade Eidolon', '{2}{W}', 'Enchantment Creature — Spirit', 'Uncommon', 'Bestow {5}{W} (If you cast this card for its bestow cost, it''s an Aura spell with enchant creature. It becomes a creature again if it''s not attached to a creature.)
	Double strike (This creature deals both first-strike and regular combat damage.)
	Enchanted creature gets +1/+1 and has double strike.', 'Ryan Yee', '12', '1', '1', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=378384&type=card', 1, 71.32);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Glimpse the Sun God', '{X}{W}', 'Instant', 'Uncommon', 'Tap X target creatures. Scry 1. (Look at the top card of your library. You may put that card on the bottom of your library.)', 'Aleksi Briclot', '13', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=378385&type=card', 25, 90.04);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'God-Favored General', '{1}{W}', 'Creature — Human Soldier', 'Uncommon', 'Inspired — Whenever God-Favored General becomes untapped, you may pay {2}{W}. If you do, create two 1/1 white Soldier enchantment creature tokens.', 'David Palumbo', '14', '1', '1', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=378386&type=card', 50, 74.58);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Griffin Dreamfinder', '{3}{W}{W}', 'Creature — Griffin', 'Common', 'Flying
	When Griffin Dreamfinder enters the battlefield, return target enchantment card from your graveyard to your hand.', 'Adam Paquette', '16', '1', '4', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=378388&type=card', 12, 16.85);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Hero of Iroas', '{1}{W}', 'Creature — Human Soldier', 'Rare', 'Aura spells you cast cost {1} less to cast.
	Heroic — Whenever you cast a spell that targets Hero of Iroas, put a +1/+1 counter on Hero of Iroas.', 'Willian Murai', '17', '2', '2', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=378389&type=card', 16, 141.28);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Hold at Bay', '{1}{W}', 'Instant', 'Common', 'Prevent the next 7 damage that would be dealt to any target this turn.', 'Nils Hamm', '18', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=378390&type=card', 33, 30.00);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Loyal Pegasus', '{W}', 'Creature — Pegasus', 'Common', 'Flying
	Loyal Pegasus can''t attack or block alone.', 'John Severin Brassell', '19', '2', '1', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=378391&type=card', 42, 2.56);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Mortal''s Ardor', '{W}', 'Instant', 'Common', 'Target creature gets +1/+1 and gains lifelink until end of turn. (Damage dealt by the creature also causes its controller to gain that much life.)', 'Kev Walker', '20', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=378392&type=card', 14, 31.14);



	-------------------------------------------------------------------------------------------------------------------------------------------------------

	INSERT INTO Sets (Nombre, Tipo, Codigo, FechaSalida, Logo)
	VALUES ('Future Sight', 'expansion', 'FUT', '20070504', 'https://svgs.scryfall.io/sets/fut.svg');

	SET @IDSET = SCOPE_IDENTITY();

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Angel of Salvation', '{6}{W}{W}', 'Creature — Angel', 'Rare', 'Flash; convoke (Your creatures can help cast this spell. Each creature you tap while casting this spell pays for {1} or one mana of that creature''s color.)
	Flying
	When Angel of Salvation enters the battlefield, prevent the next 5 damage that would be dealt this turn to any number of targets, divided as you choose.', 'D. Alexander Gregory', '1', '5', '5', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=130345&type=card', 20, 231.39);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Augur il-Vec', '{1}{W}', 'Creature — Human Cleric', 'Common', 'Shadow (This creature can block or be blocked by only creatures with shadow.)
	Sacrifice Augur il-Vec: You gain 4 life. Activate only during your upkeep.', 'Daren Bader', '2', '1', '3', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=132212&type=card', 18, 15.24);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Barren Glory', '{4}{W}{W}', 'Enchantment', 'Rare', 'At the beginning of your upkeep, if you control no permanents other than Barren Glory and have no cards in hand, you win the game.', 'Dave Kendall', '3', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=136048&type=card', 9, 218.85);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Chronomantic Escape', '{4}{W}{W}', 'Sorcery', 'Uncommon', 'Until your next turn, creatures can''t attack you. Exile Chronomantic Escape with three time counters on it.
	Suspend 3—{2}{W} (Rather than cast this card from your hand, you may pay {2}{W} and exile it with three time counters on it. At the beginning of your upkeep, remove a time counter. When the last is removed, you may cast it without paying its mana cost.)', 'Franz Vohwinkel', '4', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=126204&type=card', 49, 90.57);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Dust of Moments', '{2}{W}', 'Instant', 'Uncommon', 'Choose one —
	• Remove two time counters from each permanent and each suspended card.
	• Put two time counters on each permanent with a time counter on it and each suspended card.', 'Zoltan Boros & Gabor Szikszai', '5', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=136207&type=card', 8, 106.09);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Even the Odds', '{2}{W}', 'Instant', 'Uncommon', 'Cast this spell only if you control fewer creatures than each opponent.
	Create three 1/1 white Soldier creature tokens.', 'Shishizaru', '6', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=136192&type=card', 34, 86.98);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Gift of Granite', '{W}', 'Enchantment — Aura', 'Common', 'Flash (You may cast this spell any time you could cast an instant.)
	Enchant creature
	Enchanted creature gets +0/+2.', 'Hideaki Takamura', '7', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=136200&type=card', 23, 2.59);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Intervention Pact', '{0}', 'Instant', 'Rare', 'The next time a source of your choice would deal damage to you this turn, prevent that damage. You gain life equal to the damage prevented this way.
	At the beginning of your next upkeep, pay {1}{W}{W}. If you don''t, you lose the game.', 'Dave Kendall', '8', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=130680&type=card', 42, 179.88);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Judge Unworthy', '{1}{W}', 'Instant', 'Common', 'Choose target attacking or blocking creature. Scry 3, then reveal the top card of your library. Judge Unworthy deals damage equal to that card''s mana value to that creature.', 'Greg Staples', '9', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=126164&type=card', 8, 21.51);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Knight of Sursi', '{3}{W}', 'Creature — Human Knight', 'Common', 'Flying; flanking (Whenever a creature without flanking blocks this creature, the blocking creature gets -1/-1 until end of turn.)
	Suspend 3—{W} (Rather than cast this card from your hand, you may pay {W} and exile it with three time counters on it. At the beginning of your upkeep, remove a time counter. When the last is removed, you may cast it without paying its mana cost. It has haste.)', 'Cyril Van Der Haegen', '10', '2', '2', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=130698&type=card', 48, 15.44);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Lost Auramancers', '{2}{W}{W}', 'Creature — Human Wizard', 'Uncommon', 'Vanishing 3 (This creature enters the battlefield with three time counters on it. At the beginning of your upkeep, remove a time counter from it. When the last is removed, sacrifice it.)
	When Lost Auramancers dies, if it had no time counters on it, you may search your library for an enchantment card, put it onto the battlefield, then shuffle.', 'Brandon Kitkouski', '11', '3', '3', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=126146&type=card', 48, 88.44);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Magus of the Moat', '{2}{W}{W}', 'Creature — Human Wizard', 'Rare', 'Creatures without flying can''t attack.', 'John Avon', '12', '0', '3', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=136148&type=card', 45, 134.18);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Marshaling Cry', '{1}{W}{W}', 'Sorcery', 'Common', 'Creatures you control get +1/+1 and gain vigilance until end of turn.
	Cycling {2} ({2}, Discard this card: Draw a card.)
	Flashback {3}{W} (You may cast this card from your graveyard for its flashback cost. Then exile it.)', 'Vance Kovacs', '13', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=130689&type=card', 15, 15.74);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Saltskitter', '{3}{W}', 'Creature — Wurm', 'Common', 'Whenever another creature enters the battlefield, exile Saltskitter. Return Saltskitter to the battlefield under its owner''s control at the beginning of the next end step.', 'Chippy', '14', '3', '4', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=130320&type=card', 10, 24.29);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Samite Censer-Bearer', '{W}', 'Creature — Human Rebel Cleric', 'Common', '{W}, Sacrifice Samite Censer-Bearer: Prevent the next 1 damage that would be dealt to each creature you control this turn.', 'William Simpson', '15', '1', '1', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=130327&type=card', 49, 34.99);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Scout''s Warning', '{W}', 'Instant', 'Rare', 'The next creature card you play this turn can be played as though it had flash.
	Draw a card.', 'Zoltan Boros & Gabor Szikszai', '16', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=126200&type=card', 35, 148.69);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Spirit en-Dal', '{2}{W}', 'Creature — Spirit', 'Uncommon', 'Shadow (This creature can block or be blocked by only creatures with shadow.)
	Forecast — {1}{W}, Reveal Spirit en-Dal from your hand: Target creature gains shadow until end of turn. (Activate only during your upkeep and only once each turn.)', 'Daren Bader', '17', '2', '1', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=132221&type=card', 29, 119.60);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Aven Mindcensor', '{2}{W}', 'Creature — Bird Wizard', 'Uncommon', 'Flash
	Flying
	If an opponent would search a library, that player searches the top four cards of that library instead.', 'Rebecca Guay', '18', '2', '1', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=136204&type=card', 3, 80.66);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Bound in Silence', '{2}{W}', 'Tribal Enchantment — Rebel Aura', 'Uncommon', 'Enchant creature
	Enchanted creature can''t attack or block.', 'William Simpson', '20', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=130334&type=card', 47, 118.76);



	-------------------------------------------------------------------------------------------------------------------------------------------------------

	INSERT INTO Sets (Nombre, Tipo, Codigo, FechaSalida, Logo)
	VALUES ('Nemesis', 'expansion', 'NEM', '20000214', 'https://svgs.scryfall.io/sets/nem.svg');

	SET @IDSET = SCOPE_IDENTITY();

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Angelic Favor', '{3}{W}', 'Instant', 'Uncommon', 'If you control a Plains, you may tap an untapped creature you control rather than pay this spell''s mana cost.
	Cast this spell only during combat.
	Create a 4/4 white Angel creature token with flying. Exile it at the beginning of the next end step.', 'Paolo Parente', '1', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=21258&type=card', 22, 76.53);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Avenger en-Dal', '{1}{W}', 'Creature — Human Spellshaper', 'Rare', '{2}{W}, {T}, Discard a card: Exile target attacking creature. Its controller gains life equal to its toughness.', 'Ron Spencer', '2', '1', '1', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=21263&type=card', 41, 157.17);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Blinding Angel', '{3}{W}{W}', 'Creature — Angel', 'Rare', 'Flying (This creature can''t be blocked except by creatures with flying or reach.)
	Whenever Blinding Angel deals combat damage to a player, that player skips their next combat phase.', 'Todd Lockwood', '3', '2', '4', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=21273&type=card', 2, 244.54);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Chieftain en-Dal', '{1}{W}{W}', 'Creature — Human Knight', 'Uncommon', 'Whenever Chieftain en-Dal attacks, attacking creatures gain first strike until end of turn.', 'Dany Orizio', '4', '2', '2', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=21264&type=card', 23, 95.61);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Defender en-Vec', '{3}{W}', 'Creature — Human Cleric', 'Common', 'Fading 4 (This creature enters the battlefield with four fade counters on it. At the beginning of your upkeep, remove a fade counter from it. If you can''t, sacrifice it.)
	Remove a fade counter from Defender en-Vec: Prevent the next 2 damage that would be dealt to any target this turn.', 'Bradley Williams', '5', '2', '4', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=22026&type=card', 49, 30.16);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Defiant Falcon', '{1}{W}', 'Creature — Rebel Bird', 'Common', 'Flying
	{4}, {T}: Search your library for a Rebel permanent card with mana value 3 or less, put it onto the battlefield, then shuffle.', 'Heather Hudson', '6', '1', '1', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=21251&type=card', 36, 40.03);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Defiant Vanguard', '{2}{W}', 'Creature — Human Rebel', 'Uncommon', 'When Defiant Vanguard blocks, at end of combat, destroy it and all creatures it blocked this turn.
	{5}, {T}: Search your library for a Rebel permanent card with mana value 4 or less, put it onto the battlefield, then shuffle.', 'Pete Venters', '7', '2', '2', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=21266&type=card', 22, 115.28);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Fanatical Devotion', '{2}{W}', 'Enchantment', 'Common', 'Sacrifice a creature: Regenerate target creature.', 'Massimilano Frezzato', '8', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=21260&type=card', 47, 14.47);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Lashknife', '{1}{W}', 'Enchantment — Aura', 'Common', 'If you control a Plains, you may tap an untapped creature you control rather than pay this spell''s mana cost.
	Enchant creature
	Enchanted creature has first strike.', 'Hannibal King', '9', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=21257&type=card', 10, 17.40);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Lawbringer', '{2}{W}', 'Creature — Kor Rebel', 'Common', '{T}, Sacrifice Lawbringer: Exile target red creature.', 'Matt Cavotta', '10', '2', '2', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=21255&type=card', 28, 41.71);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Lightbringer', '{2}{W}', 'Creature — Kor Rebel', 'Common', '{T}, Sacrifice Lightbringer: Exile target black creature.', 'Paolo Parente', '11', '2', '2', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=21256&type=card', 39, 18.92);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Lin Sivvi, Defiant Hero', '{1}{W}{W}', 'Legendary Creature — Human Rebel', 'Rare', '{X}, {T}: Search your library for a Rebel permanent card with mana value X or less, put it onto the battlefield, then shuffle.
	{3}: Put target Rebel card from your graveyard on the bottom of your library.', 'rk post', '12', '1', '3', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=21271&type=card', 18, 242.66);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Netter en-Dal', '{W}', 'Creature — Human Spellshaper', 'Common', '{W}, {T}, Discard a card: Target creature can''t attack this turn.', 'Matt Cavotta', '13', '1', '1', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=22027&type=card', 21, 48.85);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Noble Stand', '{4}{W}', 'Enchantment', 'Uncommon', 'Whenever a creature you control blocks, you gain 2 life.', 'Greg Hildebrandt & Tim Hildebrandt', '14', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=21262&type=card', 36, 67.82);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Off Balance', '{W}', 'Instant', 'Common', 'Target creature can''t attack or block this turn.', 'Jeff Miracola', '15', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=22032&type=card', 1, 26.81);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Oracle''s Attendants', '{3}{W}', 'Creature — Human Soldier', 'Rare', '{T}: All damage that would be dealt to target creature this turn by a source of your choice is dealt to Oracle''s Attendants instead.', 'Dany Orizio', '16', '1', '5', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=22030&type=card', 44, 129.68);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Parallax Wave', '{2}{W}{W}', 'Enchantment', 'Rare', 'Fading 5 (This enchantment enters the battlefield with five fade counters on it. At the beginning of your upkeep, remove a fade counter from it. If you can''t, sacrifice it.)
	Remove a fade counter from Parallax Wave: Exile target creature.
	When Parallax Wave leaves the battlefield, each player returns to the battlefield all cards they own exiled with Parallax Wave.', 'Greg Staples', '17', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=22028&type=card', 29, 160.87);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Seal of Cleansing', '{1}{W}', 'Enchantment', 'Common', 'Sacrifice Seal of Cleansing: Destroy target artifact or enchantment.', 'Christopher Moeller', '18', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=21259&type=card', 34, 11.26);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Silkenfist Fighter', '{1}{W}', 'Creature — Kor Soldier', 'Common', 'Whenever Silkenfist Fighter becomes blocked, untap it.', 'Mark Brill', '19', '1', '3', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=22320&type=card', 17, 11.99);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Silkenfist Order', '{3}{W}{W}', 'Creature — Kor Soldier', 'Uncommon', 'Whenever Silkenfist Order becomes blocked, untap it.', 'Greg Hildebrandt & Tim Hildebrandt', '20', '3', '5', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=22338&type=card', 7, 95.08);



	-------------------------------------------------------------------------------------------------------------------------------------------------------

	INSERT INTO Sets (Nombre, Tipo, Codigo, FechaSalida, Logo)
	VALUES ('The Brothers'' War', 'expansion', 'BRO', '20221118', 'https://svgs.scryfall.io/sets/bro.svg');

	SET @IDSET = SCOPE_IDENTITY();

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Aeronaut Cavalry', '{4}{W}', 'Creature — Human Soldier', 'Common', 'Flying
	When Aeronaut Cavalry enters the battlefield, put a +1/+1 counter on another target Soldier you control.', 'Lorenzo Mastroianni', '1', '3', '4', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=583586&type=card', 44, 1.58);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Airlift Chaplain', '{2}{W}', 'Creature — Human Cleric', 'Common', 'Flying
	When Airlift Chaplain enters the battlefield, mill three cards. You may put a Plains card or a creature card with mana value 3 or less from among the cards milled this way into your hand. If you don''t, put a +1/+1 counter on Airlift Chaplain. (To mill a card, put the top card of your library into your graveyard.)', 'Caroline Gariba', '2', '1', '1', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=583587&type=card', 32, 31.93);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Ambush Paratrooper', '{1}{W}', 'Creature — Human Soldier', 'Common', 'Flash
	Flying
	{5}: Creatures you control get +1/+1 until end of turn.', 'Vladimir Krisetskiy', '3', '1', '2', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=583588&type=card', 23, 21.58);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Calamity''s Wake', '{1}{W}', 'Instant', 'Uncommon', 'Exile all graveyards. Players can''t cast noncreature spells this turn. Exile Calamity''s Wake.', 'Slawomir Maniak', '4', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=583589&type=card', 42, 68.79);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Deadly Riposte', '{1}{W}', 'Instant', 'Common', 'Deadly Riposte deals 3 damage to target tapped creature and you gain 2 life.', 'Olena Richards', '5', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=583590&type=card', 11, 3.83);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Disenchant', '{1}{W}', 'Instant', 'Common', 'Destroy target artifact or enchantment.', 'Richard Kane Ferguson', '6', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=583591&type=card', 33, 8.31);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Great Desert Prospector', '{4}{W}', 'Creature — Human Artificer', 'Uncommon', 'When Great Desert Prospector enters the battlefield, create a tapped Powerstone token for each other creature you control. (The tokens are artifacts with "{T}: Add {C}. This mana can''t be spent to cast a nonartifact spell.")', 'Néstor Ossandón Leal', '7', '3', '2', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=583592&type=card', 12, 114.32);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'In the Trenches', '{1}{W}{W}', 'Enchantment', 'Mythic', 'Creatures you control get +1/+1.
	{5}{W}: Exile target nonland permanent you don''t control until In the Trenches leaves the battlefield. Activate only as a sorcery and only once.', 'Daarken', '8', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=583593&type=card', 43, 382.78);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Kayla''s Command', '{1}{W}{W}', 'Sorcery', 'Rare', 'Choose two —
	• Create a 2/2 colorless Construct artifact creature token.
	• Put a +1/+1 counter on a creature you control. It gains double strike until end of turn.
	• Search your library for a basic Plains card, reveal it, put it into your hand, then shuffle.
	• You gain 2 life and scry 2.', 'Dominik Mayer', '9', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=583594&type=card', 2, 218.57);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Kayla''s Reconstruction', '{X}{W}{W}{W}', 'Sorcery', 'Rare', 'Look at the top seven cards of your library. Put up to X artifact and/or creature cards with mana value 3 or less from among them onto the battlefield. Put the rest on the bottom of your library in a random order.', 'Nicholas Elias', '10', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=583595&type=card', 21, 189.58);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Lay Down Arms', '{W}', 'Sorcery', 'Uncommon', 'Exile target creature with mana value less than or equal to the number of Plains you control. Its controller gains 3 life.', 'Liiga Smilshkalne', '11', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=583596&type=card', 4, 113.08);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Loran of the Third Path', '{2}{W}', 'Legendary Creature — Human Artificer', 'Rare', 'Vigilance
	When Loran of the Third Path enters the battlefield, destroy up to one target artifact or enchantment.
	{T}: You and target opponent each draw a card.', 'Steven Belledin', '12', '2', '1', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=583597&type=card', 34, 192.10);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Loran, Disciple of History', '{3}{W}', 'Legendary Creature — Human Artificer', 'Uncommon', 'Whenever Loran, Disciple of History or another legendary creature enters the battlefield under your control, return target artifact card from your graveyard to your hand.', 'Cristi Balanescu', '13', '3', '3', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=583598&type=card', 0, 84.83);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Loran''s Escape', '{W}', 'Instant', 'Common', 'Target artifact or creature gains hexproof and indestructible until end of turn. Scry 1.', 'Matt Stewart', '14', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=583599&type=card', 25, 23.97);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Mass Production', '{5}{W}', 'Sorcery', 'Uncommon', 'Create four 1/1 colorless Soldier artifact creature tokens.', 'Rémi Jacquot', '15', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=583600&type=card', 24, 70.31);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Meticulous Excavation', '{W}', 'Enchantment', 'Uncommon', '{2}{W}: Return target permanent you control to its owner''s hand. If it has unearth, instead exile it, then return that card to its owner''s hand. Activate only during your turn.', 'Lucas Graciano', '16', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=583601&type=card', 29, 55.59);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Military Discipline', '{W}', 'Enchantment — Aura', 'Common', 'Flash
	Enchant creature
	When Military Discipline enters the battlefield, enchanted creature gains first strike until end of turn.
	Enchanted creature gets +1/+0.', 'Francisco Miyara', '17', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=583602&type=card', 2, 35.54);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Myrel, Shield of Argive', '{3}{W}', 'Legendary Creature — Human Soldier', 'Mythic', 'During your turn, your opponents can''t cast spells or activate abilities of artifacts, creatures, or enchantments.
	Whenever Myrel, Shield of Argive attacks, create X 1/1 colorless Soldier artifact creature tokens, where X is the number of Soldiers you control.', 'Ryan Pancoast', '18', '3', '4', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=583603&type=card', 19, 280.37);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Phalanx Vanguard', '{1}{W}', 'Creature — Human Soldier', 'Common', 'Vigilance
	Whenever an artifact enters the battlefield under your control, Phalanx Vanguard gets +1/+0 until end of turn.', 'Izzy', '19', '2', '2', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=583604&type=card', 22, 6.78);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Powerstone Engineer', '{1}{W}', 'Creature — Human Artificer', 'Common', 'When Powerstone Engineer dies, create a tapped Powerstone token. (It''s an artifact with "{T}: Add {C}. This mana can''t be spent to cast a nonartifact spell.")', 'Scott Murphy', '20', '2', '1', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=583605&type=card', 35, 10.18);



	-------------------------------------------------------------------------------------------------------------------------------------------------------

	INSERT INTO Sets (Nombre, Tipo, Codigo, FechaSalida, Logo)
	VALUES ('Adventures in the Forgotten Realms', 'expansion', 'AFR', '20210723', 'https://svgs.scryfall.io/sets/afr.svg');

	SET @IDSET = SCOPE_IDENTITY();

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Arborea Pegasus', '{3}{W}', 'Creature — Pegasus', 'Common', 'Flying
	When Arborea Pegasus enters the battlefield, target creature gets +1/+1 and gains flying until end of turn.', 'Justyna Dura', '2', '2', '3', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=527289&type=card', 18, 9.94);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Blink Dog', '{2}{W}', 'Creature — Dog', 'Uncommon', 'Double strike
	Teleport — {3}{W}: Blink Dog phases out. (Treat it and anything attached to it as though they don''t exist until your next turn.)', 'Oriana Menendez', '3', '1', '1', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=527290&type=card', 46, 60.90);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'The Book of Exalted Deeds', '{W}{W}{W}', 'Legendary Artifact', 'Mythic', 'At the beginning of your end step, if you gained 3 or more life this turn, create a 3/3 white Angel creature token with flying.
	{W}{W}{W}, {T}, Exile The Book of Exalted Deeds: Put an enlightened counter on target Angel. It gains "You can''t lose the game and your opponents can''t win the game." Activate only as a sorcery.', 'Daniel Ljunggren', '4', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=527291&type=card', 49, 311.90);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Celestial Unicorn', '{2}{W}', 'Creature — Unicorn', 'Common', 'Whenever you gain life, put a +1/+1 counter on Celestial Unicorn.', 'Johannes Voss', '5', '3', '2', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=527292&type=card', 4, 49.02);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Cleric Class', '{W}', 'Enchantment — Class', 'Uncommon', '(Gain the next level as a sorcery to add its ability.)
	If you would gain life, you gain that much life plus 1 instead.
	{3}{W}: Level 2
	Whenever you gain life, put a +1/+1 counter on target creature you control.
	{4}{W}: Level 3
	When this Class becomes level 3, return target creature card from your graveyard to the battlefield. You gain life equal to that creature''s toughness.', 'Alayna Danner', '6', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=527293&type=card', 27, 118.41);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Cloister Gargoyle', '{2}{W}', 'Artifact Creature — Gargoyle', 'Uncommon', 'When Cloister Gargoyle enters the battlefield, venture into the dungeon. (Enter the first room or advance to the next room.)
	As long as you''ve completed a dungeon, Cloister Gargoyle gets +3/+0 and has flying.', 'Mark Zug', '7', '0', '4', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=527294&type=card', 5, 81.22);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Dancing Sword', '{1}{W}', 'Artifact — Equipment', 'Rare', 'Equipped creature gets +2/+1.
	When equipped creature dies, you may have Dancing Sword become a 2/1 Construct artifact creature with flying and ward {1}. If you do, it isn''t an Equipment.
	Equip {1}', 'Wisnu Tan', '8', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=527295&type=card', 27, 196.71);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Dawnbringer Cleric', '{1}{W}', 'Creature — Human Cleric', 'Common', 'When Dawnbringer Cleric enters the battlefield, choose one —
	• Cure Wounds — You gain 2 life.
	• Dispel Magic — Destroy target enchantment.
	• Gentle Repose — Exile target card from a graveyard.', 'Lie Setiawan', '9', '1', '3', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=527296&type=card', 45, 26.78);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Delver''s Torch', '{1}{W}', 'Artifact — Equipment', 'Common', 'Equipped creature gets +1/+1.
	Whenever equipped creature attacks, venture into the dungeon. (Enter the first room or advance to the next room.)
	Equip {3} ({3}: Attach to target creature you control. Equip only as a sorcery.)', 'Bram Sels', '10', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=527297&type=card', 21, 7.24);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Devoted Paladin', '{4}{W}', 'Creature — Orc Knight', 'Common', 'Beacon of Hope — When Devoted Paladin enters the battlefield, creatures you control get +1/+1 and gain vigilance until end of turn.', 'Chris Rallis', '11', '4', '4', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=527298&type=card', 44, 14.67);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Divine Smite', '{1}{W}', 'Instant', 'Uncommon', 'Target creature or planeswalker an opponent controls phases out. If that permanent is black, exile it instead. (If it phases out, treat it and anything attached to it as though they don''t exist until its controller''s next turn.)', 'Bryan Sola', '12', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=527299&type=card', 44, 115.68);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Dragon''s Disciple', '{1}{W}', 'Creature — Human Monk', 'Uncommon', 'As Dragon''s Disciple enters the battlefield, you may reveal a Dragon card from your hand. If you do or if you control a Dragon, Dragon''s Disciple enters the battlefield with a +1/+1 counter on it.
	Dragons you control have ward {1}. (Whenever a Dragon you control becomes the target of a spell or ability an opponent controls, counter it unless that player pays {1}.)', 'Lucas Graciano', '13', '1', '3', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=527300&type=card', 35, 58.68);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Dwarfhold Champion', '{1}{W}', 'Creature — Dwarf Warrior', 'Common', 'As long as Dwarfhold Champion is equipped, it gets +0/+2.', 'Miguel Mercado', '14', '3', '1', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=527301&type=card', 8, 13.10);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Flumph', '{1}{W}', 'Creature — Jellyfish', 'Rare', 'Defender, flying
	Whenever Flumph is dealt damage, you and target opponent each draw a card.', 'Brian Valeza', '15', '0', '4', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=527302&type=card', 1, 176.65);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Gloom Stalker', '{2}{W}', 'Creature — Dwarf Ranger', 'Common', 'As long as you''ve completed a dungeon, Gloom Stalker has double strike.', 'Tomas Duchek', '16', '2', '3', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=527303&type=card', 34, 20.85);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Grand Master of Flowers', '{2}{W}{W}', 'Legendary Planeswalker — Bahamut', 'Mythic', 'As long as Grand Master of Flowers has seven or more loyalty counters on him, he''s a 7/7 Dragon God creature with flying and indestructible.
	[+1]: Target creature without first strike, double strike, or vigilance can''t attack or block until your next turn.
	[+1]: Search your library and/or graveyard for a card named Monk of the Open Hand, reveal it, and put it into your hand. If you search your library this way, shuffle.', 'Ekaterina Burmak', '17', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=527304&type=card', 17, 266.48);



	-------------------------------------------------------------------------------------------------------------------------------------------------------

	INSERT INTO Sets (Nombre, Tipo, Codigo, FechaSalida, Logo)
	VALUES ('Homelands', 'expansion', 'HML', '19951001', 'https://svgs.scryfall.io/sets/hml.svg');

	SET @IDSET = SCOPE_IDENTITY();

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Abbey Gargoyles', '{2}{W}{W}{W}', 'Creature — Gargoyle', 'Uncommon', 'Flying, protection from red', 'Christopher Rush', '1', '3', '4', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=3010&type=card', 49, 107.80);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Abbey Matron', '{2}{W}', 'Creature — Human Cleric', 'Common', '{W}, {T}: Abbey Matron gets +0/+3 until end of turn.', 'Mike Kimble', '2a', '1', '3', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=3011&type=card', 4, 29.00);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Abbey Matron', '{2}{W}', 'Creature — Human Cleric', 'Common', '{W}, {T}: Abbey Matron gets +0/+3 until end of turn.', 'Mike Kimble', '2b', '1', '3', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=3012&type=card', 25, 49.57);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Aysen Bureaucrats', '{1}{W}', 'Creature — Human Advisor', 'Common', '{T}: Tap target creature with power 2 or less.', 'Alan Rabinowitz', '3a', '1', '1', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=3013&type=card', 36, 19.50);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Aysen Bureaucrats', '{1}{W}', 'Creature — Human Advisor', 'Common', '{T}: Tap target creature with power 2 or less.', 'Alan Rabinowitz', '3b', '1', '1', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=3014&type=card', 29, 7.02);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Aysen Crusader', '{2}{W}{W}', 'Creature — Human Knight', 'Rare', 'Aysen Crusader''s power and toughness are each equal to 2 plus the number of Soldiers and Warriors you control.', 'NéNé Thomas', '4', '2+*', '2+*', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=3015&type=card', 44, 215.98);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Aysen Highway', '{3}{W}{W}{W}', 'Enchantment', 'Rare', 'White creatures have plainswalk. (They can''t be blocked as long as defending player controls a Plains.)', 'NéNé Thomas', '5', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=3016&type=card', 20, 244.40);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Beast Walkers', '{1}{W}{W}', 'Creature — Human Beast Soldier', 'Rare', '{G}: Beast Walkers gains banding until end of turn. (Any creatures with banding, and up to one without, can attack in a band. Bands are blocked as a group. If any creatures with banding you control are blocking or being blocked by a creature, you divide that creature''s combat damage, not its controller, among any of the creatures it''s being blocked by or is blocking.)', 'Heather Hudson', '6', '2', '2', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=3017&type=card', 22, 151.75);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Death Speakers', '{W}', 'Creature — Human Cleric', 'Uncommon', 'Protection from black', 'Douglas Shuler', '7', '1', '1', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=3018&type=card', 30, 100.57);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Hazduhr the Abbot', '{3}{W}{W}', 'Legendary Creature — Human Cleric', 'Rare', '{X}, {T}: The next X damage that would be dealt this turn to target white creature you control is dealt to Hazduhr the Abbot instead.', 'Dan Frazier', '8', '2', '5', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=3019&type=card', 21, 130.63);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Leeches', '{1}{W}{W}', 'Sorcery', 'Rare', 'Target player loses all poison counters. Leeches deals that much damage to that player.', 'Alan Rabinowitz', '9', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=3020&type=card', 16, 173.33);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Mesa Falcon', '{1}{W}', 'Creature — Bird', 'Common', 'Flying
	{1}{W}: Mesa Falcon gets +0/+1 until end of turn.', 'Mark Poole', '10a', '1', '1', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=3022&type=card', 11, 47.48);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Mesa Falcon', '{1}{W}', 'Creature — Bird', 'Common', 'Flying
	{1}{W}: Mesa Falcon gets +0/+1 until end of turn.', 'Mark Poole', '10b', '1', '1', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=3021&type=card', 16, 46.08);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Prophecy', '{W}', 'Sorcery', 'Common', 'Reveal the top card of target opponent''s library. If it''s a land, you gain 1 life. Then that player shuffles.
	Draw a card at the beginning of the next turn''s upkeep.', 'Christopher Rush', '11', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=3023&type=card', 8, 43.68);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Rashka the Slayer', '{3}{W}{W}', 'Legendary Creature — Human Archer', 'Uncommon', 'Reach (This creature can block creatures with flying.)
	Whenever Rashka the Slayer blocks one or more black creatures, Rashka gets +1/+2 until end of turn.', 'Christopher Rush', '12', '3', '3', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=3024&type=card', 47, 96.90);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Samite Alchemist', '{3}{W}', 'Creature — Human Cleric', 'Common', '{W}{W}, {T}: Prevent the next 4 damage that would be dealt this turn to target creature you control. Tap that creature. It doesn''t untap during your next untap step.', 'Tom Wänerstrand', '13a', '0', '2', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=3025&type=card', 22, 24.12);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Samite Alchemist', '{3}{W}', 'Creature — Human Cleric', 'Common', '{W}{W}, {T}: Prevent the next 4 damage that would be dealt this turn to target creature you control. Tap that creature. It doesn''t untap during your next untap step.', 'Tom Wänerstrand', '13b', '0', '2', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=3026&type=card', 29, 39.63);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Serra Aviary', '{3}{W}', 'World Enchantment', 'Rare', 'Creatures with flying get +1/+1.', 'Nicola Leonard', '14', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=3027&type=card', 44, 163.65);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Serra Bestiary', '{W}{W}', 'Enchantment — Aura', 'Common', 'Enchant creature
	At the beginning of your upkeep, sacrifice Serra Bestiary unless you pay {W}{W}.
	Enchanted creature can''t attack or block, and its activated abilities with {T} in their costs can''t be activated.', 'Anson Maddocks', '15', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=3028&type=card', 49, 8.30);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Serra Inquisitors', '{4}{W}', 'Creature — Human Cleric', 'Uncommon', 'Whenever Serra Inquisitors blocks or becomes blocked by one or more black creatures, Serra Inquisitors gets +2/+0 until end of turn.', 'Dennis Detwiller', '16', '3', '3', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=3029&type=card', 22, 51.12);



	-------------------------------------------------------------------------------------------------------------------------------------------------------

	INSERT INTO Sets (Nombre, Tipo, Codigo, FechaSalida, Logo)
	VALUES ('Phyrexia: All Will Be One', 'expansion', 'ONE', '20230203', 'https://svgs.scryfall.io/sets/one.svg');

	SET @IDSET = SCOPE_IDENTITY();

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Against All Odds', '{3}{W}', 'Sorcery', 'Uncommon', 'Choose one or both —
	• Exile target artifact or creature you control, then return it to the battlefield under its owner''s control.
	• Return target artifact or creature card with mana value 3 or less from your graveyard to the battlefield.', 'Rudy Siswanto', '1', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=602531&type=card', 31, 70.32);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Annex Sentry', '{2}{W}', 'Artifact Creature — Phyrexian Cleric', 'Uncommon', 'Toxic 1 (Players dealt combat damage by this creature also get a poison counter.)
	When Annex Sentry enters the battlefield, exile target artifact or creature an opponent controls with mana value 3 or less until Annex Sentry leaves the battlefield.', 'David Astruga', '2', '1', '4', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=602532&type=card', 30, 72.75);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Apostle of Invasion', '{4}{W}{W}', 'Creature — Phyrexian Angel', 'Uncommon', 'Flying
	Corrupted — As long as an opponent has three or more poison counters, Apostle of Invasion has double strike.', 'Marcela Bolívar', '3', '4', '4', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=602533&type=card', 34, 78.10);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Basilica Shepherd', '{3}{W}{W}', 'Creature — Phyrexian Angel', 'Common', 'Flying
	When Basilica Shepherd enters the battlefield, create two 1/1 colorless Phyrexian Mite artifact creature tokens with toxic 1 and "This creature can''t block." (Players dealt combat damage by them also get a poison counter.)', 'Allen Williams', '4', '3', '3', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=602534&type=card', 36, 8.24);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Bladed Ambassador', '{1}{W}', 'Creature — Phyrexian Soldier', 'Uncommon', 'Bladed Ambassador enters the battlefield with an oil counter on it.
	{1}, Remove an oil counter from Bladed Ambassador: Bladed Ambassador gains indestructible until end of turn.', 'Nino Vecia', '5', '3', '1', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=602535&type=card', 48, 89.45);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Charge of the Mites', '{2}{W}', 'Instant', 'Common', 'Choose one —
	• Charge of the Mites deals damage equal to the number of creatures you control to target creature or planeswalker.
	• Create two 1/1 colorless Phyrexian Mite artifact creature tokens with toxic 1 and "This creature can''t block." (Players dealt combat damage by them also get a poison counter.)', 'Vladimir Krisetskiy', '6', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=602536&type=card', 19, 34.73);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Compleat Devotion', '{1}{W}', 'Instant', 'Common', 'Target creature you control gets +2/+2 until end of turn. If that creature has toxic, draw a card.', 'Filipe Pagliuso', '7', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=602537&type=card', 10, 48.11);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Crawling Chorus', '{W}', 'Creature — Phyrexian Horror', 'Common', 'Toxic 1 (Players dealt combat damage by this creature also get a poison counter.)
	When Crawling Chorus dies, create a 1/1 colorless Phyrexian Mite artifact creature token with toxic 1 and "This creature can''t block."', 'Michael Walsh', '8', '1', '1', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=602538&type=card', 46, 38.60);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Duelist of Deep Faith', '{1}{W}', 'Creature — Phyrexian Soldier', 'Common', 'Toxic 1 (Players dealt combat damage by this creature also get a poison counter.)
	As long as it''s your turn, Duelist of Deep Faith has first strike.', 'Marcela Bolívar', '9', '2', '2', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=602539&type=card', 8, 11.04);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Elesh Norn, Mother of Machines', '{4}{W}', 'Legendary Creature — Phyrexian Praetor', 'Mythic', 'Vigilance
	If a permanent entering the battlefield causes a triggered ability of a permanent you control to trigger, that ability triggers an additional time.
	Permanents entering the battlefield don''t cause abilities of permanents your opponents control to trigger.', 'Martina Fačková', '10', '4', '7', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=602540&type=card', 8, 283.08);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'The Eternal Wanderer', '{4}{W}{W}', 'Legendary Planeswalker', 'Rare', 'No more than one creature can attack The Eternal Wanderer each combat.
	[+1]: Exile up to one target artifact or creature. Return that card to the battlefield under its owner''s control at the beginning of that player''s next end step.
	[0]: Create a 2/2 white Samurai creature token with double strike.
	[−4]: For each player, choose a creature that player controls. Each player sacrifices all creatures they control not chosen this way.', 'Alix Branwyn', '11', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=602541&type=card', 2, 166.18);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Flensing Raptor', '{2}{W}', 'Creature — Phyrexian Bird', 'Common', 'Flying
	Toxic 1 (Players dealt combat damage by this creature also get a poison counter.)
	When Flensing Raptor enters the battlefield, another target creature you control with toxic gets +1/+1 and gains flying until end of turn.', 'Abz J Harding', '12', '2', '2', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=602542&type=card', 50, 10.22);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Goldwarden''s Helm', '{2}{W}', 'Artifact — Equipment', 'Common', 'For Mirrodin! (When this Equipment enters the battlefield, create a 2/2 red Rebel creature token, then attach this to it.)
	Equipped creature gets +0/+1.
	Equip {1}{W} ({1}{W}: Attach to target creature you control. Equip only as a sorcery.)', 'Vincent Christiaens', '13', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=602543&type=card', 13, 1.04);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Hexgold Hoverwings', '{3}{W}', 'Artifact — Equipment', 'Uncommon', 'For Mirrodin! (When this Equipment enters the battlefield, create a 2/2 red Rebel creature token, then attach this to it.)
	Equipped creature has flying.
	Creatures you control that are equipped get +1/+0.
	Equip {2}{W}', 'Kai Carpenter', '14', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=602544&type=card', 5, 62.73);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Incisor Glider', '{1}{W}', 'Artifact Creature — Phyrexian Construct', 'Common', 'Flying
	Corrupted — Whenever Incisor Glider attacks, if an opponent has three or more poison counters, creatures you control get +1/+1 until end of turn.', 'Joe Slucher', '15', '1', '3', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=602545&type=card', 3, 12.80);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Indoctrination Attendant', '{3}{W}', 'Creature — Phyrexian Cleric', 'Common', 'Toxic 1 (Players dealt combat damage by this creature also get a poison counter.)
	When Indoctrination Attendant enters the battlefield, you may return another permanent you control to its owner''s hand. If you do, create a 1/1 colorless Phyrexian Mite artifact creature token with toxic 1 and "This creature can''t block."', 'Sam Wolfe Connelly', '16', '3', '4', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=602546&type=card', 8, 16.40);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Infested Fleshcutter', '{1}{W}', 'Artifact — Equipment', 'Uncommon', 'Equipped creature gets +2/+0.
	Whenever equipped creature attacks, create a 1/1 colorless Phyrexian Mite artifact creature token with toxic 1 and "This creature can''t block." (Players dealt combat damage by it also get a poison counter.)
	Equip {2}{W}', 'José Parodi', '17', NULL, NULL, 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=602547&type=card', 25, 106.82);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Jawbone Duelist', '{1}{W}', 'Creature — Phyrexian Soldier', 'Uncommon', 'Double strike
	Toxic 1 (Players dealt combat damage by this creature also get a poison counter.)', 'Nino Vecia', '18', '1', '1', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=602548&type=card', 47, 89.62);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Kemba, Kha Enduring', '{1}{W}', 'Legendary Creature — Cat Cleric', 'Rare', 'Whenever Kemba, Kha Enduring or another Cat enters the battlefield under your control, attach up to one target Equipment you control to that creature.
	Equipped creatures you control get +1/+1.
	{3}{W}{W}: Create a 2/2 white Cat creature token.', 'Zoltan Boros', '19', '2', '2', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=602549&type=card', 8, 213.18);

	INSERT INTO Cartas (IdSet, Nombre, Coste, Tipo, Rareza, Texto, Artista, Numero, Poder, Resistencia, ImagenUrl, Stock, Precio)
	VALUES (@IDSET, 'Leonin Lightbringer', '{2}{W}', 'Creature — Cat Rebel', 'Common', 'Ward {2} (Whenever this creature becomes the target of a spell or ability an opponent controls, counter it unless that player pays {2}.)
	As long as Leonin Lightbringer is equipped, it gets +1/+1.', 'Ernanda Souza', '20', '3', '2', 'http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=602550&type=card', 49, 20.01);


COMMIT TRANSACTION;
PRINT 'Transacción completada correctamente.';
END TRY
BEGIN CATCH   
    ROLLBACK TRANSACTION;

    PRINT 'Error en la transacción.';
    PRINT ERROR_MESSAGE();
END CATCH;
