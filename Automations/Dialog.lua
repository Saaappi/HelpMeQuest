local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L = addonTable.L
local parentMapId = 0
local t = {}

e:RegisterEvent("GOSSIP_CONFIRM")
e:RegisterEvent("GOSSIP_CONFIRM_CANCEL")
e:RegisterEvent("GOSSIP_SHOW")

local Classic = {
	-- Supported Maps
		-- 13: Eastern Kingdoms
	--
	-- Blasted Lands
	[78423] = { -- Archmage Khadgar
		["g"] = {
			L["Archmage Khadgar 1"],
		},
		["c"] = {
			L["Archmage Khadgar 2"],
		},
	},
	[88206] = { -- Zidormi
		["g"] = {
			L["Zidormi 4"],
			L["Zidormi 5"],
		},
	},
	-- Loch Modan
	[9989] = { -- Lina Hearthstove
		["g"] = {
			L["I'd like to heal and revive my battle pets."],
		},
		["c"] = {
			L["A small fee for supplies is required."],
		},
	},
	[43979] = { -- Gravin Steelbeard
		["g"] = {
			L["I'd like to heal and revive my battle pets."],
		},
		["c"] = {
			L["A small fee for supplies is required."],
		},
	},
	-- Eastern Plaguelands
	[28406] = { -- Death Knight Initiate
		["g"] = {
			L["I challenge you, death knight!"],
		},
	},
	[29173] = { -- Highlord Darion Mograine
		["g"] = {
			L["I am ready."],
		},
	},
	-- Loch Modan
	[44123] = { -- Emily Jackson
		["g"] = {
			L["I'd like to heal and revive my battle pets."],
		},
		["c"] = {
			L["A small fee for supplies is required."],
		},
	},
	-- Elwynn Forest
	[240] = { -- Marshal Dughan
		["g"] = {
			L["Marshal Dughan 1"],
		},
	},
	[6749] = { -- Erma
		["g"] = {
			L["I'd like to heal and revive my battle pets."],
		},
		["c"] = {
			L["A small fee for supplies is required."],
		},
	},
	[64330] = { -- Julia Stevens
		["g"] = {
			L["Think you can take me in a pet battle?"],
		},
		["c"] = {
			L["Let's rumble!"],
		},
	},
	-- Dun Morogh
	[46293] = { -- Torben Zapblast
		["g"] = {
			L["Torben Zapblast 1"],
		},
	},
	[40991] = { -- Mountaineer Dunstan
		["g"] = {
			L["Mountaineer Dunstan 1"],
		},
	},
	[40994] = { -- Mountaineer Lewin
		["g"] = {
			L["Mountaineer Lewin 1"],
		},
	},
	[41056] = { -- Mountaineer Valgrum
		["g"] = {
			L["Mountaineer Valgrum 1"],
		},
	},
	-- Gnomeregan
	[124617] = { -- Environeer Bert
		["g"] = {
			L["Think you can take me in a pet battle?"],
		},
		["c"] = {
			L["Let's rumble!"],
		},
	},
	[147070] = { -- Micro Zoox
		["g"] = {
			L["Micro Zoox 1"],
		},
	},
	[146932] = { -- Door Control Console
		["g"] = {
			L["Door Control Console 1"],
		},
	},
	-- Redridge Mountains
	[9982] = { -- Penny
		["g"] = {
			L["I'd like to heal and revive my battle pets."],
		},
		["c"] = {
			L["A small fee for supplies is required."],
		},
	},
	[162591] = { -- Ben Howell
		["g"] = {
			L["Ben Howell 1"],
		},
	},
	[167281] = { -- Jamin
		["g"] = {
			L["The bells tell us to go to the town hall to be safe."],
			L["The magistrate has ordered our retreat."],
			L["The magistrate ordered our retreat."],
			L["The Scourge are incoming."],
			L["Everything will be okay."],
			L["We must get to the town hall."],
			L["Don't be a hero."],
			L["We're all going to go hide in the town hall."],
			L["We will survive this."],
			L["Get to the town hall."],
			L["The Scourge are coming!"],
		},
	},
	[167282] = { -- Roger
		["g"] = {
			L["The bells tell us to go to the town hall to be safe."],
			L["The magistrate has ordered our retreat."],
			L["The magistrate ordered our retreat."],
			L["The Scourge are incoming."],
			L["Everything will be okay."],
			L["We must get to the town hall."],
			L["Don't be a hero."],
			L["We're all going to go hide in the town hall."],
			L["We will survive this."],
			L["Get to the town hall."],
			L["The Scourge are coming!"],
		},
	},
	[777] = { -- Amy Davenport
		["g"] = {
			L["The bells tell us to go to the town hall to be safe."],
			L["The magistrate has ordered our retreat."],
			L["The magistrate ordered our retreat."],
			L["The Scourge are incoming."],
			L["Everything will be okay."],
			L["We must get to the town hall."],
			L["Don't be a hero."],
			L["We're all going to go hide in the town hall."],
			L["We will survive this."],
			L["Get to the town hall."],
			L["The Scourge are coming!"],
		},
	},
	[789] = { -- Kimberly Hiett
		["g"] = {
			L["The bells tell us to go to the town hall to be safe."],
			L["The magistrate has ordered our retreat."],
			L["The magistrate ordered our retreat."],
			L["The Scourge are incoming."],
			L["Everything will be okay."],
			L["We must get to the town hall."],
			L["Don't be a hero."],
			L["We're all going to go hide in the town hall."],
			L["We will survive this."],
			L["Get to the town hall."],
			L["The Scourge are coming!"],
		},
	},
	[790] = { -- Karen Taylor
		["g"] = {
			L["The bells tell us to go to the town hall to be safe."],
			L["The magistrate has ordered our retreat."],
			L["The magistrate ordered our retreat."],
			L["The Scourge are incoming."],
			L["Everything will be okay."],
			L["We must get to the town hall."],
			L["Don't be a hero."],
			L["We're all going to go hide in the town hall."],
			L["We will survive this."],
			L["Get to the town hall."],
			L["The Scourge are coming!"],
		},
	},
	[791] = { -- Lindsay Ashlock
		["g"] = {
			L["The bells tell us to go to the town hall to be safe."],
			L["The magistrate has ordered our retreat."],
			L["The magistrate ordered our retreat."],
			L["The Scourge are incoming."],
			L["Everything will be okay."],
			L["We must get to the town hall."],
			L["Don't be a hero."],
			L["We're all going to go hide in the town hall."],
			L["We will survive this."],
			L["Get to the town hall."],
			L["The Scourge are coming!"],
		},
	},
	[793] = { -- Kara Adams
		["g"] = {
			L["The bells tell us to go to the town hall to be safe."],
			L["The magistrate has ordered our retreat."],
			L["The magistrate ordered our retreat."],
			L["The Scourge are incoming."],
			L["Everything will be okay."],
			L["We must get to the town hall."],
			L["Don't be a hero."],
			L["We're all going to go hide in the town hall."],
			L["We will survive this."],
			L["Get to the town hall."],
			L["The Scourge are coming!"],
		},
	},
	[812] = { -- Alma Jainrose
		["g"] = {
			L["The bells tell us to go to the town hall to be safe."],
			L["The magistrate has ordered our retreat."],
			L["The magistrate ordered our retreat."],
			L["The Scourge are incoming."],
			L["Everything will be okay."],
			L["We must get to the town hall."],
			L["Don't be a hero."],
			L["We're all going to go hide in the town hall."],
			L["We will survive this."],
			L["Get to the town hall."],
			L["The Scourge are coming!"],
		},
	},
	[956] = { -- Dorin Songblade
		["g"] = {
			L["The bells tell us to go to the town hall to be safe."],
			L["The magistrate has ordered our retreat."],
			L["The magistrate ordered our retreat."],
			L["The Scourge are incoming."],
			L["Everything will be okay."],
			L["We must get to the town hall."],
			L["Don't be a hero."],
			L["We're all going to go hide in the town hall."],
			L["We will survive this."],
			L["Get to the town hall."],
			L["The Scourge are coming!"],
		},
	},
	[1678] = { -- Vernon Hale
		["g"] = {
			L["The bells tell us to go to the town hall to be safe."],
			L["The magistrate has ordered our retreat."],
			L["The magistrate ordered our retreat."],
			L["The Scourge are incoming."],
			L["Everything will be okay."],
			L["We must get to the town hall."],
			L["Don't be a hero."],
			L["We're all going to go hide in the town hall."],
			L["We will survive this."],
			L["Get to the town hall."],
			L["The Scourge are coming!"],
		},
	},
	[1680] = { -- Matthew Hooper
		["g"] = {
			L["The bells tell us to go to the town hall to be safe."],
			L["The magistrate has ordered our retreat."],
			L["The magistrate ordered our retreat."],
			L["The Scourge are incoming."],
			L["Everything will be okay."],
			L["We must get to the town hall."],
			L["Don't be a hero."],
			L["We're all going to go hide in the town hall."],
			L["We will survive this."],
			L["Get to the town hall."],
			L["The Scourge are coming!"],
		},
	},
	[3086] = { -- Gretchen Vogel
		["g"] = {
			L["The bells tell us to go to the town hall to be safe."],
			L["The magistrate has ordered our retreat."],
			L["The magistrate ordered our retreat."],
			L["The Scourge are incoming."],
			L["Everything will be okay."],
			L["We must get to the town hall."],
			L["Don't be a hero."],
			L["We're all going to go hide in the town hall."],
			L["We will survive this."],
			L["Get to the town hall."],
			L["The Scourge are coming!"],
		},
	},
	[3087] = { -- Crystal Boughman
		["g"] = {
			L["The bells tell us to go to the town hall to be safe."],
			L["The magistrate has ordered our retreat."],
			L["The magistrate ordered our retreat."],
			L["The Scourge are incoming."],
			L["Everything will be okay."],
			L["We must get to the town hall."],
			L["Don't be a hero."],
			L["We're all going to go hide in the town hall."],
			L["We will survive this."],
			L["Get to the town hall."],
			L["The Scourge are coming!"],
		},
	},
	[9982] = { -- Penny
		["g"] = {
			L["The bells tell us to go to the town hall to be safe."],
			L["The magistrate has ordered our retreat."],
			L["The magistrate ordered our retreat."],
			L["The Scourge are incoming."],
			L["Everything will be okay."],
			L["We must get to the town hall."],
			L["Don't be a hero."],
			L["We're all going to go hide in the town hall."],
			L["We will survive this."],
			L["Get to the town hall."],
			L["The Scourge are coming!"],
		},
	},
	[162953] = { -- Sarah Howell
		["g"] = {
			L["Sarah Howell 1"],
		},
	},
	[167279] = { -- Rachel
		["g"] = {
			L["The bells tell us to go to the town hall to be safe."],
			L["The magistrate has ordered our retreat."],
			L["The magistrate ordered our retreat."],
			L["The Scourge are incoming."],
			L["Everything will be okay."],
			L["We must get to the town hall."],
			L["Don't be a hero."],
			L["We're all going to go hide in the town hall."],
			L["We will survive this."],
			L["Get to the town hall."],
			L["The Scourge are coming!"],
		},
	},
	[167280] = { -- Nathan
		["g"] = {
			L["The bells tell us to go to the town hall to be safe."],
			L["The magistrate has ordered our retreat."],
			L["The magistrate ordered our retreat."],
			L["The Scourge are incoming."],
			L["Everything will be okay."],
			L["We must get to the town hall."],
			L["Don't be a hero."],
			L["We're all going to go hide in the town hall."],
			L["We will survive this."],
			L["Get to the town hall."],
			L["The Scourge are coming!"],
		},
	},
	[167283] = { -- Hannah
		["g"] = {
			L["The bells tell us to go to the town hall to be safe."],
			L["The magistrate has ordered our retreat."],
			L["The magistrate ordered our retreat."],
			L["The Scourge are incoming."],
			L["Everything will be okay."],
			L["We must get to the town hall."],
			L["Don't be a hero."],
			L["We're all going to go hide in the town hall."],
			L["We will survive this."],
			L["Get to the town hall."],
			L["The Scourge are coming!"],
		},
	},
	[167284] = { -- Madison
		["g"] = {
			L["The bells tell us to go to the town hall to be safe."],
			L["The magistrate has ordered our retreat."],
			L["The magistrate ordered our retreat."],
			L["The Scourge are incoming."],
			L["Everything will be okay."],
			L["We must get to the town hall."],
			L["Don't be a hero."],
			L["We're all going to go hide in the town hall."],
			L["We will survive this."],
			L["Get to the town hall."],
			L["The Scourge are coming!"],
		},
	},
	[167285] = { -- Erin
		["g"] = {
			L["The bells tell us to go to the town hall to be safe."],
			L["The magistrate has ordered our retreat."],
			L["The magistrate ordered our retreat."],
			L["The Scourge are incoming."],
			L["Everything will be okay."],
			L["We must get to the town hall."],
			L["Don't be a hero."],
			L["We're all going to go hide in the town hall."],
			L["We will survive this."],
			L["Get to the town hall."],
			L["The Scourge are coming!"],
		},
	},
	-- Duskwood
	[10062] = { -- Steven Black
		["g"] = {
			L["I'd like to heal and revive my battle pets."],
		},
		["c"] = {
			L["A small fee for supplies is required."],
		},
	},
	-- Wetlands
	[10046] = { -- Bethaine Flinthammer
		["g"] = {
			L["I'd like to heal and revive my battle pets."],
		},
		["c"] = {
			L["A small fee for supplies is required."],
		},
	},
	[43994] = { -- Salustred
		["g"] = {
			L["I'd like to heal and revive my battle pets."],
		},
		["c"] = {
			L["A small fee for supplies is required."],
		},
	},
	[44007] = { -- Shep Goldtend
		["g"] = {
			L["I'd like to heal and revive my battle pets."],
		},
		["c"] = {
			L["A small fee for supplies is required."],
		},
	},
	-- Deadwind Pass
	[113986] = { -- Archmage Khadgar
		["g"] = {
			L["I am ready."],
		},
	},
	-- Stratholme
	[155145] = { -- Plagued Critters
		["g"] = {
			L["Plagued Critters 1"],
		},
	},
	[155413] = { -- Postmaster Malown
		["g"] = {
			L["Begin pet battle."],
		},
	},
	[155414] = { -- Ezra Grimm
		["g"] = {
			L["Begin pet battle."],
		},
	},
	-- Burning Steppes
	[161782] = { -- Burt Macklyn
		["g"] = {
			L["I'm ready."],
		},
	},
	-- Blackrock Depths
	[160209] = { -- Horu Cloudwatcher
		["g"] = {
			L["Begin pet battle."],
		},
	},
	[160207] = { -- Therin Skysong
		["g"] = {
			L["Begin pet battle."],
		},
	},
	[160206] = { -- Alran Heartshade
		["g"] = {
			L["Begin pet battle."],
		},
	},
	[160208] = { -- Zuna Skullcrush
		["g"] = {
			L["Begin pet battle."],
		},
	},
	[160210] = { -- Tasha Riley
		["g"] = {
			L["Begin pet battle."],
		},
	},
	[160205] = { -- Pixy Wizzle
		["g"] = {
			L["Begin pet battle."],
		},
	},
	-- Westfall
	[119390] = { -- Marcus "Bagman" Brown
		["g"] = {
			L["Marcus \"Bagman\" Brown 1"],
		},
	},
	[42383] = { -- Transient
		["g"] = {
			L["Maybe a couple copper will loosen your tongue."],
		},
		["c"] = {
			L["Are you sure you want to give this hobo money?"],
		},
	},
	[42384] = { -- Homeless Stormwind Citizen
		["g"] = {
			L["Maybe a couple copper will loosen your tongue."],
		},
		["c"] = {
			L["Are you sure you want to give this hobo money?"],
		},
	},
	[42386] = { -- Homeless Stormwind Citizen
		["g"] = {
			L["Maybe a couple copper will loosen your tongue."],
		},
		["c"] = {
			L["Are you sure you want to give this hobo money?"],
		},
	},
	[42391] = { -- West Plains Drifter
		["g"] = {
			L["Maybe a couple copper will loosen your tongue."],
		},
		["c"] = {
			L["Are you sure you want to give this hobo money?"],
		},
	},
	[523] = { -- Thor
		["g"] = {
			L["I need a ride."],
		},
	},
	[10045] = { -- Kirk Maxwell
		["g"] = {
			L["I'd like to heal and revive my battle pets."],
		},
		["c"] = {
			L["A small fee for supplies is required."],
		},
	},
	-- Hillsbrad Foothills
	[47442] = { -- Johnny Awesome
		["g"] = {
			L["Johnny Awesome 1"],
			L["Johnny Awesome 2"],
			L["Johnny Awesome 3"],
		},
	},
	[47443] = { -- Kingslayer Orkus
		["g"] = {
			L["Kingslayer Orkus 1"],
			L["Kingslayer Orkus 2"],
			L["Kingslayer Orkus 3"],
		},
	},
	[47444] = { -- Dumass
		["g"] = {
			L["Dumass 1"],
			L["Dumass 2"],
		},
	},
	[48218] = { -- Kingslayer Orkus
		["g"] = {
			L["Kingslayer Orkus 4"]
		},
	},
	-- Mount Hyjal
	[43408] = { -- Aili Greenwillow
		["g"] = {
			L["I'd like to heal and revive my battle pets."],
		},
		["c"] = {
			L["A small fee for supplies is required."],
		},
	},
	-- Winterspring
	[11119] = { -- Azzleby
		["g"] = {
			L["I'd like to heal and revive my battle pets."],
		},
		["c"] = {
			L["A small fee for supplies is required."],
		},
	},
	-- Desolace
	[11105] = { -- Aboda
		["g"] = {
			L["I'd like to heal and revive my battle pets."],
		},
		["c"] = {
			L["A small fee for supplies is required."],
		},
	},
	-- Silithus
	[128607] = { -- Zidormi
		["g"] = {
			L["Zidormi 3"],
			L["Zidormi 6"],
		},
	},
	-- Uldum
	[48887] = { -- Darwishi
		["g"] = {
			L["I'd like to heal and revive my battle pets."],
		},
		["c"] = {
			L["A small fee for supplies is required."],
		},
	},
	-- Silverpine Forest
	[44825] = { -- Bat Handler Maggotbreath
		["g"] = {
			L["Bat Handler Maggotbreath 1"],
		},
	},
	[45752] = { -- Ambermill Dimensional Portal
		["g"] = {
			L["Ambermill Dimensional Portal 1"],
		},
	},
	-- Ironforge
	[1573] = { -- Gryth Thurden
		["g"] = {
			L["Gryth Thurden 1"],
		},
	},
	-- Stormwind City
	[107934] = { -- Recruiter Lee
		["g"] = {
			L["I've heard this tale before..."],
		},
		["c"] = {
			L["Are you sure you want to skip the Broken Shore introduction?"],
		},
	},
	[120590] = { -- Lady Jaina Proudmoore
		["g"] = {
			L["I'm ready to set sail!"],
		},
	},
	[149626] = { -- Vanguard Battlemage (Alliance)
		["g"] = {
			L["Vanguard Battlemage 1"],
		},
	},
	[171789] = { -- High Inquisitor Whitemane
		["g"] = {
			L["I have heard this tale before."],
		},
		["c"] = {
			L["Are you sure?"],
		},
	},
	[100429] = { -- Anduin Wrynn
		["g"] = {
			L["Anduin Wrynn 1"],
		},
	},
	[149616] = { -- Kirin Tor Emissary
		["g"] = {
			L["Kirin Tor Emissary 1"],
		},
	},
	[163095] = { -- Kirin Tor Emissary
		["g"] = {
			L["Lindie Springstock 1"],
		},
	},
	[154169] = { -- Captain Garrick
		["g"] = {
			L["Captain Garrick 1"],
		},
	},
	-- Eastern Plaguelands
	[150987] = { -- Sean Wilkers
		["g"] = {
			L["Sean Wilkers 1"],
		},
	},
	-- Tirisfal Glades
	[141488] = { -- Zidormi
		["g"] = {
			L["Zidormi 1"],
		},
	},
	-- Twilight Highlands
	[164012] = { -- Alexstrasza, the Life-Binder
		["g"] = {
			L["Alexstrasza, the Life-Binder 1"],
		},
	},
	[49767] = { -- Rukh Zumtarg
		["g"] = {
			L["I'd like to heal and revive my battle pets."],
		},
		["c"] = {
			L["A small fee for supplies is required."],
		},
	},
	-- Durotar
	[4311] = { -- Holgar Stormaxe
		["g"] = {
			L["I've heard this tale before..."],
		},
		["c"] = {
			L["Are you sure you want to skip the Broken Shore introduction?"],
		},
	},
	-- Northern Barrens
	[116781] = { -- Muyani
		["g"] = {
			L["Muyani 1"],
		}
	},
	-- Orgrimmar
	[135205] = { -- Nathanos Blightcaller
		["g"] = {
			L["Nathanos Blightcaller 1"],
		}
	},
	[167032] = { -- Chromie
		["g"] = {
			L["Chromie 1"],
			L["Chromie 2"],
		}
	},
	[168431] = { -- Warlord Breka Grimaxe
		["g"] = {
			L["Warlord Breka Grimaxe 2"],
		},
	},
	[171791] = { -- Nazgrim
		["g"] = {
			L["I have heard this tale before."],
		},
		["c"] = {
			L["Are you sure?"],
		},
	},
	-- Darkshore
	[141489] = { -- Zidormi
		["g"] = {
			L["Zidormi 2"],
			L["Zidormi 3"],
		}
	},
}

local BurningCrusade = {}
local WrathOfTheLichKing = {
	-- Supported Maps
		-- 113: Northrend
	--
	-- Borean Tundra
	[26044] = { -- Durkot Wolfbrother
		["g"] = {
			L["I'd like to heal and revive my battle pets."],
		},
		["c"] = {
			L["A small fee for supplies is required."],
		},
	},
	[27194] = { -- Trapper Saghani
		["g"] = {
			L["I'd like to heal and revive my battle pets."],
		},
		["c"] = {
			L["A small fee for supplies is required."],
		},
	},
	-- Zul'Drak
	[28790] = { -- Fala Softhoof
		["g"] = {
			L["I'd like to heal and revive my battle pets."],
		},
		["c"] = {
			L["A small fee for supplies is required."],
		},
	},
}

local MistsOfPandaria = {
	-- Supported Maps
		-- 424: Pandaria
	--
	-- The Jade Forest
	[66730] = { -- Hyuna of the Shrines
		["g"] = {
			L["Think you can take me in a pet battle?"],
		},
		["c"] = {
			L["Let's do it!"],
		},
	},
	[68464] = { -- Whispering Pandaren Spirit
		["g"] = {
			L["Another challenge?"],
		},
		["c"] = {
			L["Prepare yourself!"],
		},
	},
	[66243] = { -- Pan the Kind Hand
		["g"] = {
			L["I'd like to heal and revive my battle pets."],
		},
		["c"] = {
			L["A small fee for supplies is required."],
		},
	},
	[66241] = { -- Hong the Kindly
		["g"] = {
			L["I'd like to heal and revive my battle pets."],
		},
		["c"] = {
			L["A small fee for supplies is required."],
		},
	},
	-- Valley of the Four Winds
	[66734] = { -- Farmer Nishi
		["g"] = {
			L["Think you can take me in a pet battle?"],
		},
		["c"] = {
			L["Let's rumble!"],
		},
	},
	-- Krasarang Wilds
	[66733] = { -- Mo'ruk
		["g"] = {
			L["Think you can take me in a pet battle?"],
		},
		["c"] = {
			L["Come at me!"],
		},
	},
	[59310] = { -- Teve Dawnchaser
		["g"] = {
			L["I'd like to heal and revive my battle pets."],
		},
		["c"] = {
			L["A small fee for supplies is required."],
		},
	},
	-- Dread Wastes
	[68462] = { -- Flowing Pandaren Spirit
		["g"] = {
			L["Another challenge?"],
		},
		["c"] = {
			L["Prepare yourself!"],
		},
	},
	-- Vale of Eternal Blossoms
	[66741] = { -- Aki the Chosen
		["g"] = {
			L["Think you can take me in a pet battle?"],
		},
		["c"] = {
			L["You're going down!"],
		},
	},
	-- Kun-Lai Summit
	[68465] = { -- Thundering Pandaren Spirit
		["g"] = {
			L["Another challenge?"],
		},
		["c"] = {
			L["Prepare yourself!"],
		},
	},
	-- Timeless Isle
	[73626] = { -- Little Tommy Newcomer
		["g"] = {
			L["Little Tommy Newcomer 1"],
		},
		["c"] = {
			L["Let's rumble!"],
		},
	},
	[73632] = { -- Cowardly Zue
		["g"] = {
			L["I'd like to heal and revive my battle pets."],
		},
		["c"] = {
			L["A small fee for supplies is required."],
		},
	},
	[73082] = { -- Master Li
		["g"] = {
			L["Master Li 1"],
		},
	},
	-- Celestial Tournament
	[71924] = { -- Wrathion
		["g"] = {
			L["Let's do battle!"],
		},
	},
	[71927] = { -- Chen Stormstout
		["g"] = {
			L["Let's do battle!"],
		},
	},
	[71930] = { -- Shademaster Kiryn
		["g"] = {
			L["Let's do battle!"],
		},
	},
	[71931] = { -- Taran Zhu
		["g"] = {
			L["Let's do battle!"],
		},
	},
	[71932] = { -- Wise Mari
		["g"] = {
			L["Let's do battle!"],
		},
	},
	[71933] = { -- Blingtron 4000
		["g"] = {
			L["Let's do battle!"],
		},
	},
	[71926] = { -- Lorewalker Cho
		["g"] = {
			L["Let's do battle!"],
		},
	},
	[71934] = { -- Dr. Ion Goldbloom
		["g"] = {
			L["Let's do battle!"],
		},
	},
	[71929] = { -- Sully "The Pickle" McLeary
		["g"] = {
			L["Let's do battle!"],
		},
	},
	-- Mogu'shan Vaults
	[61348] = { -- Lorewalker Cho
		["g"] = {
			L["Lorewalker Cho 1"],
			L["Lorewalker Cho 2"],
		},
	},
	-- Isle of Thunder (Scenario)
	[69565] = { -- Scout Captain Elsia
		["g"] = {
			L["Scout Captain Elsia 1"],
		},
	},
	[69810] = { -- Taoshi
		["g"] = {
			L["Taoshi 1"],
		},
	},
	[70297] = { -- Taoshi
		["g"] = {
			L["Taoshi 2"],
		},
	},
}

local WarlordsOfDraenor = {
	-- Supported Maps
		-- 572: Draenor
	--
	-- Garrison (Alliance)
	[79243] = { -- Baros Alexston
		["g"] = {
			L["Baros Alexston 1"],
		},
	},
	[84455] = { -- Assistant Brightstone
		["g"] = {
			L["Assistant Brightstone 1"],
		},
	},
	[81441] = { -- Shelly Hamby
		["g"] = {
			L["Shelly Hamby 1"],
		},
	},
	[81103] = { -- Dungar Longdrink
		["g"] = {
			L["Dungar Longdrink 1"],
		},
	},
	-- Garrison (Horde)
	[80225] = { -- Skaggit
		["g"] = {
			L["Skaggit 1"],
		},
	},
	[86775] = { -- Senior Peon II
		["g"] = {
			L["Senior Peon II 1"],
		},
	},
	[88228] = { -- Sergeant Grimjaw
		["g"] = {
			L["Sergeant Grimjaw 1"],
		},
	},
	-- Frostfire Ridge
	[87122] = { -- Gargra
		["g"] = {
			L["Let's do this!"],
		},
	},
	-- Shadowmoon Valley
	[84372] = { -- Madari
		["g"] = {
			L["Madari 1"],
		},
	},
	[72871] = { -- All-Seeing Eye
		["g"] = {
			L["All-Seeing Eye 1"],
		},
	},
	[78556] = { -- Ariok
		["g"] = {
			L["Ariok 1"],
		},
	},
	[87124] = { -- Ashlei
		["g"] = {
			L["Let's do this!"],
		},
	},
	-- Gorgrond
	[81013] = { -- Rangari Rajess
		["g"] = {
			L["D'kaan is coming with help."],
		},
	},
	[81018] = { -- Rangari Kolaan
		["g"] = {
			L["D'kaan is coming with help."],
		},
	},
	[81020] = { -- Rangari Jonaa
		["g"] = {
			L["D'kaan is coming with help."],
		},
	},
	-- Talador
	[87125] = { -- Taralune
		["g"] = {
			L["Let's do this!"],
		},
	},
	-- Nagrand
	[87110] = { -- Tarr the Terrible
		["g"] = {
			L["Let's do this!"],
		},
	},
	-- Tanaan Jungle
	[78568] = { -- Thaelin Darkanvil
		["g"] = {
			L["Thaelin Darkanvil 1"],
		},
	},
}

local Legion = {
	-- Supported Maps
		-- 619: Broken Isles
		-- 905: Argus
	--
	-- Objects
	[0] = {
		["g"] = {
			L["Leave the Darkpens."], -- Ravencrest Cemetary
		},
	},
	-- Dalaran
	[96507] = { -- Tassia Whisperglen
		["g"] = {
			L["I'd like to heal and revive my battle pets."],
		},
		["c"] = {
			L["A small fee for supplies is required."],
		},
	},
	[115287] = { -- Serr'ah
		["g"] = {
			L["I'd like to heal and revive my battle pets."],
		},
		["c"] = {
			L["A small fee for supplies is required."],
		},
	},
	[99210] = { -- Bodhi Sunwayver
		["g"] = {
			L["Let's do battle!"],
		},
	},
	[97804] = { -- Tiffany Nelson
		["g"] = {
			L["Let's do battle!"],
		},
	},
	-- Highmountain
	[97854] = { -- Liza Galestride
		["g"] = {
			L["I'd like to heal and revive my battle pets."],
		},
		["c"] = {
			L["A small fee for supplies is required."],
		},
	},
	[98825] = { -- Spiritwalker Ebonhorn
		["g"] = {
			L["Spiritwalker Ebonhorn 1"],
			L["Spiritwalker Ebonhorn 2"],
		},
	},
	[99745] = { -- Snazzle Shinyfinder
		["g"] = {
			L["Snazzle Shinyfinder 1"],
		},
	},
	[99746] = { -- Trytooth Hardchisel
		["g"] = {
			L["Trytooth Hardchisel 1"],
		},
	},
	[99747] = { -- Kindle Candlecrafter
		["g"] = {
			L["Kindle Candlecrafter 1"],
		},
	},
	[99748] = { -- Dug Digger
		["g"] = {
			L["Dug Digger 1"],
		},
	},
	[99781] = { -- Snazzle Shinyfinder
		["g"] = {
			L["Snazzle Shinyfinder 2"],
		},
	},
	[99782] = { -- Trytooth Hardchisel
		["g"] = {
			L["Trytooth Hardchisel 2"],
			L["Trytooth Hardchisel 3"],
		},
	},
	[99784] = { -- Kindle Candlecrafter
		["g"] = {
			L["Kindle Candlecrafter 2"],
		},
	},
	[95403] = { -- Windmaster Julan
		["g"] = {
			L["Windmaster Julan 1"],
		},
	},
	[96286] = { -- Navarrogg
		["g"] = {
			L["Navarrogg 1"],
		},
	},
	[98773] = { -- Lasan Skyhorn
		["g"] = {
			L["Yes!"],
		},
	},
	[99619] = { -- Navarrogg
		["g"] = {
			L["I am ready."],
		},
	},
	[96591] = { -- Amateur Hunter
		["g"] = {
			L["Go hunt somewhere else!"],
		},
	},
	[98804] = { -- Amateur Hunter
		["g"] = {
			L["Go hunt somewhere else!"],
		},
	},
	[94434] = { -- Addie Fizzlebog
		["g"] = {
			L["Addie Fizzlebog 1"],
		},
	},
	[106153] = { -- Tarvim Daywalker
		["g"] = {
			L["There is no time left. Run!"],
		},
	},
	[106115] = { -- Red Skymane
		["g"] = {
			L["There is no time left. Run!"],
		},
	},
	[106191] = { -- Old Nefu
		["g"] = {
			L["There is no time left. Run!"],
		},
	},
	-- Val'sharah
	[91462] = { -- Malfurion Stormrage
		["g"] = {
			L["I am ready."],
		},
	},
	[91109] = { -- Malfurion Stormrage
		["g"] = {
			L["I am ready."],
		},
	},
	[92742] = { -- Ysera
		["g"] = {
			L["I am ready."],
		},
	},
	[104799] = { -- Tyrande Whisperwind
		["g"] = {
			L["I am ready."],
		},
	},
	[92734] = { -- Penelope Heathrow
		["g"] = {
			L["Penelope Heathrow 1"],
		},
	},
	[92620] = { -- Commander Jarod Shadowsong
		["g"] = {
			L["I am ready."],
		},
	},
	[94974] = { -- Sirius Ebonwing
		["g"] = {
			L["Sirius Ebonwing 1"],
		},
	},
	[94975] = { -- Asha Ravensong
		["g"] = {
			L["Asha Ravensong 1"],
			L["Asha Ravensong 2"],
		},
	},
	[94976] = { -- Cassiel Nightthorn
		["g"] = {
			L["Cassiel Nightthorn 1"],
			L["Cassiel Nightthorn 2"],
		},
	},
	[104739] = { -- Tyrande Whisperwind
		["g"] = {
			L["Tyrande Whisperwind 1"],
			L["Tyrande Whisperwind 2"],
		},
	},
	[99035] = { -- Durian Strongfruit
		["g"] = {
			L["Let's do battle!"],
		},
	},
	[106638] = { -- Leafbeard the Storied
		["g"] = {
			L["Leafbeard the Storied 1"],
		},
	},
	-- Stormheim
	[105386] = { -- Rydyr
		["g"] = {
			L["Let's do battle!"],
		},
	},
	[105455] = { -- Trapper Jarrun
		["g"] = {
			L["Let's do battle!"],
		},
	},
	-- Suramar
	[105250] = { -- Aulier
		["g"] = {
			L["Let's do battle!"],
		},
	},
	[105779] = { -- Felsoul Leer
		["g"] = {
			L["Let's do battle!"],
		},
	},
	-- Mardum, the Shattered Abyss
	[99914] = { -- Ashtongue Mystic
		["g"] = {
			L["Thank you for your sacrifice."],
		},
	},
	[99915] = { -- Sevis Brightflame
		["g"] = {
			L["Sevis Brightflame 1"],
			L["Sevis Brightflame 2"],
		},
	},
	[93693] = { -- Lady S'theno
		["g"] = {
			L["Lady S'theno 1"],
		},
	},
	[94435] = { -- Matron Mother Malevolence
		["g"] = {
			L["Matron Mother Malevolence 1"],
		},
	},
	[90247] = { -- Battlelord Gaardoun
		["g"] = {
			L["Battlelord Gaardoun 1"],
		},
	},
	[96436] = { -- Jace Darkweaver
		["g"] = {
			L["Jace Darkweaver 1"],
		},
	},
	[96420] = { -- Cyana Nightglaive
		["g"] = {
			L["Cyana Nightglaive 1"],
		},
	},
	[99045] = { -- Kor'vas Bloodthorn
		["g"] = {
			L["Kor'vas Bloodthorn 1"],
		},
	},
	[93127] = { -- Kayn Sunfury
		["g"] = {
			L["Kayn Sunfury 1"],
		},
	},
	[96655] = { -- Allari the Souleater
		["g"] = {
			L["Allari the Souleater 1"],
		},
	},
	[96652] = { -- Mannethrel Darkstar
		["g"] = {
			L["Mannethrel Darkstar 1"],
		},
	},
	[96653] = { -- Izal Whitemoon
		["g"] = {
			L["Izal Whitemoon 1"],
		},
	},
	-- Vault of the Wardens
	[97644] = { -- Kor'vas Bloodthorn
		["g"] = {
			L["Kor'vas Bloodthorn 2"],
		},
	},
	-- Argus
	[121263] = { -- Grand Artificer Romuul
		["g"] = {
			L["Grand Artificer Romuul 1"],
		},
	},
	[108642] = { -- Keeper Remulos
		["g"] = {
			L["Keeper Remulos 1"],
		},
	},
	[127752] = { -- Raelaara the Kind
		["g"] = {
			L["I'd like to heal and revive my battle pets."],
		},
		["c"] = {
			L["A small fee for supplies is required."],
		},
	},
	-- The Nighthold
	[110677] = { -- Image of Khadgar
		["g"] = {
			L["I'm ready."],
		},
	},
	[116662] = { -- Suramar Portal (Bottom Floor)
		["g"] = {
			L["Suramar Portal 1"],
		},
	},
	[116667] = { -- Suramar Portal (After Elisande)
		["g"] = {
			L["Suramar Portal 2"],
		},
	},
	-- Antorus, the Burning Throne
	[122500] = { -- Essence of Eonar
		["g"] = {
			L["Essence of Eonar 1"],
			L["Essence of Eonar 2"],
		},
		["c"] = {
			L["Do you want to start the encounter?"],
		},
	},
	[125720] = { -- Lightforged Beacon
		["g"] = {
			L["Lightforged Beacon 1"],
		},
	},
	[128303] = { -- Lightforged Beacon
		["g"] = {
			L["Lightforged Beacon 2"],
		},
	},
	[128169] = { -- Magni Bronzebeard
		["g"] = {
			L["I'm ready."],
		},
	},
}

local BattleForAzeroth = {
	-- Supported Maps
		-- 875: Zandalar
		-- 876: Kul Tiras
	--
	-- Drustvar
	[137613] = { -- Hobart Grapplehammer
		["g"] = {
			L["Hobart Grapplehammer 1"],
			L["Hobart Grapplehammer 2"],
		},
	},
	-- Stormsong Valley
	[138137] = { -- Huelo
		["g"] = {
			L["Huelo 1"],
		},
	},
	-- Tiragarde Sound
	[137675] = { -- Shadow Hunter Ty'jin
		["g"] = {
			L["Shadow Hunter Ty'jin 1"],
		},
	},
	[137798] = { -- Boatswain Taryn
		["g"] = {
			L["Boatswain Taryn 1"],
		},
	},
	[137800] = { -- Quartermaster Killian
		["g"] = {
			L["Quartermaster Killian 1"],
		},
	},
	[137807] = { -- Navigator Swink
		["g"] = {
			L["Navigator Swink 1"],
		},
	},
	-- Zuldazar
	[135440] = { -- Princess Talanji
		["g"] = {
			L["Princess Talanji 1"],
		},
	},
	[135690] = { -- Dread-Admiral Tattersail
		["g"] = {
			L["Quest"],
		},
	},
	[143334] = { -- Daria Smithson
		["g"] = {
			L["Take us back to Boralus."],
		},
	},
	[143690] = { -- Captured Zandalari Troll
		["g"] = {
			L["Captured Zandalari Troll 1"],
		},
	},
	-- Vol'dun
	[137559] = { -- Private James
		["g"] = {
			L["Private James 1"],
		},
	},
	[135383] = { -- Barnard "The Smasher" Baysworth
		["g"] = {
			L["Take us back to Boralus."],
		},
	},
	-- Nazmir
	[122688] = { -- Bwonsamdi
		["g"] = {
			L["Bwonsamdi 2"],
		},
	},
	[166110] = { -- Spirit of Vol'jin
		["g"] = {
			L["Spirit of Vol'jin 1"],
		},
	},
	[139620] = { -- Desha Stormwallow
		["g"] = {
			L["Take us back to Boralus."],
		},
	},
	-- Boralus
	[122370] = { -- Cyrus Crestfall
		["g"] = {
			L["Cyrus Crestfall 1"],
		},
	},
	[137066] = { -- 7th Legion Magus
		["g"] = {
			L["7th Legion Magus 1"],
		},
	},
	[135612] = { -- Halford Wyrmbane
		["g"] = {
			L["Halford Wyrmbane 1"],
		},
	},
	[135681] = { -- Grand Admiral Jes-Tereth
		["g"] = {
			L["Quest"],
		},
	},
	-- Horrific Visions
	[152993] = { -- Garona Halforcen
		["g"] = {
			L["Garona Halforcen 1"],
		},
	},
	[160998] = { -- Altar of the Daredevil
		["g"] = {
			L["Altar of the Daredevil 1"],
		},
	},
	[160961] = { -- Altar of the Dark Imagination
		["g"] = {
			L["Altar of the Dark Imagination 1"],
		},
	},
	[161000] = { -- Altar of the Pained
		["g"] = {
			L["Altar of the Pained 1"],
		},
	},
	[160967] = { -- Altar of the Burned Bridge
		["g"] = {
			L["Altar of the Burned Bridge 1"],
		},
	},
	[160999] = { -- Altar of the Long Night
		["g"] = {
			L["Altar of the Long Night 1"],
		},
	},
}

local Shadowlands = {
	-- Supported Maps
		-- 1409: Exile's Reach
		-- 1550: The Shadowlands
	--
	-- Oribos
	[0] = {
		["g"] = {
			L["Ancient Translocator 1"],
		},
	},
	[156791] = { -- Keeper Ta'saran
		["g"] = {
			L["I'd like to heal and revive my battle pets."],
		},
		["c"] = {
			L["A small fee for supplies is required."],
		},
	},
	[159478] = { -- Tal-Inara
		["g"] = {
			L["Tal-Inara 1"],
			L["Tal-Inara 2"],
			L["Tal-Inara 3"],
		},
	},
	[164079] = { -- Highlord Bolvar Fordragon
		["g"] = {
			L["Highlord Bolvar Fordragon 1"],
			L["Highlord Bolvar Fordragon 2"],
		},
		["c"] = {
			L["Are you sure?"],
		},
	},
	[177136] = { -- Polemarch Adrestes
		["g"] = {
			L["Polemarch Adrestes 1"],
		},
	},
	[168432] = { -- Ve'rayn
		["g"] = {
			L["Ve'rayn 1"],
			L["Ve'rayn 2"],
			L["Ve'rayn 3"],
			L["Ve'rayn 4"],
		},
	},
	[174871] = { -- Fatescribe Roh-Tahl
		["g"] = {
			L["Fatescribe Roh-Tahl 1"],
		},
	},
	-- Bastion
	[173130] = { -- Zolla
		["g"] = {
			L["Begin pet battle."],
		},
	},
	[160595] = { -- Pelagos
		["g"] = {
			L["Let us soulbind."],
		},
	},
	[175444] = { -- Beastkeeper Ismene
		["g"] = {
			L["I'd like to heal and revive my battle pets."],
		},
		["c"] = {
			L["A small fee for supplies is required."],
		},
	},
	[160178] = { -- Eumelia
		["g"] = {
			L["I'd like to heal and revive my battle pets."],
		},
		["c"] = {
			L["A small fee for supplies is required."],
		},
	},
	[168742] = { -- Polemarch Adrestes
		["g"] = {
			L["I am."],
		},
	},
	[168906] = { -- Polemarch Adrestes
		["g"] = {
			L["I'm ready."],
		},
	},
	[156327] = { -- Voitha
		["g"] = {
			L["Voitha 1"],
		},
	},
	[157696] = { -- Nemea
		["g"] = {
			L["Nemea 1"],
		},
		["c"] = {
			L["Nemea 2"],
		},
	},
	[173129] = { -- Thenia
		["g"] = {
			L["Begin pet battle."],
		},
	},
	[158765] = { -- Pelodis
		["g"] = {
			L["Pelodis 1"],
		},
	},
	[159277] = { -- Aspirant Leda
		["g"] = {
			L["Aspirant Leda 1"],
		},
	},
	[159278] = { -- Aspirant Ikaran
		["g"] = {
			L["Aspirant Ikaran 1"],
		},
	},
	[169022] = { -- Helpful Steward
		["g"] = {
			L["Helpful Steward 1"],
		},
	},
	[169023] = { -- Helpful Steward
		["g"] = {
			L["Helpful Steward 1"],
		},
	},
	[169024] = { -- Helpful Steward
		["g"] = {
			L["Helpful Steward 1"],
		},
	},
	[169025] = { -- Helpful Steward
		["g"] = {
			L["Helpful Steward 1"],
		},
	},
	[169026] = { -- Helpful Steward
		["g"] = {
			L["Helpful Steward 1"],
		},
	},
	[169027] = { -- Helpful Steward
		["g"] = {
			L["Helpful Steward 1"],
		},
	},
	[169077] = { -- Helpful Steward
		["g"] = {
			L["Helpful Steward 2"],
		},
	},
	[169078] = { -- Helpful Steward
		["g"] = {
			L["Helpful Steward 2"],
		},
	},
	[169079] = { -- Helpful Steward
		["g"] = {
			L["Helpful Steward 2"],
		},
	},
	[169080] = { -- Helpful Steward
		["g"] = {
			L["Helpful Steward 2"],
		},
	},
	[169081] = { -- Helpful Steward
		["g"] = {
			L["Helpful Steward 2"],
		},
	},
	[169082] = { -- Helpful Steward
		["g"] = {
			L["Helpful Steward 2"],
		},
	},
	[172714] = { -- Trapped Caretaker
		["g"] = {
			L["Trapped Caretaker 1"],
		},
	},
	[161279] = { -- Sparring Aspirant
		["g"] = {
			-- When there is only one Sparring Aspirant.
			L["Sparring Aspirant 1"],
		},
	},
	[159504] = { -- Sparring Aspirant
		["g"] = {
			L["Sparring Aspirant 1"],
			L["Sparring Aspirant 2"],
		},
	},
	[159505] = { -- Sparring Aspirant
		["g"] = {
			-- When there are Sparring Aspirants... sparring.
			L["Sparring Aspirant 1"],
			L["Sparring Aspirant 2"],
		},
	},
	[171834] = { -- Aspirant Thetes
		["g"] = {
			L["Aspirant Thetes 1"],
		},
	},
	[173131] = { -- Stratios
		["g"] = {
			L["Begin pet battle."],
		},
	},
	[160598] = { -- Klystere
		["g"] = {
			L["I'd like to heal and revive my battle pets."],
		},
		["c"] = {
			L["A small fee for supplies is required."],
		},
	},
	[181286] = { -- Sylvanas Windrunner
		["g"] = {
			L["Sylvanas Windrunner 1"],
		},
	},
	[160037] = { -- Polemarch Adrestes
		["g"] = {
			L["I know my way around the Sanctum."],
		},
		["c"] = {
			L["Are you sure?"],
		},
	},
	[165412] = { -- Xandria
		["g"] = {
			L["I'm ready."],
		},
	},
	[165794] = { -- Xandria
		["g"] = {
			L["Xandria 2"],
		},
	},
	[162542] = { -- Kleia
		["g"] = {
			L["I am ready."],
			L["I'm ready."],
			L["Kleia 1"],
			L["Kleia 2"],
		},
	},
	[163650] = { -- Kleia
		["g"] = {
			L["Let us soulbind."],
		},
	},
	[167716] = { -- Pelagos
		["g"] = {
			L["Pelagos 2"],
		},
	},
	[162556] = { -- Clora
		["g"] = {
			L["Clora 1"],
		},
	},
	[162557] = { -- Forgelite Sophone
		["g"] = {
			L["Forgelite Sophone 1"],
		},
	},
	[160280] = { -- Mikanikos
		["g"] = {
			L["I am ready."],
			L["Mikanikos 1"],
		},
	},
	[173860] = { -- Kalisthene
		["g"] = {
			L["Kalisthene 1"],
		},
	},
	[156361] = { -- Kleia
		["g"] = {
			L["I am ready."],
			L["Kleia 3"],
			L["Kleia 4"],
		},
	},
	[174497] = { -- Polemarch Adrestes
		["g"] = {
			L["I am ready."],
		},
	},
	[162889] = { -- Eridia
		["g"] = {
			L["Eridia 1"],
		},
	},
	[162904] = { -- Apolon
		["g"] = {
			L["Apolon 1"],
		},
	},
	[162888] = { -- Sika
		["g"] = {
			L["Sika 1"],
		},
	},
	[162907] = { -- Arios Riftbearer
		["g"] = {
			L["Arios Riftbearer 1"],
		},
	},
	[164473] = { -- Polemarch Adrestes
		["g"] = {
			L["I am."],
		},
	},
	[166740] = { -- Mikanikos
		["g"] = {
			L["I am."],
		},
	},
	[174503] = { -- Polemarch Adrestes
		["g"] = {
			L["I am ready."],
		},
	},
	[161637] = { -- Theotar
		["g"] = {
			L["I am ready."],
		},
	},
	[171147] = { -- General Draven
		["g"] = {
			L["I am ready."],
		},
	},
	-- End of Bastion
	-- Maldraxxus
	[173263] = { -- Rotgut
		["g"] = {
			L["Begin pet battle."],
		},
	},
	[165052] = { -- Vial Master Lurgy
		["g"] = {
			L["Is there any way I can help?"],
			L["O.K."],
		},
	},
	[157313] = { -- Foul-Tongue Cyrlix
		["g"] = {
			L["Is there any way I can help?"],
			L["O.K."],
		},
	},
	[157945] = { -- Boil Master Yetch
		["g"] = {
			L["Is there any way I can help?"],
			L["O.K."],
		},
	},
	[159696] = { -- Rencissa the Dynamo
		["g"] = {
			L["Rencissa the Dynamo 1"],
		},
	},
	[159827] = { -- Scrapper Minoire
		["g"] = {
			L["Scrapper Minoire 1"],
		},
	},
	[160917] = { -- Grimshadow
		["g"] = {
			L["Grimshadow 1"],
		},
	},
	[161710] = { -- Marcel Mullby
		["g"] = {
			L["Marcel Mullby 1"],
		},
	},
	[165966] = { -- Khaliiq
		["g"] = {
			L["Khaliiq 1"],
		},
	},
	[157130] = { -- Recruitable Animate
		["g"] = {
			L["Recruitable Animate 1"],
		},
	},
	[157168] = { -- Stubborn Animate
		["g"] = {
			L["Stubborn Animate 1"],
		},
	},
	[166129] = { -- Specialist Entra
		["g"] = {
			L["Specialist Entra 1"],
		},
	},
	[166657] = { -- Ta'eran
		["g"] = {
			L["Ta'eran 1"],
		},
	},
	[171747] = { -- Project Lead Allen
		["g"] = {
			L["Project Lead Allen 1"],
		},
	},
	[172871] = { -- Taloned Flayedwing
		["g"] = {
			L["Taloned Flayedwing 1"],
		},
	},
	[173267] = { -- Dundley Stickyfingers
		["g"] = {
			L["Begin pet battle."],
		},
	},
	[159824] = { -- Gunn Gorgebone
		["g"] = {
			L["Is there anything you need?"],
		},
	},
	[159827] = { -- Scrapper Minoire
		["g"] = {
			L["Is there anything you need?"],
			L["Scrapper Minoire 1"],
		},
	},
	[159696] = { -- Rencissa the Dynamo
		["g"] = {
			L["Is there anything you need?"],
			L["Rencissa the Dynamo 1"],
		},
	},
	[163083] = { -- Valuator Malus
		["g"] = {
			L["Very well. Let us fight."],
		},
	},
	[163084] = { -- Tester Sahaari
		["g"] = {
			L["Very well. Let us fight."],
		},
	},
	[164492] = { -- Arena Spectator
		["g"] = {
			L["Au'narim claims you owe her anima."],
		},
	},
	[164507] = { -- Arena Spectator
		["g"] = {
			L["Au'narim claims you owe her anima."],
		},
	},
	[164508] = { -- Arena Spectator
		["g"] = {
			L["Au'narim claims you owe her anima."],
		},
	},
	[161712] = { -- Nana Redcap
		["g"] = {
			L["I'd like to heal and revive my battle pets."],
		},
		["c"] = {
			L["A small fee for supplies is required."],
		},
	},
	[157130] = { -- Recruitable Animate
		["g"] = {
			L["Maldraxxus needs your service. Will you fight?"],
		},
	},
	[157168] = { -- Stubborn Animate
		["g"] = {
			L["Maldraxxus needs your service. Will you fight?"],
		},
	},
	[158453] = { -- Baroness Draka
		["g"] = {
			L["I am ready."],
		},
	},
	[165182] = { -- Baroness Draka
		["g"] = {
			L["I know my way around the Sanctum."],
		},
		["c"] = {
			L["Are you sure?"],
		},
	},
	[173257] = { -- Caregiver Maximillian
		["g"] = {
			L["I'd like to heal and revive my battle pets."],
		},
		["c"] = {
			L["A small fee for supplies is required."],
		},
	},
	[161985] = { -- Baroness Vashj
		["g"] = {
			L["Baroness Vashj 1"],
		},
	},
	[158604] = { -- Navigator Xennir
		["g"] = {
			L["Navigator Xennir 1"],
		},
	},
	[160518] = { -- Whisperer Vyn
		["g"] = {
			L["Whisperer Vyn 1"],
		},
	},
	[172566] = { -- Twigin
		["g"] = {
			L["I'm ready."],
		},
	},
	[172809] = { -- Twigin
		["g"] = {
			L["I'm ready."],
		},
	},
	[172901] = { -- Twigin
		["g"] = {
			L["I'm ready."],
		},
	},
	[172574] = { -- Navigator Xennir
		["g"] = {
			L["Navigator Xennir 2"],
		},
	},
	[168860] = { -- Kynthia
		["g"] = {
			L["Kynthia 1"],
		},
	},
	[166211] = { -- Alexandros Mograine
		["g"] = {
			L["I am ready."],
		},
	},
	[172002] = { -- Xandria
		["g"] = {
			L["I am ready."],
		},
	},
	[172923] = { -- Kel'Thuzad
		["g"] = {
			L["Kel'Thuzad 1"],
		},
	},
	[174179] = { -- Baroness Draka
		["g"] = {
			L["Baroness Draka 1"],
		},
	},
	[173523] = { -- General Draven
		["g"] = {
			L["General Draven 1"],
		},
	},
	[173222] = { -- Xandria
		["g"] = {
			L["I am ready."],
		},
	},
	-- End of Maldraxxus
	-- Ardenweald
	[171743] = { -- Dapperdew
		["g"] = {
			L["Dapperdew 1"],
		},
	},
	[157710] = { -- Cortinarius
		["g"] = {
			L["Cortinarius 1"],
		},
	},
	[170571] = { -- Timaeron
		["g"] = {
			L["I'd like to heal and revive my battle pets."],
		},
		["c"] = {
			L["A small fee for supplies is required."],
		},
	},
	[160929] = { -- Guardian Molan
		["g"] = {
			L["The forces of Mueh'zala have invaded Ardenweald."],
		},
	},
	[158921] = { -- Guardian Kota
		["g"] = {
			L["The forces of Mueh'zala have invaded Ardenweald."],
		},
	},
	[158519] = { -- Sorcha
		["g"] = {
			L["The forces of Mueh'zala have invaded Ardenweald."],
			L["I would like you to have the supplies."],
		},
	},
	[161785] = { -- Thiernax
		["g"] = {
			L["Thiernax 1"],
			L["Thiernax 2"],
		},
	},
	[165382] = { -- Gormsmith Cavina
		["g"] = {
			L["I would like you to have the supplies."],
		},
	},
	[165703] = { -- Elder Finnan
		["g"] = {
			L["I would like you to have the supplies."],
		},
	},
	[158345] = { -- Lady of the Falls
		["g"] = {
			L["I would like you to have the supplies."],
		},
	},
	[165704] = { -- Elder Gwenna
		["g"] = {
			L["I would like you to have the supplies."],
		},
	},
	[165705] = { -- Groonoomcrooek
		["g"] = {
			L["I would like you to have the supplies."],
		},
	},
	[158543] = { -- Attendant Sparkledew
		["g"] = {
			L["Attendant Sparkledew 1"],
		},
	},
	[160121] = { -- Master Sha'lor
		["g"] = {
			L["Master Sha'lor 1"],
		},
	},
	[158544] = { -- Lord Herne
		["g"] = {
			L["Lord Herne 2"],
			L["Lord Herne 3"],
			L["Lord Herne 4"],
		},
	},
	[165550] = { -- Attendant Shimmerwing
		["g"] = {
			L["Attendant Shimmerwing 1"],
		},
	},
	[169273] = { -- Silkstrider Caretaker
		["g"] = {
			L["Silkstrider Caretaker 1"],
		},
	},
	[161509] = { -- Lady Moonberry
		["g"] = {
			L["Lady Moonberry 3"],
			L["I know my way around the Sanctum."],
		},
		["c"] = {
			L["Are you sure?"],
		},
	},
	[172431] = { -- Lady Moonberry
		["g"] = {
			L["Lady Moonberry 1"],
		},
	},
	[170705] = { -- Ara'lon
		["g"] = {
			L["Ara'lon 1"],
		},
	},
	[164023] = { -- Vesperbloom
		["g"] = {
			L["Vesperbloom 1"],
			L["Vesperbloom 2"],
		},
	},
	[172185] = { -- Zayhad, The Builder
		["g"] = {
			L["Zayhad, The Builder 1"],
			L["Zayhad, The Builder 2"],
		},
	},
	[156634] = { -- Winter Queen
		["g"] = {
			L["Winter Queen 1"],
			L["Winter Queen 2"],
		},
	},
	[166887] = { -- Winter Queen
		["g"] = {
			L["Winter Queen 3"],
			L["Winter Queen 4"],
			L["I am ready to go."],
		},
	},
	[171992] = { -- Lady Moonberry
		["g"] = {
			L["Lady Moonberry 4"],
		},
	},
	[172091] = { -- Lord Herne
		["g"] = {
			L["I am ready."],
		},
	},
	[173377] = { -- Faryl
		["g"] = {
			L["Begin pet battle."],
		},
	},
	[172886] = { -- Mask of Bwonsamdi
		["g"] = {
			L["Mask of Bwonsamdi 1"],
		},
	},
	[173372] = { -- Glitterdust
		["g"] = {
			L["Begin pet battle."],
		},
	},
	[157949] = { -- Heartwood Grove Holdout
		["g"] = {
			L["Evacuate, now!"],
		},
	},
	[161354] = { -- Huln Highmountain
		["g"] = {
			L["I am ready."],
		},
	},
	[158006] = { -- Heartwood Grove Holdout
		["g"] = {
			L["Evacuate, now!"],
		},
	},
	[170924] = { -- Nortera
		["g"] = {
			L["I'd like to heal and revive my battle pets."],
		},
		["c"] = {
			L["A small fee for supplies is required."],
		},
	},
	[159427] = { -- Elder Finnan
		["g"] = {
			L["The Lady of the Falls wanted to make sure you were safe."],
		},
	},
	[159428] = { -- Groonoomcrooek
		["g"] = {
			L["The Lady of the Falls wanted to make sure you were safe."],
		},
	},
	[159465] = { -- Elder Gwenna
		["g"] = {
			L["The Lady of the Falls wanted to make sure you were safe."],
		},
	},
	[160262] = { -- Ysera
		["g"] = {
			L["Ysera 1"],
			L["I'm ready."],
		},
	},
	[162434] = { -- Littlewing
		["g"] = {
			L["I'd like to heal and revive my battle pets."],
		},
		["c"] = {
			L["A small fee for supplies is required."],
		},
	},
	[104553] = { -- Odrogg
		["g"] = {
			L["Let's do battle!"],
		},
	},
	[172677] = { -- Niya
		["g"] = {
			L["I am ready."],
		},
	},
	[165671] = { -- Pelagos
		["g"] = {
			L["Pelagos 3"],
		},
	},
	[165736] = { -- Lady Moonberry's Soap
		["g"] = {
			L["Lady Moonberry's Soap 1"],
		},
	},
	[162392] = { -- Willowblossom
		["g"] = {
			L["I am ready."],
		},
	},
	[163328] = { -- Pelagos
		["g"] = {
			L["I am ready."],
		},
	},
	-- End of Ardenweald
	-- Revendreth
	[167838] = { -- Globknob
		["g"] = {
			L["Quest"],
		},
	},
	[167918] = { -- Bela
		["g"] = {
			L["Quest"],
		},
	},
	[164420] = { -- Laurent
		["g"] = {
			L["I am ready."],
		},
	},
	[167849] = { -- Soul of Keltesh
		["g"] = {
			L["Quest"],
		},
	},
	[156295] = { -- Courier Rokalai
		["g"] = {
			L["Quest"],
		},
	},
	[168237] = { -- Ilka
		["g"] = {
			L["<Present Lajos's invitation>"],
		},
	},
	[168238] = { -- Samu
		["g"] = {
			L["<Present Lajos's invitation>"],
		},
	},
	[167717] = { -- Darkhaven Villager
		["g"] = {
			L["<Request tithe>"],
		},
	},
	[167744] = { -- Darkhaven Villager
		["g"] = {
			L["<Request tithe>"],
		},
	},
	[167746] = { -- Darkhaven Villager
		["g"] = {
			L["<Request tithe>"],
		},
	},
	[156291] = { -- Shadowrider Neralva
		["g"] = {
			L["I'd like to heal and revive my battle pets."],
		},
		["c"] = {
			L["A small fee for supplies is required."],
		},
	},
	[156234] = { -- Horrormaster Damnik
		["g"] = {
			L["I'd like to heal and revive my battle pets."],
		},
		["c"] = {
			L["A small fee for supplies is required."],
		},
	},
	[159883] = { -- Chancellor Codrin
		["g"] = {
			L["Chancellor Codrin 1"],
		},
	},
	[173324] = { -- Eyegor
		["g"] = {
			L["Begin pet battle."],
		},
	},
	[159946] = { -- The Countess
		["g"] = {
			L["The Countess 1"],
		},
	},
	[160941] = { -- The Curator
		["g"] = {
			L["The Curator 1"],
		},
	},
	[160163] = { -- The Accuser
		["g"] = {
			L["The Accuser 1"],
		},
	},
	[160233] = { -- The Accuser
		["g"] = {
			L["The Accuser 1"],
		},
	},
	[161056] = { -- Guard Captain Elizabeta
		["g"] = {
			L["Guard Captain Elizabeta 1"],
		},
	},
	[170291] = { -- Alchemist Leticia
		["g"] = {
			L["I am ready."],
		},
	},
	[160011] = { -- Lord Neculai
		["g"] = {
			L["Are you enjoying yourself?"],
		},
	},
	[160002] = { -- Lord Vasile
		["g"] = {
			L["Are you enjoying yourself?"],
		},
	},
	[160008] = { -- Lady Rodica
		["g"] = {
			L["Are you enjoying yourself?"],
		},
	},
	[160006] = { -- Lady Andrada
		["g"] = {
			L["Are you enjoying yourself?"],
		},
	},
	[159981] = { -- Lady Ivona
		["g"] = {
			L["Are you enjoying yourself?"],
		},
	},
	[159978] = { -- Lady Ihrin
		["g"] = {
			L["Are you enjoying yourself?"],
		},
	},
	[159968] = { -- Lady Zina
		["g"] = {
			L["Are you enjoying yourself?"],
		},
	},
	[160001] = { -- Duchess Yetta
		["g"] = {
			L["Are you enjoying yourself?"],
		},
	},
	[159973] = { -- Duke Mitica
		["g"] = {
			L["Are you enjoying yourself?"],
		},
	},
	[159966] = { -- Duke Grigore
		["g"] = {
			L["Are you enjoying yourself?"],
		},
	},
	[160010] = { -- Duke Vlad
		["g"] = {
			L["Are you enjoying yourself?"],
		},
	},
	[160004] = { -- Sir Vilhelm
		["g"] = {
			L["Are you enjoying yourself?"],
		},
	},
	[159967] = { -- Duchess Minodora
		["g"] = {
			L["Are you enjoying yourself?"],
		},
	},
	[159958] = { -- Madame Viviana
		["g"] = {
			L["Are you enjoying yourself?"],
		},
	},
	[160005] = { -- Madame Irini
		["g"] = {
			L["Are you enjoying yourself?"],
		},
	},
	[160003] = { -- Duke Omor
		["g"] = {
			L["Are you enjoying yourself?"],
		},
	},
	[159988] = { -- Madame Elenuta
		["g"] = {
			L["Are you enjoying yourself?"],
		},
	},
	[159988] = { -- Duke Mihas
		["g"] = {
			L["Are you enjoying yourself?"],
		},
	},
	[159972] = { -- Lord Ionel
		["g"] = {
			L["Are you enjoying yourself?"],
		},
	},
	[159982] = { -- Duchess Vanda
		["g"] = {
			L["Are you enjoying yourself?"],
		},
	},
	[160000] = { -- Lady Lerae
		["g"] = {
			L["Are you enjoying yourself?"],
		},
	},
	[159997] = { -- Lord Razvan
		["g"] = {
			L["Are you enjoying yourself?"],
		},
	},
	[159965] = { -- Lord Sorin
		["g"] = {
			L["Are you enjoying yourself?"],
		},
	},
	[159977] = { -- Sir Geofri
		["g"] = {
			L["Are you enjoying yourself?"],
		},
	},
	[159986] = { -- Sir Vali
		["g"] = {
			L["Are you enjoying yourself?"],
		},
	},
	[159960] = { -- Duke Avram
		["g"] = {
			L["Are you enjoying yourself?"],
		},
	},
	[159961] = { -- Lord Silviu
		["g"] = {
			L["Are you enjoying yourself?"],
		},
	},
	[160009] = { -- Madame Tassa
		["g"] = {
			L["Are you enjoying yourself?"],
		},
	},
	[159999] = { -- Madame Miriana
		["g"] = {
			L["Are you enjoying yourself?"],
		},
	},
	[159980] = { -- Madame Lenuta
		["g"] = {
			L["Are you enjoying yourself?"],
		},
	},
	[160007] = { -- Duchess Silviana
		["g"] = {
			L["Are you enjoying yourself?"],
		},
	},
	[159898] = { -- Duchess Lacrima
		["g"] = {
			L["Are you enjoying yourself?"],
		},
	},
	[159970] = { -- Duchess Odeta
		["g"] = {
			L["Are you enjoying yourself?"],
		},
	},
	[160956] = { -- Watcher Emil
		["g"] = {
			L["Let's go!"],
		},
	},
	[165662] = { -- The Countess
		["g"] = {
			L["<Deliver Prince Renathal's invitation.>"],
		},
	},
	[165866] = { -- The Stonewright
		["g"] = {
			L["<Deliver Prince Renathal's invitation.>"],
		},
	},
	[159650] = { -- Elena
		["g"] = {
			L["<Present the Offer of Employment.>"],
		},
	},
	[159651] = { -- Dumitra
		["g"] = {
			L["<Present the Offer of Employment.>"],
		},
	},
	[159652] = { -- Florin
		["g"] = {
			L["<Present the Offer of Employment.>"],
		},
	},
	[166541] = { -- Cobwobble
		["g"] = {
			L["Where does the Taskmaster keep the sinstones?"],
			L["What are you all doing?"],
			L["Why are the ones with scribbles interesting?"],
		},
	},
	[166542] = { -- Slobwobble
		["g"] = {
			L["Where does the Taskmaster keep the sinstones?"],
			L["What are you all doing?"],
			L["Why are the ones with scribbles interesting?"],
		},
	},
	[166543] = { -- Dobwobble
		["g"] = {
			L["Where does the Taskmaster keep the sinstones?"],
			L["What are you all doing?"],
			L["Why are the ones with scribbles interesting?"],
		},
	},
	[169238] = { -- Courier Araak
		["g"] = {
			L["Courier Araak 1"],
			L["Courier Araak 2"],
		},
	},
	[165921] = { -- Courier Araak
		["g"] = {
			L["Courier Araak 2"],
		},
	},
	[169917] = { -- Avowed Ritualist
		["g"] = {
			L["Avowed Ritualist 1"],
		},
	},
	[169865] = { -- Treasure Guardian
		["g"] = {
			L["Treasure Guardian 1"],
			L["Treasure Guardian 2"],
		},
	},
	[165419] = { -- Grand Marshal Mudrag
		["g"] = {
			L["I'm ready."],
		},
	},
	[173331] = { -- Addius the Tormentor
		["g"] = {
			L["Begin pet battle."],
		},
	},
	[163163] = { -- Ogburn
		["g"] = {
			L["I'd like to heal and revive my battle pets."],
		},
		["c"] = {
			L["A small fee for supplies is required."],
		},
	},
	[166092] = { -- Rasvan
		["g"] = {
			L["I'd like to heal and revive my battle pets."],
		},
		["c"] = {
			L["A small fee for supplies is required."],
		},
	},
	[171934] = { -- Prince Renathal
		["g"] = {
			L["I know my way around the Sanctum."],
		},
		["c"] = {
			L["Are you sure?"],
		},
	},
	[161544] = { -- The Curator
		["g"] = {
			L["The Curator 2"],
			L["The Curator 3"],
			L["I am ready."],
		},
	},
	[161553] = { -- Mindscorched Alwin
		["g"] = {
			L["Let's go."],
		},
	},
	-- The Maw
	[165918] = { -- Highlord Darion Mograine
		["g"] = {
			L["Highlord Darion Mograine 1"],
		},
	},
	[166980] = { -- Lady Jaina Proudmoore
		["g"] = {
			L["I am ready."],
			L["Lady Jaina Proudmoore 1"],
			L["Lady Jaina Proudmoore 2"],
			L["Lady Jaina Proudmoore 3"],
			L["Lady Jaina Proudmoore 4"],
		}
	},
	[168836] = { -- Shandris Feathermoon
		["g"] = {
			L["Shandris Feathermoon 1"],
		}
	},
	[178828] = { -- Lord Herne
		["g"] = {
			L["Lord Herne 1"],
		}
	},
	[178943] = { -- Lady Moonberry
		["g"] = {
			L["Lady Moonberry 2"],
		}
	},
	[179068] = { -- Orator Kloe
		["g"] = {
			L["Orator Kloe 1"],
		}
	},
	[178033] = { -- Gubbins
		["g"] = {
			L["Gubbins 1"],
		}
	},
	[177900] = { -- Xandria
		["g"] = {
			L["I am ready."],
			L["Xandria 1"],
		}
	},
	[178006] = { -- Prince Renathal
		["g"] = {
			L["Prince Renathal 1"],
		}
	},
	[162804] = { -- Ve'nari
		["g"] = {
			L["Quest"],
			L["Ve'nari 1"],
			L["Ve'nari 2"],
			L["Ve'nari 3"],
		}
	},
	[166280] = { -- Ashamane
		["g"] = {
			L["Ashamane 1"],
		}
	},
	[166315] = { -- Ashamane
		["g"] = {
			L["Ashamane 2"],
		}
	},
	[166461] = { -- Spirit of Vol'jin
		["g"] = {
			L["Spirit of Vol'jin 2"],
		}
	},
	[169625] = { -- Sinfall Executor
		["g"] = {
			L["Sinfall Executor 1"],
		}
	},
	[169627] = { -- Sinfall Executor
		["g"] = {
			L["Sinfall Executor 1"],
		}
	},
	[161158] = { -- The Accuser
		["g"] = {
			L["The Accuser 2"],
		}
	},
	[161278] = { -- The Accuser
		["g"] = {
			L["The Accuser 3"],
		}
	},
	[167689] = { -- Prince Renethal
		["g"] = {
			L["I am ready."],
		}
	},
	-- End of Revendreth
	-- Torghast
	[164937] = { -- Runecarver
		["g"] = {
			L["Runecarver 1"],
			L["Runecarver 2"],
		},
	},
	[175127] = { -- Wayfinder
		["g"] = {
			L["Wayfinder 1"],
		},
	},
	[175118] = { -- Shandris Feathermoon
		["g"] = {
			L["Quest"],
		},
	},
	[164334] = { -- Shandris Feathermoon
		["g"] = {
			L["Shandris Feathermoon 2"],
		},
	},
	[168979] = { -- Meatball
		["g"] = {
			L["Yes, I will help."],
		},
	},
	[167839] = { -- Partially-Infused Soul Remnant
		["g"] = {
			L["Partially-Infused Soul Remnant 1"],
		},
	},
	[166123] = { -- Indigo
		["g"] = {
			L["Yes, I will help."],
		},
	},
	[152418] = { -- Gallath
		["g"] = {
			L["Yes, I will help."],
		},
	},
	[166151] = { -- Moriaz the Red
		["g"] = {
			L["Yes, I will help."],
		},
	},
	[171920] = { -- Ayeleth
		["g"] = {
			L["Yes, I will help."],
		},
	},
	[171901] = { -- Kaletar
		["g"] = {
			L["I will free you."],
		},
	},
	[172264] = { -- Yira'lya
		["g"] = {
			L["I will free you."],
		},
	},
	[172261] = { -- Chalkyth
		["g"] = {
			L["Yes, I will help."],
		},
	},
	[157426] = { -- Indri the Treesinger
		["g"] = {
			L["Yes, I will help."],
		},
	},
	[178932] = { -- Ve'lor the Messenger
		["g"] = {
			L["Yes, I will help."],
		},
	},
	[166147] = { -- Calix
		["g"] = {
			L["Yes, I will help."],
		},
	},
	[157406] = { -- Renavyth
		["g"] = {
			L["I will assist you."],
		},
	},
	-- End of Torghast
	-- Zereth Mortis
	[177486] = { -- Elder Kreth
		["g"] = {
			L["Elder Kreth 1"],
			L["Elder Kreth 2"],
			L["Elder Kreth 3"],
			L["Yes."],
			L["We need your assistance."],
		},
	},
	[180923] = { -- Varoun
		["g"] = {
			L["Varoun 1"],
		},
	},
	[180950] = { -- Avna
		["g"] = {
			L["Avna 1"],
		},
	},
	[180926] = { -- Custodian Kalir
		["g"] = {
			L["Custodian Kalir 1"],
		},
	},
	[183465] = { -- Alonis
		["g"] = {
			L["Your presence is requested immediately at Provis Terra."],
		},
	},
	[183455] = { -- Huntress Laikeer
		["g"] = {
			L["Your presence is requested immediately at Provis Terra."],
		},
	},
	[183458] = { -- Ava'zer
		["g"] = {
			L["Your presence is requested immediately at Provis Terra."],
		},
	},
	[183724] = { -- Lady Jaina Proudmoore
		["g"] = {
			L["I'm ready."],
		},
	},
	[182346] = { -- Tamra
		["g"] = {
			L["Tamra 1"],
		},
	},
	[177958] = { -- Firim
		["g"] = {
			L["Firim 1"],
			L["Firim 2"],
			L["Firim 3"],
		},
	},
	[181706] = { -- Pocopoc
		["g"] = {
			L["Pocopoc 1"],
			L["Pocopoc 2"],
			L["Pocopoc 3"],
			L["Pocopoc 4"],
			L["Pocopoc 5"],
		},
	},
	[181183] = { -- Highlord Bolvar Fordragon
		["g"] = {
			L["Highlord Bolvar Fordragon 4"],
		},
	},
	[183677] = { -- Uther the Lightbringer
		["g"] = {
			L["Tell me what happened."],
		},
	},
	[178015] = { -- Elder Zoor
		["g"] = {
			L["We need your assistance."],
		},
	},
	[178016] = { -- Elder Ara
		["g"] = {
			L["We need your assistance."],
		},
	},
	[181179] = { -- Elder Nirav
		["g"] = {
			L["I need to restore this artifact."],
		},
	},
	[183298] = { -- Faruu
		["g"] = {
			L["I need to restore this artifact."],
		},
	},
	[181084] = { -- Drim
		["g"] = {
			L["I need to restore this artifact."],
		},
	},
	[184442] = { -- Feroz
		["g"] = {
			L["Feroz 1"],
		},
	},
	[184153] = { -- Elder Ara
		["g"] = {
			L["Let's begin."],
		},
	},
	[177456] = { -- Anduin Wrynn
		["g"] = {
			L["Tell me what happened."],
		},
	},
	[181229] = { -- Highlord Bolvar Fordragon
		["g"] = {
			L["Highlord Bolvar Fordragon 3"],
		},
	},
	[181229] = { -- Saezurah
		["g"] = {
			L["Saezurah 1"],
		},
	},
	[181738] = { -- Nadjia the Mistblade
		["g"] = {
			L["Nadjia the Mistblade 1"],
		},
	},
	[181740] = { -- Droman Aliothe
		["g"] = {
			L["Will you bring your forces to fight with us?"],
		},
	},
	[181739] = { -- Secutor Mevix
		["g"] = {
			L["Will you bring your forces to fight with us?"],
		},
	},
	[180965] = { -- Firim
		["g"] = {
			L["Firim 4"],
		},
	},
	[180942] = { -- Saezurah
		["g"] = {
			L["Saezurah 2"],
		},
	},
	[181892] = { -- Vessel
		["g"] = {
			L["Vessel 1"],
		},
	},
	[183693] = { -- Automa Scryer
		["g"] = {
			L["Examine the Automa."],
		},
	},
	[183703] = { -- Automa Scryer
		["g"] = {
			L["Examine the Automa."],
		},
	},
	[183692] = { -- Automa Scryer
		["g"] = {
			L["Examine the Automa."],
		},
	},
	[183694] = { -- Automa Scryer
		["g"] = {
			L["Examine the Automa."],
		},
	},
	[180914] = { -- Pelagos
		["g"] = {
			L["Pelagos 1"],
		},
	},
	-- End of Zereth Mortis
	-- Exile's Reach
	[167179] = { -- Daelya Twilightsbane
		["g"] = {
			L["Daelya Twilightsbane 1"],
			L["Daelya Twilightsbane 2"],
		},
	},
	[153211] = { -- Meredy Huntswell
		["g"] = {
			L["I'll fight the harpies that come."],
			L["Meredy Huntswell 1"],
		},
	},
	[156943] = { -- Meredy Huntswell
		["g"] = {
			L["Meredy Huntswell 1"],
		},
	},
	[167298] = { -- Herbert Gloomburst
		["g"] = {
			L["I'll fight the harpies that come."],
		},
	},
	[167309] = { -- Herbert Gloomburst
		["g"] = {
			L["Herbert Gloomburst 1"],
		},
	},
	[161350] = { -- Captain Garrick
		["g"] = {
			L["Let's get out of the citadel and figure out how to get back home."],
		},
	},
	[167663] = { -- Warlord Breka Grimaxe
		["g"] = {
			L["Warlord Breka Grimaxe 1"],
		},
	},
	[162972] = { -- Coulston Nereus
		["g"] = {
			L["I'm in."],
			L["Got it."],
		},
	},
	[164835] = { -- Kee-La
		["g"] = {
			L["I'm ready."],
		},
	},
	-- End of Exile's Reach
	-- De Other Side (Dungeon)
	[166281] = { -- Bwonsamdi
		["g"] = {
			L["Bwonsamdi 1"],
		},
	},
	-- End of De Other Side (Dungeon)
	-- Shadowfang Keep (Dungeon)
	[36296] = { -- Apothecary Hummel
		["g"] = {
			L["Begin the battle."],
		},
	},
	-- End of Shadowfang Keep
}

local function GetParentMapID(mapId)
	-- Get the parent map ID, then check
	-- to see if it's a continent.
	--
	-- If not a continent, then recursively
	-- scan the map relationship until the
	-- first continent is found.
	local mapInfo = C_Map.GetMapInfo(mapId)
	if mapInfo.mapType ~= 2 and mapInfo.parentMapID ~= 0 then
		GetParentMapID(mapInfo.parentMapID)
	else
		parentMapId = mapInfo.mapID
	end
end

local function SelectGossipOption(options, npcId, parentMapId)
	-- Use the parent map ID to determine
	-- which populated table to use.
	--
	-- If the parent map ID isn't supported
	-- then set 't' to the default creatures
	-- table.
	if parentMapId == 12 or parentMapId == 13 or parentMapId == 948 then
		t = Classic
	elseif parentMapId == 101 then
		t = BurningCrusade
	elseif parentMapId == 113 then
		t = WrathOfTheLichKing
	elseif parentMapId == 424 then
		t = MistsOfPandaria
	elseif parentMapId == 572 then
		t = WarlordsOfDraenor
	elseif parentMapId == 619 or parentMapId == 905 then
		t = Legion
	elseif parentMapId == 875 or parentMapId == 876 then
		t = BattleForAzeroth
	elseif parentMapId == 1409 or parentMapId == 1550 then
		t = Shadowlands
	end
	
	for index, gossipOptionsSubTable in ipairs(options) do
		-- These are player submitted dialogs
		-- using the Dialog command.
		for id, gossip in ipairs(HelpMePlayPlayerDialogDB) do
			if string.find(string.lower(gossipOptionsSubTable["name"]), string.lower(gossip)) then
				C_GossipInfo.SelectOption(index)
				return
			end
		end
		
		-- These are NPC dialogs associated
		-- with a specific NPC that are explicitly
		-- in the established table.
		for id, _ in pairs(t) do
			if id == npcId then
				-- We found a match in the table
				-- so let's move forward.
				for i = 1, #t[id]["g"] do
					--- DEBUG ---
					-- Only enable these if dialogs aren't being
					-- selected when they should be.
					--print(string.lower(gossipOptionsSubTable["name"]))
					--print(string.lower(t[id]["g"][i]))
					if string.find(string.lower(gossipOptionsSubTable["name"]), string.lower(t[id]["g"][i])) then
						C_GossipInfo.SelectOption(index)
						return
					end
				end
			end
		end
	end
	
	-- We're done with 't', so reset
	-- it back to an empty table.
	t = {}
end

local function ProcessDialogTree()
	local index = 1
	local unitGUID = UnitGUID("target") or UnitGUID("mouseover")
	local gossipOptions = C_GossipInfo.GetOptions()
	if unitGUID then
		local _, _, _, _, _, npcId = strsplit("-", unitGUID); npcId = tonumber(npcId)
		SelectGossipOption(gossipOptions, npcId, parentMapId)
	else
		-- This must be an object with a
		-- dialog table.
		SelectGossipOption(gossipOptions, 0, parentMapId)
	end
end

local function CheckActiveQuests(activeQuests)
	if #activeQuests == 1 then
		if activeQuests[1].isComplete then
			HMP_CompleteQuest()
		else
			ProcessDialogTree()
		end
	else
		for i = 1, #activeQuests do
			if activeQuests[i].isComplete then
				HMP_CompleteQuest()
			end
		end
		ProcessDialogTree()
	end
end

local function ConfirmConfirmationMessage(message, npcId)
	-- Use the parent map ID to determine
	-- which populated table to use.
	--
	-- If the parent map ID isn't supported
	-- then set 't' to the default creatures
	-- table.
	if parentMapId == 12 or parentMapId == 13 then
		t = Classic
	elseif parentMapId == 101 then
		t = BurningCrusade
	elseif parentMapId == 113 then
		t = WrathOfTheLichKing
	elseif parentMapId == 424 then
		t = MistsOfPandaria
	elseif parentMapId == 572 then
		t = WarlordsOfDraenor
	elseif parentMapId == 619 or parentMapId == 905 then
		t = Legion
	elseif parentMapId == 875 or parentMapId == 876 then
		t = BattleForAzeroth
	elseif parentMapId == 1409 or parentMapId == 1550 then
		t = Shadowlands
	end
	
	for id, _ in pairs(t) do
		if id == npcId then
			for i = 1, #t[id]["c"] do
				if string.find(string.lower(message), string.lower(t[id]["c"][i])) then
					StaticPopup1Button1:Click("LeftButton")
					return
				end
			end
		end
	end
end

e:SetScript("OnEvent", function(self, event, ...)
	if event == "GOSSIP_CONFIRM" then
		local _, message = ...
		if HelpMePlayOptionsDB.Dialog == false or HelpMePlayOptionsDB.Dialog == nil then return end
		local index = 1
		local unitGUID = UnitGUID("target") or UnitGUID("mouseover")
		if unitGUID then
			local _, _, _, _, _, npcId = strsplit("-", unitGUID); npcId = tonumber(npcId)
			ConfirmConfirmationMessage(message, npcId)
		end
	end
	if event == "GOSSIP_SHOW" then
		if HelpMePlayOptionsDB.Dialog == false or HelpMePlayOptionsDB.Dialog == nil then return end
		GetParentMapID(C_Map.GetBestMapForUnit("player"))
		local numAvailableQuests = C_GossipInfo.GetNumAvailableQuests()
		local activeQuests = C_GossipInfo.GetActiveQuests()
		if HelpMePlayOptionsDB.Quests then
			if next(activeQuests) then
				CheckActiveQuests(activeQuests)
			elseif numAvailableQuests > 0 then
				for i = 1, numAvailableQuests do
					SelectAvailableQuest(i)
				end
			else
				ProcessDialogTree()
			end
		else
			ProcessDialogTree()
		end
	end
end)