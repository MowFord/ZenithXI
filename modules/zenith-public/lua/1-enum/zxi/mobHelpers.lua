-----------------------------------
-- Various helpers to manipulate mobs
-----------------------------------
zxi = zxi or {}
zxi.mobHelpers = zxi.mobHelpers or {}

local m = Module:new('mobHelpers')

zxi.mobHelpers.getRespawnVarName = function(mob, mobId)
    if not mob then
        print('zxi.mobHelpers.getRespawnVarName got nil mob')

        return nil
    end

    local template = '[Respawn]{}_{}'
    if mobId then
        -- passing direct name and ids as params
        return fmt(template, mob, mobId)
    end

    return fmt(template, mob:getName(), mob:getID())
end

return m
