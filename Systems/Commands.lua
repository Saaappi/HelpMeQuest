local addonName, addonTable = ...
local e = CreateFrame("Frame")

local function Gossip(gossip)
	-- First, let's check if the gossip parameter is a number.
	if tonumber(gossip) then
		-- Cast gossip as a number and reassign it to the variable.
		gossip = tonumber(gossip)
	elseif gossip == nil then
		-- If a gossip index isn't provided, then set it to 0.
		gossip = 0
	else
		return
	end
	
	-- Get the GUID of the targeted NPC.
	local GUID = UnitGUID("target")
	local npcID = 0
	if GUID then
		-- If the GUID is valid, then split the GUID, get the NPC ID and cast it as a number.
		_, _, _, _, _, npcID = string.split("-", GUID); npcID = tonumber(npcID)
		
		-- Check if the gossip ID is 0. If it is, then wipe that NPC's gossip table.
		if gossip == 0 then
			if HelpMePlayPlayerDialogDB[npcID] then
				HelpMePlayPlayerDialogDB[npcID] = nil
			end
			return
		end
	end
	
	-- Get the available gossip options from the NPC.
	--
	-- Make sure gossips is valid before continuing.
	local gossips = C_GossipInfo.GetOptions()
	if (#gossips > 0) then
		-- If the NPC isn't in the dialog/confirm table, then add an empty table for it.
		if not HelpMePlayPlayerDialogDB[npcID] then
			HelpMePlayPlayerDialogDB[npcID] = {}
		end
		
		-- If the NPC table doesn't have the "g" table, or the gossip table, then create it.
		if not HelpMePlayPlayerDialogDB[npcID]["g"] then
			HelpMePlayPlayerDialogDB[npcID]["g"] = {}
		end
		
		-- First, count the number of gossips in the NPC's table. If 0, then it's a fresh table
		-- and we don't need to loop. Otherwise, loop.
		local numGossips = #HelpMePlayPlayerDialogDB[npcID]["g"]
		if numGossips > 0 then
			-- Check if the current gossip option is in the NPC's gossip table.
			for index, optionID in ipairs(HelpMePlayPlayerDialogDB[npcID]["g"]) do
				-- If it's in the table, then remove it. Otherwise, insert it into the table.
				if optionID == gossips[gossip].gossipOptionID then
					HelpMePlayPlayerDialogDB[npcID]["g"][index] = nil
				end
			end
		else
			table.insert(HelpMePlayPlayerDialogDB[npcID]["g"], gossips[gossip].gossipOptionID)
		end
	end
end

local function Confirm()
	-- Get the GUID of the targeted NPC.
	local GUID = UnitGUID("target")
	if GUID then
		-- If the GUID is valid, then split the GUID, get the NPC ID and cast it as a number.
		local _, _, _, _, _, npcID = string.split("-", GUID); npcID = tonumber(npcID)
		
		-- If the NPC isn't in the dialog/confirm table, then add an empty table for it.
		if not HelpMePlayPlayerDialogDB[npcID] then
			HelpMePlayPlayerDialogDB[npcID] = {}
		end
		
		-- If the NPC doesn't have a "g" table, then report that to the player.
		if not HelpMePlayPlayerDialogDB[npcID]["g"] then
			print(addonTable.CONSTANTS.COLORED_ADDON_NAME .. ": |cffFFD100" .. UnitName("target") .. "|r doesn't have a gossip entry. Please add a gossip entry (|cffFFD100/hmp gossip X|r) before attempting to automate confirmation.")
			return
		end
		
		-- If the NPC table doesn't have the "c" table, or the confirm table, then create it.
		--
		-- If they do have a "c" table, then remove it.
		if not HelpMePlayPlayerDialogDB[npcID]["c"] then
			HelpMePlayPlayerDialogDB[npcID]["c"] = true
		else
			if HelpMePlayPlayerDialogDB[npcID]["c"] then
				HelpMePlayPlayerDialogDB[npcID]["c"] = nil
			end
		end
	end
end

function HelpMePlay:SlashCommandHandler(cmd)
	local cmd, arg1, arg2 = string.split(" ", cmd)
	if not cmd or cmd == "" then
		Settings.OpenToCategory(addonName)
	elseif cmd == "gossip" and arg1 ~= nil then
		Gossip(arg1)
	elseif cmd == "confirm" then
		Confirm()
	elseif (cmd == "quest" or cmd == "q") and arg1 ~= nil then
		-- A shorthand way to check if a given quest has
		-- been completed by the current player.
		--
		-- The argument must be a number, else silently
		-- fail out.
		if tonumber(arg1) then
			self:Print(tostring(C_QuestLog.IsQuestFlaggedCompleted(arg1)))
		end
	elseif cmd == "ignore" and arg1 ~= nil then
		if arg1 == "npc" then
			local npcID = tonumber(arg2)
			if npcID then
				if HelpMePlayIgnoredCreaturesDB[npcID] == nil then
					HelpMePlayIgnoredCreaturesDB[npcID] = true
				else
					HelpMePlayIgnoredCreaturesDB[npcID] = nil
				end
			else
				if UnitIsPlayer("target") == false then
					local unitGUID = UnitGUID("target")
					if unitGUID then
						local _, _, _, _, _, npcID = strsplit("-", unitGUID); npcID = tonumber(npcID)
						if HelpMePlayIgnoredCreaturesDB[npcID] == nil then
							HelpMePlayIgnoredCreaturesDB[npcID] = true
						else
							HelpMePlayIgnoredCreaturesDB[npcID] = nil
						end
					end
				end
			end
		elseif arg1 == "quest" then
			local questId = tonumber(arg2)
			if questId then
				if HelpMePlayIgnoredQuestsDB[questId] == nil then
					HelpMePlayIgnoredQuestsDB[questId] = true
				else
					HelpMePlayIgnoredQuestsDB[questId] = nil
				end
			end
		end
	elseif cmd == "taxi" and arg1 ~= nil then
		if HelpMePlayDB.DevModeEnabled then
			-- The flight map frame must be visible.
			if not FlightMapFrame:IsVisible() then return end
			
			for _, taxiNodeData in ipairs(C_TaxiMap.GetAllTaxiNodes(GetTaxiMapID())) do
				local dest, zone = string.split(",", taxiNodeData.name)
				if string.find(string.lower(dest), string.lower(arg1)) then
					print(dest .. "," .. zone .. ": " .. taxiNodeData.nodeID)
				end
			end
		end
	elseif cmd == "talents" then
		if HelpMePlayDB.DevModeEnabled then
			-- Create a couple variables to hold the scroll
			-- frame and edit box.
			local scrollFrame
			local editBox
			
			-- If the scroll frame exists, then set the
			-- aforementioned variables to the existing
			-- frames and show them.
			if HMPTalentScrollFrame then
				scrollFrame = HMPTalentScrollFrame
				editBox = HMPTalentEditBox
				HMPTalentScrollFrame:Show()
				HMPTalentEditBox:Show()
				HMPTalentCloseButton:Show()
			else
				-- If the scroll frame and its children
				-- don't exist, then create them and setup
				-- their attributes.
				local button = CreateFrame("Button", "HMPTalentCloseButton", HMPTalentScrollFrame, "UIPanelButtonTemplate")
				local scrollFrame = CreateFrame("ScrollFrame", "HMPTalentScrollFrame", UIParent, "UIPanelScrollFrameTemplate")
				scrollFrame:SetSize(300,200)
				scrollFrame:SetPoint("CENTER")
				editBox = CreateFrame("EditBox", "HMPTalentEditBox", scrollFrame)
				editBox:SetMultiLine(true)
				editBox:SetAutoFocus(false)
				editBox:SetFontObject(ChatFontNormal)
				editBox:SetWidth(300)
				scrollFrame:SetScrollChild(editBox)
				button:SetSize(20, 12)
				button:SetText("X")
				button:SetPoint("BOTTOMLEFT", HMPTalentScrollFrame, "TOPRIGHT")
				button:SetScript("OnClick", function()
					HMPTalentScrollFrame:Hide()
					HMPTalentEditBox:Hide()
					HMPTalentCloseButton:Hide()
				end)
			end
			
			-- Iterate through the current specialization's
			-- talent nodes and insert them into the traits
			-- table.
			-- By default, these will be entered in numerical
			-- order by the node ID.
			local configID = C_ClassTalents.GetActiveConfigID()
			local nodes = C_Traits.GetTreeNodes(C_Traits.GetConfigInfo(configID).treeIDs[1])
			local text = ""
			local traits = {}
			for _, nodeID in ipairs(nodes) do
				local nodeInfo = C_Traits.GetNodeInfo(configID, nodeID)
				for i=1, #nodeInfo.entryIDs do
					local entryInfo = C_Traits.GetEntryInfo(configID, nodeInfo.entryIDs[i])
					local spellID = C_Traits.GetDefinitionInfo(entryInfo.definitionID).spellID
					
					if spellID then
						table.insert(traits, { ["name"] = (GetSpellInfo(spellID)), ["nodeID"] = nodeInfo.ID, ["entryID"] = nodeInfo.entryIDs[i] })
					end
				end
			end
			
			-- Sort the traits table alphabetically by trait name.
			table.sort(traits, function(a, b) return string.lower(a.name) < string.lower(b.name) end)
			
			-- Append all the traits to the text variable.
			for _, v in ipairs(traits) do
				text = text .. "\t\t{ -- " .. v.name .. "\n\t\t\t[\"n\"] = " .. v.nodeID .. ",\n\t\t\t[\"e\"] = " .. v.entryID .. ",\n\t\t},\n"
			end
			
			-- Add the concatenated traits variable to the edit box
			-- and show it.
			editBox:SetText(text)
		end
	end
end