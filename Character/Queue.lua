local addonName, addon = ...
local eventHandler = CreateFrame("Frame")
local queueButton

local QUEST_TO_DUNGEON = {
    [55992] = {texture = 236695, lfgDungeonID = 2043}
}

eventHandler:RegisterEvent("PLAYER_LOGIN")
eventHandler:RegisterEvent("QUEST_ACCEPTED")
eventHandler:SetScript("OnEvent", function(self, event, ...)
    if event == "PLAYER_LOGIN" then
        -- Create the button. We unregister the event at the end, so no need
        -- to do a nil check first.
        queueButton = CreateFrame("Button", addonName .. "CharacterQueueButton", UIParent, "ActionButtonTemplate")
        queueButton:RegisterForClicks("LeftButtonUp")

        -- Set the dungeon ID to 0 as a starting point.
        queueButton.lfgDungeonID = 0

        queueButton:SetScript("OnClick", function(self)
            LFG_JoinDungeon(LE_LFG_CATEGORY_LFD, self.lfgDungeonID, LFDDungeonList, LFDHiddenByCollapseList)
            self:Hide()
        end)
        queueButton:SetScript("OnEnter", function(self)
            GameTooltip:SetOwner(self, "ANCHOR_BOTTOMRIGHT")
            GameTooltip:SetText("Click to queue.")
            GameTooltip:Show()
        end)
        queueButton:SetScript("OnLeave", function()
            GameTooltip:Hide()
        end)

        queueButton:SetPoint("TOP", queueButton:GetParent(), "TOP", 0, -20)
        queueButton:Hide()
    end
    if event == "QUEST_ACCEPTED" then
        local questID = ...
        if questID then
            if QUEST_TO_DUNGEON[questID] then
                queueButton.lfgDungeonID = QUEST_TO_DUNGEON[questID].lfgDungeonID
                queueButton.icon:SetTexture(QUEST_TO_DUNGEON[questID].texture)
                queueButton:Show()
            end
        end
    end
end)