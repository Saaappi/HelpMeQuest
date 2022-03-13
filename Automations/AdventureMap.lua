local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_DIALOG = addonTable.L_DIALOG
local L_NOTES = addonTable.L_NOTES
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS

local function Get_RandomAdventureMapZone(faction)
	local attempts = 10
	local randomZone = ""
	for i=0, attempts do
		randomZone = addonTable.ADVENTURE_MAP_QUESTS_INDICES[faction][math.random(#addonTable.ADVENTURE_MAP_QUESTS_INDICES[faction])]
		if C_QuestLog.IsQuestFlaggedCompleted(addonTable.ADVENTURE_MAP_QUESTS[faction][randomZone]) == false then
			return randomZone
		end
		i = i+1
	end
end

e:RegisterEvent("ADVENTURE_MAP_OPEN")
e:SetScript("OnEvent", function(self, event, ...)
	if event == "ADVENTURE_MAP_OPEN" then
		local faction = UnitFactionGroup("player")
		local mapId = C_AdventureMap.GetMapID()
		if mapId == 1011 then -- Zandalar
			if HelpMePlayOptionsDB.BFAZoneSelection == L_GLOBALSTRINGS["Disabled"] or HelpMePlayOptionsDB.BFAZoneSelection == nil then return end
			-- This map ID is used by the Horde for leveling zone
			-- selection. It's also used by the Alliance for
			-- foothold selection.
			if faction == "Alliance" then
				if C_QuestLog.IsQuestFlaggedCompleted(51570) == false then
					C_AdventureMap.StartQuest(51570) -- Foothold: Zuldazar
				elseif C_QuestLog.IsQuestFlaggedCompleted(51571) == false then
					C_AdventureMap.StartQuest(51571) -- Foothold: Nazmir
				else
					C_AdventureMap.StartQuest(51572) -- Foothold: Vol'dun
				end
			else
				if HelpMePlayOptionsDB.BFAZoneSelection ~= L_GLOBALSTRINGS["Random"] then
					-- Horde Zone Selection
					if C_QuestLog.IsQuestFlaggedCompleted(addonTable.ADVENTURE_MAP_QUESTS[faction][HelpMePlayOptionsDB.BFAZoneSelection]) == false then
						C_AdventureMap.StartQuest(addonTable.ADVENTURE_MAP_QUESTS[faction][HelpMePlayOptionsDB.BFAZoneSelection])
					end
				else
					C_AdventureMap.StartQuest(addonTable.ADVENTURE_MAP_QUESTS[faction][Get_RandomAdventureMapZone(faction)])
				end
			end
		end
		if mapId == 1014 then -- Kul Tiras
			if HelpMePlayOptionsDB.BFAZoneSelection == L_GLOBALSTRINGS["Disabled"] or HelpMePlayOptionsDB.BFAZoneSelection == nil then return end
			-- This map ID is used by the Alliance for leveling zone
			-- selection. It's also used by the Horde for
			-- foothold selection.
			if faction == "Alliance" then
				if HelpMePlayOptionsDB.BFAZoneSelection ~= L_GLOBALSTRINGS["Random"] then
					-- Alliance Zone Selection
					if C_QuestLog.IsQuestFlaggedCompleted(addonTable.ADVENTURE_MAP_QUESTS[faction][HelpMePlayOptionsDB.BFAZoneSelection]) == false then
						C_AdventureMap.StartQuest(addonTable.ADVENTURE_MAP_QUESTS[faction][HelpMePlayOptionsDB.BFAZoneSelection])
					end
				else
					C_AdventureMap.StartQuest(addonTable.ADVENTURE_MAP_QUESTS[faction][Get_RandomAdventureMapZone(faction)])
				end
			else
				if C_QuestLog.IsQuestFlaggedCompleted(51801) == false then
					C_AdventureMap.StartQuest(51801) -- Foothold: Drustvar
				elseif C_QuestLog.IsQuestFlaggedCompleted(51800) == false then
					C_AdventureMap.StartQuest(51800) -- Foothold: Tiragarde Sound
				else
					C_AdventureMap.StartQuest(51802) -- Foothold: Stormsong Valley
				end
			end
		end
		if mapId == 1647 then -- Shadowlands
			if HelpMePlayOptionsDB.SLZoneSelection == L_GLOBALSTRINGS["Disabled"] or HelpMePlayOptionsDB.SLZoneSelection == nil then return end
			if HelpMePlayOptionsDB.SLZoneSelection ~= L_GLOBALSTRINGS["Random"] then
				if C_QuestLog.IsQuestFlaggedCompleted(addonTable.ADVENTURE_MAP_QUESTS["Shadowlands"][HelpMePlayOptionsDB.SLZoneSelection]) == false then
					C_AdventureMap.StartQuest(addonTable.ADVENTURE_MAP_QUESTS["Shadowlands"][HelpMePlayOptionsDB.SLZoneSelection])
				end
			else
				C_AdventureMap.StartQuest(addonTable.ADVENTURE_MAP_QUESTS["Shadowlands"][Get_RandomAdventureMapZone("Shadowlands")])
			end
		end
	end
end)