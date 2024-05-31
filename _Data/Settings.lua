---@diagnostic disable: undefined-global
local addonName, addon = ...
local LHMP = LibStub("LibHelpMePlay")
local NOT_AVAILABLE_FOR_USE = "This setting is currently unavailable."

local function GetEditModeLayouts()
    local layouts={{1,"Modern"},{2,"Classic"}}
    local customLayouts = C_EditMode.GetLayouts()
    for index, layout in ipairs(customLayouts.layouts) do
        table.insert(layouts, (index + 2), { (index + 2), layout.layoutName })
    end
    return layouts
end

addon.Settings = {
    General = {
        --[[{
            Type = "CheckButton",
            Name = "Emotes",
            TooltipText = "Toggle to automatically emote at appropriate NPCs.\n\n" ..
            addon.ColorText("RED", NOT_AVAILABLE_FOR_USE),
            SavedVariable = "UseEmotes",
        },]]
        {
            Type = "CheckButton",
            Name = "Gossip",
            TooltipText = "Toggle the automatic selection of NPC gossips.\n\n" ..
            addon.ColorText("RED", NOT_AVAILABLE_FOR_USE),
            SavedVariable = "AcceptGossip",
        },
        {
            Type = "CheckButton",
            Name = "Mute Talking Head",
            TooltipText = "Toggle to hide and prevent the talking head popup.",
            SavedVariable = "MuteTalkingHead",
        },
        {
            Type = "CheckButton",
            Name = "Ready Checks",
            TooltipText = "Toggle to automatically accept ready checks.",
            SavedVariable = "AcceptReadyChecks",
        },
        {
            Type = "CheckButton",
            Name = "Skip Cutscenes",
            TooltipText = "Toggle skipping cutscenes and in-game movies.",
            SavedVariable = "SkipCutscenes",
        },
        {
            Type = "CheckButton",
            Name = "Role Checks",
            TooltipText = "Toggle to automatically accept role checks.",
            SavedVariable = "AcceptRoleChecks",
        },
        {
            Type = "CheckButton",
            Name = "Skyriding",
            TooltipText = "Toggle to add a button to the Skyriding UI to quickly learn its traits.",
            SavedVariable = "UseDynamicFlightButton",
        },
        {
            Type = "CheckButton",
            Name = "War Mode",
            TooltipText = "Toggle to automatically enable War Mode when entering or logging into Orgrimmar or Stormwind City.\n\n" ..
            addon.ColorText("RED", format("This setting doesn't apply to players at or above level %d.", addon.Constants["CHROMIE_TIME_MAX_LEVEL"])),
            SavedVariable = "UseWarMode",
        },
        {
            Type = "CheckButton",
            Name = "Rare Scan",
            TooltipText = "Toggle if you wish to receive a popup notification and sound for nearby rares.",
            SavedVariable = "RareScan",
        },
        {
            Type = "CheckButton",
            Name = "Event Queue",
            TooltipText = "Toggle to add a button to the top middle of your screen. This button can be used to quickly queue into ongoing events.",
            SavedVariable = "UseWorldEventQueue",
        },
        {
            Type = "CheckButton",
            Name = "Open Containers",
            TooltipText = "Toggle to automatically open (supported) container items when you loot them.",
            SavedVariable = "OpenHolidayItems",
        },
        {
            Type = "CheckButton",
            Name = "Chat Icons",
            TooltipText = "Toggle to show item and collection status (when appropriate) icons in the chat frame.",
            SavedVariable = "ShowChatIcons",
        },
    },
    Quest = {
        {
            Type = "CheckButton",
            Name = "Adventure Maps",
            TooltipText = "Toggle to automatically accept quests from adventure maps.\n\n" ..
            addon.ColorText("RED", "The current support is only for the adventure map in The Waking Shores."),
            SavedVariable = "UseAdventureMaps",
        },
        {
            Type = "CheckButton",
            Name = "Accept and Complete Quests",
            TooltipText = "Toggle the acceptance and completion of quests, as well as the selection of quest rewards.",
            SavedVariable = "AcceptAndCompleteQuests",
        },
        --[[{
            Type = "CheckButton",
            Name = "Accept and Complete All Quests",
            TooltipText = "Toggle the acceptance and completion of all quests, as well as the selection of quest rewards.",
            SavedVariable = "AcceptAndCompleteAllQuests",
        },]]
        {
            Type = "CheckButton",
            Name = "Ignore Repeatable Quests",
            TooltipText = "Toggle to ignore repeatable quests.",
            SavedVariable = "IgnoreRepeatableQuests",
        },
        {
            Type = "CheckButton",
            Name = "Ignore Daily Quests",
            TooltipText = "Toggle to ignore daily quests.",
            SavedVariable = "IgnoreDailyQuests",
        },
        {
            Type = "CheckButton",
            Name = "Party Play",
            TooltipText = "Toggle to make playing with friends a little easier.\n\n" ..
            addon.ColorText("RED", "Party Play, by default, will only auto share quests with party members. Announcements have been removed."),
            SavedVariable = "UsePartyPlay",
        },
        --[[{
            Type = "CheckButton",
            Name = "Purchase Quest Items",
            TooltipText = "Toggle to automatically purchase quest items from merchants.",
            SavedVariable = "PurchaseQuestItems",
        },]]
        {
            Type = "DropDown",
            Name = "Chromie Time",
            TooltipText = "Select the expansion to use when speaking with Chromie in Orgrimmar or Stormwind City.",
            Options = {
                --{ 16, "Dragonflight" }, -- Dragonflight isn't supported yet (not until The War Within).
                { 14, EXPANSION_NAME8 },
                { 15, EXPANSION_NAME7 },
                { 10, EXPANSION_NAME6 },
                { 9, EXPANSION_NAME5 },
                { 8, EXPANSION_NAME4 },
                { 5, EXPANSION_NAME3 },
                { 7, EXPANSION_NAME2 },
                { 6, EXPANSION_NAME1 },
                { 0, NONE },
            },
            SavedVariable = "ChromieTimeExpansionID",
        },
        {
            Type = "DropDown",
            Name = "Quest Rewards",
            TooltipText = format("Select how quest rewards should be chosen.\n\n" ..
            "If Item Level is selected, then chosen quest rewards are automatically equipped by %s.", addonName),
            Options = {
                { 1, "Item Level" },
                { 2, "Sell Price" },
                { 0, NONE },
            },
            SavedVariable = "QuestRewardSelectionTypeID",
        },
    },
    Merchant = {
        {
            Type = "CheckButton",
            Name = "Repairs",
            TooltipText = "Toggle to allow automatic repair.",
            SavedVariable = "ShouldRepair",
        },
        {
            Type = "Slider",
            Name = "Trainer Protection Value",
            TooltipText = "Use the slider to set the minimum amount of gold you must have before the addon will automatically train for you.",
            Options = {
                minValue = 0,
                maxValue = 1000,
                step = 100,
            },
            SavedVariable = "TrainerProtectionValue",
        },
        {
            Type = "BasicButton",
            Name = "Trainer Protection Value (Manual)",
            ButtonText = "Click Me",
            ClickHandler = function(_, button)
                if button == "LeftButton" then
                    StaticPopupDialogs["HELPMEPLAY_TRAINER_PROTECTION_VALUE_MANUAL"] = {
                        text = "Enter the amount of money you must possess before the addon will automatically train for you.",
                        button1 = ACCEPT,
                        button2 = CANCEL,
                        OnAccept = function(self)
                            if tonumber(self.editBox:GetText()) then
                                local value = tonumber(self.editBox:GetText(), 10)
                                HelpMePlayDB["TrainerProtectionValue"] = value * 10000
                            end
                        end,
                        OnShow = function(self)
                            local function HidePopup(self) self:GetParent():Hide() end
                            self.editBox:SetScript("OnKeyUp", function(self, key)
                                if key == "ESCAPE" then HidePopup(self) end
                                if key == "ENTER" then
                                    if tonumber(self:GetText()) then
                                        local value = tonumber(self:GetText(), 10)
                                        HelpMePlayDB["TrainerProtectionValue"] = value * 10000
                                    end
                                    HidePopup(self)
                                end
                            end)
                        end,
                        timeout = 0,
                        showAlert = false,
                        whileDead = false,
                        hasEditBox = true,
                        exclusive = true,
                        preferredIndex = STATICPOPUP_NUMDIALOGS,
                    }
                    StaticPopup_Show("HELPMEPLAY_TRAINER_PROTECTION_VALUE_MANUAL")
                end
            end,
            TooltipText = "The slider moves in increments of 10. Click here to set a custom amount of money.",
            AddSearchTags = true,
        },
    },
    GuildBank = {
        {
            Type = "CheckButton",
            Name = "Keep Me Safe",
            TooltipText = "Toggle to add a popup for approval before the addon is allowed to deposit into the guild bank.",
            SavedVariable = "DepositKeepMeSafe",
        },
        {
            Type = "Slider",
            Name = "Deposit Keep Amount",
            TooltipText = "Use the slider to set the minimum amount of gold you would like to keep on your character after making a deposit.\n\n" ..
            "Visiting a guild bank while below this threshold will instead attempt a withdrawal, provided the guild bank has the funds.",
            Options = {
                minValue = 0,
                maxValue = 10000000,
                step = 10000,
            },
            SavedVariable = "DepositKeepAmount",
        },
        {
            Type = "BasicButton",
            Name = "Deposit Keep Amount (Manual)",
            ButtonText = "Click Me",
            ClickHandler = function(_, button)
                if button == "LeftButton" then
                    StaticPopupDialogs["HELPMEPLAY_DEPOSIT_KEEP_AMOUNT_MANUAL"] = {
                        text = "Enter an amount of money to keep on hand.",
                        button1 = ACCEPT,
                        button2 = CANCEL,
                        OnAccept = function(self)
                            if tonumber(self.editBox:GetText()) then
                                local value = tonumber(self.editBox:GetText(), 10)
                                HelpMePlayDB["DepositKeepAmount"] = value * 10000
                            end
                        end,
                        OnShow = function(self)
                            local function HidePopup(self) self:GetParent():Hide() end
                            self.editBox:SetScript("OnKeyUp", function(self, key)
                                if key == "ESCAPE" then HidePopup(self) end
                                if key == "ENTER" then
                                    if tonumber(self:GetText()) then
                                        local value = tonumber(self:GetText(), 10)
                                        HelpMePlayDB["DepositKeepAmount"] = value * 10000
                                    end
                                    HidePopup(self)
                                end
                            end)
                        end,
                        timeout = 0,
                        showAlert = false,
                        whileDead = false,
                        hasEditBox = true,
                        exclusive = true,
                        preferredIndex = STATICPOPUP_NUMDIALOGS,
                    }
                    StaticPopup_Show("HELPMEPLAY_DEPOSIT_KEEP_AMOUNT_MANUAL")
                end
            end,
            TooltipText = "The slider moves in increments of 1,000. Click here to set a custom amount of money.",
            AddSearchTags = true,
        },
    },
    QuestMobs = {
        {
            Type = "DropDown",
            Name = "Quest Mobs Icon",
            TooltipText = "Select the icon that should appear on the nameplate of NPCs related to active quest(s).",
            Options = {
                { 1, "Quest" },
                { 2, "Treasure Goblin" },
                { 3, "Custom" },
                { 0, NONE },
            },
            SavedVariable = "QuestMobsIconID",
        },
        {
            Type = "DropDown",
            Name = "Quest Mobs Icon Position",
            TooltipText = "Select the position the icon should appear on the nameplate.",
            Options = {
                { 1, "LEFT" },
                { 2, "TOPLEFT" },
                { 3, "TOP" },
                { 4, "TOPRIGHT" },
                { 5, "RIGHT" },
                { 6, "BOTTOMRIGHT" },
                { 7, "BOTTOM" },
                { 8, "BOTTOMLEFT" },
            },
            SavedVariable = "QuestMobsIconPositionID",
        },
        {
            Type = "Slider",
            Name = "X Offset",
            TooltipText = "Use the slider to set the icon's X offset.",
            Options = {
                minValue = -25,
                maxValue = 25,
                step = 50,
            },
            SavedVariable = "QuestMobsIconXOffset",
        },
        {
            Type = "Slider",
            Name = "Y Offset",
            TooltipText = "Use the slider to set the icon's Y offset.",
            Options = {
                minValue = -25,
                maxValue = 25,
                step = 50,
            },
            SavedVariable = "QuestMobsIconYOffset",
        },
    },
    NewCharacter = {
        {
            Type = "CheckButton",
            Name = "Action Bar 2",
            TooltipText = "",
            SavedVariable = "NCC_ActionBar2",
        },
        {
            Type = "CheckButton",
            Name = "Action Bar 3",
            TooltipText = "",
            SavedVariable = "NCC_ActionBar3",
        },
        {
            Type = "CheckButton",
            Name = "Action Bar 4",
            TooltipText = "",
            SavedVariable = "NCC_ActionBar4",
        },
        {
            Type = "CheckButton",
            Name = "Action Bar 5",
            TooltipText = "",
            SavedVariable = "NCC_ActionBar5",
        },
        {
            Type = "CheckButton",
            Name = "Action Bar 6",
            TooltipText = "",
            SavedVariable = "NCC_ActionBar6",
        },
        {
            Type = "CheckButton",
            Name = "Action Bar 7",
            TooltipText = "",
            SavedVariable = "NCC_ActionBar7",
        },
        {
            Type = "CheckButton",
            Name = "Action Bar 8",
            TooltipText = "",
            SavedVariable = "NCC_ActionBar8",
        },
        {
            Type = "CheckButton",
            Name = "Clear All Tracking",
            TooltipText = "Toggle to clear all tracking options from the minimap. De-toggle to keep the default tracking options enabled.",
            SavedVariable = "ClearAllTracking",
        },
        {
            Type = "CheckButton",
            Name = "Auto Loot",
            TooltipText = "Toggle to enable Auto Loot. De-toggle to disable Auto Loot.",
            SavedVariable = "AutoLoot",
        },
        {
            Type = "CheckButton",
            Name = "Disable Tutorials",
            TooltipText = "Toggle to disable the tutorial popups. De-toggle if you wish to see the tutorial popups.",
            SavedVariable = "DisableTutorials",
        },
        {
            Type = "CheckButton",
            Name = "Auto Push Spells",
            TooltipText = "Toggle to automatically push spells to your action bars. De-toggle if you don't want spells to automatically push to your action bars.",
            SavedVariable = "AutoPushSpells",
        },
        {
            Type = "CheckButton",
            Name = "Class Color Frames",
            TooltipText = "Toggle to make the PvP and raid frames use class colors instead of health. De-toggle to keep health as the defining color.",
            SavedVariable = "ClassColorFrames",
        },
        {
            Type = "CheckButton",
            Name = "Loot Under Mouse",
            TooltipText = "Toggle to make the loot window appear under your mouse. De-toggle to make the loot window appear near the top-left corner.",
            SavedVariable = "LootUnderMouse",
        },
        {
            Type = "CheckButton",
            Name = "Disable Dialog",
            TooltipText = "Toggle to silence dialog. De-toggle to enable dialog.",
            SavedVariable = "DisableDialog",
        },
        {
            Type = "DropDown",
            Name = "Edit Mode",
            TooltipText = "Select the default layout you would like all your new characters to use.",
            Options = GetEditModeLayouts(),
            SavedVariable = "NCC_EditModeLayoutID",
        },
    },
    Utilities = {
        {
            Type = "BasicButton",
            Name = "",
            ButtonText = "Open Issue",
            ClickHandler = function()
                StaticPopupDialogs["HELPMEPLAY_OPEN_ISSUE"] = {
                    text = "Hey! Thanks for being willing to open an issue. You rock! |T648207:16|t",
                    button1 = CLOSE,
                    OnShow = function(self)
                        local function HidePopup(self) self:GetParent():Hide() end
                        self.editBox:SetScript("OnKeyUp", function(self, key)
                            if IsControlKeyDown() and key == "C" then HidePopup(self) end
                        end)
                        self.editBox:SetText("https://github.com/Saaappi/HelpMePlay/issues/new")
                        self.editBox:HighlightText()
                    end,
                    timeout = 0,
                    showAlert = false,
                    whileDead = false,
                    hideOnEscape = true,
                    hasEditBox = true,
                    enterClicksFirstButton = true,
                    preferredIndex = 3,
                }
                StaticPopup_Show("HELPMEPLAY_OPEN_ISSUE")
            end,
            TooltipText = "Click to get the Github issue page.",
            AddSearchTags = true,
        },
        {
            Type = "BasicButton",
            Name = "",
            ButtonText = "Talent Importer",
            ClickHandler = function(_, button)
                if button == "LeftButton" then
                    HideUIPanel(SettingsPanel)
                    addon.OpenTalentImporter()
                end
            end,
            TooltipText = "Click to open the Talent Importer utility.",
            AddSearchTags = true,
        },
        {
            Type = "BasicButton",
            Name = "",
            ButtonText = "Heirlooms",
            ClickHandler = function(_, button)
                if button == "LeftButton" then
                    HideUIPanel(SettingsPanel)
                    addon.OpenHeirloomSelector()
                end
            end,
            TooltipText = "Click to open the Heirloom selection utility.",
            AddSearchTags = true,
        },
        {
            Type = "BasicButton",
            Name = "",
            ButtonText = "Randomize Adventurer",
            ClickHandler = function(_, button)
                if button == "LeftButton" then
                    local raceID = LHMP:GetRandomRaceID()
                    if raceID then
                        local factionID = LHMP:GetRaceFactionByID(raceID)
                        local race = C_CreatureInfo.GetRaceInfo(raceID)
                        if race then
                            local classID = LHMP:GetRandomClassByRaceID(raceID)
                            if classID then
                                local class = C_CreatureInfo.GetClassInfo(classID)
                                local specName = LHMP:GetRandomSpecIDByClassID(classID)
                                if class then
                                    if factionID and factionID == 0 then
                                        HelpMePlay.Print(format("%s %s %s %s", CreateAtlasMarkup("bfa-landingbutton-horde-up", 16, 16), race.raceName, specName, class.className))
                                    elseif factionID and factionID == 1 then
                                        HelpMePlay.Print(format("%s %s %s %s", CreateAtlasMarkup("bfa-landingbutton-alliance-up", 16, 16), race.raceName, specName, class.className))
                                    end
                                end
                            end
                        end
                    end
                end
            end,
            TooltipText = "Don't know what to create next? Click to randomly generate a race, class, and specialization combination for your next character!",
            AddSearchTags = true,
        },
    }
}