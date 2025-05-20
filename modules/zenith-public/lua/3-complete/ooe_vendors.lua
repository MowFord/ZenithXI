--------------------------------------------------------------
-- Out of Era vendors and other shop overrides
-- Does not restore Era functionality but customizes offerings
-- Public module for ZenitXI
-- Items with an * have had their default prices changed
--------------------------------------------------------------
local m = Module:new('ooe_vendors')

-----------------------------
-- Scroll Vendor Overrides --
-----------------------------

-----------------------------------
-- Restores Taza as a scroll vendor
-- Area: Lower Jeuno
-----------------------------------
xi.module.ensureTable("xi.zones.Lower_Jeuno.npcs.Taza")

m:addOverride('xi.zones.Lower_Jeuno.npcs.Taza.onTrigger', function(player, npc)
    local stock = {
        { xi.item.SCROLL_OF_SLEEP_II,      18720 },
        { xi.item.SCROLL_OF_SLEEPGA,       11200 },
        { xi.item.SCROLL_OF_STONE_III,     19932 },
        { xi.item.SCROLL_OF_WATER_III,     22682 },
        { xi.item.SCROLL_OF_AERO_III,      27744 },
        { xi.item.SCROLL_OF_FIRE_III,      33306 },
        { xi.item.SCROLL_OF_BLIZZARD_III,  39368 },
        { xi.item.SCROLL_OF_THUNDER_III,   45930 },
        { xi.item.SCROLL_OF_PROTECTRA_V,  119240 },
        { xi.item.SCROLL_OF_SHELLRA_V,    124540 },
        { xi.item.SCROLL_OF_DIA_III,      139135 },
        { xi.item.SCROLL_OF_SLOW_II,      139135 },
        { xi.item.SCROLL_OF_PARALYZE_II,  139135 },
        { xi.item.SCROLL_OF_PHALANX_II,   139135 },
        { xi.item.SCROLL_OF_QUAKE_II,     119180 },
        { xi.item.SCROLL_OF_FLOOD_II,     119180 },
        { xi.item.SCROLL_OF_TORNADO_II,   119180 },
        { xi.item.SCROLL_OF_FLARE_II,     119180 },
        { xi.item.SCROLL_OF_FREEZE_II,    119180 },
        { xi.item.SCROLL_OF_BURST_II,     119180 },
        { xi.item.SCROLL_OF_BIO_III,      139125 },
        { xi.item.SCROLL_OF_BLIND_II,     139125 },
    }

    player:showText(npc, zones[player:getZoneID()].text.WAAG_DEEG_SHOP_DIALOG)
    xi.shop.general(player, stock)
end)

---------------------
-- Stock overrides --
---------------------
m:addOverride('xi.zones.Bastok_Markets.npcs.Hortense.onTrigger', function(player, npc)
    local stock =
    {
        { xi.item.SCROLL_OF_FOE_REQUIEM,         74, 3, },
        { xi.item.SCROLL_OF_FOE_REQUIEM_II,     509, 3, },
        { xi.item.SCROLL_OF_FOE_REQUIEM_III,   4576, 3, },
        { xi.item.SCROLL_OF_FOE_REQUIEM_IV,    7987, 3, },
        { xi.item.SCROLL_OF_ARMYS_PAEON,         43, 3, },
        { xi.item.SCROLL_OF_ARMYS_PAEON_II,     371, 3, },
        { xi.item.SCROLL_OF_ARMYS_PAEON_III,   3744, 3, },
        { xi.item.SCROLL_OF_ARMYS_PAEON_IV,    6864, 3, },
        { xi.item.SCROLL_OF_VALOR_MINUET,        24, 3, },
        { xi.item.SCROLL_OF_VALOR_MINUET_II,   1272, 3, },
        { xi.item.SCROLL_OF_VALOR_MINUET_III,  6406, 3, },
    }

    player:showText(npc, zones[player:getZoneID()].text.HORTENSE_SHOP_DIALOG)
    xi.shop.general(player, stock)
end)

m:addOverride('xi.zones.Port_Bastok.npcs.Valeriano.onTrigger', function(player, npc)
    local stock =
    {
        { xi.item.GINGER_COOKIE,                  12 },
        { xi.item.FLUTE,                          49 },
        { xi.item.PICCOLO,                      1144 },
        { xi.item.SCROLL_OF_SCOPS_OPERETTA,      677 },
        { xi.item.SCROLL_OF_PUPPETS_OPERETTA,  19552 },
        { xi.item.SCROLL_OF_FOWL_AUBADE,        3369 },
        { xi.item.SCROLL_OF_ADVANCING_MARCH,    2379 },
        { xi.item.SCROLL_OF_GODDESSS_HYMNUS,  104000 },
    }

    player:showText(npc, zones[player:getZoneID()].text.VALERIANO_SHOP_DIALOG)
    xi.shop.general(player, stock, xi.fameArea.BASTOK)
end)

m:addOverride('xi.zones.Southern_San_dOria.npcs.Valeriano.onTrigger', function(player, npc)
    local stock =
    {
        { xi.item.GINGER_COOKIE,                  12 },
        { xi.item.FLUTE,                          49 },
        { xi.item.PICCOLO,                      1144 },
        { xi.item.SCROLL_OF_SCOPS_OPERETTA,      677 },
        { xi.item.SCROLL_OF_PUPPETS_OPERETTA,  19552 },
        { xi.item.SCROLL_OF_FOWL_AUBADE,        3369 },
        { xi.item.SCROLL_OF_ADVANCING_MARCH,    2379 },
        { xi.item.SCROLL_OF_GODDESSS_HYMNUS,  104000 },
    }

    player:showText(npc, zones[player:getZoneID()].text.VALERIANO_SHOP_DIALOG)
    xi.shop.general(player, stock, xi.fameArea.SANDORIA)
end)

m:addOverride('xi.zones.Windurst_Woods.npcs.Valeriano.onTrigger', function(player, npc)
    local stock =
    {
        { xi.item.GINGER_COOKIE,                  12 },
        { xi.item.FLUTE,                          49 },
        { xi.item.PICCOLO,                      1144 },
        { xi.item.SCROLL_OF_SCOPS_OPERETTA,      677 },
        { xi.item.SCROLL_OF_PUPPETS_OPERETTA,  19552 },
        { xi.item.SCROLL_OF_FOWL_AUBADE,        3369 },
        { xi.item.SCROLL_OF_ADVANCING_MARCH,    2379 },
        { xi.item.SCROLL_OF_GODDESSS_HYMNUS,  104000 },
    }

    player:showText(npc, zones[player:getZoneID()].text.VALERIANO_SHOP_DIALOG)
    xi.shop.general(player, stock, xi.fameArea.WINDURST)
end)

m:addOverride('xi.zones.Lower_Jeuno.npcs.Susu.onTrigger', function(player, npc)
    local stock =
    {
        { xi.item.SCROLL_OF_BARSLEEP,       244 },
        { xi.item.SCROLL_OF_BARPOISON,      400 },
        { xi.item.SCROLL_OF_BARPARALYZE,    780 },
        { xi.item.SCROLL_OF_BARBLIND,      2030 },
        { xi.item.SCROLL_OF_BARSILENCE,    4608 },
        { xi.item.SCROLL_OF_BARVIRUS,      9600 },
        { xi.item.SCROLL_OF_BARPETRIFY,   15120 },
        { xi.item.SCROLL_OF_BARSLEEPRA,     244 },
        { xi.item.SCROLL_OF_BARPOISONRA,    400 },
        { xi.item.SCROLL_OF_BARPALARYZRA,   780 },
        { xi.item.SCROLL_OF_BARBLINDRA,    2030 },
        { xi.item.SCROLL_OF_BARSILENCERA,  4608 },
        { xi.item.SCROLL_OF_BARVIRA,       9600 },
        { xi.item.SCROLL_OF_BARPETRA,     15120 },
        { xi.item.SCROLL_OF_SILENA,        2330 },
        { xi.item.SCROLL_OF_CURSNA,        8586 },
        { xi.item.SCROLL_OF_VIRUNA,       13300 },
        { xi.item.SCROLL_OF_STONA,        19200 },
        { xi.item.SCROLL_OF_BANISHGA_II,  20000 },
        { xi.item.SCROLL_OF_HOLY,         35000 },
    }

    player:showText(npc, zones[player:getZoneID()].text.WAAG_DEEG_SHOP_DIALOG)
    xi.shop.general(player, stock)
end)

m:addOverride('xi.zones.Lower_Jeuno.npcs.Hasim.onTrigger', function(player, npc)
    local stock =
    {
        { xi.item.SCROLL_OF_BARSTONE,         156 },
        { xi.item.SCROLL_OF_BARWATER,         360 },
        { xi.item.SCROLL_OF_BARAERO,          930 },
        { xi.item.SCROLL_OF_BARFIRE,         1760 },
        { xi.item.SCROLL_OF_BARBLIZZARD,     3624 },
        { xi.item.SCROLL_OF_BARTHUNDER,      5754 },
        { xi.item.SCROLL_OF_BARSTONRA,        156 },
        { xi.item.SCROLL_OF_BARWATERA,        360 },
        { xi.item.SCROLL_OF_BARAERA,          930 },
        { xi.item.SCROLL_OF_BARFIRA,         1760 },
        { xi.item.SCROLL_OF_BARBLIZZARA,     3624 },
        { xi.item.SCROLL_OF_BARTHUNDRA,      5754 },
        { xi.item.SCROLL_OF_CURE_IV,        23400 },
        { xi.item.SCROLL_OF_CURAGA_II,      11200 },
        { xi.item.SCROLL_OF_CURAGA_III,     19932 },
        { xi.item.SCROLL_OF_PROTECT_III,    32000 },
        { xi.item.SCROLL_OF_PROTECTRA_II,    7074 },
        { xi.item.SCROLL_OF_PROTECTRA_III,  19200 },
        { xi.item.SCROLL_OF_SHELL_III,      26244 },
        { xi.item.SCROLL_OF_SHELLRA,         1760 },
        { xi.item.SCROLL_OF_SHELLRA_II,     14080 },
        { xi.item.SCROLL_OF_SHELLRA_III,    26244 },
-- { xi.item.SCROLL_OF_INUNDATION,     73500 },
        { xi.item.SCROLL_OF_ADDLE,         130378 },
    }

    player:showText(npc, zones[player:getZoneID()].text.WAAG_DEEG_SHOP_DIALOG)
    xi.shop.general(player, stock)
end)

m:addOverride('xi.zones.Lower_Jeuno.npcs.Creepstix.onTrigger', function(player, npc)
    local stock =
    {
        { xi.item.SCROLL_OF_GOBLIN_GAVOTTE,   8160 },
        { xi.item.SCROLL_OF_PROTECTRA_II  ,   7074 },
        { xi.item.SCROLL_OF_SHELLRA,          1760 },
    }

    player:showText(npc, zones[player:getZoneID()].text.JUNK_SHOP_DIALOG)
    xi.shop.general(player, stock)
end)

m:addOverride('xi.zones.Lower_Jeuno.npcs.Yoskolo.onTrigger', function(player, npc)
    local stock =
    {
        { xi.item.FLASK_OF_DISTILLED_WATER,       12 },
        { xi.item.BOTTLE_OF_ORANGE_JUICE,        200 },
        { xi.item.BOTTLE_OF_APPLE_JUICE,         300 },
        { xi.item.BOTTLE_OF_MELON_JUICE,        1100 },
        { xi.item.BOTTLE_OF_GRAPE_JUICE,         930 },
        { xi.item.BOTTLE_OF_PINEAPPLE_JUICE,     400 },
        { xi.item.SERVING_OF_ICECAP_ROLANBERRY, 5544 },
        { xi.item.SCROLL_OF_FIRE_CAROL,         6380 },
        { xi.item.SCROLL_OF_ICE_CAROL,          7440 },
        { xi.item.SCROLL_OF_WIND_CAROL,         5940 },
        { xi.item.SCROLL_OF_EARTH_CAROL,        4600 },
        { xi.item.SCROLL_OF_LIGHTNING_CAROL,    7920 },
        { xi.item.SCROLL_OF_WATER_CAROL,        5000 },
        { xi.item.SCROLL_OF_LIGHT_CAROL,        4200 },
        { xi.item.SCROLL_OF_DARK_CAROL,         8400 },
-- { xi.item.SCROLL_OF_SENTINELS_SCHERZO, 60000 },
    }

    player:showText(npc, zones[player:getZoneID()].text.YOSKOLO_SHOP_DIALOG)
    xi.shop.general(player, stock)
end)

m:addOverride('xi.zones.Lower_Jeuno.npcs.Amalasanda.onTrigger', function(player, npc)
    local stock =
    {
        { xi.item.BAMBOO_STICK,             151 },
        { xi.item.PINCH_OF_BLACK_PEPPER,    267 },
        { xi.item.SQUARE_OF_SILK_CLOTH,   35070 }, -- *
        { xi.item.KOMA,                     231 },
        { xi.item.LUMP_OF_TAMA_HAGANE,    12000 }, -- *
        { xi.item.POT_OF_URUSHI,          77206 },
        { xi.item.BOX_OF_STICKY_RICE,       331 },
        { xi.item.ONZ_OF_CURRY_POWDER,     1039 },
        { xi.item.JAR_OF_GROUND_WASABI,    2724 },
        { xi.item.BOTTLE_OF_RICE_VINEGAR,   210 },
        { xi.item.BUNDLE_OF_SHIRATAKI,      516 },
        { xi.item.BAG_OF_BUCKWHEAT_FLOUR,  5250 },
        { xi.item.SCROLL_OF_KATON_ICHI,    2447 },
        { xi.item.SCROLL_OF_HYOTON_ICHI,   2447 },
        { xi.item.SCROLL_OF_HUTON_ICHI,    2447 },
        { xi.item.SCROLL_OF_DOTON_ICHI,    2447 },
        { xi.item.SCROLL_OF_RAITON_ICHI,   2447 },
        { xi.item.SCROLL_OF_SUITON_ICHI,   2447 },
    }

    player:showText(npc, zones[player:getZoneID()].text.AMALASANDA_SHOP_DIALOG)
    xi.shop.general(player, stock)
end)

m:addOverride('xi.zones.Selbina.npcs.Quelpia.onTrigger', function(player, npc)
    local stock =
    {
        { xi.item.SCROLL_OF_CURE_II,      676 },
        { xi.item.SCROLL_OF_CURE_III,    3768 },
        { xi.item.SCROLL_OF_CURAGA_II,  11648 },
        { xi.item.SCROLL_OF_RAISE,       5984 },
        { xi.item.SCROLL_OF_HOLY,       36400 },
        { xi.item.SCROLL_OF_DIA_II,     11648 },
        { xi.item.SCROLL_OF_BANISH_II,   9360 },
        { xi.item.SCROLL_OF_PROTECT_II,  7356 },
        { xi.item.SCROLL_OF_SHELL_II,   18304 },
        { xi.item.SCROLL_OF_HASTE,      20800 },
        { xi.item.SCROLL_OF_ENFIRE,      5366 },
        { xi.item.SCROLL_OF_ENBLIZZARD,  4261 },
        { xi.item.SCROLL_OF_ENAERO,      2600 },
        { xi.item.SCROLL_OF_ENSTONE,     2111 },
        { xi.item.SCROLL_OF_ENTHUNDER,   1575 },
        { xi.item.SCROLL_OF_ENWATER,     7356 },
        { xi.item.SCROLL_OF_FLURRY,     34320 },
    }

    player:showText(npc, zones[player:getZoneID()].text.QUELPIA_SHOP_DIALOG)
    xi.shop.general(player, stock)
end)

m:addOverride('xi.zones.Selbina.npcs.Dohdjuma.onTrigger', function(player, npc)
    local stock =
    {
        { xi.item.BAG_OF_RYE_FLOUR,            41 },
        { xi.item.SCROLL_OF_SHEEPFOE_MAMBO,   269 },
        { xi.item.FLASK_OF_EYE_DROPS,        2698 },
        { xi.item.ANTIDOTE,                   328 },
        { xi.item.FLASK_OF_DISTILLED_WATER,    12 },
        { xi.item.POTION,                     946 },
        { xi.item.LUGWORM,                     12 },
        { xi.item.JUG_OF_SELBINA_MILK,         62 },
        { xi.item.PICKLED_HERRING,           1296 }, -- *
        { xi.item.SERVING_OF_HERB_QUUS,      5183 },
-- { xi.item.SELBINA_WAYSTONE,         10400 },
    }

    player:showText(npc, zones[player:getZoneID()].text.DOHDJUMA_SHOP_DIALOG)
    xi.shop.general(player, stock)
end)

m:addOverride('xi.zones.Mhaura.npcs.Tya_Padolih.onTrigger', function(player, npc)
    local stock =
    {
        { xi.item.SCROLL_OF_SLEEPGA, 11200 },
        { 4912,                      18032 }, -- Scroll of Distract
        { 4914,                      25038 }, -- Scroll of Frazzle
    }

    player:showText(npc, zones[player:getZoneID()].text.TYAPADOLIH_SHOP_DIALOG)
    xi.shop.general(player, stock)
end)

m:addOverride('xi.zones.Kazham.npcs.Toji_Mumosulah.onTrigger', function(player, npc)
    local stock =
    {
        { 112,                        496 }, -- Yellow Jar
        { 13199,                      104 }, -- Blood Stone
        { 13076,                     3816 }, -- Fang Necklace
        { 13321,                     1812 }, -- Bone Earring
        { 17351,                     5160 }, -- Gemshorn
        { 16993,                       70 }, -- Peeled Crayfish
        { 16998,                       40 }, -- Insect Paste
        { xi.item.JUG_OF_WORMY_BROTH, 100 }, -- *
        { 17876,                      165 }, -- Fish Broth
        { 17880,                      695 }, -- Seedbed Soil
        { xi.item.HATCHET,            500 },
        { 4988,                      3600 }, -- Scroll of Army's Paeon III
        { 4964,                      9590 }, -- Scroll of Monomi: Ichi
    }

    player:showText(npc, zones[player:getZoneID()].text.TOJIMUMOSULAH_SHOP_DIALOG)
    xi.shop.general(player, stock)
end)

m:addOverride('xi.zones.Norg.npcs.Solby-Maholby.onTrigger', function(player, npc)
    local stock =
    {
        { xi.item.LUGWORM, 12 },
        { 4899,          500, }, -- Earth Spirit Pact
-- { 2870,        10500, }, -- Norg Waystone
        { 4930,       119250, }, -- Scroll of Katon: San
        { 4933,       119250, }, -- Scroll of Hyoton: San
        { 4936,       119250, }, -- Scroll of Huton: San
        { 4939,       119250, }, -- Scroll of Doton: San
        { 4942,       119250, }, -- Scroll of Raiton: San
        { 4945,       119250, }, -- Scroll of Suiton: San
        { 4970,       155910, }, -- Scroll of Gekka: Ichi
        { 4971,       155910, }, -- Scroll of Yain: Ichi
    }

    player:showText(npc, zones[player:getZoneID()].text.SOLBYMAHOLBY_SHOP_DIALOG)
    xi.shop.general(player, stock)
end)

m:addOverride('xi.zones.Rabao.npcs.Brave_Ox.onTrigger', function(player, npc)
    local stock =
    {
        { xi.item.SCROLL_OF_PROTECT_IV,    88400 },
        { xi.item.SCROLL_OF_PROTECTRA_IV,  84240 },
        { xi.item.SCROLL_OF_DISPEL,        72800 },
        { xi.item.SCROLL_OF_STUN,          36400 },
        { xi.item.SCROLL_OF_FLASH,         36400 },
        { xi.item.SCROLL_OF_RERAISE_III,  624000 },
        { xi.item.SCROLL_OF_BANISH_III,    89440 },
        { xi.item.SCROLL_OF_CURA,          22713 },
        { xi.item.SCROLL_OF_SACRIFICE,     70304 },
        { xi.item.SCROLL_OF_ESUNA,         73008 },
        { xi.item.SCROLL_OF_AUSPICE,       35006 },
        { xi.item.SCROLL_OF_CRUSADE,      162162 },
    }

    player:showText(npc, zones[player:getZoneID()].text.BRAVEOX_SHOP_DIALOG)
    xi.shop.general(player, stock)
end)

m:addOverride('xi.zones.Tavnazian_Safehold.npcs.Nilerouche.onTrigger', function(player, npc)
    local stock =
    {
        { 17005,   108, }, -- Lufaise Fly
        { 17383,  2640, }, -- Clothespole
        { 688,      20, }, -- Arrowwood Log
        { 690,    7800, }, -- Elm Log
-- { 2871,  10000, }, -- Safehold Waystone
    }

    if player:getCurrentMission(xi.mission.log_id.COP) >= xi.mission.id.cop.SHELTERING_DOUBT then
        stock =
        {
            { 17005,   108, }, -- Lufaise Fly
            { 17383,  2640, }, -- Clothespole
            { 688,      20, }, -- Arrowwood Log
            { 690,    7800, }, -- Elm Log
            { 4638,  66000, }, -- Banish III
-- { 2871,  10000, }, -- Safehold Waystone
        }
    end

    player:showText(npc, zones[player:getZoneID()].text.NILEROUCHE_SHOP_DIALOG)
    xi.shop.general(player, stock)
end)

m:addOverride('xi.zones.Tavnazian_Safehold.npcs.Mazuro-Oozuro.onTrigger', function(player, npc)
    local stock =
    {
        { 17005,   108, }, -- Lufaise Fly
        { 17383,  2640, }, -- Clothespole
        { 688,      20, }, -- Arrowwood Log
        { 690,    7800, }, -- Elm Log
-- { 2871,  10000, }, -- Safehold Waystone
    }

    if player:getCurrentMission(xi.mission.log_id.COP) >= xi.mission.id.cop.SHELTERING_DOUBT then
        stock =
        {
            { 17005,   108, }, -- Lufaise Fly
            { 17383,  2640, }, -- Clothespole
            { 688,      20, }, -- Arrowwood Log
            { 690,    7800, }, -- Elm Log
            { 4638,  66000, }, -- Banish III
-- { 2871,  10000, }, -- Safehold Waystone
        }
    end

    player:showText(npc, zones[player:getZoneID()].text.MAZUROOOZURO_SHOP_DIALOG)
    xi.shop.general(player, stock)
end)

m:addOverride('xi.zones.Aht_Urhgan_Whitegate.npcs.Mazween.onTrigger', function(player, npc)
    local stock =
    {
        { xi.item.SCROLL_OF_SLEEPGA,      11200 },
        { xi.item.SCROLL_OF_SLEEP_II,     18720 },
        { xi.item.SCROLL_OF_POISON_II,    25200 },
        { xi.item.SCROLL_OF_BIO_II,       14000 },
        { xi.item.SCROLL_OF_POISONGA,      5160 },
        { xi.item.SCROLL_OF_STONE_III,    19932 },
        { xi.item.SCROLL_OF_WATER_III,    22682 },
        { xi.item.SCROLL_OF_AERO_III,     27744 },
        { xi.item.SCROLL_OF_FIRE_III,     33306 },
        { xi.item.SCROLL_OF_BLIZZARD_III, 39368 },
        { xi.item.SCROLL_OF_THUNDER_III,  45930 },
        { 4883,                           27000 }, -- Absorb-TP
        { 4854,                           30780 }, -- Drain II
        { 4885,                           70560 }, -- Dread Spikes
-- { 4856, 79800, }, -- Aspir II
    }

    player:showText(npc, zones[player:getZoneID()].text.MAZWEEN_SHOP_DIALOG)
    xi.shop.general(player, stock)
end)

m:addOverride('xi.zones.Nashmau.npcs.Mamaroon.onTrigger', function(player, npc)
    local stock =
    {
        { xi.item.SCROLL_OF_STUN,        27000 },
        { xi.item.SCROLL_OF_ENFIRE,       5160 },
        { xi.item.SCROLL_OF_ENBLIZZARD,   4098 },
        { xi.item.SCROLL_OF_ENAERO,       2500 },
        { xi.item.SCROLL_OF_ENSTONE,      2030 },
        { xi.item.SCROLL_OF_ENTHUNDER,    1515 },
        { xi.item.SCROLL_OF_ENWATER,      7074 },
        { xi.item.SCROLL_OF_SHOCK_SPIKES, 9360 },
        { 2502,                          39950 }, -- White Puppet Turban*
        { 2501,                          39950 }, -- Black Puppet Turban*
    }

    player:showText(npc, zones[player:getZoneID()].text.MAMAROON_SHOP_DIALOG)
    xi.shop.general(player, stock)
end)

----------------------------
-- Other Vendor Overrides --
----------------------------

m:addOverride('xi.zones.Northern_San_dOria.npcs.Pirvidiauce.onTrigger', function(player, npc)
    local stock =
    {
        { xi.item.CERAMIC_FLOWERPOT,    1050, 3, },
        { xi.item.PILE_OF_RED_GRAVEL,   2293, 3, },
        { xi.item.ASH_CLOGS,             130, 3, },
        { xi.item.HOLLY_CLOGS,          1706, 2, },
        { xi.item.CHESTNUT_SABOTS,      9547, 1, },
        { xi.item.WOODEN_ARROW,            4, 3, },
        { xi.item.CROSSBOW_BOLT,           6, 2, },
        { xi.item.FLASK_OF_EYE_DROPS,   2724, 3, },
        { xi.item.ANTIDOTE,              331, 3, },
        { xi.item.FLASK_OF_ECHO_DROPS,   840, 2, },
        { xi.item.POTION,                955, 1, },
        { xi.item.ETHER,                5025, 1, },
-- { xi.item.KINGDOM_WAYSTONE,    10500, 3, },
    }

    player:showText(npc, zones[player:getZoneID()].text.PIRVIDIAUCE_SHOP_DIALOG)
    xi.shop.general(player, stock)
end)

m:addOverride('xi.zones.Bastok_Mines.npcs.Boytz.onTrigger', function(player, npc)
    local stock =
    {
        { xi.item.BRASS_FLOWERPOT,      1050, 3 },
        { xi.item.PICKAXE,               210, 3 },
        { xi.item.FLASK_OF_EYE_DROPS,   2724, 3 },
        { xi.item.ANTIDOTE,              331, 3 },
        { xi.item.FLASK_OF_ECHO_DROPS,   840, 2 },
        { xi.item.POTION,                955, 2 },
        { xi.item.ETHER,                5025, 1 },
        { xi.item.WOODEN_ARROW,            4, 2 },
        { xi.item.IRON_ARROW,              8, 3 },
        { xi.item.CROSSBOW_BOLT,           6, 3 },
-- { xi.item.REPUBLIC_WAYSTONE,   10500, 3 },
    }

    local rank = GetNationRank(xi.nation.BASTOK)

    if rank >= 2 then
        table.insert(stock, { xi.item.SET_OF_THIEFS_TOOLS, 4158, 3 })
    end

    if rank >= 3 then
        table.insert(stock, { xi.item.LIVING_KEY, 6000, 3 })
    end

    player:showText(npc, zones[player:getZoneID()].text.BOYTZ_SHOP_DIALOG)
    xi.shop.nation(player, stock, xi.nation.BASTOK)
end)

m:addOverride('xi.zones.Windurst_Woods.npcs.Wije_Tiren.onTrigger', function(player, npc)
    local stock =
    {
        { xi.item.FLASK_OF_EYE_DROPS,   2724, 3 },
        { xi.item.ANTIDOTE,              331, 3 },
        { xi.item.FLASK_OF_ECHO_DROPS,   840, 2 },
        { xi.item.POTION,                955, 2 },
        { xi.item.ETHER,                5025, 1 },
        { 5014,                            108, }, --Scroll of Herb Pastoral
        { xi.item.FLASK_OF_DISTILLED_WATER,  12 },
-- { 2864,                          10500, }, --Federation Waystone
    }

    player:showText(npc, zones[player:getZoneID()].text.WIJETIREN_SHOP_DIALOG)
    xi.shop.general(player, stock)
end)

m:addOverride('xi.zones.Mhaura.npcs.Pikini-Mikini.onTrigger', function(player, npc)
    local stock =
    {
        { xi.item.FLASK_OF_EYE_DROPS,      2724, },
        { xi.item.ANTIDOTE,                 331, },
        { xi.item.FLASK_OF_ECHO_DROPS,      840, },
        { xi.item.POTION,                   955, },
        { xi.item.FLASK_OF_DISTILLED_WATER,  12, },
        { xi.item.SHEET_OF_PARCHMENT,      1980, },
        { xi.item.LUGWORM,                   12, },
        { xi.item.HATCHET,                  500, },
        { xi.item.STRIP_OF_MEAT_JERKY,      124, },
        { 5299,                             162, }, -- Salsa
-- { 2867,                           10500, }, -- Mhaura Waystone
    }

    player:showText(npc, zones[player:getZoneID()].text.PIKINIMIKINI_SHOP_DIALOG)
    xi.shop.general(player, stock)
end)

m:addOverride('xi.zones.Lower_Jeuno.npcs.Stinknix.onTrigger', function(player, npc)
    local stock =
    {
        { xi.item.PINCH_OF_POISON_DUST,      320 },
        { xi.item.PINCH_OF_VENOM_DUST,      1035 },
        { xi.item.PINCH_OF_PARALYSIS_DUST,  2000 },
        { xi.item.IRON_ARROW,                  8 },
        { xi.item.CROSSBOW_BOLT,               6 },
        { xi.item.GRENADE,                  1204 },
-- { xi.item.DUCHY_WAYSTONE,          10000 },
    }

    player:showText(npc, zones[player:getZoneID()].text.JUNK_SHOP_DIALOG)
    xi.shop.general(player, stock)
end)

m:addOverride('xi.zones.Kazham.npcs.Nuh_Celodehki.onTrigger', function(player, npc)
    local stock =
    {
        { xi.item.FISH_MITHKABOB,           3240, }, -- *
        { 4536,                             3406, }, -- Blackened Frog
        { xi.item.ROAST_MUSHROOM,            688, }, -- *
        { xi.item.EEL_KABOB,                3150, },
        { xi.item.BOTTLE_OF_PINEAPPLE_JUICE,  728 }, -- *
        { xi.item.WINDURST_SALAD,            2046 }, -- *
    }

    player:showText(npc, zones[player:getZoneID()].text.NUHCELODENKI_SHOP_DIALOG)
    xi.shop.general(player, stock)
end)

m:addOverride('xi.zones.Kazham.npcs.Ghemi_Sinterilo.onTrigger', function(player, npc)
    local stock =
    {
        { xi.item.BUNCH_OF_PAMAMAS,        80, },
        { xi.item.KAZHAM_PINEAPPLE,        60, },
        { xi.item.MITHRAN_TOMATO,          40, },
        { xi.item.BUNCH_OF_KAZHAM_PEPPERS, 60, },
        { xi.item.STICK_OF_CINNAMON,      260, }, -- Cinnamon
        { xi.item.KUKURU_BEAN,            120, }, -- Kukuru Bean
        { 5187,                           172, }, -- Elshimo Coconut
        { 5604,                           344, }, -- Elshimo Pachira Fruit*
-- { 2869,                         10000, }, -- Kazham Waystone
        { xi.item.AQUILARIA_LOG,         3128, }, -- Aquilaria Log
    }

    player:showText(npc, zones[player:getZoneID()].text.GHEMISENTERILO_SHOP_DIALOG)
    xi.shop.general(player, stock)
end)

m:addOverride('xi.zones.Rabao.npcs.Scamplix.onTrigger', function(player, npc)
    local stock =
    {
        { xi.item.FLASK_OF_DISTILLED_WATER,     12 },
        { xi.item.STRIP_OF_MEAT_JERKY,         124 },
        { xi.item.LOAF_OF_GOBLIN_BREAD,        312 },
        { xi.item.CACTUS_ARM,                  832 },
-- { xi.item.RABAO_WAYSTONE,            10500 },
        { xi.item.ETHER,                      5025 },
        { xi.item.THUNDERMELON,                338 },
        { xi.item.WATERMELON,                  208 },
        { xi.item.POTION,                      946 },
        { xi.item.ANTIDOTE,                    328 },
        { xi.item.FLASK_OF_BLINDNESS_POTION,  1248 },
        { xi.item.MYTHRIL_EARRING,            4680 },
        { xi.item.WATER_JUG,                   208 },
    }

    player:showText(npc, zones[player:getZoneID()].text.SCAMPLIX_SHOP_DIALOG)
    xi.shop.general(player, stock)
end)

m:addOverride('xi.zones.Aht_Urhgan_Whitegate.npcs.Khaf_Jhifanm.onTrigger', function(player, npc)
    local stock =
    {
        { 5567,                           600, }, -- Dried Date*
        { 5576,                           800, }, -- Ayran
        { 5590,                          3750, }, -- Balik Sandvici
        { xi.item.BAG_OF_WILDGRASS_SEEDS, 320, },
        { 5075,                          4400, }, -- Scroll of Raptor Mazurka
-- { 2872,                         10000, }, -- Empire Waystone
    }

    player:showText(npc, zones[player:getZoneID()].text.KHAFJHIFANM_SHOP_DIALOG)
    xi.shop.general(player, stock)
end)

m:addOverride('xi.zones.Aht_Urhgan_Whitegate.npcs.Fayeewah.onTrigger', function(player, npc)
    local stock =
    {
        { xi.item.CUP_OF_CHAI,    204, }, -- *
        { 5637,                    41, }, -- Pogaca*
        { xi.item.IRMIK_HELVASI, 4150, }, -- *
    }

    player:showText(npc, zones[player:getZoneID()].text.FAYEEWAH_SHOP_DIALOG)
    xi.shop.general(player, stock)
end)

m:addOverride('xi.zones.Aht_Urhgan_Whitegate.npcs.Yafaaf.onTrigger', function(player, npc)
    local stock =
    {
        { xi.item.BOWL_OF_SUTLAC,         3000, }, -- *
        { 5596,                           1675, }, -- Simit*
        { xi.item.CUP_OF_IMPERIAL_COFFEE, 1350, }, -- Imperial Coffee
    }

    player:showText(npc, zones[player:getZoneID()].text.YAFAAF_SHOP_DIALOG)
    xi.shop.general(player, stock)
end)

m:addOverride('xi.zones.Aht_Urhgan_Whitegate.npcs.Mulnith.onTrigger', function(player, npc)
    local stock =
    {
        { xi.item.ROAST_MUSHROOM, 688, }, -- *
        { 5598,                  4000, }, -- Sis Kebabi (Requires Astral Candescence)*
        { 5600,                  5000, }, -- Balik Sis (Requires Astral Candescence)*
    }

    player:showText(npc, zones[player:getZoneID()].text.MULNITH_SHOP_DIALOG)
    xi.shop.general(player, stock)
end)

m:addOverride('xi.zones.Aht_Urhgan_Whitegate.npcs.Rubahah.onTrigger', function(player, npc)
    local stock =
    {
        { xi.item.EAR_OF_MILLIONCORN, 48, },
        { 2237,                       60, }, -- Imperial Flour (Requires Astral Candescence)
        { 2214,                       68, }, -- Imperial Rice (Requires Astral Candescence)
        { 2271,                      948, }, -- Coffee Beans (Requires Astral Candescence)*
    }

    player:showText(npc, zones[player:getZoneID()].text.RUBAHAH_SHOP_DIALOG)
    xi.shop.general(player, stock)
end)

m:addOverride('xi.zones.Aht_Urhgan_Whitegate.npcs.Gavrie.onTrigger', function(player, npc)
    local stock =
    {
        { xi.item.FLASK_OF_EYE_DROPS,      2595 },
        { xi.item.ANTIDOTE,                 316 },
        { xi.item.FLASK_OF_ECHO_DROPS,      800 },
        { xi.item.POTION,                   910 },
        { xi.item.ETHER,                   4832 },
        { xi.item.REMEDY,                  3360 },
        { xi.item.FLASK_OF_DISTILLED_WATER,  12 },
        { xi.item.CAN_OF_AUTOMATON_OIL,     500 }, -- *
        { xi.item.CAN_OF_AUTOMATON_OIL_P1, 1000 }, -- *
        { xi.item.CAN_OF_AUTOMATON_OIL_P2, 2000 }, -- *
        { xi.item.CAN_OF_AUTOMATON_OIL_P3, 2500 }, -- *
    }

    player:showText(npc, zones[player:getZoneID()].text.GAVRIE_SHOP_DIALOG)
    xi.shop.general(player, stock)
end)

m:addOverride('xi.zones.Nashmau.npcs.Pipiroon.onTrigger', function(player, npc)
    local stock =
    {
        { xi.item.PEBBLE,                   31, }, -- *
        { xi.item.GRENADE,                1204, },
        { xi.item.RIOT_GRENADE,           6000, },
        { xi.item.CHAKRAM,               10395, }, -- *
        { xi.item.PINCH_OF_BOMB_ASH,       515, },
        { xi.item.FLASK_OF_DISTILLED_WATER, 12, }, -- *
        { xi.item.SPRIG_OF_FRESH_MARJORAM,  47, }, -- *
        { xi.item.HATCHET,                 500, }, -- *
        { 5356,                           2700, }, -- Remedy Ointment*
-- { 2873,                    10000, }, -- Nashmau Waystone
    }

    player:showText(npc, zones[player:getZoneID()].text.PIPIROON_SHOP_DIALOG)
    xi.shop.general(player, stock)
end)

m:addOverride('xi.zones.Nashmau.npcs.Poporoon.onTrigger', function(player, npc)
    local stock =
    {
        { xi.item.LEATHER_HIGHBOOTS,  336, },
        { xi.item.LIZARD_LEDELSENS,  3438, },
        { xi.item.STUDDED_BOOTS,    11172, },
        { xi.item.SOCKS,            16000, }, -- *
        { xi.item.CUIR_HIGHBOOTS,   20532, },
        { 12958,                    95800, }, -- Tiger Ledelsens *
    }

    player:showText(npc, zones[player:getZoneID()].text.POPOROON_SHOP_DIALOG)
    xi.shop.general(player, stock)
end)

m:addOverride('xi.zones.Nashmau.npcs.Chichiroon.onTrigger', function(player, npc)
    local stock =
    {
-- { 6368,  69288, }, -- Geomancer Die (SOA)
-- { 6369,  73920, }, -- Rune Fencer Die (SOA)
        { 5498,  85500, }, -- Caster's Die
        { 5497,  99224, }, -- Bolter's Die
    }

    player:showText(npc, zones[player:getZoneID()].text.CHICHIROON_SHOP_DIALOG)
    xi.shop.general(player, stock)
end)

m:addOverride('xi.zones.Nashmau.npcs.Jajaroon.onTrigger', function(player, npc)
    local stock =
    {
        { xi.item.FIRE_CARD,    75, }, -- *
        { xi.item.ICE_CARD,     75, }, -- *
        { xi.item.WIND_CARD,    75, }, -- *
        { xi.item.EARTH_CARD,   75, }, -- *
        { xi.item.THUNDER_CARD, 75, }, -- *
        { xi.item.WATER_CARD,   75, }, -- *
        { xi.item.LIGHT_CARD,   75, }, -- *
        { xi.item.DARK_CARD,    75, }, -- *
        { xi.item.TRUMP_CARD,  151, }, -- *
        { 5493,                316, }, -- Corsair Die
        { 5489,                600, }, -- Ninja Die
        { 5492,               3525, }, -- Blue Mage Die
        { 5490,               9216, }, -- Dragoon Die
        { 5488,              35200, }, -- Samurai Die
        { 5491,              40000, }, -- Summoner Die
        { 5494,              82500, }, -- Puppetmaster Die
    }

    player:showText(npc, zones[player:getZoneID()].text.JAJAROON_SHOP_DIALOG)
    xi.shop.general(player, stock)
end)

m:addOverride('xi.zones.Nashmau.npcs.Yoyoroon.onTrigger', function(player, npc)
    local stock =
    {
        { 2239,  9940, }, -- Tension Spring*
        { 2243,  9940, }, -- Loudspeaker*
        { 2246,  9940, }, -- Accelerator*
        { 2251,  9940, }, -- Armor Plate*
        { 2254,  9940, }, -- Stabilizer*
        { 2258,  9940, }, -- Mana Jammer*
        { 2262,  9940, }, -- Auto-Repair Kit*
        { 2266,  9940, }, -- Mana Tank*
        { 2250, 14925, }, -- Shock Absorber*
        { 2255, 14925, }, -- Volt Gun*
        { 2260, 14925, }, -- Stealth Screen*
        { 2240, 19925, }, -- Inhibitor*
        { 2242, 19925, }, -- Mana Booster*
        { 2247, 19925, }, -- Scope*
        { 2264, 19925, }, -- Damage Gauge*
        { 2268, 19925, }, -- Mana Conserver*
    }

    player:showText(npc, zones[player:getZoneID()].text.YOYOROON_SHOP_DIALOG)
    xi.shop.general(player, stock)
end)

return m
