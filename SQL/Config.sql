-- Config
-- Author: blkbutterfly74
-- DateCreated: 11/28/2017 7:42:07 AM
--------------------------------------------------------------
INSERT INTO Maps (File, Domain, Name, Description, Image, RequiresUniqueLeaders, StaticMap, WorldBuilderOnly)
VALUES 
	/* standard maps */
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/AEPEarth.lua', 'StandardMaps', 'LOC_MAP_AEP_EARTH_NAME', 'LOC_MAP_AEP_EARTH_DESCRIPTION', 'Map_EarthHuge', 0, 0, 1),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/AEP_NewWorld.lua', 'StandardMaps', 'LOC_MAP_AEP_NEW_WORLD_NAME', 'LOC_MAP_AEP_NEW_WORLD_DESCRIPTION', NULL, 0, 0, 0),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/AEP_Oceania.lua', 'StandardMaps', 'LOC_MAP_AEP_OCEANIA_NAME', 'LOC_MAP_AEP_OCEANIA_DESCRIPTION', NULL, 0, 0, 0),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/AEP_AncientWorld.lua', 'StandardMaps', 'LOC_MAP_AEP_ANCIENT_WORLD_NAME', 'LOC_MAP_AEP_ANCIENT_WORLD_DESCRIPTION', NULL, 0, 0, 0),

	/* GS maps */
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/AEP_Oceania_XP2.lua', 'Maps:Expansion2Maps', 'LOC_MAP_AEP_OCEANIA_NAME', 'LOC_MAP_AEP_OCEANIA_DESCRIPTION', NULL, 0, 0, 0),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/AEP_NewWorld_XP2.lua', 'Maps:Expansion2Maps', 'LOC_MAP_AEP_NEW_WORLD_NAME', 'LOC_MAP_AEP_NEW_WORLD_DESCRIPTION', NULL, 0, 0, 0),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/AEP_AncientWorld_XP2.lua', 'Maps:Expansion2Maps', 'LOC_MAP_AEP_ANCIENT_WORLD_NAME', 'LOC_MAP_AEP_ANCIENT_WORLD_DESCRIPTION', NULL, 0, 0, 0),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/AEPEarth_XP2.lua', 'Maps:Expansion2Maps', 'LOC_MAP_AEP_EARTH_NAME', 'LOC_MAP_AEP_EARTH_DESCRIPTION', 'Map_EarthHuge', 0, 0, 1),

	/* TSL standard maps */
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_NewWorld.lua', 'StandardMaps', 'LOC_MAP_TSL_AEP_NEW_WORLD_NAME', 'LOC_MAP_TSL_AEP_NEW_WORLD_DESCRIPTION', 'Map_TrueStartEarth', 0, 0, 0),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'StandardMaps', 'LOC_MAP_TSL_AEP_ANCIENT_WORLD_NAME', 'LOC_MAP_TSL_AEP_ANCIENT_WORLD_DESCRIPTION', 'Map_TrueStartEarth', 0, 0, 0),

	/* TSL GS maps */
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_Oceania_XP2.lua', 'Maps:Expansion2Maps', 'LOC_MAP_TSL_AEP_OCEANIA_NAME', 'LOC_MAP_TSL_AEP_OCEANIA_DESCRIPTION', 'Map_TrueStartEarth', 0, 0, 0),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_NewWorld_XP2.lua', 'Maps:Expansion2Maps', 'LOC_MAP_TSL_AEP_NEW_WORLD_NAME', 'LOC_MAP_TSL_AEP_NEW_WORLD_DESCRIPTION', 'Map_TrueStartEarth', 0, 0, 0),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld_XP2.lua', 'Maps:Expansion2Maps', 'LOC_MAP_TSL_AEP_ANCIENT_WORLD_NAME', 'LOC_MAP_TSL_AEP_ANCIENT_WORLD_DESCRIPTION', 'Map_TrueStartEarth', 0, 0, 0);

INSERT INTO MapSizes (Domain, MapSizeType, Name, Description, MinPlayers, MaxPlayers, DefaultPlayers, MinCityStates, MaxCityStates, DefaultCityStates, SortIndex)
VALUES 
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_Oceania_XP2.lua', 'MAPSIZE_DUEL', 'LOC_MAPSIZE_DUEL_NAME', 'LOC_MAPSIZE_DUEL_DESCRIPTION', 2, 2, 2, 0, 1, 1, 10),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_NewWorld.lua', 'MAPSIZE_SMALL', 'LOC_MAPSIZE_SMALL_NAME', 'LOC_MAPSIZE_SMALL_DESCRIPTION', 2, 7, 5, 0, 4, 4, 10),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_NewWorld_XP2.lua', 'MAPSIZE_STANDARD', 'LOC_MAPSIZE_STANDARD_NAME', 'LOC_MAPSIZE_STANDARD_DESCRIPTION', 2, 9, 8, 0, 5, 5, 10),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'MAPSIZE_HUGE', 'LOC_MAPSIZE_HUGE_NAME', 'LOC_MAPSIZE_HUGE_DESCRIPTION', 2, 34, 12, 0, 25, 12, 10),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld_XP2.lua', 'MAPSIZE_HUGE', 'LOC_MAPSIZE_HUGE_NAME', 'LOC_MAPSIZE_HUGE_DESCRIPTION', 2, 40, 12, 0, 25, 12, 10);

INSERT INTO MapDomainOverrides (Map, ParameterId, Domain)
VALUES
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_Oceania_XP2.lua', 'MapSize', '{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_Oceania_XP2.lua'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_NewWorld.lua', 'MapSize', '{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_NewWorld.lua'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_NewWorld_XP2.lua', 'MapSize', '{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_NewWorld_XP2.lua'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'MapSize', '{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld_XP2.lua', 'MapSize', '{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld_XP2.lua');

INSERT INTO DomainValueFilters (Domain, Value, Filter)
VALUES 
	('Maps:Expansion2Maps', '{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/AEP_Oceania.lua', 'difference'),
	('Maps:Expansion2Maps', '{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/AEP_NewWorld.lua', 'difference'),
	('Maps:Expansion2Maps', '{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/AEP_AncientWorld.lua', 'difference'),
	('Maps:Expansion2Maps', '{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/AEPEarth.lua', 'difference'),

	/* TSL maps */
	('Maps:Expansion2Maps', '{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_NewWorld.lua', 'difference'),
	('Maps:Expansion2Maps', '{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'difference');

INSERT INTO Parameters (Key1, Key2, ParameterId, Name, Description, Domain, DefaultValue, ConfigurationGroup, ConfigurationId, GroupId, SortIndex)
VALUES
/*
	-- TSL
	('Map', '{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/AEPEarth.lua', 'TrueStarts', 'LOC_MAP_TRUE_START_POSITION_NAME', 'LOC_MAP_TRUE_START_POSITION_DESCRIPTION', 'bool', 0, 'Map', 'true_start', 'MapOptions', 300),
*/

	-- rainfall
	('Map', '{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/AEPEarth.lua', 'Rainfall', 'LOC_MAP_RAINFALL_NAME', 'LOC_MAP_RAINFALL_DESCRIPTION', 'Rainfall', 2, 'Map', 'rainfall', 'MapOptions', 250),
	('Map', '{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/AEP_NewWorld.lua', 'Rainfall', 'LOC_MAP_RAINFALL_NAME', 'LOC_MAP_RAINFALL_DESCRIPTION', 'Rainfall', 2, 'Map', 'rainfall', 'MapOptions', 250),
	('Map', '{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/AEP_AncientWorld.lua', 'Rainfall', 'LOC_MAP_RAINFALL_NAME', 'LOC_MAP_RAINFALL_DESCRIPTION', 'Rainfall', 2, 'Map', 'rainfall', 'MapOptions', 250),
	('Map', '{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/AEP_Oceania.lua', 'Rainfall', 'LOC_MAP_RAINFALL_NAME', 'LOC_MAP_RAINFALL_DESCRIPTION', 'Rainfall', 2, 'Map', 'rainfall', 'MapOptions', 250),
	('Map', '{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/AEP_Oceania_XP2.lua', 'Rainfall', 'LOC_MAP_RAINFALL_NAME', 'LOC_MAP_RAINFALL_DESCRIPTION', 'Rainfall', 2, 'Map', 'rainfall', 'MapOptions', 250),
	('Map', '{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/AEP_NewWorld_XP2.lua', 'Rainfall', 'LOC_MAP_RAINFALL_NAME', 'LOC_MAP_RAINFALL_DESCRIPTION', 'Rainfall', 2, 'Map', 'rainfall', 'MapOptions', 250),
	('Map', '{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/AEP_AncientWorld_XP2.lua', 'Rainfall', 'LOC_MAP_RAINFALL_NAME', 'LOC_MAP_RAINFALL_DESCRIPTION', 'Rainfall', 2, 'Map', 'rainfall', 'MapOptions', 250),
	('Map', '{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/AEPEarth_XP2.lua', 'Rainfall', 'LOC_MAP_RAINFALL_NAME', 'LOC_MAP_RAINFALL_DESCRIPTION', 'Rainfall', 2, 'Map', 'rainfall', 'MapOptions', 250),
	('Map', '{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_Oceania_XP2.lua', 'Rainfall', 'LOC_MAP_RAINFALL_NAME', 'LOC_MAP_RAINFALL_DESCRIPTION', 'Rainfall', 2, 'Map', 'rainfall', 'MapOptions', 250),
	('Map', '{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_NewWorld.lua', 'Rainfall', 'LOC_MAP_RAINFALL_NAME', 'LOC_MAP_RAINFALL_DESCRIPTION', 'Rainfall', 2, 'Map', 'rainfall', 'MapOptions', 250),
	('Map', '{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_NewWorld_XP2.lua', 'Rainfall', 'LOC_MAP_RAINFALL_NAME', 'LOC_MAP_RAINFALL_DESCRIPTION', 'Rainfall', 2, 'Map', 'rainfall', 'MapOptions', 250),
	('Map', '{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'Rainfall', 'LOC_MAP_RAINFALL_NAME', 'LOC_MAP_RAINFALL_DESCRIPTION', 'Rainfall', 2, 'Map', 'rainfall', 'MapOptions', 250),
	('Map', '{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld_XP2.lua', 'Rainfall', 'LOC_MAP_RAINFALL_NAME', 'LOC_MAP_RAINFALL_DESCRIPTION', 'Rainfall', 2, 'Map', 'rainfall', 'MapOptions', 250),

	-- world age
	('Map', '{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/AEPEarth.lua', 'WorldAge', 'LOC_MAP_WORLD_AGE_NAME', 'LOC_MAP_WORLD_AGE_DESCRIPTION', 'WorldAge', 2, 'Map', 'world_age', 'MapOptions', 230),
	('Map', '{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/AEP_NewWorld.lua', 'WorldAge', 'LOC_MAP_WORLD_AGE_NAME', 'LOC_MAP_WORLD_AGE_DESCRIPTION', 'WorldAge', 2, 'Map', 'world_age', 'MapOptions', 230),
	('Map', '{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/AEP_AncientWorld.lua', 'WorldAge', 'LOC_MAP_WORLD_AGE_NAME', 'LOC_MAP_WORLD_AGE_DESCRIPTION', 'WorldAge', 2, 'Map', 'world_age', 'MapOptions', 230),
	('Map', '{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/AEP_Oceania.lua', 'WorldAge', 'LOC_MAP_WORLD_AGE_NAME', 'LOC_MAP_WORLD_AGE_DESCRIPTION', 'WorldAge', 2, 'Map', 'world_age', 'MapOptions', 230),
	('Map', '{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/AEP_Oceania_XP2.lua', 'WorldAge', 'LOC_MAP_WORLD_AGE_NAME', 'LOC_MAP_WORLD_AGE_DESCRIPTION', 'WorldAge', 2, 'Map', 'world_age', 'MapOptions', 230),
	('Map', '{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/AEP_NewWorld_XP2.lua', 'WorldAge', 'LOC_MAP_WORLD_AGE_NAME', 'LOC_MAP_WORLD_AGE_DESCRIPTION', 'WorldAge', 2, 'Map', 'world_age', 'MapOptions', 230),
	('Map', '{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/AEP_AncientWorld_XP2.lua', 'WorldAge', 'LOC_MAP_WORLD_AGE_NAME', 'LOC_MAP_WORLD_AGE_DESCRIPTION', 'WorldAge', 2, 'Map', 'world_age', 'MapOptions', 230),
	('Map', '{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/AEPEarth_XP2.lua', 'WorldAge', 'LOC_MAP_WORLD_AGE_NAME', 'LOC_MAP_WORLD_AGE_DESCRIPTION', 'WorldAge', 2, 'Map', 'world_age', 'MapOptions', 230),
	('Map', '{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_NewWorld.lua', 'WorldAge', 'LOC_MAP_WORLD_AGE_NAME', 'LOC_MAP_WORLD_AGE_DESCRIPTION', 'WorldAge', 2, 'Map', 'world_age', 'MapOptions', 230),
	('Map', '{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_Oceania_XP2.lua', 'WorldAge', 'LOC_MAP_WORLD_AGE_NAME', 'LOC_MAP_WORLD_AGE_DESCRIPTION', 'WorldAge', 2, 'Map', 'world_age', 'MapOptions', 230),
	('Map', '{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_NewWorld_XP2.lua', 'WorldAge', 'LOC_MAP_WORLD_AGE_NAME', 'LOC_MAP_WORLD_AGE_DESCRIPTION', 'WorldAge', 2, 'Map', 'world_age', 'MapOptions', 230),
	('Map', '{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'WorldAge', 'LOC_MAP_WORLD_AGE_NAME', 'LOC_MAP_WORLD_AGE_DESCRIPTION', 'WorldAge', 2, 'Map', 'world_age', 'MapOptions', 230),
	('Map', '{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld_XP2.lua', 'WorldAge', 'LOC_MAP_WORLD_AGE_NAME', 'LOC_MAP_WORLD_AGE_DESCRIPTION', 'WorldAge', 2, 'Map', 'world_age', 'MapOptions', 230);

INSERT INTO MapLeaders (Map, LeaderType)
VALUES
	/* TSL Oceania GS*/
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_Oceania_XP2.lua', 'RANDOM'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_Oceania_XP2.lua', 'LEADER_KUPE'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_Oceania_XP2.lua', 'LEADER_JOHN_CURTIN'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_Oceania_XP2.lua', 'LEADER_MINOR_CIV_NAN_MADOL'),

	/* TSL New World */
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_NewWorld.lua', 'RANDOM'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_NewWorld.lua', 'LEADER_MONTEZUMA'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_NewWorld.lua', 'LEADER_POUNDMAKER'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_NewWorld.lua', 'LEADER_T_ROOSEVELT'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_NewWorld.lua', 'LEADER_T_ROOSEVELT_ROUGHRIDER'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_NewWorld.lua', 'LEADER_ABRAHAM_LINCOLN'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_NewWorld.lua', 'LEADER_PEDRO'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_NewWorld.lua', 'LEADER_LADY_SIX_SKY'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_NewWorld.lua', 'LEADER_LAUTARO'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_NewWorld.lua', 'LEADER_SIMON_BOLIVAR'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_NewWorld.lua', 'LEADER_MINOR_CIV_BUENOS_AIRES'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_NewWorld.lua', 'LEADER_MINOR_CIV_CAGUANA'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_NewWorld.lua', 'LEADER_MINOR_CIV_TORONTO'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_NewWorld.lua', 'LEADER_MINOR_CIV_LA_VENTA'),

	/* TSL New World GS */
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_NewWorld_XP2.lua', 'RANDOM'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_NewWorld_XP2.lua', 'LEADER_MONTEZUMA'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_NewWorld_XP2.lua', 'LEADER_POUNDMAKER'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_NewWorld_XP2.lua', 'LEADER_T_ROOSEVELT'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_NewWorld_XP2.lua', 'LEADER_T_ROOSEVELT_ROUGHRIDER'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_NewWorld_XP2.lua', 'LEADER_ABRAHAM_LINCOLN'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_NewWorld_XP2.lua', 'LEADER_PEDRO'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_NewWorld_XP2.lua', 'LEADER_LADY_SIX_SKY'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_NewWorld_XP2.lua', 'LEADER_LAUTARO'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_NewWorld_XP2.lua', 'LEADER_SIMON_BOLIVAR'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_NewWorld_XP2.lua', 'LEADER_PACHACUTI'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_NewWorld_XP2.lua', 'LEADER_LAURIER'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_NewWorld_XP2.lua', 'LEADER_MINOR_CIV_BUENOS_AIRES'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_NewWorld_XP2.lua', 'LEADER_MINOR_CIV_CAGUANA'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_NewWorld_XP2.lua', 'LEADER_MINOR_CIV_CAHOKIA'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_NewWorld_XP2.lua', 'LEADER_MINOR_CIV_LA_VENTA'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_NewWorld_XP2.lua', 'LEADER_MINOR_CIV_NAZCA'),

	/* TSL Ancient World */
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'RANDOM'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'RANDOM_POOL1'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'RANDOM_POOL2'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'LEADER_ALEXANDER'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'LEADER_AMANITORE'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'LEADER_BARBAROSSA'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'LEADER_CATHERINE_DE_MEDICI'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'LEADER_CATHERINE_DE_MEDICI_ALT'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'LEADER_CLEOPATRA'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'LEADER_CLEOPATRA_ALT'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'LEADER_CYRUS'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'LEADER_NADER_SHAH'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'LEADER_GANDHI'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'LEADER_GILGAMESH'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'LEADER_GORGO'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'LEADER_HARDRADA'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'LEADER_JADWIGA'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'LEADER_MVEMBA'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'LEADER_NZINGA_MBANDE'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'LEADER_GITARJA'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'LEADER_PERICLES'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'LEADER_PETER_GREAT'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'LEADER_PHILIP_II'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'LEADER_SALADIN'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'LEADER_SALADIN_ALT'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'LEADER_TOMYRIS'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'LEADER_TRAJAN'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'LEADER_JULIUS_CAESAR'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'LEADER_HOJO'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'LEADER_TOKUGAWA'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'LEADER_VICTORIA'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'LEADER_TAMAR'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'LEADER_CHANDRAGUPTA'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'LEADER_QIN'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'LEADER_QIN_ALT'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'LEADER_WILHELMINA'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'LEADER_ROBERT_THE_BRUCE'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'LEADER_SHAKA'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'LEADER_JAYAVARMAN'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'LEADER_SEONDEOK'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'LEADER_GENGHIS_KHAN'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'LEADER_AMBIORIX'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'LEADER_BASIL'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'LEADER_HAMMURABI'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'LEADER_MENELIK'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'LEADER_LADY_TRIEU'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'LEADER_KUBLAI_KHAN_MONGOLIA'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'LEADER_KUBLAI_KHAN_CHINA'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'LEADER_YONGLE'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'LEADER_WU_ZETIAN'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'LEADER_JOAO_III'),

	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'LEADER_MINOR_CIV_ANTANANARIVO'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'LEADER_MINOR_CIV_ARMAGH'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'LEADER_MINOR_CIV_AYUTTHAYA'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'LEADER_MINOR_CIV_JAKARTA'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'LEADER_MINOR_CIV_CARTHAGE'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'LEADER_MINOR_CIV_CHINGUETTI'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'LEADER_MINOR_CIV_GENEVA'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'LEADER_MINOR_CIV_HATTUSA'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'LEADER_MINOR_CIV_HONG_KONG'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'LEADER_MINOR_CIV_JERUSALEM'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'LEADER_MINOR_CIV_JOHANNESBURG'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'LEADER_MINOR_CIV_KABUL'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'LEADER_MINOR_CIV_KANDY'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'LEADER_MINOR_CIV_KUMASI'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'LEADER_MINOR_CIV_LAHORE'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'LEADER_MINOR_CIV_LISBON'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'LEADER_MINOR_CIV_MOHENJO_DARO'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'LEADER_MINOR_CIV_MUSCAT'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'LEADER_MINOR_CIV_SAMARKAND'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'LEADER_MINOR_CIV_SINGAPORE'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'LEADER_MINOR_CIV_STOCKHOLM'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'LEADER_MINOR_CIV_TARUGA'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'LEADER_MINOR_CIV_WOLIN'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'LEADER_MINOR_CIV_ZANZIBAR'),

	/* TSL Ancient World GS */
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld_XP2.lua', 'RANDOM'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld_XP2.lua', 'RANDOM_POOL1'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld_XP2.lua', 'RANDOM_POOL2'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld_XP2.lua', 'LEADER_ALEXANDER'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld_XP2.lua', 'LEADER_AMANITORE'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld_XP2.lua', 'LEADER_BARBAROSSA'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld_XP2.lua', 'LEADER_CATHERINE_DE_MEDICI'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld_XP2.lua', 'LEADER_CATHERINE_DE_MEDICI_ALT'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld_XP2.lua', 'LEADER_CLEOPATRA'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld_XP2.lua', 'LEADER_CLEOPATRA_ALT'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld_XP2.lua', 'LEADER_CYRUS'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld_XP2.lua', 'LEADER_NADER_SHAH'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld_XP2.lua', 'LEADER_GANDHI'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld_XP2.lua', 'LEADER_GILGAMESH'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld_XP2.lua', 'LEADER_GORGO'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld_XP2.lua', 'LEADER_HARDRADA'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld_XP2.lua', 'LEADER_JADWIGA'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld_XP2.lua', 'LEADER_MVEMBA'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld_XP2.lua', 'LEADER_NZINGA_MBANDE'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld_XP2.lua', 'LEADER_GITARJA'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld_XP2.lua', 'LEADER_PERICLES'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld_XP2.lua', 'LEADER_PETER_GREAT'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld_XP2.lua', 'LEADER_PHILIP_II'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld_XP2.lua', 'LEADER_SALADIN'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld_XP2.lua', 'LEADER_SALADIN_ALT'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld_XP2.lua', 'LEADER_TOMYRIS'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld_XP2.lua', 'LEADER_TRAJAN'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld_XP2.lua', 'LEADER_JULIUS_CAESAR'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld_XP2.lua', 'LEADER_HOJO'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld_XP2.lua', 'LEADER_TOKUGAWA'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld_XP2.lua', 'LEADER_VICTORIA'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld_XP2.lua', 'LEADER_TAMAR'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld_XP2.lua', 'LEADER_CHANDRAGUPTA'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld_XP2.lua', 'LEADER_QIN'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld_XP2.lua', 'LEADER_QIN_ALT'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld_XP2.lua', 'LEADER_WILHELMINA'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld_XP2.lua', 'LEADER_ROBERT_THE_BRUCE'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld_XP2.lua', 'LEADER_SHAKA'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld_XP2.lua', 'LEADER_JAYAVARMAN'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld_XP2.lua', 'LEADER_SEONDEOK'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld_XP2.lua', 'LEADER_GENGHIS_KHAN'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld_XP2.lua', 'LEADER_AMBIORIX'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld_XP2.lua', 'LEADER_BASIL'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld_XP2.lua', 'LEADER_HAMMURABI'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld_XP2.lua', 'LEADER_MENELIK'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld_XP2.lua', 'LEADER_DIDO'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld_XP2.lua', 'LEADER_ELEANOR_ENGLAND'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld_XP2.lua', 'LEADER_ELEANOR_FRANCE'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld_XP2.lua', 'LEADER_KRISTINA'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld_XP2.lua', 'LEADER_MANSA_MUSA'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld_XP2.lua', 'LEADER_SUNDIATA_KEITA'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld_XP2.lua', 'LEADER_MATTHIAS_CORVINUS'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld_XP2.lua', 'LEADER_LADY_TRIEU'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld_XP2.lua', 'LEADER_KUBLAI_KHAN_MONGOLIA'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld_XP2.lua', 'LEADER_KUBLAI_KHAN_CHINA'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld_XP2.lua', 'LEADER_YONGLE'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld_XP2.lua', 'LEADER_WU_ZETIAN'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld_XP2.lua', 'LEADER_SULEIMAN'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld_XP2.lua', 'LEADER_SULEIMAN_ALT'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld_XP2.lua', 'LEADER_JOAO_III');

INSERT INTO MapSupportedValues (Map, Domain, Value)
VALUES 
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_Oceania_XP2.lua', 'Expansion2CityStates', 'CIVILIZATION_NAN_MADOL'),

	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_NewWorld.lua', 'StandardCityStates', 'CIVILIZATION_BUENOS_AIRES'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_NewWorld.lua', 'StandardCityStates', 'CIVILIZATION_CAGUANA'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_NewWorld.lua', 'StandardCityStates', 'CIVILIZATION_TORONTO'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_NewWorld.lua', 'StandardCityStates', 'CIVILIZATION_LA_VENTA'),

	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_NewWorld.lua', 'Expansion1CityStates', 'CIVILIZATION_BUENOS_AIRES'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_NewWorld.lua', 'Expansion1CityStates', 'CIVILIZATION_CAGUANA'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_NewWorld.lua', 'Expansion1CityStates', 'CIVILIZATION_TORONTO'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_NewWorld.lua', 'Expansion1CityStates', 'CIVILIZATION_LA_VENTA'),

	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_NewWorld_XP2.lua', 'Expansion2CityStates', 'CIVILIZATION_BUENOS_AIRES'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_NewWorld_XP2.lua', 'Expansion2CityStates', 'CIVILIZATION_CAGUANA'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_NewWorld_XP2.lua', 'Expansion2CityStates', 'CIVILIZATION_CAHOKIA'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_NewWorld_XP2.lua', 'Expansion2CityStates', 'CIVILIZATION_NAZCA'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_NewWorld_XP2.lua', 'Expansion2CityStates', 'CIVILIZATION_LA_VENTA'),

	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'StandardCityStates', 'CIVILIZATION_ANTANANARIVO'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'StandardCityStates', 'CIVILIZATION_BABYLON'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'StandardCityStates', 'CIVILIZATION_ARMAGH'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'StandardCityStates', 'CIVILIZATION_AYUTTHAYA'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'StandardCityStates', 'CIVILIZATION_JAKARTA'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'StandardCityStates', 'CIVILIZATION_CARTHAGE'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'StandardCityStates', 'CIVILIZATION_CHINGUETTI'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'StandardCityStates', 'CIVILIZATION_GENEVA'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'StandardCityStates', 'CIVILIZATION_HATTUSA'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'StandardCityStates', 'CIVILIZATION_HONG_KONG'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'StandardCityStates', 'CIVILIZATION_JERUSALEM'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'StandardCityStates', 'CIVILIZATION_JOHANNESBURG'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'StandardCityStates', 'CIVILIZATION_KABUL'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'StandardCityStates', 'CIVILIZATION_KANDY'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'StandardCityStates', 'CIVILIZATION_KUMASI'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'StandardCityStates', 'CIVILIZATION_LAHORE'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'StandardCityStates', 'CIVILIZATION_LISBON'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'StandardCityStates', 'CIVILIZATION_MOHENJO_DARO'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'StandardCityStates', 'CIVILIZATION_MUSCAT'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'StandardCityStates', 'CIVILIZATION_SAMARKAND'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'StandardCityStates', 'CIVILIZATION_SINGAPORE'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'StandardCityStates', 'CIVILIZATION_STOCKHOLM'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'StandardCityStates', 'CIVILIZATION_TARUGA'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'StandardCityStates', 'CIVILIZATION_WOLIN'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'StandardCityStates', 'CIVILIZATION_ZANZIBAR'),

	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'Expansion1CityStates', 'CIVILIZATION_ANTANANARIVO'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'Expansion1CityStates', 'CIVILIZATION_BABYLON'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'Expansion1CityStates', 'CIVILIZATION_ARMAGH'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'Expansion1CityStates', 'CIVILIZATION_AYUTTHAYA'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'Expansion1CityStates', 'CIVILIZATION_JAKARTA'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'Expansion1CityStates', 'CIVILIZATION_CARTHAGE'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'Expansion1CityStates', 'CIVILIZATION_CHINGUETTI'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'Expansion1CityStates', 'CIVILIZATION_GENEVA'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'Expansion1CityStates', 'CIVILIZATION_HATTUSA'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'Expansion1CityStates', 'CIVILIZATION_HONG_KONG'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'Expansion1CityStates', 'CIVILIZATION_JERUSALEM'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'Expansion1CityStates', 'CIVILIZATION_JOHANNESBURG'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'Expansion1CityStates', 'CIVILIZATION_KABUL'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'Expansion1CityStates', 'CIVILIZATION_KANDY'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'Expansion1CityStates', 'CIVILIZATION_KUMASI'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'Expansion1CityStates', 'CIVILIZATION_LAHORE'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'Expansion1CityStates', 'CIVILIZATION_LISBON'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'Expansion1CityStates', 'CIVILIZATION_MOHENJO_DARO'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'Expansion1CityStates', 'CIVILIZATION_MUSCAT'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'Expansion1CityStates', 'CIVILIZATION_SAMARKAND'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'Expansion1CityStates', 'CIVILIZATION_SINGAPORE'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'Expansion1CityStates', 'CIVILIZATION_STOCKHOLM'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'Expansion1CityStates', 'CIVILIZATION_TARUGA'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'Expansion1CityStates', 'CIVILIZATION_VENICE'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'Expansion1CityStates', 'CIVILIZATION_WOLIN'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld.lua', 'Expansion1CityStates', 'CIVILIZATION_ZANZIBAR'),

	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld_XP2.lua', 'Expansion2CityStates', 'CIVILIZATION_ANTANANARIVO'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld_XP2.lua', 'Expansion2CityStates', 'CIVILIZATION_BABYLON'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld_XP2.lua', 'Expansion2CityStates', 'CIVILIZATION_ARMAGH'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld_XP2.lua', 'Expansion2CityStates', 'CIVILIZATION_AYUTTHAYA'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld_XP2.lua', 'Expansion2CityStates', 'CIVILIZATION_JAKARTA'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld_XP2.lua', 'Expansion2CityStates', 'CIVILIZATION_NGAZARGAMU'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld_XP2.lua', 'Expansion2CityStates', 'CIVILIZATION_CHINGUETTI'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld_XP2.lua', 'Expansion2CityStates', 'CIVILIZATION_GENEVA'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld_XP2.lua', 'Expansion2CityStates', 'CIVILIZATION_HATTUSA'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld_XP2.lua', 'Expansion2CityStates', 'CIVILIZATION_HONG_KONG'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld_XP2.lua', 'Expansion2CityStates', 'CIVILIZATION_FEZ'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld_XP2.lua', 'Expansion2CityStates', 'CIVILIZATION_JOHANNESBURG'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld_XP2.lua', 'Expansion2CityStates', 'CIVILIZATION_KABUL'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld_XP2.lua', 'Expansion2CityStates', 'CIVILIZATION_KANDY'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld_XP2.lua', 'Expansion2CityStates', 'CIVILIZATION_KUMASI'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld_XP2.lua', 'Expansion2CityStates', 'CIVILIZATION_LAHORE'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld_XP2.lua', 'Expansion2CityStates', 'CIVILIZATION_LISBON'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld_XP2.lua', 'Expansion2CityStates', 'CIVILIZATION_MOHENJO_DARO'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld_XP2.lua', 'Expansion2CityStates', 'CIVILIZATION_MUSCAT'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld_XP2.lua', 'Expansion2CityStates', 'CIVILIZATION_SAMARKAND'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld_XP2.lua', 'Expansion2CityStates', 'CIVILIZATION_SINGAPORE'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld_XP2.lua', 'Expansion2CityStates', 'CIVILIZATION_BOLOGNA'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld_XP2.lua', 'Expansion2CityStates', 'CIVILIZATION_TARUGA'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld_XP2.lua', 'Expansion2CityStates', 'CIVILIZATION_VENICE'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld_XP2.lua', 'Expansion2CityStates', 'CIVILIZATION_WOLIN'),
	('{0D260DE6-56DC-4704-9486-1E532E1432BD}Maps/TSL_AEP_AncientWorld_XP2.lua', 'Expansion2CityStates', 'CIVILIZATION_ZANZIBAR');

