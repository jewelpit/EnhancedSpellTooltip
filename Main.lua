print("testing message")

GameTooltip:HookScript("OnTooltipSetSpell", function(self)
    local spell_name, spell_id = GameTooltip:GetSpell()
    print(GetSpellInfo(spell_id))
    local total_mana_cost = 0
    for _, v in ipairs(GetSpellPowerCost(spell_id)) do
        if v.name == "MANA" then
            total_mana_cost = total_mana_cost + v.cost
        end
    end
    print(GetSpellBonusDamage(4))
    print(GetSpellBonusHealing())
    local name, _, _, castTime, _, _ = GetSpellInfo(spell_id)
    GameTooltip:AddLine("|cffffffff")
    GameTooltip:AddLine(spell_name, 1, 1, 1)
    GameTooltip:AddLine("Spell ID: " .. spell_id, 1, 1, 1)

    -- This is the actual cast time, including talents and haste.
    GameTooltip:AddLine("Cast time: " .. (castTime / 1000.0) .. " sec", 1, 1, 1)
    GameTooltip:AddLine("Mana cost: " .. total_mana_cost, 1, 1, 1)
end)
