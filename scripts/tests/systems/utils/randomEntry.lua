describe('randomEntry', function()
    local tables =
    {
        int =
        {
            [100]    = {},
            [1000]   = {},
        },
        string =
        {
            [100]    = {},
            [1000]   = {},
        },
        mixed =
        {
            [100]    = {},
            [1000]   = {},
        },
    }

    it('initializes tables', function()
        for desiredCount, tab in pairs(tables['int']) do
            for i = 1, desiredCount do
                table.insert(tab, math.random(1, 1000))
            end
        end

        for desiredCount, tab in pairs(tables['string']) do
            for i = 1, desiredCount do
                tab[string.format('key%d', i)] = math.random(1, 1000)
            end
        end

        for desiredCount, tab in pairs(tables['mixed']) do
            for i = 1, desiredCount do
                if math.random(1, 100) < 50 then
                    tab[string.format('key%d', i)] = math.random(1, 1000)
                else
                    table.insert(tab, math.random(1, 1000))
                end
            end
        end
    end)

    for keyType, subTables in pairs(tables) do
        for size, table in pairs(subTables) do
            it(fmt('selects a random entry from table with {} keys of size {}', keyType, size), function()
                local result = utils.randomEntry(table)
                assert(
                    result ~= nil,
                    fmt('Random entry with {} keys of size {} is not nil', keyType, size)
                )
            end)
        end
    end
end)
