--[[Script by Domicroat of ac-web.org ]]

function LordMarrowgar_OnCombat (pUnit, Event)
pUnit:SendChatMessage(14, 0, "The Scourge will wash over this world as a swarm of death and destruction!")
pUnit:PlaySoundToSet(16941)
pUnit:RegisterEvent("LordMarrowgar_BoneStorm", 30000, 0)
pUnit:RegisterEvent("LordMarrowgar_BoneSpike", 14000, 0)
pUnit:RegisterEvent("LordMarrowgar_Coldflame", 3000, 0)
end
 
function LordMarrowgar_BoneSpike (pUnit, Event)
        pUnit:SendChatMessage(14, 0, "Bound by bone!")
        pUnit:PlaySoundToSet(16947)
        pUnit:FullCastSpellOnTarget(69057, pUnit:GetRandomPlayer(0))

 end

function LordMarrowgar_Coldflame (pUnit, Event)
pUnit:CastSpellOnTarget (69147, pUnit:GetRandomPlayer(0))
 end
 
function LordMarrowgar_BoneStorm (pUnit, Event)
pUnit:RemoveEvents()
pUnit:Root()
pUnit:FullCastSpell(69076)
pUnit:SendChatMessage(14, 0, "BONE STORM!")
pUnit:SendChatMessage(42, 0, "BONE STORM!")
pUnit:PlaySoundToSet(16946)
pUnit:RegisterEvent("BoneStorm_Move", 15000, 0)
pUnit:RegisterEvent("BoneStorm_Stop", 34000, 1)
 end
 
function BoneStorm_Move (pUnit, Event)
        local plr = pUnit:GetRandomPlayer(0)
        pUnit:Unroot()
        if (plr ~= nil) then
        local x = plr:GetX()
        local y = plr:GetY()
        local z = plr:GetZ()
        pUnit:ModifyRunSpeed(18)
        pUnit:MoveTo(x, y, z)
        pUnit:RegisterEvent("BoneStorm_Root", 4000, 0)
        end
end
 
function BoneStorm_Root (pUnit, Event)
pUnit:Root()
end
 
function BoneStorm_Stop (pUnit, Event)
pUnit:RemoveEvents()
pUnit:Unroot()
pUnit:RemoveAura(69076)
pUnit:ClearThreatList()
pUnit:RegisterEvent("LordMarrowgar_OnCombat", 1, 1)
end
 
function LordMarrowgar_OnKillPlr (pUnit, Event)
local chance = math.random(1, 2)
        if (chance == 1) then
        pUnit:SendChatMessage(14, 0, "More bones for the offering!")
        pUnit:PlaySoundToSet(16942)
        else
        pUnit:PlaySoundToSet(16943)
        pUnit:SendChatMessage(14, 0, "Languish in damnation!")
        end
 end
 
function LordMarrowgar_OnDeath (pUnit, Event)
pUnit:RemoveEvents()
pUnit:PlaySoundToSet(16944)
pUnit:SendChatMessage(12, 0, "I see... only darkness...")
end
 
function LordMarrowgar_OnLeaveCombat (pUnit, Event)
pUnit:RemoveEvents()
end
 
RegisterUnitEvent(36612, 1, "LordMarrowgar_OnCombat")
RegisterUnitEvent(36612, 2, "LordMarrowgar_OnLeaveCombat")
RegisterUnitEvent(36612, 3, "LordMarrowgar_OnKillPlr")
RegisterUnitEvent(36612, 4, "LordMarrowgar_OnDeath")