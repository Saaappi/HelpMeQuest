local addonName, HelpMePlay = ...
local eventFrame = CreateFrame("Frame")

function HelpMePlay.GetBestMapForUnit(uiMapID)
    local mapID = uiMapID or C_Map.GetBestMapForUnit("player")
    if mapID then
        local info = C_Map.GetMapInfo(mapID)
        if info and info.mapType == 3 then
            HelpMePlay.playerMapID = mapID
        elseif info and info.mapType > 3 then
            HelpMePlay.GetBestMapForUnit(info.parentMapID)
        end
    end
end

function HelpMePlay.Print(text)
    print(text)
end

local function OnEvent(_, event, arg1, arg2)
	if event == "ADDON_LOADED" then
		if addonName == arg1 then
            HelpMePlay.RegisterSettings()
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
        HelpMePlay.playerClassName, HelpMePlay.playerClassFileName, HelpMePlay.playerClassID = UnitClass("player")
        HelpMePlay.playerClassColor = C_ClassColor.GetClassColor(HelpMePlay.playerClassFileName)
        HelpMePlay.playerLevel = UnitLevel("player")
        HelpMePlay.playerSpecID = PlayerUtil.GetCurrentSpecID()
        HelpMePlay.playerSpecName = select(2, GetSpecializationInfo(HelpMePlay.playerSpecID))
        HelpMePlay.playerGUID = UnitGUID("player")
        HelpMePlay.playerMapID = HelpMePlay.GetBestMapForUnit(C_Map.GetBestMapForUnit("player"))

        local faction = UnitFactionGroup("player")
        if faction == "Alliance" then
            HelpMePlay.playerFactionID = 1
        elseif faction == "Horde" then
            HelpMePlay.playerFactionID = 0
        elseif faction == "Neutral" then
            HelpMePlay.playerFactionID = -1
        end
        eventFrame:UnregisterEvent(event)
    end
    if event == "PLAYER_SPECIALIZATION_CHANGED" then
        HelpMePlay.playerSpecID = PlayerUtil.GetCurrentSpecID()
		HelpMePlay.playerSpecName = select(2, GetSpecializationInfoByID(HelpMePlay.playerSpecID))
    end
    if event == "ZONE_CHANGED" or event == "ZONE_CHANGED_NEW_AREA" then
        HelpMePlay.GetBestMapForUnit(nil)
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
            Settings.OpenToCategory(HelpMePlay.Category:GetID())
        else
            HelpMePlay.Print(HelpMePlay.ErrorMessages["IN_COMBAT_LOCKDOWN"])
        end
    elseif cmd == "?" then
        HelpMePlay.Print(format("Name: %s\nAuthor: %s\nVersion: %s", addonName, C_AddOns.GetAddOnMetadata(addonName, "Author"), C_AddOns.GetAddOnMetadata(addonName, "Version")))
    else
        HelpMePlay.Print(HelpMePlay.ErrorMessages["COMMAND_NOT_FOUND"])
	end
end
SLASH_HELPMEPLAY_SLASHCMD1 = "/hmp"
SLASH_HELPMEPLAY_SLASHCMD2 = "/helpmeplay"