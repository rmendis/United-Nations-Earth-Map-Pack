-- TSL_AEP_AncientWorld
-- Author: blkbutterfly74
-- DateCreated: 12/31/2020 7:27:25 AM
-- Creates a ginormous map of the Ancient World as a subset of AEP  
-- based off Scrambled Arctic map script
-- Thanks to Gedemon for tips on how to debug, test and develop the full map
-----------------------------------------------------------------------------

include "MapEnums"
include "MapUtilities"
include "MountainsCliffs"
include "RiversLakes"
include "FeatureGenerator"
include "TerrainGenerator"
include "NaturalWonderGenerator"
include "ResourceGenerator"
include "AssignTrueStartingPlots"

-- north pole
local g_CenterX = 21;
local g_CenterY = 94;

local g_iE = 70.6;			-- approx. distance to equator from north pole (measured from image of map)

-- TSLs in polar coords (deg) from N.P.
local g_TSLs = {
	LEADER_GITARJA = {75, 21},
	LEADER_JAYAVARMAN = {60, 13},
	LEADER_HOJO = {39.6, 47.0},
	LEADER_QIN = {42, 25},
	LEADER_MINOR_CIV_HONG_KONG = {50.7, 22.0},
	LEADER_MINOR_CIV_JAKARTA = {65, 25},
	--LEADER_MINOR_CIV_SEOUL = {40, 36},
	-- LEADER_MINOR_CIV_PALENQUE cannot be placed cos of proximity to La Venta
	LEADER_SALADIN = {47.5, -59.7},
	LEADER_SALADIN_ALT = {47.5, -59.7},
	LEADER_CLEOPATRA = {47, -60.7},
	LEADER_VICTORIA = {31, -91.8},
	LEADER_CATHERINE_DE_MEDICI = {35, -91.6},
	LEADER_CATHERINE_DE_MEDICI_ALT = {35, -91.6},
	LEADER_BARBAROSSA = {32.1, -84.6},
	LEADER_GORGO = {41.8, -69},
	LEADER_PERICLES = {41.8, -68.7},
	LEADER_GANDHI = {45.4, -14},
	LEADER_MVEMBA = {75.9, -77.1},
	LEADER_NZINGA_MBANDE = {77.4, -75.8},
	LEADER_HARDRADA = {21.2, -81.9},
	LEADER_TRAJAN = {39.1, -76.7},
	LEADER_JULIUS_CAESAR = {39.1, -76.7},
	LEADER_PETER_GREAT = {24.7, -68.6},
	LEADER_TOMYRIS = {36.8, -22.4},
	LEADER_PHILIP_II = {39.2, -95.9},
	LEADER_GILGAMESH = {44.6, -45.9},
	LEADER_ALEXANDER = {38.3, -70.1},
	LEADER_CYRUS = {46.4, -37.1},
	LEADER_NADER_SHAH = {44.4, -35.8},
	LEADER_AMANITORE = {60.2, -54.5},
	LEADER_JADWIGA = {32.6, -72.1},
	--LEADER_MINOR_CIV_AMSTERDAM = {30.1, -84.3}, 
	--LEADER_MINOR_CIV_BRUSSELS cannot be placed cos of proximity to england, germany
	LEADER_MINOR_CIV_CARTHAGE = {43.6, -80.8},
	LEADER_MINOR_CIV_GENEVA = {36.1, -85.2},
	LEADER_MINOR_CIV_HATTUSA = {39.4, -59.5},
	LEADER_MINOR_CIV_JERUSALEM = {46, -55.6},
	LEADER_MINOR_CIV_KABUL = {42, -25.4},
	LEADER_MINOR_CIV_KANDY = {64.1, -10.8},
	LEADER_MINOR_CIV_KUMASI = {65.1, -92.6},
	LEADER_JOAO_III = {42.4, -98.1},
	LEADER_MINOR_CIV_MOHENJO_DARO = {52.5, -17.8},
	--LEADER_MINOR_CIV_PRESLAV = {38.5, -65.4},    blocked by Ottoman and Byzantium
	LEADER_MINOR_CIV_STOCKHOLM = {24.7, -76},
	--LEADER_MINOR_CIV_VALLETTA = {42.2, -76.3},
	--LEADER_MINOR_CIV_VILNIUS = {29.7, -70.3}, removed cos blocked freq. by europeans
	--LEADER_MINOR_CIV_YEREVAN = {40.4, -48}, removed cos of proximity to Georgia
	LEADER_MINOR_CIV_ZANZIBAR = {75.6, -52.5},
	LEADER_MINOR_CIV_ANTANANARIVO = {85.6, -43.6},
	LEADER_MINOR_CIV_ARMAGH = {30.4, -99.5},
	--LEADER_MINOR_CIV_GRANADA = {41, -92.7},
	LEADER_MINOR_CIV_MUSCAT = {52.7, -33.4},
	LEADER_MINOR_CIV_ANTIOCH = {35.9, -77.1},		-- Venice 
	LEADER_MINOR_CIV_BABYLON = {48.4, -38.3},	-- anshan
	LEADER_TAMAR = {36.8, -47.2},
	LEADER_CHANDRAGUPTA = {48.2, -4.8},
	LEADER_SEONDEOK = {40, 36.9},
	LEADER_GENGHIS_KHAN = {33.8, 19},
	LEADER_WILHELMINA = {30.1, -84.3}, 
	LEADER_ROBERT_THE_BRUCE = {27.2, -96.3},
	LEADER_SHAKA = {91.9, -59.25},
	LEADER_MINOR_CIV_AYUTTHAYA = {57.7, 9},
	LEADER_MINOR_CIV_CHINGUETTI = {57.5, -103.1},
	LEADER_MINOR_CIV_JOHANNESBURG = {87.7, -61.4},
	LEADER_MINOR_CIV_LAHORE = {47.1, -17.3},
	--LEADER_MINOR_CIV_NALANDA cannot be placed due to proximity to Chandragupta (Patna)
	LEADER_MINOR_CIV_SAMARKAND = {41, -28},
	LEADER_MINOR_CIV_SINGAPORE = {66.53, 11.3},
	LEADER_MINOR_CIV_TARUGA = {64.4, -83.76},
	--LEADER_MINOR_CIV_VATICAN_CITY blocked by Rome
	LEADER_MINOR_CIV_WOLIN = {29.6, -78.31},
	LEADER_AMBIORIX = {31.1, -86.3},
	LEADER_BASIL = {39.8, -64.72},
	LEADER_MENELIK = {64.7, -50.65},
	LEADER_HAMMURABI = {43.9, -43.2},
	LEADER_LADY_TRIEU = {51.2, 17},
	LEADER_KUBLAI_KHAN_CHINA = {36.4, 31.5},
	LEADER_KUBLAI_KHAN_MONGOLIA = {36.4, 31.5},
	LEADER_MINOR_CIV_LISBON = {68.6, -46.8},		-- Mogadishu
};

local g_iW, g_iH;
local g_iFlags = {};
local g_continentsFrac = nil;
local g_iNumTotalLandTiles = 0; 
local landStrips = {
		{72, 163, 164},
		{72, 178, 178},
		{73, 136, 136},
		{73, 158, 159},
		{73, 161, 161},
		{73, 166, 166},
		{73, 170, 170},
		{73, 178, 178},
		{74, 135, 138},
		{74, 158, 159},
		{74, 164, 164},
		{74, 169, 174},
		{75, 125, 125},
		{75, 133, 140},
		{75, 150, 150},
		{75, 159, 159},
		{75, 161, 161},
		{75, 167, 175},
		{75, 178, 179},
		{76, 129, 131},
		{76, 134, 134},
		{76, 137, 137},
		{76, 139, 144},
		{76, 148, 148},
		{76, 156, 159},
		{76, 163, 164},
		{76, 167, 175},
		{76, 178, 179},
		{77, 130, 133},
		{77, 140, 143},
		{77, 151, 151},
		{77, 157, 159},
		{77, 165, 165},
		{77, 167, 175},
		{77, 179, 180},
		{78, 120, 120},
		{78, 122, 122},
		{78, 131, 132},
		{78, 143, 143},
		{78, 169, 176},
		{78, 179, 180},
		{79, 119, 120},
		{79, 129, 129},
		{79, 152, 154},
		{79, 170, 176},
		{79, 179, 180},
		{80, 118, 120},
		{80, 128, 129},
		{80, 141, 142},
		{80, 144, 144},
		{80, 153, 154},
		{80, 172, 176},
		{80, 180, 180},
		{81, 117, 120},
		{81, 127, 128},
		{81, 131, 136},
		{81, 140, 142},
		{81, 147, 151},
		{81, 172, 177},
		{81, 180, 181},
		{82, 117, 119},
		{82, 127, 127},
		{82, 130, 142},
		{82, 147, 155},
		{82, 173, 176},
		{82, 180, 181},
		{83, 116, 118},
		{83, 126, 142},
		{83, 146, 156},
		{83, 174, 175},
		{83, 180, 181},
		{84, 111, 116},
		{84, 126, 141},
		{84, 144, 144},
		{84, 146, 157},
		{84, 178, 178},
		{84, 180, 181},
		{85, 109, 116},
		{85, 119, 120},
		{85, 127, 142},
		{85, 144, 157},
		{85, 173, 173},
		{85, 181, 181},
		{86, 106, 106},
		{86, 110, 122},
		{86, 128, 158},
		{86, 166, 167},
		{86, 178, 179},
		{87, 110, 161},
		{87, 164, 168},
		{87, 178, 181},
		{88, 106, 159},
		{88, 161, 161},
		{88, 164, 169},
		{88, 177, 181},
		{89, 108, 159},
		{89, 163, 170},
		{89, 176, 176},
		{89, 178, 181},
		{90, 111, 160},
		{90, 163, 170},
		{90, 178, 180},
		{91, 109, 109},
		{91, 113, 169},
		{91, 174, 175},
		{91, 177, 180},
		{92, 114, 169},
		{92, 173, 175},
		{92, 177, 179},
		{93, 110, 110},
		{93, 115, 168},
		{93, 173, 174},
		{93, 177, 179},
		{94, 116, 168},
		{94, 172, 174},
		{94, 176, 177},
		{95, 117, 167},
		{95, 171, 173},
		{95, 176, 177},
		{95, 179, 179},
		{96, 115, 115},
		{96, 119, 172},
		{96, 175, 176},
		{97, 116, 116},
		{97, 120, 170},
		{97, 175, 176},
		{97, 178, 178},
		{98, 116, 117},
		{98, 119, 167},
		{98, 175, 175},
		{99, 120, 166},
		{99, 175, 175},
		{100, 121, 166},
		{101, 121, 167},
		{102, 100, 100},
		{102, 119, 164},
		{102, 173, 173},
		{103, 119, 163},
		{103, 169, 170},
		{104, 117, 117},
		{104, 120, 162},
		{105, 116, 117},
		{105, 120, 162},
		{106, 116, 117},
		{106, 120, 162},
		{107, 121, 162},
		{108, 117, 117},
		{108, 122, 162},
		{109, 115, 115},
		{109, 121, 163},
		{110, 115, 116},
		{110, 119, 119},
		{110, 121, 163},
		{111, 114, 114},
		{111, 119, 120},
		{111, 122, 164},
		{112, 119, 120},
		{112, 123, 164},
		{113, 112, 112},
		{113, 120, 120},
		{113, 123, 165},
		{114, 111, 112},
		{114, 120, 121},
		{114, 123, 165},
		{115, 111, 113},
		{115, 121, 121},
		{115, 123, 166},
		{116, 112, 112},
		{116, 122, 168},
		{116, 171, 173},
		{117, 123, 169},
		{117, 172, 173},
		{118, 121, 121},
		{118, 123, 170},
		{119, 116, 116},
		{119, 123, 171},
		{120, 115, 120},
		{120, 122, 171},
		{121, 114, 118},
		{121, 122, 170},
		{122, 113, 119},
		{122, 121, 167},
		{123, 101, 102},
		{123, 113, 161},
		{124, 101, 104},
		{124, 113, 115},
		{124, 118, 160},
		{125, 102, 104},
		{125, 113, 115},
		{125, 117, 157},
		{126, 112, 115},
		{126, 117, 156},
		{127, 111, 115},
		{127, 118, 118},
		{127, 120, 154},
		{128, 111, 116},
		{128, 119, 154},
		{129, 111, 116},
		{129, 119, 135},
		{129, 140, 154},
		{130, 107, 107},
		{130, 111, 112},
		{130, 114, 115},
		{130, 119, 135},
		{130, 142, 153},
		{131, 106, 108},
		{131, 115, 115},
		{131, 119, 138},
		{131, 143, 152},
		{132, 107, 107},
		{132, 113, 113},
		{132, 118, 138},
		{132, 142, 151},
		{133, 104, 104},
		{133, 107, 108},
		{133, 113, 113},
		{133, 117, 150},
		{133, 153, 154},
		{134, 104, 105},
		{134, 107, 109},
		{134, 112, 131},
		{134, 134, 149},
		{134, 152, 155},
		{135, 104, 105},
		{135, 107, 109},
		{135, 112, 126},
		{135, 128, 129},
		{135, 134, 148},
		{135, 151, 155},
		{136, 106, 109},
		{136, 111, 126},
		{136, 133, 147},
		{136, 151, 155},
		{137, 111, 125},
		{137, 130, 144},
		{137, 150, 155},
		{138, 107, 125},
		{138, 129, 155},
		{139, 107, 126},
		{139, 128, 155},
		{140, 107, 116},
		{140, 118, 126},
		{140, 128, 132},
		{140, 134, 154},
		{141, 108, 117},
		{141, 121, 124},
		{141, 127, 130},
		{141, 135, 154},
		{141, 158, 158},
		{142, 104, 105},
		{142, 108, 113},
		{142, 116, 118},
		{142, 122, 123},
		{142, 128, 130},
		{142, 132, 132},
		{142, 135, 154},
		{142, 157, 157},
		{143, 104, 111},
		{143, 118, 120},
		{143, 123, 125},
		{143, 135, 154},
		{144, 103, 110},
		{144, 115, 115},
		{144, 119, 120},
		{144, 124, 125},
		{144, 135, 153},
		{144, 156, 156},
		{145, 103, 109},
		{145, 115, 115},
		{145, 120, 120},
		{145, 127, 127},
		{145, 134, 135},
		{145, 136, 153},
		{145, 156, 157},
		{146, 103, 108},
		{146, 118, 118},
		{146, 131, 134},
		{146, 139, 152},
		{146, 156, 157},
		{147, 104, 107},
		{147, 114, 116},
		{147, 128, 137},
		{147, 142, 152},
		{147, 155, 157},
		{148, 109, 117},
		{148, 125, 139},
		{148, 147, 151},
		{148, 154, 158},
		{149, 104, 116},
		{149, 120, 120},
		{149, 125, 141},
		{149, 150, 151},
		{149, 153, 158},
		{150, 102, 144},
		{150, 153, 158},
		{151, 101, 158},
		{152, 101, 158},
		{153, 98, 158},
		{154, 97, 157},
		{155, 96, 157},
		{156, 94, 157},
		{157, 93, 157},
		{158, 93, 156},
		{158, 169, 171},
		{159, 94, 156},
		{159, 170, 172},
		{160, 93, 156},
		{160, 169, 172},
		{161, 93, 155},
		{161, 169, 173},
		{162, 92, 155},
		{162, 169, 173},
		{163, 91, 156},
		{163, 168, 173},
		{164, 91, 156},
		{164, 168, 174},
		{165, 92, 157},
		{165, 167, 174},
		{166, 93, 160},
		{166, 167, 174},
		{167, 94, 161},
		{167, 168, 174},
		{168, 95, 162},
		{168, 169, 174},
		{169, 95, 162},
		{169, 169, 173},
		{170, 97, 162},
		{170, 170, 172},
		{171, 98, 112},
		{171, 114, 161},
		{172, 100, 108},
		{172, 115, 117},
		{172, 121, 160},
		{173, 119, 119},
		{173, 121, 159},
		{174, 121, 159},
		{175, 120, 158},
		{176, 120, 157},
		{177, 121, 159},
		{178, 123, 160},
		{179, 124, 160},
		{180, 126, 159},
		{181, 127, 158},
		{182, 127, 157},
		{183, 128, 158},
		{184, 127, 158},
		{185, 127, 157},
		{186, 126, 157},
		{187, 126, 156},
		{188, 126, 156},
		{189, 127, 155},
		{190, 129, 154},
		{191, 130, 153},
		{192, 131, 152},
		{193, 132, 151},
		{194, 133, 149},
		{195, 135, 147},
		{196, 138, 145},
		{197, 139, 142}};

-------------------------------------------------------------------------------
function GenerateMap()
	print("Generating Earth Ocean Map");
	local pPlot;

	-- Set globals
	g_iW, g_iH = Map.GetGridSize();
	g_iFlags = TerrainBuilder.GetFractalFlags();
	
	plotTypes = GeneratePlotTypes();
	terrainTypes = GenerateTerrainTypesEarth(plotTypes, g_iW, g_iH, g_iFlags, false);

	for i = 0, (g_iW * g_iH) - 1, 1 do
		pPlot = Map.GetPlotByIndex(i);
		if (plotTypes[i] == g_PLOT_TYPE_HILLS) then
			terrainTypes[i] = terrainTypes[i] + 1;
		end
		TerrainBuilder.SetTerrainType(pPlot, terrainTypes[i]);
	end

	-- Temp
	AreaBuilder.Recalculate();
	local biggest_area = Areas.FindBiggestArea(false);
	print("After Adding Hills: ", biggest_area:GetPlotCount());

	-- Place lakes before rivers to allow them to act as sources for rivers
	local numLargeLakes = GameInfo.Maps[Map.GetMapSize()].Continents;
	AddLakes(numLargeLakes);

	-- River generation is affected by plot types, originating from highlands and preferring to traverse lowlands.
	AddRivers();

	AddFeatures();
	
	print("Adding cliffs");
	AddCliffs(plotTypes, terrainTypes);
	
	local args = {
		numberToPlace = GameInfo.Maps[Map.GetMapSize()].NumNaturalWonders,
	};

	local nwGen = NaturalWonderGenerator.Create(args);

	AreaBuilder.Recalculate();
	TerrainBuilder.AnalyzeChokepoints();
	TerrainBuilder.StampContinents();
	
	local resourcesConfig = MapConfiguration.GetValue("resources");
	local args = {
		resources = resourcesConfig,
		LuxuriesPerRegion = 7,
	}
	local resGen = ResourceGenerator.Create(args);

	print("Setting true start locations.");

	local args = {
		TRUE_START_LOCATIONS = g_TSLs,
		CENTER_X = g_CenterX,
		CENTER_Y = g_CenterY,
	};
	local true_start_locations = AssignTrueStartingPlots.Create(args);

	local GoodyGen = AddGoodies(g_iW, g_iH);
end

-- Input a Hash; Export width, height, and wrapX
function GetMapInitData(MapSize)
	local Width = 95;
	local Height = 128;
	return {Width = Width, Height = Height, WrapX = false}
end

-------------------------------------------------------------------------------
function GeneratePlotTypes()
	print("Generating Plot Types");
	local plotTypes = {};

	-- Start with it all as water
	for x = 0, g_iW - 1 do
		for y = 0, g_iH - 1 do
			local i = y * g_iW + x;
			local pPlot = Map.GetPlotByIndex(i);
			plotTypes[i] = g_PLOT_TYPE_OCEAN;
			TerrainBuilder.SetTerrainType(pPlot, g_TERRAIN_TYPE_OCEAN);
		end
	end

	-- Each land strip is defined by: Y, X Start, X End
	local xOffset = -89;
	local yOffset = -71;
		
	for i, v in ipairs(landStrips) do
		local y = g_iH - (v[1] + yOffset);   -- inverted 
		local xStart = v[2] + xOffset;
		local xEnd = v[3] + xOffset; 
		for x = xStart, xEnd do
			local i = y * g_iW + x;
			local pPlot = Map.GetPlotByIndex(i);
			plotTypes[i] = g_PLOT_TYPE_LAND;
			TerrainBuilder.SetTerrainType(pPlot, g_TERRAIN_TYPE_SNOW);  -- temporary setting so can calculate areas
			g_iNumTotalLandTiles = g_iNumTotalLandTiles + 1;
		end
	end
		
	AreaBuilder.Recalculate();

	--	world_age
	local world_age_new = 5;
	local world_age_normal = 3;
	local world_age_old = 2;

	local world_age = MapConfiguration.GetValue("world_age");
	if (world_age == 1) then
		world_age = world_age_new;
	elseif (world_age == 2) then
		world_age = world_age_normal;
	elseif (world_age == 3) then
		world_age = world_age_old;
	else
		world_age = 2 + TerrainBuilder.GetRandomNumber(4, "Random World Age - Lua");
	end
	
	local args = {};
	args.world_age = world_age;
	args.iW = g_iW;
	args.iH = g_iH
	args.iFlags = g_iFlags;
	args.blendRidge = 10;
	args.blendFract = 1;
	args.extra_mountains = 4;
	plotTypes = ApplyTectonics(args, plotTypes);

	return plotTypes;
end

function InitFractal(args)

	if(args == nil) then args = {}; end

	local continent_grain = args.continent_grain or 2;
	local rift_grain = args.rift_grain or -1; -- Default no rifts. Set grain to between 1 and 3 to add rifts. - Bob
	local invert_heights = args.invert_heights or false;
	local polar = args.polar or true;
	local ridge_flags = args.ridge_flags or g_iFlags;

	local fracFlags = {};
	
	if(invert_heights) then
		fracFlags.FRAC_INVERT_HEIGHTS = true;
	end
	
	if(polar) then
		fracFlags.FRAC_POLAR = true;
	end
	
	if(rift_grain > 0 and rift_grain < 4) then
		local riftsFrac = Fractal.Create(g_iW, g_iH, rift_grain, {}, 6, 5);
		g_continentsFrac = Fractal.CreateRifts(g_iW, g_iH, continent_grain, fracFlags, riftsFrac, 6, 5);
	else
		g_continentsFrac = Fractal.Create(g_iW, g_iH, continent_grain, fracFlags, 6, 5);	
	end

	-- Use Brian's tectonics method to weave ridgelines in to the continental fractal.
	-- Without fractal variation, the tectonics come out too regular.
	--
	--[[ "The principle of the RidgeBuilder code is a modified Voronoi diagram. I 
	added some minor randomness and the slope might be a little tricky. It was 
	intended as a 'whole world' modifier to the fractal class. You can modify 
	the number of plates, but that is about it." ]]-- Brian Wade - May 23, 2009
	--
	local MapSizeTypes = {};
	for row in GameInfo.Maps() do
		MapSizeTypes[row.MapSizeType] = row.PlateValue;
	end
	local sizekey = Map.GetMapSize();

	local numPlates = MapSizeTypes[sizekey] or 4

	-- Blend a bit of ridge into the fractal.
	-- This will do things like roughen the coastlines and build inland seas. - Brian

	g_continentsFrac:BuildRidges(numPlates, {}, 1, 2);
end

function AddFeatures()
	print("Adding Features");

	-- Get Rainfall setting input by user.
	local rainfall = MapConfiguration.GetValue("rainfall");
	
	local args = {rainfall = rainfall, iJunglePercent = 40, iMarshPercent = 7, iForestPercent = 40}	-- no rainforest
	local featuregen = FeatureGenerator.Create(args);

	featuregen:AddFeatures();
end

------------------------------------------------------------------------------
function GenerateTerrainTypesEarth(plotTypes, iW, iH, iFlags, bNoCoastalMountains)
	print("Generating Terrain Types");
	local terrainTypes = {};

	local fracXExp = -1;
	local fracYExp = -1;
	local grain_amount = 3;

	earth = Fractal.Create(iW, iH, 
									grain_amount, iFlags, 
									fracXExp, fracYExp);
									
	for iX = 0, iW - 1 do
		for iY = 0, iH - 1 do
			local index = (iY * iW) + iX;
			if (plotTypes[index] == g_PLOT_TYPE_OCEAN) then
				if (IsAdjacentToLand(plotTypes, iX, iY)) then
					terrainTypes[index] = g_TERRAIN_TYPE_COAST;
				else
					terrainTypes[index] = g_TERRAIN_TYPE_OCEAN;
				end
			end
		end
	end

	if (bNoCoastalMountains == true) then
		plotTypes = RemoveCoastalMountains(plotTypes, terrainTypes);
	end

	for iX = 0, iW - 1 do
		for iY = 0, iH - 1 do
			local index = (iY * iW) + iX;
			local _lat = _GetRadialLatitudeAtPlot(earth, iX, iY);
			local lat = math.abs(_lat);
			local iAzimuth = Azimuth(iX, iY, g_CenterX, g_CenterY);
			local earthVal = earth:GetHeight(iX, iY);

			-- 12% snow
			local iSnowTop = earth:GetHeight(100);	
			local iSnowBottom = earth:GetHeight(88);
				
			-- 10% tundra							
			local iTundraTop = iSnowBottom;										
			local iTundraBottom = earth:GetHeight(78);

			local iPlainsTop = iTundraBottom;
			local iPlainsBottom = earth:GetHeight(53);

			local iGrassTop = iPlainsBottom;
			local iGrassBottom = earth:GetHeight(33);

			-- 33% desert
			local iDesertTop = iGrassBottom;
			local iDesertBottom = earth:GetHeight(0);

			-- antarctica and north pole
			if (_lat < -0.7 or _lat > 0.83) then
				if (plotTypes[index] == g_PLOT_TYPE_MOUNTAIN) then
					terrainTypes[index] = g_TERRAIN_TYPE_SNOW_MOUNTAIN;
				elseif (plotTypes[index] ~= g_PLOT_TYPE_OCEAN) then
					terrainTypes[index] = g_TERRAIN_TYPE_SNOW;
				end

			-- arctic circle and patagonia
			elseif (_lat > 0.73 or _lat < -0.66) then
				iTundraTop = earth:GetHeight(45);
				iTundraBottom = earth:GetHeight(0);

				if (plotTypes[index] == g_PLOT_TYPE_MOUNTAIN) then
					terrainTypes[index] = g_TERRAIN_TYPE_SNOW_MOUNTAIN;

					if ((earthVal >= iTundraBottom) and (earthVal <= iTundraTop)) then
						terrainTypes[index] = g_TERRAIN_TYPE_TUNDRA_MOUNTAIN;
					end
				elseif (plotTypes[index] ~= g_PLOT_TYPE_OCEAN) then
					terrainTypes[index] = g_TERRAIN_TYPE_SNOW;

					if ((earthVal >= iTundraBottom) and (earthVal <= iTundraTop)) then
						terrainTypes[index] = g_TERRAIN_TYPE_TUNDRA;
					end
				end

			-- Australia, Sahara & Arabia
			elseif ((_lat < -0.11 and _lat > -0.48 and iAzimuth > 22 and iAzimuth < 64)
					or (_lat < 0.41 and _lat > 0.13 and iAzimuth > -109 and iAzimuth < -31)) then
			 
				iGrassTop = earth:GetHeight(100);
				iGrassBottom = earth:GetHeight(97);
				
				iPlainsTop = iGrassBottom;
				iPlainsBottom = earth:GetHeight(90);

				iDesertTop = iPlainsBottom;
				iDesertBottom = earth:GetHeight(0);

				if (plotTypes[index] == g_PLOT_TYPE_MOUNTAIN) then
					if ((earthVal >= iDesertBottom) and (earthVal <= iDesertTop)) then
						terrainTypes[index] = g_TERRAIN_TYPE_DESERT_MOUNTAIN;
					elseif ((earthVal >= iPlainsBottom) and (earthVal <= iPlainsTop)) then
						terrainTypes[index] = g_TERRAIN_TYPE_PLAINS_MOUNTAIN;
					elseif ((earthVal >= iGrassBottom) and (earthVal <= iGrassTop)) then
						terrainTypes[index] = g_TERRAIN_TYPE_GRASS_MOUNTAIN;
					end
				elseif (plotTypes[index] ~= g_PLOT_TYPE_OCEAN) then			
					if ((earthVal >= iDesertBottom) and (earthVal <= iDesertTop)) then
						terrainTypes[index] = g_TERRAIN_TYPE_DESERT;
					elseif ((earthVal >= iPlainsBottom) and (earthVal <= iPlainsTop)) then
						terrainTypes[index] = g_TERRAIN_TYPE_PLAINS;
					elseif ((earthVal >= iGrassBottom) and (earthVal <= iGrassTop)) then
						terrainTypes[index] = g_TERRAIN_TYPE_GRASS;
					end
				end

			-- grassland not found further north than 60 deg.
			elseif (lat > 0.66) then
				iTundraTop = earth:GetHeight(45);										
				iTundraBottom = earth:GetHeight(5);

				iPlainsTop = iTundraBottom;
				iPlainsBottom = earth:GetHeight(0);

				if (plotTypes[index] == g_PLOT_TYPE_MOUNTAIN) then
					terrainTypes[index] = g_TERRAIN_TYPE_SNOW_MOUNTAIN;

					if ((earthVal >= iTundraBottom) and (earthVal <= iTundraTop)) then
						terrainTypes[index] = g_TERRAIN_TYPE_TUNDRA_MOUNTAIN;
					elseif ((earthVal >= iPlainsBottom) and (earthVal <= iPlainsTop)) then
						terrainTypes[index] = g_TERRAIN_TYPE_PLAINS_MOUNTAIN;
					end

				elseif (plotTypes[index] ~= g_PLOT_TYPE_OCEAN) then
					terrainTypes[index] = g_TERRAIN_TYPE_SNOW;
				
					if ((earthVal >= iTundraBottom) and (earthVal <= iTundraTop)) then
						terrainTypes[index] = g_TERRAIN_TYPE_TUNDRA;
					elseif ((earthVal >= iPlainsBottom) and (earthVal <= iPlainsTop)) then
						terrainTypes[index] = g_TERRAIN_TYPE_PLAINS;
					end
				end
			
			-- tropics
			elseif (lat < 0.26) then
				-- rainforest
				iGrassTop = earth:GetHeight(100);
				iGrassBottom = earth:GetHeight(30);
																		
				iPlainsTop = iGrassBottom;
				iPlainsBottom = earth:GetHeight(5);

				iDesertTop = iPlainsBottom;

				if (plotTypes[index] == g_PLOT_TYPE_MOUNTAIN) then
					terrainTypes[index] = g_TERRAIN_TYPE_DESERT_MOUNTAIN;

					if ((earthVal >= iGrassBottom) and (earthVal <= iGrassTop)) then
						terrainTypes[index] = g_TERRAIN_TYPE_GRASS_MOUNTAIN;
					elseif ((earthVal >= iPlainsBottom) and (earthVal <= iPlainsTop)) then
						terrainTypes[index] = g_TERRAIN_TYPE_PLAINS_MOUNTAIN;
					end

				elseif (plotTypes[index] ~= g_PLOT_TYPE_OCEAN) then
					terrainTypes[index] = g_TERRAIN_TYPE_DESERT;
		
					if ((earthVal >= iGrassBottom) and (earthVal <= iGrassTop)) then
						terrainTypes[index] = g_TERRAIN_TYPE_GRASS;
					elseif ((earthVal >= iPlainsBottom) and (earthVal <= iPlainsTop)) then
						terrainTypes[index] = g_TERRAIN_TYPE_PLAINS;
					end
				end

			-- central eurasia and north america
			elseif (lat > 0.44) then
				if (plotTypes[index] == g_PLOT_TYPE_MOUNTAIN) then
					terrainTypes[index] = g_TERRAIN_TYPE_GRASS_MOUNTAIN;

					if ((earthVal >= iSnowBottom) and (earthVal <= iSnowTop)) then
						terrainTypes[index] = g_TERRAIN_TYPE_SNOW_MOUNTAIN;
					elseif ((earthVal >= iTundraBottom) and (earthVal <= iTundraTop)) then
						terrainTypes[index] = g_TERRAIN_TYPE_TUNDRA_MOUNTAIN;
					elseif ((earthVal >= iPlainsBottom) and (earthVal <= iPlainsTop)) then
						terrainTypes[index] = g_TERRAIN_TYPE_PLAINS_MOUNTAIN;
					end

				elseif (plotTypes[index] ~= g_PLOT_TYPE_OCEAN) then
					terrainTypes[index] = g_TERRAIN_TYPE_GRASS;
				
					if ((earthVal >= iSnowBottom) and (earthVal <= iSnowTop)) then
						terrainTypes[index] = g_TERRAIN_TYPE_SNOW;
					elseif ((earthVal >= iTundraBottom) and (earthVal <= iTundraTop)) then
						terrainTypes[index] = g_TERRAIN_TYPE_TUNDRA;
					elseif ((earthVal >= iPlainsBottom) and (earthVal <= iPlainsTop)) then
						terrainTypes[index] = g_TERRAIN_TYPE_PLAINS;
					end
				end

			-- rest of world
			else
				if (plotTypes[index] == g_PLOT_TYPE_MOUNTAIN) then
					terrainTypes[index] = g_TERRAIN_TYPE_GRASS_MOUNTAIN;

					if ((earthVal >= iPlainsBottom) and (earthVal <= iPlainsTop)) then
						terrainTypes[index] = g_TERRAIN_TYPE_PLAINS_MOUNTAIN;
					elseif ((earthVal >= iDesertBottom) and (earthVal <= iDesertTop)) then
						terrainTypes[index] = g_TERRAIN_TYPE_DESERT_MOUNTAIN;
					end

				elseif (plotTypes[index] ~= g_PLOT_TYPE_OCEAN) then
					terrainTypes[index] = g_TERRAIN_TYPE_GRASS;
				
					if ((earthVal >= iPlainsBottom) and (earthVal <= iPlainsTop)) then
						terrainTypes[index] = g_TERRAIN_TYPE_PLAINS;
					elseif ((earthVal >= iDesertBottom) and (earthVal <= iDesertTop)) then
						terrainTypes[index] = g_TERRAIN_TYPE_DESERT;
					end
				end

			end
		end
	end

	local bExpandCoasts = true;

	if bExpandCoasts == false then
		return
	end

	print("Expanding coasts");
	for iI = 0, 2 do
		local shallowWaterPlots = {};
		for iX = 0, iW - 1 do
			for iY = 0, iH - 1 do
				local index = (iY * iW) + iX;
				if (terrainTypes[index] == g_TERRAIN_TYPE_OCEAN) then
					-- Chance for each eligible plot to become an expansion is 1 / iExpansionDiceroll.
					-- Default is two passes at 1/4 chance per eligible plot on each pass.
					if (IsAdjacentToShallowWater(terrainTypes, iX, iY) and TerrainBuilder.GetRandomNumber(4, "add shallows") == 0) then
						table.insert(shallowWaterPlots, index);
					end
				end
			end
		end
		for i, index in ipairs(shallowWaterPlots) do
			terrainTypes[index] = g_TERRAIN_TYPE_COAST;
		end
	end
	
	return terrainTypes; 
end

-- override: circular poles
function FeatureGenerator:AddIceAtPlot(plot, iX, iY)
	local _lat = _GetRadialLatitudeAtPlot(earth, iX, iY);
	local lat = math.abs(_lat);
	
	-- more south polar ice
	if (_lat > 0.66 or _lat < - 0.6) then
		local iScore = TerrainBuilder.GetRandomNumber(100, "Resource Placement Score Adjust");

		iScore = iScore + lat * 100;

		if(IsAdjacentToLandPlot(iX,iY) == true) then
			iScore = iScore / 2.0;
		end

		local iAdjacent = TerrainBuilder.GetAdjacentFeatureCount(plot, g_FEATURE_ICE);
		iScore = iScore + 10.0 * iAdjacent;

		if(iScore > 130) then
			TerrainBuilder.SetFeatureType(plot, g_FEATURE_ICE);
			   
		end
	end
	
	return false;
end

-- override: for a radial equator 
------------------------------------------------------------------------------
function FeatureGenerator:AddJunglesAtPlot(plot, iX, iY)
	local lat = GetRadialLatitudeAtPlot(earth, iX, iY);

	--Jungle Check. First see if it can place the feature.	
	if(TerrainBuilder.CanHaveFeature(plot, g_FEATURE_JUNGLE)) then
		if(math.ceil(self.iJungleCount * 100 / self.iNumLandPlots) <= self.iJungleMaxPercent) then
			if(lat < 0.26) then		-- tropics 
																			 
																		  

																						 

																						
				--Weight based on adjacent plots if it has more than 3 start subtracting
				local iScore = 300;
				local iAdjacent = TerrainBuilder.GetAdjacentFeatureCount(plot, g_FEATURE_JUNGLE);

				if(iAdjacent == 0 ) then
					iScore = iScore;
				elseif(iAdjacent == 1) then
					iScore = iScore + 50;
				elseif (iAdjacent == 2 or iAdjacent == 3) then
					iScore = iScore + 150;
				elseif (iAdjacent == 4) then
					iScore = iScore - 50;
				else
					iScore = iScore - 200;
				end

				if(TerrainBuilder.GetRandomNumber(300, "Resource Placement Score Adjust") <= iScore) then
					TerrainBuilder.SetFeatureType(plot, g_FEATURE_JUNGLE);
					local terrainType = plot:GetTerrainType();

					if(terrainType == g_TERRAIN_TYPE_PLAINS_HILLS or terrainType == g_TERRAIN_TYPE_GRASS_HILLS) then
						TerrainBuilder.SetTerrainType(plot, g_TERRAIN_TYPE_PLAINS_HILLS);
					else
						TerrainBuilder.SetTerrainType(plot, g_TERRAIN_TYPE_PLAINS);
					end

					self.iJungleCount = self.iJungleCount + 1;
					return true;
				end
			end
		end
	end

	return false
end

------------------------------------------------------------------------------
function FeatureGenerator:AddReefAtPlot(plot, iX, iY)
	local lat = GetRadialLatitudeAtPlot(earth, iX, iY);

	--Reef Check. First see if it can place the feature.
	if(TerrainBuilder.CanHaveFeature(plot, g_FEATURE_REEF) and lat < 0.38) then		-- northern most reefs
		self.iNumReefablePlots = self.iNumReefablePlots + 1;
		if(math.ceil(self.iReefCount * 100 / self.iNumReefablePlots) <= self.iReefMaxPercent) then
																						  

				--Weight based on adjacent plots
															  
				local iScore  = 3 * g_iE * lat;
				local iAdjacent = TerrainBuilder.GetAdjacentFeatureCount(plot, g_FEATURE_REEF);

				if(iAdjacent == 0 ) then
					iScore = iScore + 100;
				elseif(iAdjacent == 1) then
					iScore = iScore + 125;
				elseif (iAdjacent == 2) then
					iScore = iScore  + 150;
				elseif (iAdjacent == 3 or iAdjacent == 4) then
					iScore = iScore + 175;
				else
					iScore = iScore + 10000;
				end

				if(TerrainBuilder.GetRandomNumber(200, "Resource Placement Score Adjust") >= iScore) then
					TerrainBuilder.SetFeatureType(plot, g_FEATURE_REEF);
					self.iReefCount = self.iReefCount + 1;
				end
		end
	end
end
------------------------------------------------------------------------------

-- bugfix/patch - remember pythagoras?
function __GetPlotDistance(iX1, iY1, iX0, iY0)
	return math.sqrt((iX1-iX0)^2 + (iY1-iY0)^2);
end

-- the angle of (iX1, iY1) relative to (iX0, iY0) in degrees
function Azimuth(iX1, iY1, iX0, iY0)
	return math.deg(_Azimuth(iX1, iY1, iX0, iY0));
end

-- the angle of (iX1, iY1) relative to (iX0, iY0)
function _Azimuth(iX1, iY1, iX0, iY0)
	return math.atan2(iY1-iY0, iX1-iX0);
end

----------------------------------------------------------------------------------
-- LATITUDE LOOKUP
----------------------------------------------------------------------------------
function _GetRadialLatitudeAtPlot(variationFrac, iX, iY)
	local iZ = __GetPlotDistance(iX, iY, g_CenterX, g_CenterY);		-- radial distance from center

	if (iZ < 2*g_iE) then
		-- Terrain bands are governed by latitude (in rad).
		local _lat = 1/2 - iZ/(2*g_iE);

		-- Returns a latitude value between 0.0 (tropical) and +/-1.0 (polar).
		local lat = 2 * _lat;
	
		-- Adjust latitude using variation fractal, to roughen the border between bands:
		-- lessen the variation at south pole
		lat = lat + (128 - variationFrac:GetHeight(iX, iY))/(255.0 * 5.0) * (1 - iZ/(2*g_iE));

		-- Limit to the range [-1, 1]:
		lat = math.clamp(lat, -1, 1);
	
		return lat;
	else
		-- off the map (south pole) 
		return -1;
	end
end

-- Returns a latitude value between 0.0 (tropical) and 1.0 (polar).
function GetRadialLatitudeAtPlot(variationFrac, iX, iY)
	return math.abs(_GetRadialLatitudeAtPlot(variationFrac, iX, iY));
end