-----------------------------------
--  Area: RuAun Gardens
--    NM: Despot
-- Notes: Spawns exactly where the correct placeholder was defeated and claimed to the person who defeated it.
-----------------------------------
local ID = zones[xi.zone.RUAUN_GARDENS]
-----------------------------------
---@type TMobEntity
local entity = {}

entity.spawnPoints =
{
    { x = -0.100, y = -42.000, z = -291.000 }
}

entity.phList =
{
    [ID.mob.DESPOT - 16] = ID.mob.DESPOT,
    [ID.mob.DESPOT - 15] = ID.mob.DESPOT,
    [ID.mob.DESPOT - 14] = ID.mob.DESPOT,
    [ID.mob.DESPOT - 13] = ID.mob.DESPOT,
    [ID.mob.DESPOT - 12] = ID.mob.DESPOT,
    [ID.mob.DESPOT - 11] = ID.mob.DESPOT,
    [ID.mob.DESPOT - 10] = ID.mob.DESPOT,
    [ID.mob.DESPOT - 9 ] = ID.mob.DESPOT,
    [ID.mob.DESPOT - 8 ] = ID.mob.DESPOT,
    [ID.mob.DESPOT - 7 ] = ID.mob.DESPOT,
    [ID.mob.DESPOT - 6 ] = ID.mob.DESPOT,
    [ID.mob.DESPOT - 5 ] = ID.mob.DESPOT,
    [ID.mob.DESPOT - 4 ] = ID.mob.DESPOT,
    [ID.mob.DESPOT - 3 ] = ID.mob.DESPOT,
    [ID.mob.DESPOT - 2 ] = ID.mob.DESPOT,
    [ID.mob.DESPOT - 1 ] = ID.mob.DESPOT,
}

entity.onMobInitialize = function(mob)
    mob:setMobMod(xi.mobMod.IDLE_DESPAWN, 300)
    mob:setMobMod(xi.mobMod.GIL_MIN, 18000)
    mob:setMobMod(xi.mobMod.GIL_MAX, 18000)
    mob:setMobMod(xi.mobMod.MUG_GIL, 3250)
    mob:addImmunity(xi.immunity.DARK_SLEEP)
    mob:addImmunity(xi.immunity.ELEGY)
    mob:addImmunity(xi.immunity.LIGHT_SLEEP)
    mob:addImmunity(xi.immunity.SLOW)
    mob:addImmunity(xi.immunity.PETRIFY)
end

entity.onMobPreSpawn = function(mob)
    -- localvar is set in xi.mob.phOnDespawn when PH primes Despot
    local phId = mob:getLocalVar('spawnedFromPhId')
    local ph = phId > 0 and GetMobByID(phId) or nil
    -- localvar is set in a Groundskeeper "TAKE_DAMAGE" listener to store the real final attacker of the PH (if it's a PC)
    local killerId = ph and ph:getLocalVar('killer') or 0
    -- Ignores non-PC killers, also the killer must meet some additional conditions on spawn
    if killerId ~= 0 then
        mob:addListener('SPAWN', 'SPAWN_PH_KILLER', function(mobArg)
            local killer = GetPlayerByID(killerId)
            -- "If that person is fighting something else at the time of spawn, it will spawn unclaimed."
            if
                killer and
                not killer:isEngaged() and
                killer:checkDistance(mobArg) <= 50
            then
                mobArg:updateClaim(killer)
            end

            mobArg:removeListener('SPAWN_PH_KILLER')
        end)
    end

    mob:addListener('WEAPONSKILL_STATE_EXIT', 'DESPOT_MOBSKILL', function(mobArg, skillID)
        -- Despot rapidly uses several Panzerfaust in a row
        local counter = mob:getLocalVar('panzerfaustCounter')
        local maxCount = mob:getLocalVar('panzerfaustMax')
        mob:setLocalVar('panzerfaustCounter', counter + 1)

        -- Initialize on first use
        if maxCount == 0 then
            maxCount = math.random(2, 5)
            mob:setAutoAttackEnabled(false)
            mob:setLocalVar('panzerfaustMax', maxCount)
        end

        -- Reset for next sequence
        if counter >= maxCount then
            mob:setAutoAttackEnabled(true)
            mob:setLocalVar('panzerfaustCounter', 0)
            mob:setLocalVar('panzerfaustMax', 0)
        end
    end)
end

entity.onMobFight = function(mob, target)
    local counter = mob:getLocalVar('panzerfaustCounter')
    local maxCount = mob:getLocalVar('panzerfaustMax')

    if
        counter > 0 and
        counter <= maxCount and
        not xi.combat.behavior.isEntityBusy(mob)
    then
        mob:useMobAbility(xi.mobSkill.PANZERFAUST, nil, 0)
    end
end

entity.onMobWeaponSkill = function(target, mob, skill)
    skill:setAnimationTime(0)
end

entity.onMobDeath = function(mob, player, optParams)
end

entity.onMobDespawn = function(mob)
end

return entity
