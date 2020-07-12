local function update_mana(percent, ...)
    for i = 1, select("#", ...) do
        local region = select(i, ...)
        if region and region:GetObjectType() == "FontString" then
            local left = region:GetText()
            if left and string.find(left, "^%d+ Mana$") then
                region:SetText(string.format("%s (%.2f%%)", left, percent))
            end
        end
    end
end

GameTooltip:HookScript("OnTooltipSetSpell", function(self)
    local spell_name, spell_id = GameTooltip:GetSpell()
    local total_mana_cost = 0
    for _, v in ipairs(GetSpellPowerCost(spell_id)) do
        if v.name == "MANA" then
            total_mana_cost = total_mana_cost + v.cost
        end
    end

    local total_mana_percent = total_mana_cost / UnitPowerMax("player") * 100
    update_mana(total_mana_percent, GameTooltip:GetRegions())
end)
