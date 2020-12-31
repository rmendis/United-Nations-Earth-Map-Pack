-- AssignTrueStartingPlots
-- Author: blkbutterfly74
-- DateCreated: 3/17/2018 10:55:30 AM
------------------------------------------------------------------------------
AssignTrueStartingPlots = {};
------------------------------------------------------------------------------
function AssignTrueStartingPlots.Create(args)
	local instance = {

		-- Core Process member methods
		__InitStartingData				= AssignTrueStartingPlots.__InitStartingData,
		__GetIndex						= AssignTrueStartingPlots.__GetIndex,

		tsls = args.TRUE_START_LOCATIONS,
		centerX = args.CENTER_X,
		centerY = args.CENTER_Y,
	}

	instance:__InitStartingData();

	return instance;
end
------------------------------------------------------------------------------
function AssignTrueStartingPlots:__InitStartingData()
	for _, pPlayer in ipairs(Players) do
		local pPlayerConfig = PlayerConfigurations[pPlayer:GetID()];

		if (pPlayerConfig ~= nil) then
			local leaderName = pPlayerConfig:GetLeaderTypeName();
			
			if (leaderName ~= nil) then
				local v = self.tsls[leaderName];

				if (leaderName ~= "LEADER_FREE_CITIES") then	-- ignore free cities "civ"
					assert((v ~= nil), "No TSL for " .. leaderName);

					local i = self:__GetIndex(v[1], v[2]);
					local pPlot = Map.GetPlotByIndex(i);

					if (pPlayer == Game.GetLocalPlayer() and (pPlot:IsLake() or pPlot:IsMountain())) then
						error("Can't place TSL for local player", 2);	-- must throw exception
					else
						if (pPlot:IsMountain()) then
							error("Mountain block TSL for " .. leaderName .. " at index: " .. i); 
						elseif (pPlot:IsLake()) then
							error("Lake block TSL for " .. leaderName .. " at index: " .. i); 
						else	
							if (pPlot:IsWater()) then
								print("WARNING: Water placement for ", leaderName .. " at index: " .. i); 
							end

							-- o/w assign TSL
							pPlayer:SetStartingPlot(pPlot);
					
							print("Assigning TSL for", leaderName .. " at index: " .. i); 
						end
					end
				end
			end
		end

		--[[
		local pPlot = pPlayer:GetStartingPlot();
		if (pPlot ~= nil) then
			print("DEBUG: starting plot index: " .. pPlot:GetIndex());
		else
			--print("DEBUG: no starting plot assigned for " .. pPlayerConfig:GetLeaderTypeName());
		end
		--]]
	end 
end
------------------------------------------------------------------------------
function AssignTrueStartingPlots:__GetIndex(r, theta)
	local iX = self.centerX + __Round(r * math.cos(math.rad(theta)));
	local iY = self.centerY + __Round(r * math.sin(math.rad(theta)));

	local width, _ = Map.GetGridSize();

	return (iY * width + iX);		-- plot index from polar coord (deg)
end
------------------------------------------------------------------------------
function __Round(n)
	return math.floor(n + 0.5);
end
