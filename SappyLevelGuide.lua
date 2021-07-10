--[[
	The purpose of the addon is to make MY questing route faster.
]]--

--[[ TODO
]]--

--[[
	These variables are provided to the addon by Blizzard.
		addonName	: This is self explanatory, but it's the name of the addon.
		t			: This is an empty table. This is how the addon can communicate between files or local functions, sort of like traditional classes.
]]--
local addonName, t = ...;

-- Variables
local e = CreateFrame("Frame");

-- Functions
local function GetActiveQuests()
	local activeQuests = C_GossipInfo.GetActiveQuests();
	if (next(activeQuests)) then
		for index, activeQuestsData in ipairs(activeQuests) do
			if (activeQuestsData["isComplete"]) then
				C_GossipInfo.SelectActiveQuest(index);
			end
		end
	end
end

local function GetAvailableQuests()
	local availableQuests = C_GossipInfo.GetAvailableQuests();
	if (next(availableQuests)) then -- The NPC has an available quest to pick up. Let's check our database for a match.
		for i, availableQuest in ipairs(availableQuests) do
			for _, questID in ipairs(t.quests) do
				if (availableQuest.questID == questID) then -- The quest is in the database. Let's pick it up!
					C_GossipInfo.SelectAvailableQuest(i);
				end
			end
		end
	end
end

local function GetGreetingQuests()
	local numAvailableQuests = GetNumAvailableQuests();
	if (numAvailableQuests > 0) then
		for i = 1, numAvailableQuests, 1 do
			SelectAvailableQuest(i);
		end
	else
		local numActiveQuests = GetNumActiveQuests();
		for i = 1, numActiveQuests, 1 do
			SelectActiveQuest(i);
		end
	end
end

local function GetQuestItemLink_Callback(index)
	local link = GetQuestItemLink("choice", index)
	if (link) then
		return link;
	else
		GetQuestItemLink_Callback(index);
	end
end

local function Max(tbl)
	local highestItemIndex = 0;
	local highestSellPrice = 0;
	for itemIndex, itemSellPrice in ipairs(tbl) do
		if (itemSellPrice > highestSellPrice) then
			highestItemIndex = itemIndex;
			highestSellPrice = itemSellPrice;
		end
	end
	return highestItemIndex;
end

e:RegisterEvent("CHAT_MSG_MONSTER_SAY");
e:RegisterEvent("GOSSIP_SHOW");
e:RegisterEvent("MODIFIER_STATE_CHANGED");
e:RegisterEvent("QUEST_COMPLETE");
e:RegisterEvent("QUEST_DATA_LOAD_RESULT");
e:RegisterEvent("QUEST_DETAIL");
e:RegisterEvent("QUEST_GREETING");
e:RegisterEvent("QUEST_PROGRESS");
e:SetScript("OnEvent", function(self, event, ...)
	if (event == "CHAT_MSG_MONSTER_SAY") then
		local msg, monster = ...
		if (monster == "Playful Trickster") then
			if (string.find(msg, "Not so much as a word of praise! Hmph!")) then
				DoEmote("praise", nil)
			elseif (string.find(msg, "The other spriggans were all cheering my name for days!")) then
				DoEmote("cheer", nil)
			elseif (string.find(msg, "Dance with me!")) then
				DoEmote("dance", nil)
			elseif (string.find(msg, "Introductions are an important part of first impressions!")) then
				DoEmote("bow", nil)
			elseif (string.find(msg, "some ask us permission and always thank us for our trouble")) then
				DoEmote("thanks", nil)
			elseif (string.find(msg, "How strong he must have been!")) then
				DoEmote("flex", nil)
			end
		end
	end
	if (event == "GOSSIP_SHOW") then
		if (IsShiftKeyDown() == false) then
			GetAvailableQuests();
			GetActiveQuests();
		end
	end
	if (event == "MODIFIER_STATE_CHANGED") then
		local key, isDown = ...;
		if (key == "LALT" and isDown) then
			if (QuestFrame:IsVisible()) then
				QuestFrameAcceptButton:Click();
			end
		end
	end
	if (event == "QUEST_COMPLETE") then
		local numQuestChoices = GetNumQuestChoices();
		if (numQuestChoices > 0) then
			local sellPrices = {};
			for i = 1, numQuestChoices, 1 do
				local _, _, quantity = GetQuestItemInfo("choice", i);
				local link = GetQuestItemLink("choice", i);
				if (link == nil) then
					link = GetQuestItemLink_Callback(i);
				end
				local _, _, _, _, _, _, _, _, _, _, sellPrice = GetItemInfo(link);
				sellPrices[i] = (quantity*sellPrice);
			end
			GetQuestReward(Max(sellPrices));
		else
			QuestFrameCompleteQuestButton:Click();
		end
	end
	if (event == "QUEST_DETAIL") then
		if (IsAltKeyDown()) then
			AcceptQuest();
		end
	end
	if (event == "QUEST_GREETING") then
		if (IsShiftKeyDown() == false) then
			GetGreetingQuests();
		end
	end
	if (event == "QUEST_PROGRESS") then
		QuestFrameCompleteButton:Click();
	end
end);