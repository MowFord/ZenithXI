-----------------------------------
-- Pet Global Functions
-----------------------------------
require('scripts/globals/nyzul/pathos')
-----------------------------------
xi = xi or {}
xi.pet = xi.pet or {}

local avatarPetIDs = set
{
    xi.petId.CARBUNCLE,
    xi.petId.FENRIR,
    xi.petId.IFRIT,
    xi.petId.TITAN,
    xi.petId.LEVIATHAN,
    xi.petId.GARUDA,
    xi.petId.SHIVA,
    xi.petId.RAMUH,
    xi.petId.DIABOLOS,
    xi.petId.ALEXANDER,
    xi.petId.ODIN,
    xi.petId.ATOMOS,
    xi.petId.CAIT_SITH,
    xi.petId.SIREN,
}

local astralOnlySpellIDs = set
{
    xi.magic.spell.ODIN,
    xi.magic.spell.ALEXANDER,
}

---@param target CBaseEntity
---@param mob CBaseEntity
---@param skill CMobSkill
---@return number
xi.pet.onMobSkillCheck = function(target, mob, skill)
    -- block mobskill if mob doesn't have an assigned pet or pet is currently spawned
    -- TODO implement mobmods to determine if mob can call pet outside of combat
    --      or how many total pets the mob can call after respawning
    if mob:getPet() == nil or mob:hasPet() then
        return 1
    end

    return 0
end

---@param caster CBaseEntity
---@param target CBaseEntity
---@param spell CSpell
---@return number
xi.pet.onCastingCheck = function(caster, target, spell)
    local result = 0

    if caster:hasPet() then
        result = xi.msg.basic.ALREADY_HAS_A_PET
    elseif
        astralOnlySpellIDs[spell:getID()] and
        not caster:hasStatusEffect(xi.effect.ASTRAL_FLOW)
    then
        result = xi.msg.basic.MAGIC_MUST_ASTRAL_FLOW
    elseif not caster:canUseMisc(xi.zoneMisc.PET) then
        result = xi.msg.basic.CANT_BE_USED_IN_AREA
    elseif caster:getObjType() == xi.objType.PC then
        result = xi.summon.avatarMiniFightCheck(caster, spell:getID())
    else
        -- non-pc without an attached pet
        -- TODO implement mobmods to determine if mob can call pet outside of combat
        --      or how many total pets the mob can call after respawning
        if caster:getPet() == nil then
            result = 1
        end
    end

    return result
end

---@param caster CBaseEntity
---@param petID number?
---@param state CSpell|CMobSkill?
---@param target CBaseEntity?
---@return nil
xi.pet.spawnPet = function(caster, petID, state, target)
    local casterType = caster:getObjType()
    if casterType == xi.objType.PC then
        caster:spawnPlayerPet(petID)

        -- These should only be relevant for players
        if avatarPetIDs[petID] then
            local effect = caster:getStatusEffect(xi.effect.AVATARS_FAVOR)
            if effect then
                effect:setPower(1) -- resummon resets effect
                xi.avatarsFavor.applyAvatarsFavorAuraToPet(caster, effect)
                xi.avatarsFavor.applyAvatarsFavorDebuffsToPet(caster)
            end

            if petID == xi.petId.ALEXANDER then
                -- Use Perfect Defense 5 seconds after spawning.
                local pet = caster:getPet()
                if pet then
                    pet:timer(5000, function()
                        pet:usePetAbility(xi.jobAbility.PERFECT_DEFENSE, pet)
                    end)
                end
            elseif petID == xi.petId.ODIN then
                if target then
                    caster:petAttack(target)
                end
            end
        end
    elseif casterType == xi.objType.MOB then
        -- copy confrontation effect and potentially morph mob's pet based on avatar/elementals petID given
        caster:assignMobPetProperties(petID)

        -- TODO implement mobmods to decide what type of pet summon animation we do here. For the time being continue doing the default instant call
        -- mobs don't emit message when using call beast/wyvern, activate, or summoner spells
        if state then
            state:setMsg(xi.msg.basic.NONE)
        end

        -- TODO utilize xi.mob.callPets(caster, nil, params) where params are determined based on the mob mods mentioned above
        local pet = caster:getPet()
        if pet then
            local ownerPos = caster:getPos()
            ownerPos.rot = caster:getRotPos()
            local pos = NearLocation(ownerPos, 2.2, math.pi)
            pet:setSpawn(pos.x, pos.y, pos.z, ownerPos.rot)
            pet:spawn()
        end
    end

    -- Nyzul Isle has Pathos set randomly on floors and is recorded as bits in a localvar of the instance
    if caster:getZoneID() == xi.zone.NYZUL_ISLE then
        xi.nyzul.addPetSpawnPathos(caster)
    end
end

-- TODO should charmed entities lose their buffs when they become uncharmed?
xi.pet.applyFamiliarBuffs = function(owner, pet)
    if
        not owner or
        not pet or
        not pet:isAlive() or
        pet:getLocalVar('hasFamiliarBuffs') ~= 0
    then
        return
    end

    pet:setLocalVar('hasFamiliarBuffs', 1)

    local familiarBonus = owner:getMod(xi.mod.FAMILIAR_BONUS)
    if
        owner:isPC() and
        pet:isCharmed()
    then
        -- extends duration by 25m-30m
        local minSeconds = 25 * 60
        local maxSeconds = 30 * 60
        local bonusSeconds = familiarBonus * 60
        pet:extendCharm(minSeconds + bonusSeconds, maxSeconds + bonusSeconds)
    end

    if familiarBonus > 0 then
        pet:addMod(xi.mod.HASTE_ABILITY, familiarBonus * 100)
    end

    local familiarBoost = 10
    local familiarBoostPerc = familiarBoost / 100
    local addedHP = pet:getMaxHP() * familiarBoostPerc
    pet:setMaxHP(pet:getMaxHP() + addedHP) -- technically BASE_HP mod is added back to generate modhp, but close enough
    -- wakes up pets
    pet:addHP(addedHP)

    -- adds % bonuses to the following stats
    -- TODO are these the only stats boosted?
    pet:addMod(xi.mod.ATTP, familiarBoost)
    pet:addMod(xi.mod.RATTP, familiarBoost)
    pet:addMod(xi.mod.DEFP, familiarBoost)
    pet:addMod(xi.mod.ACC, pet:getMod(xi.mod.ACC) * familiarBoostPerc)
    pet:addMod(xi.mod.RACC, pet:getMod(xi.mod.RACC) * familiarBoostPerc)
    pet:addMod(xi.mod.EVA, pet:getMod(xi.mod.EVA) * familiarBoostPerc)

    -- TODO does familiar give some bonus resistance to crowd control? Is it only for mob pets?
    -- Lots of reports of mobs using Familiar and the pet having higher chance to resist bind/sleep/etc
end
