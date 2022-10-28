local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS

e:RegisterEvent("PLAYER_INTERACTION_MANAGER_FRAME_SHOW")
e:RegisterEvent("PLAYER_CHOICE_UPDATE")
e:SetScript("OnEvent", function(self, event, ...)
	-- Architect Table
	if event == "PLAYER_INTERACTION_MANAGER_FRAME_SHOW" then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.ArchitectTableEnabled == false or HelpMePlayDB.ArchitectTableEnabled == nil then return false end
		
		if type == 30 then -- Architect Table
			local garrisonLevel = C_Garrison.GetGarrisonInfo(2)
			if garrisonLevel == 1 then
				local plotsForBuilding = C_Garrison.GetPlotsForBuilding(26)
				if HelpMePlaySavesDB["isGarrisonBarracksPlaced"] == false or HelpMePlaySavesDB["isGarrisonBarracksPlaced"] == nil then
					for i = 1, #plotsForBuilding do
						local buildingId = C_Garrison.GetOwnedBuildingInfo(plotsForBuilding[i])
						if buildingId ~= nil then
							HelpMePlaySavesDB["isGarrisonBarracksPlaced"] = true
							return
						end
						C_Garrison.PlaceBuilding(plotsForBuilding[i], 26)
						PlaySound(SOUNDKIT.UI_GARRISON_ARCHITECT_TABLE_UPGRADE_START)
						HideUIPanel(GarrisonBuildingFrame)
						HelpMePlaySavesDB["isGarrisonBarracksPlaced"] = true
					end
				end
			end
		elseif type == 32 then -- Mission Table
			if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
			if HelpMePlayDB.MissionTableEnabled == false or HelpMePlayDB.MissionTableEnabled == nil then return false end
			
			C_Timer.After(0.5, function()
				GarrisonMissionTutorialFrame:Hide()
				local missions = C_Garrison.GetAvailableMissions(1)
				local followers = C_Garrison.GetFollowers(1)
				local faction = UnitFactionGroup("player")
				if faction == "Alliance" then
					for boardIndex, mission in pairs(missions) do
						if addonTable.GARRISON_MISSIONS[mission.missionID] then
							if mission.inProgress == false then
								C_Garrison.AddFollowerToMission(mission.missionID, followers[1].followerID)
								C_Garrison.StartMission(mission.missionID)
								C_Garrison.CloseMissionNPC()
							end
						end
					end
				else
					for boardIndex, mission in pairs(missions) do
						if addonTable.GARRISON_MISSIONS[mission.missionID] then
							if mission.inProgress == false then
								C_Garrison.AddFollowerToMission(mission.missionID, followers[1].followerID)
								C_Garrison.StartMission(mission.missionID)
								C_Garrison.CloseMissionNPC()
							end
						end
					end
				end
				HideUIPanel(GarrisonMissionFrame)
			end)
		end
	end
	
	-- Outposts
	if event == "PLAYER_CHOICE_UPDATE" then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if HelpMePlayDB.GarrisonOutpostsEnabled == false or HelpMePlayDB.GarrisonOutpostsEnabled == nil then return false end
		if PlayerChoiceFrame:IsVisible() then
			local mapId = C_Map.GetBestMapForUnit("player")
			local choiceInfo = C_PlayerChoice.GetCurrentPlayerChoiceInfo()
			if choiceInfo then
				local _, _, _, _, _, id = string.split("-", choiceInfo.objectGUID); id = tonumber(id)
				if id then
					if id == 74594 or id == 81119 then
						-- 74594: Durotan
						-- 81119: Drafting Table
						SendPlayerChoiceResponse(choiceInfo.options[2].buttons[1].id)
						HideUIPanel(PlayerChoiceFrame)
					end
				end
			end
		end
	end
end)