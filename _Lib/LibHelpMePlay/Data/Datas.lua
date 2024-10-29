local LHMP = LibStub("LibHelpMePlay")
if not LHMP then
    return false
end

LHMP.Colors = {
    COMMON = "FFFFFF",
    UNCOMMON = "1EFF00",
    RARE = "0070DD",
    EPIC = "A335EE",
    LEGENDARY = "FF8000",
    ARTIFACT = "E6CC80",
    HEIRLOOM = "00CCFF",
    GOLD = "FFD100",
    RED = "FF0000"
}

LHMP.Containers = {
    21746, -- Lucky Red Envelope
    37586, -- Handful of Treats
    54537, -- Heart-Shaped Box
    117392, -- Loot-Filled Pumpkin
    117393, -- Keg-Shaped Treasure Chest
    117394, -- Satchel of Chilled Goods
    147573, -- Trial of Style Reward: First Place
    147574, -- Trial of Style Reward: Second Place
    147575, -- Trial of Style Reward: Third Place
    147576, -- Trial of Style Consolation Prize
    216874, -- Loot-Filled Basket
    228741, -- Lamplighter Supply Satchel
}

LHMP.Emotes = {
    [153580] = "WAVE" -- Gor'groth
}

LHMP.RaceFactions = {
    [1] = 1,
    [2] = 0,
    [3] = 1,
    [4] = 1,
    [5] = 0,
    [6] = 0,
    [7] = 1,
    [8] = 0,
    [9] = 0,
    [10] = 0,
    [11] = 1,
    [22] = 1,
    [25] = 1,
    [26] = 0,
    [27] = 0,
    [28] = 0,
    [29] = 1,
    [30] = 1,
    [31] = 0,
    [32] = 1,
    [34] = 1,
    [35] = 0,
    [36] = 0,
    [37] = 1,
    [52] = 1,
    [70] = 0
}

LHMP.RaceClassCombinations = {
    [1] = {1, 2, 3, 4, 5, 6, 8, 9, 10},
    [2] = {1, 3, 4, 5, 6, 7, 8, 9, 10},
    [3] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10},
    [4] = {1, 3, 4, 5, 6, 8, 9, 10, 11, 12},
    [5] = {1, 3, 4, 5, 6, 8, 9, 10},
    [6] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11},
    [7] = {1, 3, 4, 5, 6, 8, 9, 10},
    [8] = {1, 3, 4, 5, 6, 7, 8, 9, 10, 11},
    [9] = {1, 3, 4, 5, 6, 7, 8, 9, 10},
    [10] = {1, 2, 3, 4, 5, 6, 8, 9, 10, 12},
    [11] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10},
    [22] = {1, 3, 4, 5, 6, 8, 9, 10, 11},
    [25] = {1, 3, 4, 5, 6, 7, 8, 9, 10},
    [26] = {1, 3, 4, 5, 6, 7, 8, 9, 10},
    [27] = {1, 3, 4, 5, 6, 8, 9, 10},
    [28] = {1, 3, 4, 5, 6, 7, 8, 9, 10, 11},
    [29] = {1, 3, 4, 5, 6, 8, 9, 10},
    [30] = {1, 2, 3, 4, 5, 6, 8, 9, 10},
    [31] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11},
    [32] = {1, 3, 4, 5, 6, 7, 8, 9, 10},
    [34] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10},
    [35] = {1, 3, 4, 5, 6, 7, 8, 9, 10},
    [36] = {1, 3, 4, 5, 6, 7, 8, 9, 10},
    [37] = {1, 3, 4, 5, 6, 8, 9, 10},
    [52] = {13},
    [70] = {13}
}

LHMP.HeroClasses = {6, 12, 13}

-- Use /dump C_PlayerChoice.GetCurrentPlayerChoiceInfo().choiceID
-- to get the ID for below.
LHMP.PlayerChoices = {
    [51] = 1,
    [55] = 2,
    [234] = 1,
    [688] = 1
}

LHMP.QuestMerchants = {
    [2664] = {
        { Index = 1, Quantity = 1, Conditions = {{"QUESTS_ACTIVE", {26600}}, {"QUEST_OBJECTIVES_INCOMPLETE", {{26600,1}}}}}
    },
    [2491] = {
        { Index = 1, Quantity = 1, Conditions = {{"QUESTS_ACTIVE", {26600}}, {"QUEST_OBJECTIVES_INCOMPLETE", {{26600,2}}}}}
    },
    [19678] = {
        { Index = 2, Quantity = 1, Conditions = {{"QUESTS_ACTIVE", {10664}}, {"QUEST_OBJECTIVES_INCOMPLETE", {{10664,3}}}}}
    },
    [40832] = {
        { Index = 1, Quantity = 1, Conditions = {{"QUESTS_ACTIVE", {25517}}, {"QUEST_OBJECTIVES_INCOMPLETE", {{25517,1}}}}}
    },
    [54982] = {
        { Index = 1, Quantity = 3, Conditions = {{"QUESTS_ACTIVE", {29627}}, {"QUEST_OBJECTIVES_INCOMPLETE", {{29627,3}}}}}
    },
    [54981] = {
        { Index = 1, Quantity = 1, Conditions = {{"QUESTS_ACTIVE", {29627}}, {"QUEST_OBJECTIVES_INCOMPLETE", {{29627,2}}}}}
    },
    [73306] = {
        { Index = 6, Quantity = 1, Conditions = {{"QUESTS_ACTIVE", {33343}}, {"QUEST_OBJECTIVES_INCOMPLETE", {{33343,1}}}}}
    },
    [156800] = {
        { Index = 1, Quantity = 1, Conditions = {{"QUESTS_ACTIVE", {55194}}, {"QUEST_OBJECTIVES_INCOMPLETE", {{55194,1}}}}}
    },
    [167213] = {
        { Index = 1, Quantity = 1, Conditions = {{"QUESTS_ACTIVE", {59950}}, {"QUEST_OBJECTIVES_INCOMPLETE", {{59950,1}}}}}
    },
    [209192] = {
        { Index = 1, Quantity = 1, Conditions = {{"QUESTS_ACTIVE", {79223}}, {"QUEST_OBJECTIVES_INCOMPLETE", {{79223,1}}}}}
    },
    [217642] = {
        { Index = 1, Quantity = 1, Conditions = {{"QUESTS_ACTIVE", {78613}}, {"QUEST_OBJECTIVES_INCOMPLETE", {{78613,2}}}}}
    },
    [216164] = {
        { Index = 1, Quantity = 1, Conditions = {{"QUESTS_ACTIVE", {79343}}, {"QUEST_OBJECTIVES_INCOMPLETE", {{79343,3}}}}}
    },
    [228184] = {
        { Index = 1, Quantity = 1, Conditions = {{"QUESTS_ACTIVE", {84664}}, {"QUEST_OBJECTIVES_INCOMPLETE", {{84664,1}}}}}
    },
    [212370] = {
        { Index = 1, Quantity = 1, Conditions = {{"QUESTS_ACTIVE", {79545}}, {"QUEST_OBJECTIVES_INCOMPLETE", {{79545,2}}}}}
    },
    [217072] = {
        { Index = 1, Quantity = 1, Conditions = {{"QUESTS_ACTIVE", {79176}}, {"QUEST_OBJECTIVES_INCOMPLETE", {{79176,1}}}}}
    },
    [206151] = {
        { Index = 1, Quantity = 1, Conditions = {{"QUESTS_ACTIVE", {76394}}, {"QUEST_OBJECTIVES_INCOMPLETE", {{76394,3}}}}}
    },
    [100437] = {
        { Index = 1, Quantity = 1, Conditions = {{"QUESTS_ACTIVE", {40520}}, {"QUEST_OBJECTIVES_INCOMPLETE", {{40520,1}}}}}
    },
    [193637] = {
        { Index = 1, Quantity = 7, Conditions = {{"QUESTS_ACTIVE", {66223}}, {"QUEST_OBJECTIVES_INCOMPLETE", {{66223,1}}}}}
    }
}

LHMP.IgnoredQuests = {
    10966, -- Back to the Orphanage [A]
    10967, -- Back to the Orphanage [H]
    59583, -- Welcome to Stormwind
    60343, -- Welcome to Orgrimmar
}

-- If the event should use the title from the calendar, then simply
-- omit the <name> property from the event's table below.
--
-- The texture can be an atlas or a texture ID.
LHMP.WorldEvents = {
    { -- Timewalking Dungeon Event: Classic [US]
        eventID = 1508,
        lfgDungeonID = 2634,
        texture = 236761,
        conditions = {
            minLevel = 10
        }
    },
    { -- Timewalking Dungeon Event: Classic [EU]
        eventID = 1583,
        lfgDungeonID = 2634,
        texture = 236761,
        conditions = {
            minLevel = 10
        }
    },
    { -- Timewalking Dungeon Event: The Burning Crusade [US]
        eventID = 559,
        lfgDungeonID = 744,
        texture = 630783,
        conditions = {
            minLevel = 10
        }
    },
    { -- Timewalking Dungeon Event: The Burning Crusade [EU]
        eventID = 622,
        lfgDungeonID = 744,
        texture = 630783,
        conditions = {
            minLevel = 10
        }
    },
    { -- Timewalking Dungeon Event: The Wrath of the Lich King [US]
        eventID = 562,
        lfgDungeonID = 995,
        texture = 630787,
        conditions = {
            minLevel = 10
        }
    },
    { -- Timewalking Dungeon Event: The Wrath of the Lich King [EU]
        eventID = 616,
        lfgDungeonID = 995,
        texture = 630787,
        conditions = {
            minLevel = 10
        }
    },
    { -- Timewalking Dungeon Event: Cataclysm [US]
        eventID = 587,
        lfgDungeonID = 1146,
        texture = 630784,
        conditions = {
            minLevel = 10
        }
    },
    { -- Timewalking Dungeon Event: Cataclysm [EU]
        eventID = 628,
        lfgDungeonID = 1146,
        texture = 630784,
        conditions = {
            minLevel = 10
        }
    },
    { -- Timewalking Dungeon Event: Mists of Pandaria [US]
        eventID = 643,
        lfgDungeonID = 1453,
        texture = 630786,
        conditions = {
            minLevel = 10
        }
    },
    { -- Timewalking Dungeon Event: Mists of Pandaria [EU]
        eventID = 652,
        lfgDungeonID = 1453,
        texture = 630786,
        conditions = {
            minLevel = 10
        }
    },
    { -- Timewalking Dungeon Event: Warlords of Draenor [US]
        eventID = 1056,
        lfgDungeonID = 1971,
        texture = 2838050,
        conditions = {
            minLevel = 10
        }
    },
    { -- Timewalking Dungeon Event: Warlords of Draenor [EU]
        eventID = 1063,
        lfgDungeonID = 1971,
        texture = 2838050,
        conditions = {
            minLevel = 10
        }
    },
    { -- Timewalking Dungeon Event: Legion [US]
        eventID = 1263,
        lfgDungeonID = 2274,
        texture = 1408999,
        conditions = {
            minLevel = 10
        }
    },
    { -- Timewalking Dungeon Event: Legion [EU]
        eventID = 1265,
        lfgDungeonID = 2274,
        texture = 1408999,
        conditions = {
            minLevel = 10
        }
    },
    { -- Love is in the Air
        eventID = 423,
        lfgDungeonID = 288,
        texture = 135450,
        conditions = {
            minLevel = 10
        }
    },
    { -- Midsummer Fire Festival
        eventID = 341,
        lfgDungeonID = 286,
        texture = 368565,
        conditions = {
            minLevel = 10
        }
    },
    { -- Brewfest
        eventID = 372,
        lfgDungeonID = 287,
        texture = 132621,
        conditions = {
            minLevel = 10
        }
    },
    { -- Hallow's End
        eventID = 324,
        lfgDungeonID = 285,
        texture = 133661,
        conditions = {
            minLevel = 10
        }
    },
}