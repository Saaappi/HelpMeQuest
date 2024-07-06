local addonName, HelpMePlay = ...
local dynamicFlightTalentsButton = CreateFrame("Button")

local skyridingTalents = {
    { ["nodeID"] = 64066, ["entryID"] = 82387 }, 	-- Take to the Skies
    { ["nodeID"] = 81466, ["entryID"] = 102427 }, 	-- Redirection
    { ["nodeID"] = 64069, ["entryID"] = 82390 }, 	-- Dynamic Stretching
    { ["nodeID"] = 64068, ["entryID"] = 82389 }, 	-- Thrill Chaser
    { ["nodeID"] = 94579, ["entryID"] = 117167 }, 	-- Second Wind
    { ["nodeID"] = 64067, ["entryID"] = 82388 }, 	-- Ohn'ahra's Gusts
    { ["nodeID"] = 64065, ["entryID"] = 82385 },    -- Dragonrider's Compassion
    { ["nodeID"] = 92672, ["entryID"] = 114806 }, 	-- Aerial Halt
    { ["nodeID"] = 64064, ["entryID"] = 82384 }, 	-- Restorative Travels
    { ["nodeID"] = 92679, ["entryID"] = 114815 }, 	-- Ground Skimming
    { ["nodeID"] = 92671, ["entryID"] = 114805 }, 	-- Airborne Recovery
    { ["nodeID"] = 64063, ["entryID"] = 82383 }, 	-- Airborne Tumbling
    { ["nodeID"] = 92678, ["entryID"] = 114814 }, 	-- Land's Blessing
    { ["nodeID"] = 94578, ["entryID"] = 117165 }, 	-- Wind's Respite
    { ["nodeID"] = 64061, ["entryID"] = 82380 }, 	-- Dragonriding Learner
    { ["nodeID"] = 94577, ["entryID"] = 117164 }, 	-- Swift Skimming
    { ["nodeID"] = 64062, ["entryID"] = 82381 },    -- Dragonrider's Hunt
    { ["nodeID"] = 64059, ["entryID"] = 82378 }, 	-- Beyond Infinity
    { ["nodeID"] = 64060, ["entryID"] = 82379 }, 	-- Yearning for the Sky
    { ["nodeID"] = 64058, ["entryID"] = 82377 }, 	-- At Home Aloft
}

local function PurchaseTalents()
    local treeID = 672
    local configID = C_Traits.GetConfigIDByTreeID(treeID)

    C_Traits.ResetTree(configID, treeID)

    C_Timer.After(HelpMePlay.Constants["TIMER_DELAY"], function()
        for _, node in pairs(skyridingTalents) do
            local nodeInfo = C_Traits.GetNodeInfo(configID, node.nodeID)
            if #nodeInfo.entryIDs > 1 then
                C_Traits.SetSelection(configID, node.nodeID, node.entryID)
            else
                C_Traits.PurchaseRank(configID, node.nodeID)
            end
        end
        C_Traits.CommitConfig(configID)
    end)
end

EventRegistry:RegisterCallback("GenericTraitFrame.OnShow", function()
    if HelpMePlayDB["UseDynamicFlightButton"] == false then return end

	if GenericTraitFrame.Header.Title:GetText() == "Dragonriding" then
        dynamicFlightTalentsButton = HelpMePlay.CreateWidget("IconButton", {
            name = format("%sDynamicFlightTalentsButton", addonName),
            texture = 4728198,
            parent = GenericTraitFrame.Currency,
            anchor = "TOPRIGHT",
            relativeAnchor = "BOTTOMRIGHT",
            xOff = 0,
            yOff = -15,
            width = 24,
            height = 24,
            useFontString = false,
            fontStringText = ""
        })

        dynamicFlightTalentsButton:ClearAllPoints()
        dynamicFlightTalentsButton:SetPoint("TOPRIGHT", GenericTraitFrame.Currency, "BOTTOMRIGHT", 0, -15)

        dynamicFlightTalentsButton:SetScript("OnClick", PurchaseTalents)
        dynamicFlightTalentsButton:SetScript("OnEnter", function(self)
            HelpMePlay.Tooltip_OnEnter(self, "Skyriding", "Click to learn your Skyriding talents.")
        end)
        dynamicFlightTalentsButton:SetScript("OnLeave", HelpMePlay.Tooltip_OnLeave)
	end
end)

EventRegistry:RegisterCallback("GenericTraitFrame.OnHide", function()
    dynamicFlightTalentsButton:Hide()
end)