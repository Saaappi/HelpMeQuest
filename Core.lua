local addonName, HelpMePlay = ...
local eventFrame = CreateFrame("Frame")
local LHMP = LibStub("LibHelpMePlay")

function HelpMePlay.GetBestMapByMapID(uiMapID)
    local mapID = uiMapID or C_Map.GetBestMapForUnit("player")
    if mapID then
        local info = C_Map.GetMapInfo(mapID)
        if info and info.mapType == 3 then
            HelpMePlay.playerMapID = mapID
            HelpMePlay.playerMapName = C_Map.GetMapInfo(mapID).name
        elseif info and info.mapType > 3 then
            HelpMePlay.GetBestMapByMapID(info.parentMapID)
        end
    end
end

function HelpMePlay.Print(text)
    print(string.format("%s: %s", LHMP:ColorText("HEIRLOOM", addonName), text))
end

local function OnEvent(_, event, arg1, arg2)
	if event == "ADDON_LOADED" then
		if addonName == arg1 then
            HelpMePlay.Init()
            eventFrame:UnregisterEvent(event)
		end
	end
    if event == "PLAYER_LEVEL_CHANGED" then
        local newLevel = arg2
		if newLevel then
			HelpMePlay.playerLevel = newLevel
		end
    end
    if event == "PLAYER_LOGIN" then
        eventFrame:UnregisterEvent(event)

        HelpMePlay.playerClassName, HelpMePlay.playerClassFileName, HelpMePlay.playerClassID = UnitClass("player")
        HelpMePlay.playerClassColor = C_ClassColor.GetClassColor(HelpMePlay.playerClassFileName)
        HelpMePlay.playerLevel = UnitLevel("player")
        HelpMePlay.playerSpecID = PlayerUtil.GetCurrentSpecID()
        HelpMePlay.playerSpecName = select(2, GetSpecializationInfoByID(HelpMePlay.playerSpecID))
        HelpMePlay.playerGUID = UnitGUID("player")
        HelpMePlay.playerMapID = HelpMePlay.GetBestMapByMapID(C_Map.GetBestMapForUnit("player"))
        HelpMePlay.playerName = UnitName("player")

        local faction = LHMP:GetUnlocalizedUnitFaction("player")
        if faction == "Alliance" then
            HelpMePlay.playerFactionID = 1
        elseif faction == "Horde" then
            HelpMePlay.playerFactionID = 0
        elseif faction == "Neutral" then
            HelpMePlay.playerFactionID = -1
        end

        HelpMePlay.RefreshMountsByType("Ground")
        HelpMePlay.RefreshMountsByType("Flying")
        HelpMePlay.RefreshMountsByType("Dynamic")
        HelpMePlay.RefreshMountsByType("Aquatic")
        HelpMePlay.RefreshMountsByType("AQ")
        HelpMePlay.RefreshMountsByType("Vashjir")
        HelpMePlay.RefreshMountsByType("Unused")

        if HelpMePlay.playerMapID then
            HelpMePlay.playerMapName = C_Map.GetMapInfo(HelpMePlay.playerMapID).name
        end

        -- If the Deposit Keep Amount is greater than 1,000, then
        -- reset its value to 0.
        if HelpMePlayDB["DepositKeepAmount"] > 1000 then
            HelpMePlayDB["DepositKeepAmount"] = 0
        end
        if HelpMePlayDB["TrainerProtectionValue"] > 1000 then
            HelpMePlayDB["TrainerProtectionValue"] = 0
        end
    end
    if event == "PLAYER_SPECIALIZATION_CHANGED" then
        HelpMePlay.playerSpecID = PlayerUtil.GetCurrentSpecID()
		HelpMePlay.playerSpecName = select(2, GetSpecializationInfoByID(HelpMePlay.playerSpecID))
    end
    if event == "ZONE_CHANGED" or event == "ZONE_CHANGED_NEW_AREA" then
        HelpMePlay.GetBestMapByMapID(nil)
    end
end

eventFrame:RegisterEvent("ADDON_LOADED")
eventFrame:RegisterEvent("PLAYER_LEVEL_CHANGED")
eventFrame:RegisterEvent("PLAYER_LOGIN")
eventFrame:RegisterEvent("PLAYER_SPECIALIZATION_CHANGED")
eventFrame:RegisterEvent("ZONE_CHANGED")
eventFrame:RegisterEvent("ZONE_CHANGED_NEW_AREA")
eventFrame:SetScript("OnEvent", OnEvent)

SlashCmdList["HELPMEPLAY_SLASHCMD"] = function(cmd)
	if not cmd or cmd == "" then
        if not InCombatLockdown() then
            Settings.OpenToCategory(HelpMePlay.SettingsCategoryID)
        else
            HelpMePlay.Print(HelpMePlay.ErrorMessages["IN_COMBAT_LOCKDOWN"])
        end
    else
        HelpMePlay.Print(HelpMePlay.ErrorMessages["COMMAND_NOT_FOUND"])
	end
end
SLASH_HELPMEPLAY_SLASHCMD1 = "/hmp"
SLASH_HELPMEPLAY_SLASHCMD2 = "/helpmeplay"