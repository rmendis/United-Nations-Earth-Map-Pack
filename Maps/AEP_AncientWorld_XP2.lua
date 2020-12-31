-- AEP_AncientWorld_XP2
-- Author: blkbutterfly74
-- DateCreated: 12/29/2020 6:43:37 PM
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
include "CoastalLowlands"
include "AssignStartingPlots"

-- north pole
local g_CenterX = 21;
local g_CenterY = 94;

local g_iW, g_iH;
local g_iFlags = {};
local g_continentsFrac = nil;
local g_iNumTotalLandTiles = 0;
local featuregen = nil;

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
		{191, 198, 198},
		{192, 131, 152},
		{192, 197, 198},
		{193, 132, 151},
		{193, 196, 198},
		{194, 133, 149},
		{194, 195, 198},
		{195, 135, 147},
		{195, 194, 198},
		{196, 138, 145},
		{196, 193, 198},
		{197, 139, 142},
		{197, 192, 198},
		{198, 191, 198},
		{199, 190, 198}};

-------------------------------------------------------------------------------
function GenerateMap()
	print("Generating Earth Ocean Map");
	local pPlot;

	-- Set globals
	g_iW, g_iH = Map.GetGridSize();
	g_iFlags = TerrainBuilder.GetFractalFlags();

	--	local world_age
	local world_age_new = 5;
	local world_age_normal = 3;
	local world_age_old = 2;

	local world_age = MapConfiguration.GetValue("world_age");
	if (world_age == 1) then
		world_age = world_age_new;
	elseif (world_age == 3) then
		world_age = world_age_old;
	else
		world_age = world_age_normal;	-- default
	end
	
	plotTypes = GeneratePlotTypes();
	terrainTypes = GenerateTerrainTypesEarth(plotTypes, g_iW, g_iH, g_iFlags, false);
	ApplyBaseTerrain(plotTypes, terrainTypes, g_iW, g_iH);

	AreaBuilder.Recalculate();
	--[[ blackbutterfly74 - Why this additional AnalyzeChockepoint()? Commenting out for now:
	TerrainBuilder.AnalyzeChokepoints(); --]]
	TerrainBuilder.StampContinents();

	local iContinentBoundaryPlots = GetContinentBoundaryPlotCount(g_iW, g_iH);
	local biggest_area = Areas.FindBiggestArea(false);
	print("After Adding Hills: ", biggest_area:GetPlotCount());
	AddTerrainFromContinents(plotTypes, terrainTypes, world_age, g_iW, g_iH, iContinentBoundaryPlots);

	AreaBuilder.Recalculate();

	-- Place lakes before rivers to allow them to act as sources for rivers
	local numLargeLakes = GameInfo.Maps[Map.GetMapSize()].Continents;
	AddLakes(numLargeLakes);

	-- River generation is affected by plot types, originating from highlands and preferring to traverse lowlands.
	AddRivers();

	AddFeatures();

	TerrainBuilder.AnalyzeChokepoints();
	
	print("Adding cliffs");
	AddCliffs(plotTypes, terrainTypes);
	
	local args = {
		numberToPlace = GameInfo.Maps[Map.GetMapSize()].NumNaturalWonders,
	};

	local nwGen = NaturalWonderGenerator.Create(args);

	AddFeaturesFromContinents();
	MarkCoastalLowlands();
	
	local resourcesConfig = MapConfiguration.GetValue("resources");
	local args = {
		resources = resourcesConfig,
		LuxuriesPerRegion = 7,
	}
	local resGen = ResourceGenerator.Create(args);

	print("Creating start plot database.");

	-- START_MIN_Y and START_MAX_Y is the percent of the map ignored for major civs' starting positions.
	local startConfig = MapConfiguration.GetValue("start");-- Get the start config
	local args = {
		MIN_MAJOR_CIV_FERTILITY = 150,
		MIN_MINOR_CIV_FERTILITY = 50, 
		MIN_BARBARIAN_FERTILITY = 1,
		START_MIN_Y = 15,
		START_MAX_Y = 15,
		START_CONFIG = startConfig,
		WATER = true,
	};
	local start_plot_database = AssignStartingPlots.Create(args);

	local GoodyGen = AddGoodies(g_iW, g_iH);
end

-- Input a Hash; Export width, height, and wrapX
function GetMapInitData(MapSize)
	local Width = 95;
	local Height = 128;
	return {Width = Width, Height = Height, WrapX = false}
end

-------------------------------------------------------------------------------
function GeneratePlotTypes(world_age)
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
	featuregen = FeatureGenerator.Create(args);

	featuregen:AddFeatures(true, true);  --second parameter is whether or not rivers start inland);
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

			local iDistanceFromCenter = __GetPlotDistance(iX, iY, g_CenterX, g_CenterY);
			local iAzimuth = Azimuth(iX, iY, g_CenterX, g_CenterY);

			local iSnowTop = earth:GetHeight(100);	
			local iSnowBottom = earth:GetHeight(75);
											
			local iTundraTop = earth:GetHeight(75);										
			local iTundraBottom = earth:GetHeight(50);

			local iPlainsTop = earth:GetHeight(50);
			local iPlainsBottom = earth:GetHeight(15);

			local iDesertTop = earth:GetHeight(15);
			local iDesertBottom = earth:GetHeight(3);

			local iGrassTop = earth:GetHeight(3);
			local iGrassBottom = earth:GetHeight(0);

			local earthVal = earth:GetHeight(iX, iY);

			-- north pole
			if (iDistanceFromCenter < 15 or iDistanceFromCenter > 115) then
				if (plotTypes[index] == g_PLOT_TYPE_MOUNTAIN) then
					terrainTypes[index] = g_TERRAIN_TYPE_SNOW_MOUNTAIN;
				elseif (plotTypes[index] ~= g_PLOT_TYPE_OCEAN) then
					terrainTypes[index] = g_TERRAIN_TYPE_SNOW;
				end

			elseif (iDistanceFromCenter < 20 or iDistanceFromCenter > 110) then
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
			elseif ((iDistanceFromCenter > 80 and iDistanceFromCenter < 103 and iAzimuth > 22 and iAzimuth < 64)
					or (iDistanceFromCenter > 44 and iDistanceFromCenter < 66 and iAzimuth > -109 and iAzimuth < -31)) then
				-- desert
				iGrassTop = earth:GetHeight(100);
				iGrassBottom = earth:GetHeight(97);
				
				iPlainsTop = earth:GetHeight(97);
				iPlainsBottom = earth:GetHeight(90);

				iDesertTop = earth:GetHeight(90);
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

			-- arctic circle
			elseif (iDistanceFromCenter < 25 or iDistanceFromCenter > 105) then
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
			
			-- southeast asia & central america
			elseif (iDistanceFromCenter > 48 or iDistanceFromCenter < 80) then
				-- rainforest
				iGrassTop = earth:GetHeight(100);
				iGrassBottom = earth:GetHeight(30);
																		
				iPlainsTop = earth:GetHeight(30);
				iPlainsBottom = earth:GetHeight(10);

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
			elseif (iDistanceFromCenter < 35 or iDistanceFromCenter > 90) then
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

------------------------------------------------------------------------------
function FeatureGenerator:AddIceToMap()
	local iTargetIceTiles = (self.iGridH * self.iGridW *  (GlobalParameters.ICE_TILES_PERCENT + self.iIceModifiedPercent)) / 100;

	local aPhases = {};
	local iPhases = 0;
	for row in GameInfo.RandomEvents() do
		if (row.EffectOperatorType == "SEA_LEVEL") then
			local kPhaseDetails = {};
			kPhaseDetails.RandomEventEnum = row.Index;
			kPhaseDetails.IceLoss = row.IceLoss;
			table.insert(aPhases, kPhaseDetails);
			iPhases = iPhases + 1;
		end
	end
	
	if (iPhases <= 0) then 
		return;
	end

	------------------------------
	-- PHASE ONE: PERMANENT ICE --
	------------------------------
	local iIceLossThisLevel = aPhases[iPhases].IceLoss;
	local iPermanentIcePercent = 100 - iIceLossThisLevel;
	local iPermanentIceTiles = (iTargetIceTiles * iPermanentIcePercent) / 100;

	print ("Permanent Ice Tiles: " .. tostring(iPermanentIceTiles));

	local iPercentNeeded = 75;

	-- poles
	for x = 0, self.iGridW - 1, 1 do
		for y = self.iGridH - 1, 0, -1 do
			local i = y * self.iGridW + x;

			local plot = Map.GetPlotByIndex(i);
			if (plot ~= nil) then
				if(TerrainBuilder.CanHaveFeature(plot, g_FEATURE_ICE) == true and IsAdjacentToLandPlot(x, y) == false) then
					if (TerrainBuilder.GetRandomNumber(100, "Permanent Ice") <= iPercentNeeded) then
						AddIceAtPlot(plot, x, y, -1); 
					end
				end
			end
		end
	end

	---------------------------------------
	-- PHASE TWO: ICE THAT CAN DISAPPEAR --
	---------------------------------------
	if (iPhases > 1) then
		for iPhaseIndex = iPhases, 1, -1 do
			kPhaseDetails = aPhases[iPhaseIndex];
			local iIcePercentToAdd = 0;
			if (iPhaseIndex == 1) then 
				iIcePercentToAdd = kPhaseDetails.IceLoss;			
			else
				iIcePercentToAdd = kPhaseDetails.IceLoss - aPhases[iPhaseIndex - 1].IceLoss;
			end
			local iIceTilesToAdd = (iTargetIceTiles * iIcePercentToAdd) / 100;

			print ("iPhaseIndex: " .. tostring(iPhaseIndex) .. ", iIceTilesToAdd: " .. tostring(iIceTilesToAdd) .. ", RandomEventEnum: " .. tostring(kPhaseDetails.RandomEventEnum));

			-- Find all plots on map adjacent to already-placed ice
			local aTargetPlots = {};
			for y = 0, self.iGridH - 1, 1 do
				for x = 0, self.iGridW - 1, 1 do
					local i = y * self.iGridW + x;
					local plot = Map.GetPlotByIndex(i);
					if (plot ~= nil) then
						local iAdjacent = TerrainBuilder.GetAdjacentFeatureCount(plot, g_FEATURE_ICE);
						if (TerrainBuilder.CanHaveFeature(plot, g_FEATURE_ICE) == true and iAdjacent > 0) then
							local kPlotDetails = {};
							kPlotDetails.PlotIndex = i;
							kPlotDetails.AdjacentIce = iAdjacent;
							kPlotDetails.AdjacentToLand = IsAdjacentToLandPlot(x, y);
							table.insert(aTargetPlots, kPlotDetails);
						end
					end
				end
			end

			-- Roll die to see which of these get ice
			if (#aTargetPlots > 0) then
				local iPercentNeeded = 100 * iIceTilesToAdd / #aTargetPlots;
				for i, targetPlot in ipairs(aTargetPlots) do
					local iFinalPercentNeeded = iPercentNeeded + 10 * targetPlot.AdjacentIce;
					if (targetPlot.AdjacentToLand == true) then
						iFinalPercentNeeded = iFinalPercentNeeded / 5;
					end
					if (TerrainBuilder.GetRandomNumber(100, "Permanent Ice") <= iFinalPercentNeeded) then
					    local plot = Map.GetPlotByIndex(targetPlot.PlotIndex);
						AddIceAtPlot(plot, plot:GetX(), plot:GetY(), kPhaseDetails.RandomEventEnum); 
					end
				end
			end
		end
	end
end

------------------------------------------------------------------------------
function AddIceAtPlot(plot, iX, iY, iE)
	local iDistanceFromCenter = __GetPlotDistance(iX, iY, g_CenterX, g_CenterY);	-- radial
	local iV = TerrainBuilder.GetRandomNumber(8, "Random variance");
	
	if (iDistanceFromCenter + iV < 26 or iDistanceFromCenter + iV > 113) then
		local iScore = TerrainBuilder.GetRandomNumber(100, "Resource Placement Score Adjust");

		iScore = iScore + math.abs(((68 - iDistanceFromCenter)/68)) * 100;		-- 68 is approx. half max. dist. from center

		if(IsAdjacentToLandPlot(iX,iY) == true) then
			iScore = iScore / 1.42;
		end

		local iAdjacent = TerrainBuilder.GetAdjacentFeatureCount(plot, g_FEATURE_ICE);
		iScore = iScore + 10.0 * iAdjacent;

		if(iScore > 130) then
			TerrainBuilder.SetFeatureType(plot, g_FEATURE_ICE);
			TerrainBuilder.AddIce(plot:GetIndex(), iE); 
		end
	end

	return false;
end

-- override: for a radial equator 
function FeatureGenerator:AddJunglesAtPlot(plot, iX, iY)
	--Jungle Check. First see if it can place the feature.
	if(TerrainBuilder.CanHaveFeature(plot, g_FEATURE_JUNGLE)) then
		if(math.ceil(self.iJungleCount * 100 / self.iNumLandPlots) <= self.iJungleMaxPercent) then
			local iEquator = 72;		-- approx. measurement from sat. img
			local iJungleBottom = iEquator -  math.ceil(self.iJungleMaxPercent * 0.5);
			local iJungleTop = iEquator +  math.ceil(self.iJungleMaxPercent * 0.5);

			local iDistanceFromCenter = __GetPlotDistance(iX, iY, g_CenterX, g_CenterY);	-- radial

			if(iDistanceFromCenter >= iJungleBottom  and iDistanceFromCenter <= iJungleTop) then 
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
	--Reef Check. First see if it can place the feature.
	if(TerrainBuilder.CanHaveFeature(plot, g_FEATURE_REEF)) then
		self.iNumReefablePlots = self.iNumReefablePlots + 1;
		if(math.ceil(self.iReefCount * 100 / self.iNumReefablePlots) <= self.iReefMaxPercent) then
				local iDistanceFromCenter = __GetPlotDistance(iX, iY, g_CenterX, g_CenterY);	-- radial

				--Weight based on adjacent plots
				local iEquator = 72;		-- approx. measurement from sat. img
				local iScore  = 3 * math.abs(72 - iDistanceFromCenter);
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
function AddFeaturesFromContinents()
	print("Adding Features from Continents");

	featuregen:AddFeaturesFromContinents();
end

-- bugfix/patch - remember pythagoras?
function __GetPlotDistance(iX1, iY1, iX0, iY0)
	return math.sqrt((iX1-iX0)^2 + (iY1-iY0)^2);
end

-- the angle of (iX1, iY1) relative to (iX0, iY0) in degrees
function Azimuth(iX1, iY1, iX0, iY0)
	return math.deg(math.atan2(iY1-iY0, iX1-iX0));
end