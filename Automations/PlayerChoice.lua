local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_DIALOG = addonTable.L_DIALOG
local L_NOTES = addonTable.L_NOTES
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS

--[[
	Description:
		Player choices are in-game decisions the player makes to determine
		how they want to play the game, progress their character, etc.
		
		I add support for player choices as they appear. For example, selecting
		a covenant is a player choice.
		
		If the player choice frame is visible, then get the ID of whatever is
		offering the player choice. Player choices can be offered through NPCs,
		game objects, or other sources.
		
		Currently supported:
		- Shadowlands: Story Mode or Threads of Fate
		- Shadowlands: Covenant Selection
		- Warlords: Gorgrond Outpost Selection
		- Classic: Command Boards (Tanaan Jungle)
]]--
e:RegisterEvent("PLAYER_CHOICE_UPDATE")
e:SetScript("OnEvent", function(self, event, ...)
	if event == "PLAYER_CHOICE_UPDATE" then
		if HelpMePlayDB.Enabled == false or HelpMePlayDB.Enabled == nil then return false end
		if PlayerChoiceFrame:IsVisible() then
			local mapId = C_Map.GetBestMapForUnit("player")
			local choiceInfo = C_PlayerChoice.GetCurrentPlayerChoiceInfo()
			if choiceInfo then
				local _, _, _, _, _, id = string.split("-", choiceInfo.objectGUID); id = tonumber(id)
				if id then
					if id == addonTable.PLAYERCHOICE["Fatescribe Roh-Tahl"] then
						if HelpMePlayDB.ThreadsOfFateEnabled then
							SendPlayerChoiceResponse(choiceInfo.options[1].buttons[1].id)
							HideUIPanel(PlayerChoiceFrame)
						else
							SendPlayerChoiceResponse(choiceInfo.options[2].buttons[1].id)
							HideUIPanel(PlayerChoiceFrame)
						end
					elseif id == addonTable.PLAYERCHOICE["Shadowlands Covenant Map: Covenant Selection"] then
						if HelpMePlayDB.CovenantId == 1 then
							SendPlayerChoiceResponse(choiceInfo.options[1].buttons[1].id)
							HideUIPanel(PlayerChoiceFrame)
						elseif HelpMePlayDB.CovenantId == 2 then
							SendPlayerChoiceResponse(choiceInfo.options[2].buttons[1].id)
							HideUIPanel(PlayerChoiceFrame)
						elseif HelpMePlayDB.CovenantId == 3 then
							SendPlayerChoiceResponse(choiceInfo.options[3].buttons[1].id)
							HideUIPanel(PlayerChoiceFrame)
						elseif HelpMePlayDB.CovenantId == 4 then
							SendPlayerChoiceResponse(choiceInfo.options[4].buttons[1].id)
							HideUIPanel(PlayerChoiceFrame)
						end
					end
				else
					if addonTable.PLAYERCHOICE_MAPS[mapId] then
						for i = 1, 3 do
							if choiceInfo.options[i].header == addonTable.PLAYERCHOICE["Tanaan Jungle"] then
								SendPlayerChoiceResponse(choiceInfo.options[i].buttons[1].id)
								HideUIPanel(PlayerChoiceFrame)
								break
							end
						end
					end
				end
			end
		end
	end
end)