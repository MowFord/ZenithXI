-----------------------------------
-- Area: RuAun Gardens
--  Mob: Groundskeeper
-- Note: Place holder Despot
-----------------------------------
local ID = zones[xi.zone.RUAUN_GARDENS]
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobSpawn = function(mob)
    mob:addListener('TAKE_DAMAGE', 'GET_TRUE_KILLER', function(mobArg, amount, attacker)
        -- update the localvar for 'killer' only if the killer is a PC, otherwise clear it
        -- this is for Despot to only automatically aggro players on spawn (onMobDeath passes the killer as the PC, NOT the pet)
        if
            attacker and
            attacker:getObjType() == xi.objType.PC and
            amount >= mobArg:getHP()
        then
            mobArg:setLocalVar('killer', attacker:getID())
        else
            mobArg:setLocalVar('killer', 0)
        end
    end)
end

entity.onMobDeath = function(mob, player, optParams)
    xi.regime.checkRegime(player, mob, 143, 2, xi.regime.type.FIELDS)
    xi.regime.checkRegime(player, mob, 144, 1, xi.regime.type.FIELDS)
end

entity.onMobDespawn = function(mob)
    local pos = mob:getPos()
    local params =
    {
        immediate = true,
        spawnPoints = {
            { x = pos.x, y = pos.y, z = pos.z },
        },
    }

    xi.mob.phOnDespawn(mob, ID.mob.DESPOT, 5, 7200, params)-- 2 hours
end

return entity
