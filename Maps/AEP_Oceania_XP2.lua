-- AEP_Oceania_XP2
-- Author: blkbutterfly74
-- DateCreated: 12/29/2020 5:23:31 PM
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
local g_CenterX = 1;
local g_CenterY = -31;

local g_iW, g_iH;
local g_iFlags = {};
local g_continentsFrac = nil;
local g_iNumTotalLandTiles = 0;
local featuregen = nil;

local landStrips = {
		{0, 170, 198},
		{1, 171, 198},
		{2, 125, 131},
		{2, 174, 198},
		{3, 121, 133},
		{3, 176, 198},
		{4, 116, 118},
		{4, 120, 126},
		{4, 177, 198},
		{5, 114, 118},
		{5, 122, 123},
		{5, 178, 198},
		{6, 111, 119},
		{6, 180, 198},
		{7, 116, 118},
		{7, 181, 198},
		{8, 118, 119},
		{8, 182, 198},
		{9, 119, 120},
		{9, 184, 198},
		{10, 121, 121},
		{10, 185, 198},
		{11, 186, 198},
		{12, 187, 198},
		{13, 188, 198},
		{14, 189, 198},
		{15, 190, 198},
		{16, 190, 198},
		{17, 191, 198},
		{18, 164, 164},
		{18, 192, 198},
		{19, 163, 166},
		{19, 193, 198},
		{20, 159, 159},
		{20, 163, 167},
		{20, 193, 198},
		{21, 127, 127},
		{21, 130, 130},
		{21, 153, 153},
		{21, 156, 161},
		{21, 166, 167},
		{21, 196, 198},
		{22, 112, 113},
		{22, 125, 125},
		{22, 128, 128},
		{22, 130, 131},
		{22, 151, 164},
		{22, 167, 168},
		{22, 197, 198},
		{23, 110, 110},
		{23, 132, 132},
		{23, 150, 165},
		{23, 198, 198},
		{24, 126, 126},
		{24, 150, 166},
		{24, 168, 168},
		{25, 127, 127},
		{25, 150, 168},
		{26, 127, 128},
		{26, 150, 169},
		{27, 151, 170},
		{28, 152, 171},
		{29, 152, 172},
		{30, 152, 173},
		{31, 133, 133},
		{31, 153, 172},
		{32, 154, 173},
		{33, 134, 135},
		{33, 154, 173},
		{34, 155, 175},
		{35, 136, 136},
		{35, 138, 138},
		{35, 144, 144},
		{35, 156, 173},
		{36, 138, 138},
		{36, 156, 176},
		{37, 140, 140},
		{37, 144, 144},
		{37, 156, 177},
		{38, 140, 140},
		{38, 147, 148},
		{38, 156, 177},
		{39, 141, 141},
		{39, 148, 149},
		{39, 156, 177},
		{40, 149, 150},
		{40, 156, 177},
		{41, 143, 146},
		{41, 150, 151},
		{41, 157, 178},
		{42, 143, 143},
		{42, 147, 147},
		{42, 150, 151},
		{42, 157, 160},
		{42, 163, 179},
		{43, 139, 139},
		{43, 149, 152},
		{43, 157, 159},
		{43, 163, 179},
		{44, 150, 155},
		{44, 164, 181},
		{45, 132, 132},
		{45, 151, 156},
		{45, 165, 181},
		{46, 148, 148},
		{46, 151, 158},
		{46, 166, 182},
		{47, 152, 158},
		{47, 166, 183},
		{48, 153, 159},
		{48, 164, 184},
		{49, 154, 160},
		{49, 165, 185},
		{50, 155, 159},
		{50, 165, 186},
		{51, 156, 159},
		{51, 166, 187},
		{52, 156, 159},
		{52, 167, 188},
		{53, 157, 160},
		{53, 162, 163},
		{53, 167, 189},
		{54, 160, 160},
		{54, 163, 163},
		{54, 168, 190},
		{55, 158, 158},
		{55, 161, 161},
		{55, 169, 169},
		{55, 173, 190},
		{56, 161, 162},
		{56, 166, 166},
		{56, 173, 191},
		{57, 160, 162},
		{57, 174, 192},
		{58, 161, 162},
		{58, 174, 192},
		{59, 162, 162},
		{59, 164, 164},
		{59, 175, 193},
		{60, 162, 162},
		{60, 165, 165},
		{60, 170, 171},
		{60, 178, 194},
		{61, 166, 16},
		{61, 170, 172},
		{61, 179, 195},
		{62, 167, 167},
		{62, 172, 173},
		{62, 182, 196},
		{63, 163, 165},
		{63, 174, 175},
		{63, 183, 196},
		{64, 162, 164},
		{64, 167, 167},
		{64, 184, 196},
		{65, 168, 166},
		{65, 174, 174},
		{65, 185, 194},
		{65, 196, 196},
		{66, 162, 162},
		{66, 165, 166},
		{66, 170, 171},
		{66, 174, 174},
		{66, 176, 176},
		{66, 185, 194},
		{67, 166, 166},
		{67, 169, 169},
		{67, 171, 172},
		{67, 175, 176},
		{67, 186, 193},
		{68, 160, 162},
		{68, 167, 167},
		{68, 170, 170},
		{68, 173, 173},
		{68, 186, 193},
		{69, 160, 163},
		{69, 168, 168},
		{69, 170, 170},
		{69, 172, 174},
		{69, 176, 176},
		{69, 187, 192},
		{70, 161, 162},
		{70, 168, 168},
		{70, 170, 173},
		{70, 176, 177},
		{70, 188, 192},
		{71, 158, 159},
		{71, 162, 164},
		{71, 169, 172},
		{71, 177, 178},
		{71, 189, 190},
		{71, 192, 192},
		{72, 163, 164},
		{72, 178, 178},
		{73, 136, 136},
		{73, 158, 159},
		{73, 161, 161},
		{73, 166, 166},
		{73, 170, 170},
		{73, 178, 178}};

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

	-- no large lakes
	AddLakes();

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
	local Width = 90;
	local Height = 73;
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
	local xOffset = -109;
	local yOffset = 0;
		
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

	-- antarctic ice sheet core
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