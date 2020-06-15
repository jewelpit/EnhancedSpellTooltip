print("testing message")

GameTooltip:HookScript("OnTooltipSetSpell", function(self)
    local spell_name, spell_id = GameTooltip:GetSpell()
    GameTooltip:AddLine("|cffffffff")
    GameTooltip:AddLine(spell_name, 1, 1, 1)
    GameTooltip:AddLine("Spell ID: " .. spell_id, 1, 1, 1)
end)
