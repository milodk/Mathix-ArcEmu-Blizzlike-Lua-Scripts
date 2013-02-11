function PriestPenanceFix(event, plr, spellid)
	if (spellid == 47666) then
		local target = plr:GetSelection()
		local distance = plr:GetDistance(target)

		if target:IsFriendly() == true and distance <= 30 and target:IsPlayer() == true then
			local Health = target:GetHealth()
			local HealAmount = math.random(650, 756)
			target:SetHealth(Health+HealAmount)
			plr:RegisterEvent(PenanceHeal2, 1000, 1)
		elseif target:IsFriendly() == false and distance <= 30 then
			plr:DealDamage(target, 240, 47666)
			plr:RegisterEvent(PenanceDamage2, 1000, 1)
		end
	end
end

function PenanceDamage2(event, plr, spellid)
	plr:DealDamage(target, 240, 47666)
	plr:RegisterEvent(PenanceDamage3, 1000, 1)
end

function PenanceDamage3(event, plr, spellid)
	plr:DealDamage(target, 240, 47666)
end

function PenanceHeal2(event, plr, spellid)
	local HealAmount = math.random(650, 756)
	target:SetHealth(Health+HealAmount)
	plr:RegisterEvent(PenanceHeal3, 1000, 1)
end

function PenanceHeal3(event, plr, spellid)
	local HealAmount = math.random(650, 756)
	target:SetHealth(Health+HealAmount)
end


RegisterServerHook(10, "PriestPenanceFix")