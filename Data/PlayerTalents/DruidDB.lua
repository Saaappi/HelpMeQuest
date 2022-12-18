local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local DRUID_TALENTS = {
	[102] = { -- Balance
		{ -- Frenzied Regeneration
			["n"] = 82220,
			["e"] = 103298,
		},
		{ -- Eclipse
			["n"] = 88223,
			["e"] = 109858,
		},
		{ -- Improved Barkskin
			["n"] = 82219,
			["e"] = 103297,
		},
		{ -- Shooting Stars
			["n"] = 88225,
			["e"] = 109861,
		},
		{ -- Thrash
			["n"] = 82223,
			["e"] = 103301,
		},
		{ -- Nature's Balance
			["n"] = 88226,
			["e"] = 109862,
		},
		{ -- Swipe
			["n"] = 82226,
			["e"] = 103304,
		},
		{ -- Starfall
			["n"] = 88201,
			["e"] = 109833,
		},
		{ -- Moonkin Form
			["n"] = 82212,
			["e"] = 103290,
		},
		{ -- Lunar Shrapnel
			["n"] = 88232,
			["e"] = 109868,
		},
		{ -- Ironfur
			["n"] = 82227,
			["e"] = 103305,
		},
		{ -- Aetherial Kindling
			["n"] = 88209,
			["e"] = 109843,
		},
		{ -- Nurturing Instinct
			["n"] = 82214,
			["e"] = 103292,
		},
		{ -- Umbral Embrace
			["n"] = 88216,
			["e"] = 109850,
		},
		{ -- Nurturing Instinct
			["n"] = 82214,
			["e"] = 103292,
		},
		{ -- Umbral Embrace
			["n"] = 88216,
			["e"] = 109850,
		},
		{ -- Nurturing Instinct
			["n"] = 82214,
			["e"] = 103292,
		},
		{ -- Solstice
			["n"] = 88203,
			["e"] = 109835,
		},
		{ -- Thick Hide
			["n"] = 82228,
			["e"] = 103306,
		},
		{ -- Solstice
			["n"] = 88203,
			["e"] = 109835,
		},
		{ -- Thick Hide
			["n"] = 82228,
			["e"] = 103306,
		},
		{ -- Force of Nature
			["n"] = 88210,
			["e"] = 109844,
		},
		{ -- Wild Charge
			["n"] = 82198,
			["e"] = 103276,
		},
		{ -- Solar Beam
			["n"] = 88231,
			["e"] = 109867,
		},
		{ -- Astral Influence
			["n"] = 82210,
			["e"] = 103288,
		},
		{ -- Stellar Flare
			["n"] = 91048,
			["e"] = 109841,
		},
		{ -- Astral Influence
			["n"] = 82210,
			["e"] = 103288,
		},
		{ -- Twin Moons
			["n"] = 88208,
			["e"] = 109842,
		},
		{ -- Sunfire
			["n"] = 82208,
			["e"] = 103286,
		},
		{ -- Orbit Breaker
			["n"] = 88199,
			["e"] = 109831,
		},
		{ -- Typhoon
			["n"] = 82209,
			["e"] = 103287,
		},
		{ -- Rattle the Stars
			["n"] = 88236,
			["e"] = 109872,
		},
		{ -- Soothe
			["n"] = 82229,
			["e"] = 103307,
		},
		{ -- Waning Twilight
			["n"] = 88202,
			["e"] = 109834,
		},
		{ -- Improved Sunfire
			["n"] = 82207,
			["e"] = 103285,
		},
		{ -- Waning Twilight
			["n"] = 88202,
			["e"] = 109834,
		},
		{ -- Matted Fur
			["n"] = 82236,
			["e"] = 103314,
		},
		{ -- Celestial Alignment
			["n"] = 88215,
			["e"] = 109849,
		},
		{ -- Stampeding Roar
			["n"] = 82234,
			["e"] = 103312,
		},
		{ -- Starlord
			["n"] = 88200,
			["e"] = 109832,
		},
		{ -- Incapacitating Roar
			["n"] = 82237,
			["e"] = 103316,
		},
		{ -- Starlord
			["n"] = 88200,
			["e"] = 109832,
		},
		{ -- Lycara's Teachings
			["n"] = 82233,
			["e"] = 103311,
		},
		{ -- Nature's Grace
			["n"] = 88222,
			["e"] = 109857,
		},
		{ -- Lycara's Teachings
			["n"] = 82233,
			["e"] = 103311,
		},
		{ -- Orbital Strike
			["n"] = 88221,
			["e"] = 109856,
		},
		{ -- Lycara's Teachings
			["n"] = 82233,
			["e"] = 103311,
		},
		{ -- Soul of the Forest
			["n"] = 88212,
			["e"] = 109846,
		},
		{ -- Ursol's Vortex
			["n"] = 82242,
			["e"] = 103321,
		},
		{ -- Wild Mushroom
			["n"] = 88220,
			["e"] = 109854,
		},
		{ -- Well-Honed Instincts
			["n"] = 82246,
			["e"] = 103326,
		},
		{ -- Circle of Life and Death
			["n"] = 88227,
			["e"] = 109863,
		},
		{ -- Well-Honed Instincts
			["n"] = 82246,
			["e"] = 103326,
		},
		{ -- Convoke the Spirits
			["n"] = 88206,
			["e"] = 109838,
		},
		{ -- Improved Stampeding Roar
			["n"] = 82230,
			["e"] = 103308,
		},
		{ -- Fungal Growth
			["n"] = 88205,
			["e"] = 109837,
		},
		{ -- Renewal
			["n"] = 82232,
			["e"] = 103310,
		},
		{ -- Elune's Guidance
			["n"] = 88228,
			["e"] = 109864,
		},
		{ -- Innervate
			["n"] = 82243,
			["e"] = 103323,
		},
		{ -- Fury of Elune
			["n"] = 88224,
			["e"] = 109859,
		},
		{ -- Nature's Vigil
			["n"] = 82244,
			["e"] = 103324,
		},
	},
	[103] = { -- Feral
	},
	[104] = { -- Guardian
	},
	[105] = { -- Restoration
		{ -- Rake
			["n"] = 82199,
			["e"] = 103277,
		},
		{ -- Lifebloom
			["n"] = 82049,
			["e"] = 103100,
		},
		{ -- Starfire
			["n"] = 91040,
			["e"] = 112963,
		},
		{ -- Ysera's Gift
			["n"] = 82048,
			["e"] = 103099,
		},
		{ -- Thrash
			["n"] = 82223,
			["e"] = 103301,
		},
		{ -- Nature's Swiftness
			["n"] = 82050,
			["e"] = 103101,
		},
		{ -- Starsurge
			["n"] = 82200,
			["e"] = 103278,
		},
		{ -- Omen of Clarity
			["n"] = 82084,
			["e"] = 103143,
		},
		{ -- Rip
			["n"] = 82222,
			["e"] = 103300,
		},
		{ -- Swiftmend
			["n"] = 82216,
			["e"] = 103294,
		},
		{ -- Swipe
			["n"] = 82226,
			["e"] = 103304,
		},
		{ -- Flash of Clarity
			["n"] = 82083,
			["e"] = 103142,
		},
		{ -- Improved Nature's Cure
			["n"] = 82203,
			["e"] = 103281,
		},
		{ -- Improved Regrowth
			["n"] = 82055,
			["e"] = 103109,
		},
		{ -- Killer Instinct
			["n"] = 82225,
			["e"] = 103303,
		},
		{ -- Cenarion Ward
			["n"] = 82052,
			["e"] = 103104,
		},
		{ -- Killer Instinct
			["n"] = 82225,
			["e"] = 103303,
		},
		{ -- Efflorescence
			["n"] = 82057,
			["e"] = 103111,
		},
		{ -- Killer Instinct
			["n"] = 82225,
			["e"] = 103303,
		},
		{ -- Ironbark
			["n"] = 82082,
			["e"] = 103141,
		},
		{ -- Nurturing Instinct
			["n"] = 82214,
			["e"] = 103292,
		},
		{ -- Tranquility
			["n"] = 82054,
			["e"] = 103108,
		},
		{ -- Skull Bash
			["n"] = 82224,
			["e"] = 103302,
		},
		{ -- Soul of the Forest
			["n"] = 82059,
			["e"] = 103113,
		},
		{ -- Natural Recovery
			["n"] = 82206,
			["e"] = 103284,
		},
		{ -- Cultivation
			["n"] = 82056,
			["e"] = 103110,
		},
		{ -- Natural Recovery
			["n"] = 82206,
			["e"] = 103284,
		},
		{ -- Stonebark
			["n"] = 82081,
			["e"] = 103140,
		},
		{ -- Feline Swiftness
			["n"] = 82239,
			["e"] = 103318,
		},
		{ -- Verdancy
			["n"] = 82060,
			["e"] = 103114,
		},
		{ -- Feline Swiftness
			["n"] = 82239,
			["e"] = 103318,
		},
		{ -- Rampant Growth
			["n"] = 82058,
			["e"] = 103112,
		},
		{ -- Sunfire
			["n"] = 82208,
			["e"] = 103286,
		},
		{ -- Harmonious Blooming
			["n"] = 82065,
			["e"] = 103121,
		},
		{ -- Soothe
			["n"] = 82229,
			["e"] = 103307,
		},
		{ -- Harmonious Blooming
			["n"] = 82065,
			["e"] = 103121,
		},
		{ -- Primal Fury
			["n"] = 82238,
			["e"] = 103317,
		},
		{ -- Unstoppable Growth
			["n"] = 82080,
			["e"] = 103138,
		},
		{ -- Wild Growth
			["n"] = 82241,
			["e"] = 103320,
		},
		{ -- Unstoppable Growth
			["n"] = 82080,
			["e"] = 103138,
		},
		{ -- Improved Sunfire
			["n"] = 82207,
			["e"] = 103285,
		},
		{ -- Convoke the Spirits
			["n"] = 82064,
			["e"] = 103119,
		},
		{ -- Stampeding Roar
			["n"] = 82234,
			["e"] = 103312,
		},
		{ -- Adaptive Swarm
			["n"] = 82067,
			["e"] = 103123,
		},
		{ -- Incapacitating Roar
			["n"] = 82237,
			["e"] = 103316,
		},
		{ -- Unbridled Swarm
			["n"] = 82066,
			["e"] = 103122,
		},
		{ -- Well-Honed Instincts
			["n"] = 82246,
			["e"] = 103326,
		},
		{ -- Circle of Life and Death
			["n"] = 82074,
			["e"] = 103130,
		},
		{ -- Well-Honed Instincts
			["n"] = 82246,
			["e"] = 103326,
		},
		{ -- Photosynthesis
			["n"] = 82073,
			["e"] = 103129,
		},
		{ -- Protector of the Pack
			["n"] = 82245,
			["e"] = 103325,
		},
	},
}

addonTable.DRUID_TALENTS = DRUID_TALENTS