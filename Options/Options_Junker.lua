local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_DIALOG = addonTable.L_DIALOG
local L_NOTES = addonTable.L_NOTES
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local numTabs = 4
local icon = ""

local junkerOptions = {
	name = L_GLOBALSTRINGS["Tabs.Junker"],
	handler = HelpMePlay,
	type = "group",
	args = {
		enable = {
			name = L_GLOBALSTRINGS["General.Toggle.Enable"],
			order = 0,
			desc = L_GLOBALSTRINGS["Junker.Toggle.EnableDesc"],
			type = "toggle",
			get = function(info) return HelpMePlayDB.JunkerEnabled end,
			set = function(info, val) HelpMePlayDB.JunkerEnabled = val end,
		},
		toggle_header = {
			name = L_GLOBALSTRINGS["Header.Toggles"],
			order = 1,
			type = "header",
		},
	},
}
addonTable.junkerOptions = junkerOptions