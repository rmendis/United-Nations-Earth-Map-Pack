-- AEPEarth_XP2
-- Author: blkbutterfly74
-- DateCreated: 12/29/2020 9:29:19 PM
-- Creates a ginormous map of AEP Earth 
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

include "AssignTrueStartingPlots"

local earth = nil;

-- north pole
local g_CenterX = 110;
local g_CenterY = 94;

local g_iE = 70.6;			-- approx. distance to equator from north pole (measured from image of map)

-- TSLs in polar coords (deg) from N.P.
local g_TSLs = {
	LEADER_GITARJA = {75, 21},
	LEADER_JOHN_CURTIN = {97, 59},
	LEADER_JAYAVARMAN = {60, 13},
	LEADER_HOJO = {39.6, 47.0},
	LEADER_QIN = {42, 25},
	LEADER_MONTEZUMA = {58, -178},
	LEADER_MINOR_CIV_HONG_KONG = {50.7, 22.0},
	LEADER_MINOR_CIV_JAKARTA = {65, 25},	-- Bandar Brunei
	LEADER_MINOR_CIV_LA_VENTA = {57, 178},
	LEADER_MINOR_CIV_NAN_MADOL = {63, 69.86};
	--LEADER_MINOR_CIV_SEOUL = {40, 36},
	LEADER_MINOR_CIV_AUCKLAND = {100, 87},
	-- LEADER_MINOR_CIV_PALENQUE cannot be placed cos of proximity to La Venta
	LEADER_T_ROOSEVELT = {39.8, -162.5},
	LEADER_T_ROOSEVELT_ROUGHRIDER = {39.8, -162.5},
	LEADER_SALADIN = {47.5, -59.7},
	LEADER_PEDRO = {99.6, -146.5},
	LEADER_CLEOPATRA = {47, -60.7},
	LEADER_VICTORIA = {31, -91.8},
	LEADER_CATHERINE_DE_MEDICI = {35, -91.6},
	LEADER_BARBAROSSA = {32.1, -84.6},
	LEADER_GORGO = {41.8, -69},
	LEADER_PERICLES = {41.8, -68.7},
	LEADER_GANDHI = {45.4, -14},
	LEADER_MVEMBA = {75.9, -77.1},
	LEADER_HARDRADA = {21.2, -81.9},
	LEADER_TRAJAN = {39.1, -76.7},
	LEADER_PETER_GREAT = {24.7, -68.6},
	LEADER_TOMYRIS = {36.8, -22.4},
	LEADER_PHILIP_II = {39.2, -95.9},
	LEADER_GILGAMESH = {44.6, -45.9},
	LEADER_ALEXANDER = {38.3, -70.1},
	LEADER_CYRUS = {46.4, -37.1},
	LEADER_AMANITORE = {60.2, -54.5},
	LEADER_JADWIGA = {32.6, -72.1},
	--LEADER_MINOR_CIV_AMSTERDAM = {30.1, -84.3}, 
	--LEADER_MINOR_CIV_BRUSSELS cannot be placed cos of proximity to england, germany
	LEADER_MINOR_CIV_BUENOS_AIRES = {102.9, -154.7},
	LEADER_MINOR_CIV_CARTHAGE = {43.6, -80.8},
	LEADER_MINOR_CIV_GENEVA = {36.1, -85.2},
	LEADER_MINOR_CIV_HATTUSA = {39.4, -59.5},
	--LEADER_MINOR_CIV_JERUSALEM = {46, -55.6},	-- blocked by Dido
	LEADER_MINOR_CIV_KABUL = {42, -25.4},
	LEADER_MINOR_CIV_KANDY = {64.1, -10.8},
	LEADER_MINOR_CIV_KUMASI = {65.1, -92.6},
	LEADER_JOAO_III = {42.4, -98.1},
	LEADER_MINOR_CIV_MOHENJO_DARO = {52.5, -17.8},
	--LEADER_MINOR_CIV_PRESLAV = {38.5, -65.4},    blocked by Ottoman and Byzantium
	--LEADER_MINOR_CIV_STOCKHOLM = {24.7, -76},	-- now a civ
	LEADER_MINOR_CIV_TORONTO = {37.1, -166},
	--LEADER_MINOR_CIV_VALLETTA = {42.2, -76.3},
	--LEADER_MINOR_CIV_VILNIUS = {29.7, -70.3},
	--LEADER_MINOR_CIV_YEREVAN = {40.4, -48}, removed cos of proximity to Georgia
	LEADER_MINOR_CIV_ZANZIBAR = {75.6, -52.5},
	LEADER_MINOR_CIV_ANTANANARIVO = {85.6, -43.6},
	LEADER_MINOR_CIV_ARMAGH = {30.4, -99.5},
	--LEADER_MINOR_CIV_GRANADA = {41, -92.7},
	LEADER_MINOR_CIV_MUSCAT = {52.7, -33.4},
	LEADER_MINOR_CIV_ANTIOCH = {35.9, -77.1},		-- Venice
	LEADER_MINOR_CIV_BABYLON = {48.4, 38.3},	-- anshan
	LEADER_POUNDMAKER = {30.4, 163},
	LEADER_TAMAR = {36.8, -47.2},
	LEADER_CHANDRAGUPTA = {48.2, -4.8},
	LEADER_SEONDEOK = {40, 36.9},
	LEADER_LAUTARO = {99.3, -161.2},
	LEADER_GENGHIS_KHAN = {33.8, 19},
	LEADER_WILHELMINA = {30.1, -84.3}, 
	LEADER_ROBERT_THE_BRUCE = {27.2, -96.3},
	LEADER_SHAKA = {91.9, -59.25},
	LEADER_LADY_SIX_SKY = {61.4, -173.5},
	LEADER_SIMON_BOLIVAR = {68, -162.9},
	LEADER_KUPE = {88.2, 86},
	LEADER_PACHACUTI = {83, -160.5},
	LEADER_LAURIER = {37.1, -166},
	LEADER_MINOR_CIV_CAGUANA = {56.6, -159.3},
	LEADER_MINOR_CIV_CAHOKIA = {39, -178.5},
	LEADER_MINOR_CIV_AYUTTHAYA = {57.7, 9},
	LEADER_MINOR_CIV_LAHORE = {47.1, -17.3},
	LEADER_MINOR_CIV_SAMARKAND = {41, -28},
	LEADER_MINOR_CIV_SINGAPORE = {66.53, 11.3},
	LEADER_MINOR_CIV_TARUGA = {64.4, -83.76},
	--LEADER_MINOR_CIV_VATICAN_CITY blocked by Rome
	LEADER_MINOR_CIV_WOLIN = {29.6, -78.31},
	LEADER_AMBIORIX = {31.1, -86.3},
	LEADER_BASIL = {39.8, -64.72},
	LEADER_MENELIK = {64.7, -50.65},
	LEADER_CATHERINE_DE_MEDICI_ALT = {35, -91.6},
	LEADER_DIDO = {45.5, -56.7},
	LEADER_ELEANOR_ENGLAND = {31, -91.8},
	LEADER_ELEANOR_FRANCE = {35, -91.6},
	LEADER_KRISTINA = {24.7, -76},
	LEADER_MANSA_MUSA = {63.4, -96.34},
	LEADER_MATTHIAS_CORVINUS = {35.7, -72.1},
	LEADER_SULEIMAN = {39.8, -64.72},
	LEADER_HAMMURABI = {43.9, -43.2},
	LEADER_LADY_TRIEU = {51.2, 17},
	LEADER_KUBLAI_KHAN_CHINA = {36.4, 31.5},
	LEADER_KUBLAI_KHAN_MONGOLIA = {36.4, 31.5},

	--LEADER_MINOR_CIV_AKKAD	--blocked by Babylon and Sumeria
	LEADER_MINOR_CIV_BOLOGNA = {36.5, -80.5},
	--LEADER_MINOR_CIV_CARDIFF = {30.1, -93.81},	-- blocked by England
	LEADER_MINOR_CIV_FEZ = {45.3, -96.5},
	LEADER_MINOR_CIV_NGAZARGAMU = {59.4, -77.4},
	LEADER_MINOR_CIV_LISBON = {68.6, -46.8},		-- Mogadishu

	-- cvs & tcs city states
	CVS_LEADER_MINOR_CIV_CHETRO_KETL = {42.2, 166.3},
	CVS_LEADER_MINOR_CIV_ETZANOA = {38.6, 169.6},
	CVS_LEADER_MINOR_CIV_IQUALUIT = {20.6, -157.2},
	CVS_LEADER_MINOR_CIV_TAOS = {44.4, 165.7},
	CVS_LEADER_MINOR_CIV_TUNERIUT = {20.2, -171.5},
	CVS_LEADER_MINOR_CIV_WYAM = {43.3, 161.2},
	TCS_LEADER_MINOR_CIV_CHAN_CHAN = {76.7, -168},
	TCS_LEADER_MINOR_CIV_GUAPONDELIG = {72.6, -168.1},
	TCS_LEADER_MINOR_CIV_KUHIKUGU = {78.8, -146.9},
	TCS_LEADER_MINOR_CIV_TEYUNA = {62.3, -161.3},
};

local g_iW, g_iH;
local g_iFlags = {};
local g_continentsFrac = nil;
local g_iNumTotalLandTiles = 0;
local featuregen = nil;

local landStrips = {
		{0, 0, 36},
		{0, 170, 198},
		{1, 0, 35},
		{1, 171, 198},
		{2, 0, 34},
		{2, 125, 131},
		{2, 174, 198},
		{3, 0, 33},
		{3, 121, 133},
		{3, 176, 198},
		{4, 0, 31},
		{4, 116, 118},
		{4, 120, 126},
		{4, 177, 198},
		{5, 0, 30},
		{5, 114, 118},
		{5, 122, 123},
		{5, 178, 198},
		{6, 0, 28},
		{6, 111, 119},
		{6, 180, 198},
		{7, 0, 27},
		{7, 116, 118},
		{7, 181, 198},
		{8, 0, 26},
		{8, 118, 119},
		{8, 182, 198},
		{9, 0, 25},
		{9, 119, 120},
		{9, 184, 198},
		{10, 0, 23},
		{10, 121, 121},
		{10, 185, 198},
		{11, 0, 23},
		{11, 186, 198},
		{12, 0, 22},
		{12, 187, 198},
		{13, 0, 21},
		{13, 188, 198},
		{14, 0, 19},
		{14, 189, 198},
		{15, 0, 18},
		{15, 190, 198},
		{16, 0, 17},
		{16, 190, 198},
		{17, 0, 17},
		{17, 191, 198},
		{18, 0, 16},
		{18, 164, 164},
		{18, 192, 198},
		{19, 0, 15},
		{19, 163, 166},
		{19, 193, 198},
		{20, 0, 14},
		{20, 159, 159},
		{20, 163, 167},
		{20, 193, 198},
		{21, 0, 13},
		{21, 127, 127},
		{21, 130, 130},
		{21, 153, 153},
		{21, 156, 161},
		{21, 166, 167},
		{21, 196, 198},
		{22, 0, 12},
		{22, 112, 113},
		{22, 125, 125},
		{22, 128, 128},
		{22, 130, 131},
		{22, 151, 164},
		{22, 167, 168},
		{22, 197, 198},
		{23, 0, 11},
		{23, 110, 110},
		{23, 132, 132},
		{23, 150, 165},
		{23, 198, 198},
		{24, 0, 10},
		{24, 126, 126},
		{24, 150, 166},
		{24, 168, 168},
		{25, 0, 9},
		{25, 127, 127},
		{25, 150, 168},
		{26, 0, 9},
		{26, 127, 128},
		{26, 150, 169},
		{27, 0, 8},
		{27, 151, 170},
		{28, 0, 8},
		{28, 152, 171},
		{29, 0, 7},
		{29, 152, 172},
		{30, 0, 7},
		{30, 152, 173},
		{31, 0, 6},
		{31, 133, 133},
		{31, 153, 172},
		{32, 0, 5},
		{32, 154, 173},
		{33, 0, 4},
		{33, 134, 135},
		{33, 154, 173},
		{34, 0, 4},
		{34, 155, 175},
		{35, 0, 3},
		{35, 136, 136},
		{35, 138, 138},
		{35, 144, 144},
		{35, 156, 173},
		{36, 0, 2},
		{36, 138, 138},
		{36, 156, 176},
		{37, 0, 1},
		{37, 140, 140},
		{37, 144, 144},
		{37, 156, 177},
		{38, 0, 1},
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
		{78, 103, 103},
		{78, 120, 120},
		{78, 122, 122},
		{78, 131, 132},
		{78, 143, 143},
		{78, 169, 176},
		{78, 179, 180},
		{79, 102, 102},
		{79, 119, 120},
		{79, 129, 129},
		{79, 152, 154},
		{79, 170, 176},
		{79, 179, 180},
		{80, 101, 101},
		{80, 118, 120},
		{80, 128, 129},
		{80, 141, 142},
		{80, 144, 144},
		{80, 153, 154},
		{80, 172, 176},
		{80, 180, 180},
		{81, 100, 100},
		{81, 117, 120},
		{81, 127, 128},
		{81, 131, 136},
		{81, 140, 142},
		{81, 147, 151},
		{81, 172, 177},
		{81, 180, 181},
		{82, 99, 99},
		{82, 117, 119},
		{82, 127, 127},
		{82, 130, 142},
		{82, 147, 155},
		{82, 173, 176},
		{82, 180, 181},
		{83, 97, 99},
		{83, 101, 103},
		{83, 102, 103},
		{83, 116, 118},
		{83, 126, 142},
		{83, 146, 156},
		{83, 174, 175},
		{83, 180, 181},
		{84, 72, 77},
		{84, 98, 104},
		{84, 111, 116},
		{84, 126, 141},
		{84, 144, 144},
		{84, 146, 157},
		{84, 178, 178},
		{84, 180, 181},
		{85, 71, 78},
		{85, 98, 104},
		{85, 109, 116},
		{85, 119, 120},
		{85, 127, 142},
		{85, 144, 157},
		{85, 173, 173},
		{85, 181, 181},
		{86, 64, 79},
		{86, 97, 103},
		{86, 106, 106},
		{86, 110, 122},
		{86, 128, 158},
		{86, 166, 167},
		{86, 178, 179},
		{87, 62, 64},
		{87, 68, 81},
		{87, 83, 85},
		{87, 88, 89},
		{87, 95, 104},
		{87, 110, 161},
		{87, 164, 168},
		{87, 178, 181},
		{88, 60, 62},
		{88, 65, 104},
		{88, 106, 159},
		{88, 161, 161},
		{88, 164, 169},
		{88, 177, 181},
		{89, 64, 103},
		{89, 108, 159},
		{89, 163, 170},
		{89, 176, 176},
		{89, 178, 181},
		{90, 61, 105},
		{90, 111, 160},
		{90, 163, 170},
		{90, 178, 180},
		{91, 59, 104},
		{91, 109, 109},
		{91, 113, 169},
		{91, 174, 175},
		{91, 177, 180},
		{92, 56, 103},
		{92, 114, 169},
		{92, 173, 175},
		{92, 177, 179},
		{93, 55, 102},
		{93, 110, 110},
		{93, 115, 168},
		{93, 173, 174},
		{93, 177, 179},
		{94, 54, 99},
		{94, 116, 168},
		{94, 172, 174},
		{94, 176, 177},
		{95, 54, 98},
		{95, 117, 167},
		{95, 171, 173},
		{95, 176, 177},
		{95, 179, 179},
		{96, 53, 97},
		{96, 115, 115},
		{96, 119, 172},
		{96, 175, 176},
		{97, 53, 95},
		{97, 116, 116},
		{97, 120, 170},
		{97, 175, 176},
		{97, 178, 178},
		{98, 52, 94},
		{98, 97, 97},
		{98, 116, 117},
		{98, 119, 167},
		{98, 175, 175},
		{99, 52, 56},
		{99, 58, 92},
		{99, 97, 98}, 
		{99, 120, 166},
		{99, 175, 175},
		{100, 52, 54},
		{100, 60, 92},
		{100, 94, 95},
		{100, 97, 97},
		{100, 121, 166},
		{101, 52, 53},
		{101, 61, 92},
		{101, 94, 96},
		{101, 99, 100},
		{101, 121, 167},
		{102, 52, 53},
		{102, 62, 92},
		{102, 94, 96},
		{102, 98, 98},
		{102, 100, 100},
		{102, 119, 164},
		{102, 173, 173},
		{103, 51, 53},
		{103, 63, 91},
		{103, 119, 163},
		{103, 169, 170},
		{104, 50, 53},
		{104, 62, 93},
		{104, 95, 96},
		{104, 98, 98},
		{104, 100, 100},
		{104, 117, 117},
		{104, 119, 162},
		{105, 50, 54},
		{105, 61, 84},
		{105, 87, 94},
		{105, 96, 96},
		{105, 116, 117},
		{105, 120, 162},
		{106, 42, 43},
		{106, 49, 55},
		{106, 61, 83},
		{106, 88, 92},
		{106, 100, 102},
		{106, 116, 117},
		{106, 120, 162},
		{107, 49, 55},
		{107, 62, 83},
		{107, 91, 91},
		{107, 94, 95},
		{107, 97, 97},
		{107, 99, 103},
		{107, 121, 162},
		{108, 49, 51},
		{108, 54, 55},
		{108, 62, 82},
		{108, 88, 89},
		{108, 91, 92},
		{108, 94, 95},
		{108, 99, 103},
		{108, 117, 117},
		{108, 122, 162},
		{109, 49, 51},
		{109, 55, 55},
		{109, 63, 82},
		{109, 94, 96},
		{109, 115, 115},
		{109, 121, 163},
		{110, 48, 51},
		{110, 62, 81},
		{110, 90, 90},
		{110, 92, 92},
		{110, 94, 95},
		{110, 99, 106},
		{110, 115, 116},
		{110, 119, 119},
		{110, 121, 163},
		{111, 47, 51},
		{111, 56, 56},
		{111, 62, 81},
		{111, 85, 88},
		{111, 90, 91},
		{111, 93, 95},
		{111, 100, 106},
		{111, 114, 114},
		{111, 119, 120},
		{111, 122, 164},
		{112, 47, 51},
		{112, 56, 57},
		{112, 61, 82},
		{112, 84, 87},
		{112, 90, 94},
		{112, 99, 107},
		{112, 119, 120},
		{112, 123, 164},
		{113, 46, 47},
		{113, 50, 51},
		{113, 57, 57},
		{113, 60, 87},
		{113, 89, 93},
		{113, 99, 107},
		{113, 112, 112},
		{113, 120, 120},
		{113, 123, 165},
		{114, 46, 46},
		{114, 57, 57},
		{114, 59, 61},
		{114, 65, 87},
		{114, 89, 93},
		{114, 97, 106},
		{114, 111, 112},
		{114, 120, 121},
		{114, 123, 165},
		{115, 46, 46},
		{115, 57, 57},
		{115, 66, 86},
		{115, 89, 90},
		{115, 92, 92},
		{115, 96, 106},
		{115, 111, 113},
		{115, 121, 121},
		{115, 123, 166},
		{116, 45, 46},
		{116, 57, 57},
		{116, 59, 59},
		{116, 61, 61},
		{116, 67, 87},
		{116, 95, 105},
		{116, 112, 112},
		{116, 122, 168},
		{116, 171, 173},
		{117, 36, 36},
		{117, 46, 47},
		{117, 56, 57},
		{117, 59, 59},
		{117, 72, 87},
		{117, 94, 105},
		{117, 123, 169},
		{117, 172, 173},
		{118, 35, 36},
		{118, 38, 40},
		{118, 47, 47},
		{118, 54, 54},
		{118, 56, 57},
		{118, 74, 78},
		{118, 80, 86},
		{118, 94, 104},
		{118, 121, 121},
		{118, 123, 170},
		{119, 35, 41},
		{119, 46, 47},
		{119, 54, 54},
		{119, 56, 57},
		{119, 59, 59},
		{119, 73, 73},
		{119, 76, 79},
		{119, 81, 85},
		{119, 93, 103},
		{119, 116, 116},
		{119, 123, 171},
		{120, 34, 42},
		{120, 46, 47},
		{120, 56, 56},
		{120, 58, 58},
		{120, 77, 79},
		{120, 82, 85},
		{120, 93, 103},
		{120, 115, 120},
		{120, 122, 171},
		{121, 33, 48},
		{121, 76, 78},
		{121, 82, 85},
		{121, 92, 101},
		{121, 114, 118},
		{121, 122, 170},
		{122, 33, 49},
		{122, 55, 55},
		{122, 58, 58},
		{122, 78, 79},
		{122, 85, 85},
		{122, 93, 95},
		{122, 113, 119},
		{122, 121, 167},
		{123, 32, 50},
		{123, 56, 56},
		{123, 79, 79},
		{123, 81, 83},
		{123, 93, 93},
		{123, 101, 102},
		{123, 113, 161},
		{124, 31, 50},
		{124, 56, 57},
		{124, 82, 83},
		{124, 101, 104},
		{124, 113, 115},
		{124, 118, 160},
		{125, 30, 51},
		{125, 57, 57},
		{125, 82, 83},
		{125, 102, 104},
		{125, 113, 115},
		{125, 117, 157},
		{126, 30, 51},
		{126, 57, 57},
		{126, 82, 82},
		{126, 112, 115},
		{126, 117, 156},
		{127, 30, 52},
		{127, 111, 115},
		{127, 118, 118},
		{127, 120, 154},
		{128, 30, 52},
		{128, 57, 57},
		{128, 111, 116},
		{128, 119, 154},
		{129, 30, 51},
		{129, 58, 58},
		{129, 111, 116},
		{129, 119, 135},
		{129, 140, 154},
		{130, 30, 52},
		{130, 107, 107},
		{130, 111, 112},
		{130, 114, 115},
		{130, 119, 135},
		{130, 142, 153},
		{131, 30, 52},
		{131, 106, 108},
		{131, 115, 115},
		{131, 119, 138},
		{131, 143, 152},
		{132, 30, 52},
		{132, 107, 107},
		{132, 113, 113},
		{132, 118, 138},
		{132, 142, 151},
		{133, 4, 4},
		{133, 6, 6},
		{133, 30, 53},
		{133, 104, 104},
		{133, 107, 108},
		{133, 113, 113},
		{133, 117, 150},
		{133, 153, 154},
		{134, 3, 5},
		{133, 7, 7},
		{134, 30, 54},
		{134, 59, 59},
		{134, 104, 105},
		{134, 107, 109},
		{134, 112, 131},
		{134, 134, 149},
		{134, 152, 155},
		{135, 2, 8},
		{135, 10, 15},
		{135, 28, 54},
		{135, 57, 57},
		{135, 104, 105},
		{135, 107, 109},
		{135, 112, 126},
		{135, 128, 129},
		{135, 134, 148},
		{135, 151, 155},
		{136, 3, 8},
		{136, 11, 17},
		{136, 19, 55},
		{136, 106, 109},
		{136, 111, 126},
		{136, 133, 147},
		{136, 151, 155},
		{137, 2, 54},
		{137, 111, 125},
		{137, 130, 144},
		{137, 150, 155},
		{138, 2, 54},
		{138, 107, 125},
		{138, 129, 155},
		{139, 2, 54},
		{139, 107, 126},
		{139, 128, 155},
		{140, 2, 54},
		{140, 107, 116},
		{140, 118, 126},
		{140, 128, 132},
		{140, 134, 154},
		{141, 2, 2},
		{141, 4, 54},
		{141, 108, 117},
		{141, 121, 124},
		{141, 127, 130},
		{141, 135, 154},
		{141, 158, 158},
		{142, 3, 54},
		{142, 104, 105},
		{142, 108, 113},
		{142, 116, 118},
		{142, 122, 123},
		{142, 128, 130},
		{142, 132, 132},
		{142, 135, 154},
		{142, 157, 157},
		{143, 3, 3},
		{143, 5, 55},
		{143, 104, 111},
		{143, 118, 120},
		{143, 123, 125},
		{143, 135, 154},
		{144, 5, 56},
		{144, 103, 110},
		{144, 115, 115},
		{144, 119, 120},
		{144, 124, 125},
		{144, 135, 153},
		{144, 156, 156},
		{145, 3, 56},
		{145, 103, 109},
		{145, 115, 115},
		{145, 120, 120},
		{145, 127, 127},
		{145, 134, 135},
		{145, 136, 153},
		{145, 156, 157},
		{146, 3, 6},
		{146, 8, 56},
		{146, 103, 108},
		{146, 118, 118},
		{146, 131, 134},
		{146, 139, 152},
		{146, 156, 157},
		{147, 3, 5},
		{147, 8, 10},
		{147, 12, 57},
		{147, 104, 107},
		{147, 114, 116},
		{147, 128, 137},
		{147, 142, 152},
		{147, 155, 157},
		{148, 4, 5},
		{148, 9, 10},
		{148, 13, 57},
		{148, 109, 117},
		{148, 125, 139},
		{148, 147, 151},
		{148, 154, 158},
		{149, 4, 5},
		{149, 10, 11},
		{149, 13, 57},
		{149, 104, 116},
		{149, 120, 120},
		{149, 125, 141},
		{149, 150, 151},
		{149, 153, 158},
		{150, 4, 5},
		{150, 11, 11},
		{150, 14, 15},
		{150, 17, 57},
		{150, 102, 144},
		{150, 153, 158},
		{151, 5, 6},
		{151, 16, 16},
		{151, 18, 57},
		{151, 101, 158},
		{152, 6, 6},
		{152, 18, 57},
		{152, 95, 95},
		{152, 101, 158},
		{153, 19, 57},
		{153, 98, 158},
		{154, 7, 7},
		{154, 21, 57},
		{154, 97, 157},
		{155, 7, 7},
		{155, 21, 58},
		{155, 96, 157},
		{156, 22, 58},
		{156, 94, 157},
		{157, 23, 58},
		{157, 93, 157},
		{158, 24, 59},
		{158, 93, 156},
		{158, 169, 171},
		{159, 0, 0},
		{159, 24, 60},
		{159, 94, 156},
		{159, 170, 172},
		{160, 0, 1},
		{160, 26, 61},
		{160, 93, 156},
		{160, 169, 172},
		{161, 0, 2},
		{161, 13, 13},
		{161, 28, 62},
		{161, 93, 155},
		{161, 169, 173},
		{162, 0, 2},
		{162, 14, 14},
		{162, 30, 63},
		{162, 92, 155},
		{162, 169, 173},
		{163, 0, 3},
		{163, 30, 63},
		{163, 91, 156},
		{163, 168, 173},
		{164, 0, 3},
		{164, 15, 15},
		{164, 31, 63},
		{164, 91, 156},
		{164, 168, 174},
		{165, 0, 2},
		{165, 4, 4},
		{165, 35, 64},
		{165, 92, 157},
		{165, 167, 174},
		{166, 0, 2},
		{166, 4, 5},
		{166, 36, 40},
		{166, 43, 65},
		{166, 93, 160},
		{166, 167, 174},
		{167, 0, 1},
		{167, 5, 6},
		{167, 40, 40},
		{167, 44, 66},
		{167, 94, 161},
		{167, 168, 174},
		{168, 0, 0},
		{168, 6, 6},
		{168, 8, 8},
		{168, 46, 66},
		{168, 95, 162},
		{168, 169, 174},
		{169, 0, 0},
		{169, 7, 7},
		{169, 48, 64},
		{169, 95, 162},
		{169, 169, 173},
		{170, 7, 8},
		{170, 49, 57},
		{170, 97, 162},
		{170, 170, 172},
		{171, 8, 8},
		{171, 50, 56},
		{171, 98, 112},
		{171, 114, 161},
		{172, 9, 10},
		{172, 100, 108},
		{172, 115, 117},
		{172, 121, 160},
		{173, 10, 10},
		{173, 13, 13},
		{173, 119, 119},
		{173, 121, 159},
		{174, 11, 11},
		{174, 121, 159},
		{175, 120, 158},
		{176, 0, 0},
		{176, 120, 157},
		{177, 0, 1},
		{177, 121, 159},
		{178, 0, 1},
		{178, 123, 160},
		{179, 0, 2},
		{179, 124, 160},
		{180, 0, 2},
		{180, 126, 159},
		{181, 0, 3},
		{181, 127, 158},
		{182, 0, 4},
		{182, 127, 157},
		{183, 0, 4},
		{183, 128, 158},
		{184, 0, 5},
		{184, 127, 158},
		{185, 0, 6},
		{185, 127, 157},
		{186, 0, 6},
		{186, 126, 157},
		{187, 0, 7},
		{187, 126, 156},
		{188, 0, 8},
		{188, 126, 156},
		{189, 0, 8},
		{189, 127, 155},
		{190, 0, 9},
		{190, 129, 154},
		{191, 0, 10},
		{191, 130, 153},
		{191, 198, 198},
		{192, 0, 10},
		{192, 131, 152},
		{192, 197, 198},
		{193, 0, 11},
		{193, 132, 151},
		{193, 196, 198},
		{194, 0, 12},
		{194, 133, 149},
		{194, 195, 198},
		{195, 0, 13},
		{195, 135, 147},
		{195, 194, 198},
		{196, 0, 14},
		{196, 41, 42},
		{196, 138, 145},
		{196, 193, 198},
		{197, 0, 14},
		{197, 42, 43},
		{197, 139, 142},
		{197, 192, 198},
		{198, 0, 16},
		{198, 191, 198},
		{199, 0, 17},
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

	--TerrainBuilder.AnalyzeChokepoints();   -- commented out as now WorldBuilder template map
	
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

	local bTrueStart = MapConfiguration.GetValue("true_start");

	if (bTrueStart) then
		print("Setting true start locations.");

		local args = {
			TRUE_START_LOCATIONS = g_TSLs,
			CENTER_X = g_CenterX,
			CENTER_Y = g_CenterY,
		};
		local true_start_locations = AssignTrueStartingPlots.Create(args);
	else
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
		local start_plot_database = AssignStartingPlots.Create(args)
	end

	local GoodyGen = AddGoodies(g_iW, g_iH);
end

-- Input a Hash; Export width, height, and wrapX
function GetMapInitData(MapSize)
	local Width = 198;
	local Height = 199;
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
	local xOffset = 0;
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
	
	local args = {rainfall = rainfall, iJunglePercent = 40, iMarshPercent = 7, iForestPercent = 40, iIcePercent = 15}	-- no rainforest
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
				if (plotTypes[index] == g_PLOT_TYPE_MOUNTAIN) then
					terrainTypes[index] = g_TERRAIN_TYPE_TUNDRA_MOUNTAIN;

					if ((earthVal >= iSnowBottom) and (earthVal <= iSnowTop)) then
						terrainTypes[index] = g_TERRAIN_TYPE_SNOW_MOUNTAIN;
					end
				elseif (plotTypes[index] ~= g_PLOT_TYPE_OCEAN) then
					terrainTypes[index] = g_TERRAIN_TYPE_TUNDRA;

					if ((earthVal >= iSnowBottom) and (earthVal <= iSnowTop)) then
						terrainTypes[index] = g_TERRAIN_TYPE_SNOW;
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

	local iPercentNeeded = 50;

	-- poles
	for x = 0, self.iGridW - 1, 1 do
		for y = self.iGridH - 1, 0, -1 do
			local _lat = _GetRadialLatitudeAtPlot(earth, x, y);

			if (_lat > 0.83 or _lat < -0.073) then
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

-- override: circular poles
function AddIceAtPlot(plot, iX, iY, iE)
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
			TerrainBuilder.AddIce(plot:GetIndex(), iE); 
		end
	end
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