--[[
Script by Mathix of ac-web.org
Thanks to Runemaster of ac-web.org 
]]
function LifestealEnchantFix(effectIndex, spell)
	local procnumber = math.random(1,10)

	if procnumber = 1 then
		local plr = spell:GetCaster()
		local maxhealth = plr:GetHealth()
		plr:SetHealth(maxhealth+30)
	end
end

RegisterDummySpell(27104, "LifestealEnchantFix")