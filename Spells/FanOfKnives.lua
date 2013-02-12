-- Fan of Knives fix by Mathix of ac-web.org
function FanOfKnivesFix(event, plr, spellid)
	if (spellid == 51723) then
		Enemys = plr:GetInRangeEnemies()
		if plr:GetDistanceYards(Enemies) <= 8 then
			local damage = math.random(250,320)
			plr:DealDamage(Enemies, damage, 51723)
		end
	end

RegisterServerHook(10, "FanOfKnivesFix")