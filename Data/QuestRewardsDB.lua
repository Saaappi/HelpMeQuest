local addonName, addonTable = ...
local e = CreateFrame("Frame")
local L_DIALOG = addonTable.L_DIALOG
local L_NOTES = addonTable.L_NOTES
local L_GLOBALSTRINGS = addonTable.L_GLOBALSTRINGS
local QUESTREWARDS = {
	[45724] = "Champion's Purse",
}

addonTable.QUESTREWARDS = QUESTREWARDS