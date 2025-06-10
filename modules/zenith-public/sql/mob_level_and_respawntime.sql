-----------------------------------
-- Monster level and respawn overrides
-- Does not restore Era functionality
-- Public module for ZenitXI
-----------------------------------

-- Retail dungeon respawn times
-- Level 1~19 - 8 Minutes - 480
-- Level 20~29 - 10 Minutes - 600
-- Level 30~39 - 12 Minutes - 720
-- Level 40~49 - 14 Minutes - 840
-- Level 50+ - 16 Minutes - 960
-----------------------------------

-- MISAREAUX_COAST (Zone 25)
-----------------------------------
UPDATE `mob_groups` SET `respawntime`= 300 WHERE `zoneid` = 25 AND `name` = 'Seaboard_Vulture';

-- PHOMIUNA_AQUEDUCTS (Zone 27)
-----------------------------------
UPDATE `mob_groups` SET `minLevel` = 46, `maxLevel` = 48 WHERE `zoneid` = 27 AND `name` = 'Aqueduct_Spider';

UPDATE `mob_groups` SET `respawntime`= 720 WHERE `zoneid` = 27 AND `name` IN (
    'Big_Jaw_noaggro',
    'Gloop',
    'Addled_Tumor',
    'Taurus',
    'Vampire_Bat',
);

UPDATE `mob_groups` SET `respawntime`= 840 WHERE `zoneid` = 27 AND `name` IN (
    'Diremite',
    'Canal_Bats',
    'Hell_Bat',
    'Stegotaur',
    'Fomor_Beastmaster',
    'Makara',
    'Fomor_Dragoon',
    'Fomor_Ninja',
    'Oil_Spill',
    'Fomor_Warrior',
    'Fomor_Thief',
    'Fomor_Summoner',
    'Foul_Meat',
    'Fomor_Paladin',
    'Fomor_Bard',
    'Air_Elemental',
    'Thunder_Elemental',
    'Dark_Elemental',
    'Fomor_Monk',
    'Fomor_Samurai',
    'Fomor_Ranger',
    'Fomor_Dark_Knight',
    'Fomor_Black_Mage',
    'Fomor_Red_Mage',
    'Aqueduct_Spider'
);

-- SACRARIUM (Zone 28)
-----------------------------------
UPDATE `mob_groups` SET, `respawntime` = 960, `minLevel` = 57, `maxLevel` = 59 WHERE `zoneid` = 28 AND `name` = 'Aqueduct_Spider';

UPDATE `mob_groups` SET `respawntime`= 840 WHERE `zoneid` = 28 AND `name` IN (
    'Gazer',
    'Greater_Gaylas',
    'Stegotaur'
);

-- RIVERNE_SITE_B01 (Zone 29)
-----------------------------------

-- RIVERNE_SITE_A01 (Zone 30)
-----------------------------------
