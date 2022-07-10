//Important: Make a folder in scriptfiles called "Spieler", and make .txt files for all players in the "Spieler"-folder. The .txt-files should be called exactly like the players name,
//for example: Simon.txt or WhatEverThePlayerNameIs.txt

//dini include: https://dracoblue.net/downloads/dini/
//foreach include: https://github.com/karimcambridge/samp-foreach/blob/master/foreach.inc

#include a_samp
#include dini
#include foreach
#pragma tabsize 0
#pragma dynamic 65536
#define AUTOD 4
#define PLANED 6

#define Hellrot 0xFF0000FF
#define Hellblau 0x0091FFFF
#define Weis 0xFFFFFFFF

#define MAX_ZONE_NAME 28

new VehicleNames[][] =
{
        "Landstalker", "Bravura", "Buffalo", "Linerunner", "Perrenial", "Sentinel",
        "Dumper", "Firetruck", "Trashmaster", "Stretch", "Manana", "Infernus",
        "Voodoo", "Pony", "Mule", "Cheetah", "Ambulance", "Leviathan", "Moonbeam",
        "Esperanto", "Taxi", "Washington", "Bobcat", "Whoopee", "BF Injection",
        "Hunter", "Premier", "Enforcer", "Securicar", "Banshee", "Predator", "Bus",
        "Rhino", "Barracks", "Hotknife", "Trailer", "Previon", "Coach", "Cabbie",
        "Stallion", "Rumpo", "RC Bandit", "Romero", "Packer", "Monster", "Admiral",
        "Squalo", "Seasparrow", "Pizzaboy", "Tram", "Trailer", "Turismo", "Speeder",
        "Reefer", "Tropic", "Flatbed", "Yankee", "Caddy", "Solair", "Berkley's RC Van",
        "Skimmer", "PCJ-600", "Faggio", "Freeway", "RC Baron", "RC Raider", "Glendale",
        "Oceanic","Sanchez", "Sparrow", "Patriot", "Quad", "Coastguard", "Dinghy",
        "Hermes", "Sabre", "Rustler", "ZR-350", "Walton", "Regina", "Comet", "BMX",
        "Burrito", "Camper", "Marquis", "Baggage", "Dozer", "Maverick", "News Chopper",
        "Rancher", "FBI Rancher", "Virgo", "Greenwood", "Jetmax", "Hotring", "Sandking",
        "Blista Compact", "Police Maverick", "Boxvillde", "Benson", "Mesa", "RC Goblin",
        "Hotring Racer A", "Hotring Racer B", "Bloodring Banger", "Rancher", "Super GT",
        "Elegant", "Journey", "Bike", "Mountain Bike", "Beagle", "Cropduster", "Stunt",
        "Tanker", "Roadtrain", "Nebula", "Majestic", "Buccaneer", "Shamal", "Hydra",
        "FCR-900", "NRG-500", "HPV1000", "Cement Truck", "Tow Truck", "Fortune",
        "Cadrona", "FBI Truck", "Willard", "Forklift", "Tractor", "Combine", "Feltzer",
        "Remington", "Slamvan", "Blade", "Freight", "Streak", "Vortex", "Vincent",
        "Bullet", "Clover", "Sadler", "Firetruck", "Hustler", "Intruder", "Primo",
        "Cargobob", "Tampa", "Sunrise", "Merit", "Utility", "Nevada", "Yosemite",
        "Windsor", "Monster", "Monster", "Uranus", "Jester", "Sultan", "Stratium",
        "Elegy", "Raindance", "RC Tiger", "Flash", "Tahoma", "Savanna", "Bandito",
        "Freight Flat", "Streak Carriage", "Kart", "Mower", "Dune", "Sweeper",
        "Broadway", "Tornado", "AT-400", "DFT-30", "Huntley", "Stafford", "BF-400",
        "News Van", "Tug", "Trailer", "Emperor", "Wayfarer", "Euros", "Hotdog", "Club",
        "Freight Box", "Trailer", "Andromada", "Dodo", "RC Cam", "Launch", "Police Car",
        "Police Car", "Police Car", "Police Ranger", "Picador", "S.W.A.T", "Alpha",
        "Phoenix", "Glendale", "Sadler", "Luggage", "Luggage", "Stairs", "Boxville",
        "Tiller", "Utility Trailer"
};

new BlinkerL[MAX_VEHICLES];
new BlinkerR[MAX_VEHICLES];
new BlinkerVL;
new BlinkerVR;
new BlinkerHL;
new BlinkerHR;

new LandingGearCRTL[MAX_PLAYERS];
new PlayerText:Tacho[MAX_PLAYERS][56];
new PlayerText:KMH[MAX_PLAYERS];
new PlayerText:AutoHP[MAX_PLAYERS][5];
new PlayerText:Sprit[MAX_PLAYERS];
new PlayerText:Batterie[MAX_PLAYERS][6];
new PlayerText:Motorleuchte[MAX_PLAYERS][9];
new PlayerText:Licht[MAX_PLAYERS][4];
new PlayerText:Locked[MAX_PLAYERS][4];
new PlayerText:Kilometerstand[MAX_PLAYERS];
new PlayerText:Tachonadel[MAX_PLAYERS];
new PlayerText:Spritnadel[MAX_PLAYERS];
new PlayerText:Tacho_Mitte[MAX_PLAYERS];
new PlayerText:Sprit_Mitte[MAX_PLAYERS];
new PlayerText:Blitz[MAX_PLAYERS];
new PlayerText:Airspeed[MAX_PLAYERS];
new PlayerText:Airspeeed[MAX_PLAYERS];
new PlayerText:Airspeedindicator[MAX_PLAYERS];
new PlayerText:Airspeeddisplay[MAX_PLAYERS];
new PlayerText:Alittudegauge[MAX_PLAYERS];
new PlayerText:Altimeter[MAX_PLAYERS];
new PlayerText:Altdisplay[MAX_PLAYERS];
new PlayerText:Tausendnadel[MAX_PLAYERS];
new PlayerText:Hundertnadel[MAX_PLAYERS];
new PlayerText:SteigtSinkt[MAX_PLAYERS];
new PlayerText:SteigtHintergrund[MAX_PLAYERS];
new PlayerText:Steigtnadel[MAX_PLAYERS];
new PlayerText:Variometer[MAX_PLAYERS];
new PlayerText:Variodisplay[MAX_PLAYERS];
new PlayerText:Altideckel[MAX_PLAYERS];
new PlayerText:Airspeeddeckel[MAX_PLAYERS];
new PlayerText:ArtHorizon[MAX_PLAYERS];
new PlayerText:CRTLboard_plane[MAX_PLAYERS];
new PlayerText:CRTLboard1_plane[MAX_PLAYERS];
new PlayerText:CRTLboard2_plane[MAX_PLAYERS];
new PlayerText:Kompass_Gauge[MAX_PLAYERS];
new PlayerText:Kompass_Hintergrund[MAX_PLAYERS];
new PlayerText:Kompass_N[MAX_PLAYERS];
new PlayerText:Kompass_E[MAX_PLAYERS];
new PlayerText:Kompass_S[MAX_PLAYERS];
new PlayerText:Kompass_W[MAX_PLAYERS];
new PlayerText:Kompass_Icon[MAX_PLAYERS];
new PlayerText:Flug_Info[MAX_PLAYERS];
new PlayerText:Flug_InfoHintergrund[MAX_PLAYERS];
new PlayerText:Abgrenzung[MAX_PLAYERS][4];
new PlayerText:RFuel[MAX_PLAYERS];
new PlayerText:LFuel[MAX_PLAYERS];
new PlayerText:Fuel1[MAX_PLAYERS];
new PlayerText:Fuel2[MAX_PLAYERS];
new PlayerText:Condition[MAX_PLAYERS];
new PlayerText:Zustand[MAX_PLAYERS];
new PlayerText:Fname[MAX_PLAYERS];
new PlayerText:Distance[MAX_PLAYERS];
new PlayerText:KMStandFlieger[MAX_PLAYERS];
new PlayerText:Fuelpumpen[MAX_PLAYERS];
new PlayerText:FPON[MAX_PLAYERS];
new PlayerText:FPOFF[MAX_PLAYERS];
new PlayerText:PEngine[MAX_PLAYERS];
new PlayerText:PEON[MAX_PLAYERS];
new PlayerText:PEOFF[MAX_PLAYERS];
new PlayerText:LDGear[MAX_PLAYERS];
new PlayerText:LDGON[MAX_PLAYERS];
new PlayerText:LDGOFF[MAX_PLAYERS];
new PlayerText:LowFuel[MAX_PLAYERS];
new PlayerText:LowFuelW[MAX_PLAYERS];
new PlayerText:BlinkerLinks[MAX_PLAYERS];
new PlayerText:BlinkerRechts[MAX_PLAYERS];

new NVehicleLocked[MAX_VEHICLES];


new speedotimer;
new Planespeedotimer;
new Tachonadeltimer;
new BlinkerTimer;
new Float:Fuel[MAX_VEHICLES] = {100.0,...};
new Float:Pfuel[MAX_VEHICLES] = {100.0,...};
new Float:Milage[MAX_VEHICLES] = {0.0,...};
new Float:Pdistance[MAX_VEHICLES] = {0.0,...};
new Spieler[64];
new Sname [MAX_PLAYER_NAME];

new Blitztimer;
new NBlitzertimer;

public OnFilterScriptInit()
{
	return 1;
}

public OnFilterScriptExit()
{
	KillTimer(speedotimer);
	KillTimer(Tachonadeltimer);
	KillTimer(Planespeedotimer);
	return 1;
}

public OnPlayerConnect(playerid)
{
	speedotimer = SetTimerEx("Speedometer",555,true, "%i", playerid);
	Tachonadeltimer = SetTimerEx("Speedo",250,true, "%i", playerid);
	Planespeedotimer = SetTimerEx("PlaneSpeedo",250, true, "%i", playerid);

Tacho[playerid][19] = CreatePlayerTextDraw(playerid, 458.666564, 335.444274, "LD_POOL:ball");
PlayerTextDrawTextSize(playerid, Tacho[playerid][19], 90.540115, 108.010002);
PlayerTextDrawAlignment(playerid, Tacho[playerid][19], 1);
PlayerTextDrawColor(playerid, Tacho[playerid][19], 255);
PlayerTextDrawBackgroundColor(playerid, Tacho[playerid][19], 255);
PlayerTextDrawFont(playerid, Tacho[playerid][19], 4);

Tacho[playerid][20] = CreatePlayerTextDraw(playerid, 463.999969, 341.251800, "LD_POOL:ball");
PlayerTextDrawTextSize(playerid, Tacho[playerid][20], 80.000000, 96.000000);
PlayerTextDrawAlignment(playerid, Tacho[playerid][20], 1);
PlayerTextDrawColor(playerid, Tacho[playerid][20], -1);
PlayerTextDrawBackgroundColor(playerid, Tacho[playerid][20], 255);
PlayerTextDrawFont(playerid, Tacho[playerid][20], 4);

Tacho[playerid][21] = CreatePlayerTextDraw(playerid, 525.066650, 312.214599, "LD_POOL:ball");
PlayerTextDrawTextSize(playerid, Tacho[playerid][21], 110.000000, 133.000000);
PlayerTextDrawAlignment(playerid, Tacho[playerid][21], 1);
PlayerTextDrawColor(playerid, Tacho[playerid][21], 255);
PlayerTextDrawBackgroundColor(playerid, Tacho[playerid][21], 255);
PlayerTextDrawFont(playerid, Tacho[playerid][21], 4);

Tacho[playerid][22] = CreatePlayerTextDraw(playerid, 531.333374, 320.096069, "LD_POOL:ball");
PlayerTextDrawTextSize(playerid, Tacho[playerid][22], 98.000000, 117.000000);
PlayerTextDrawAlignment(playerid, Tacho[playerid][22], 1);
PlayerTextDrawColor(playerid, Tacho[playerid][22], -1);
PlayerTextDrawBackgroundColor(playerid, Tacho[playerid][22], 255);
PlayerTextDrawFont(playerid, Tacho[playerid][22], 4);

Tacho[playerid][23] = CreatePlayerTextDraw(playerid, 538.000000, 400.570495, "");
PlayerTextDrawTextSize(playerid, Tacho[playerid][23], 23.000000, 23.000000);
PlayerTextDrawAlignment(playerid, Tacho[playerid][23], 1);
PlayerTextDrawColor(playerid, Tacho[playerid][23], 0x808080FF);
PlayerTextDrawFont(playerid, Tacho[playerid][23], 5);
PlayerTextDrawSetPreviewModel(playerid, Tacho[playerid][23], 3812);
PlayerTextDrawSetPreviewRot(playerid, Tacho[playerid][23], -90.000000, 0.000000, -41.000000, 2.000000);
PlayerTextDrawBackgroundColor(playerid,Tacho[playerid][23], 0);

Tacho[playerid][24] = CreatePlayerTextDraw(playerid, 529.000305, 382.318450, "");
PlayerTextDrawTextSize(playerid, Tacho[playerid][24], 23.000000, 23.000000);
PlayerTextDrawAlignment(playerid, Tacho[playerid][24], 1);
PlayerTextDrawColor(playerid, Tacho[playerid][24], 0x808080FF);
PlayerTextDrawFont(playerid, Tacho[playerid][24], 5);
PlayerTextDrawSetPreviewModel(playerid, Tacho[playerid][24], 3812);
PlayerTextDrawSetPreviewRot(playerid, Tacho[playerid][24], -90.000000, 0.000000, 110.000000, 2.000000);
PlayerTextDrawBackgroundColor(playerid,Tacho[playerid][24], 0);

Tacho[playerid][25] = CreatePlayerTextDraw(playerid, 527.000305, 361.162719, "");
PlayerTextDrawTextSize(playerid, Tacho[playerid][25], 23.000000, 23.000000);
PlayerTextDrawAlignment(playerid, Tacho[playerid][25], 1);
PlayerTextDrawColor(playerid, Tacho[playerid][25], 0x808080FF);
PlayerTextDrawFont(playerid, Tacho[playerid][25], 5);
PlayerTextDrawSetPreviewModel(playerid, Tacho[playerid][25], 3812);
PlayerTextDrawSetPreviewRot(playerid, Tacho[playerid][25], -90.000000, 0.000000, -99.000000, 2.000000);
PlayerTextDrawBackgroundColor(playerid,Tacho[playerid][25], 0);

Tacho[playerid][26] = CreatePlayerTextDraw(playerid, 532.000183, 340.421966, "");
PlayerTextDrawTextSize(playerid, Tacho[playerid][26], 23.000000, 23.000000);
PlayerTextDrawAlignment(playerid, Tacho[playerid][26], 1);
PlayerTextDrawColor(playerid, Tacho[playerid][26], 0x808080FF);
PlayerTextDrawFont(playerid, Tacho[playerid][26], 5);
PlayerTextDrawSetPreviewModel(playerid, Tacho[playerid][26], 3812);
PlayerTextDrawSetPreviewRot(playerid, Tacho[playerid][26], -90.000000, 0.000000, 57.000000, 2.000000);
PlayerTextDrawBackgroundColor(playerid,Tacho[playerid][26], 0);

Tacho[playerid][27] = CreatePlayerTextDraw(playerid, 544.000122, 324.658874, "");
PlayerTextDrawTextSize(playerid, Tacho[playerid][27], 23.000000, 23.000000);
PlayerTextDrawAlignment(playerid, Tacho[playerid][27], 1);
PlayerTextDrawColor(playerid, Tacho[playerid][27], 0x808080FF);
PlayerTextDrawFont(playerid, Tacho[playerid][27], 5);
PlayerTextDrawSetPreviewModel(playerid, Tacho[playerid][27], 3812);
PlayerTextDrawSetPreviewRot(playerid, Tacho[playerid][27], -90.000000, 0.000000, 30.000000, 2.000000);
PlayerTextDrawBackgroundColor(playerid,Tacho[playerid][27], 0);

Tacho[playerid][28] = CreatePlayerTextDraw(playerid, 560.000122, 315.532928, "");
PlayerTextDrawTextSize(playerid, Tacho[playerid][28], 23.000000, 23.000000);
PlayerTextDrawAlignment(playerid, Tacho[playerid][28], 1);
PlayerTextDrawColor(playerid, Tacho[playerid][28], 0x808080FF);
PlayerTextDrawFont(playerid, Tacho[playerid][28], 5);
PlayerTextDrawSetPreviewModel(playerid, Tacho[playerid][28], 3812);
PlayerTextDrawSetPreviewRot(playerid, Tacho[playerid][28], -90.000000, 0.000000, 10.000000, 2.000000);
PlayerTextDrawBackgroundColor(playerid,Tacho[playerid][28], 0);

Tacho[playerid][29] = CreatePlayerTextDraw(playerid, 577.666748, 315.947753, "");
PlayerTextDrawTextSize(playerid, Tacho[playerid][29], 23.000000, 23.000000);
PlayerTextDrawAlignment(playerid, Tacho[playerid][29], 1);
PlayerTextDrawColor(playerid, Tacho[playerid][29], 0x808080FF);
PlayerTextDrawFont(playerid, Tacho[playerid][29], 5);
PlayerTextDrawSetPreviewModel(playerid, Tacho[playerid][29], 3812);
PlayerTextDrawSetPreviewRot(playerid, Tacho[playerid][29], -90.000000, 0.000000, -11.000000, 2.000000);
PlayerTextDrawBackgroundColor(playerid,Tacho[playerid][29], 0);

Tacho[playerid][30] = CreatePlayerTextDraw(playerid, 593.999816, 324.658905, "");
PlayerTextDrawTextSize(playerid, Tacho[playerid][30], 23.000000, 23.000000);
PlayerTextDrawAlignment(playerid, Tacho[playerid][30], 1);
PlayerTextDrawColor(playerid, Tacho[playerid][30], 0x808080FF);
PlayerTextDrawFont(playerid, Tacho[playerid][30], 5);
PlayerTextDrawSetPreviewModel(playerid, Tacho[playerid][30], 3812);
PlayerTextDrawSetPreviewRot(playerid, Tacho[playerid][30], -90.000000, 0.000000, -32.000000, 2.000000);
PlayerTextDrawBackgroundColor(playerid,Tacho[playerid][30], 0);

Tacho[playerid][31] = CreatePlayerTextDraw(playerid, 605.666503, 340.421966, "");
PlayerTextDrawTextSize(playerid, Tacho[playerid][31], 23.000000, 23.000000);
PlayerTextDrawAlignment(playerid, Tacho[playerid][31], 1);
PlayerTextDrawColor(playerid, Tacho[playerid][31], 0x808080FF);
PlayerTextDrawFont(playerid, Tacho[playerid][31], 5);
PlayerTextDrawSetPreviewModel(playerid, Tacho[playerid][31], 3812);
PlayerTextDrawSetPreviewRot(playerid, Tacho[playerid][31], -90.000000, 0.000000, -55.000000, 2.000000);
PlayerTextDrawBackgroundColor(playerid,Tacho[playerid][31], 0);

Tacho[playerid][32] = CreatePlayerTextDraw(playerid, 610.666137, 361.577606, "");
PlayerTextDrawTextSize(playerid, Tacho[playerid][32], 23.000000, 23.000000);
PlayerTextDrawAlignment(playerid, Tacho[playerid][32], 1);
PlayerTextDrawColor(playerid, Tacho[playerid][32], 0x808080FF);
PlayerTextDrawFont(playerid, Tacho[playerid][32], 5);
PlayerTextDrawSetPreviewModel(playerid, Tacho[playerid][32], 3812);
PlayerTextDrawSetPreviewRot(playerid, Tacho[playerid][32], -90.000000, 0.000000, -85.000000, 2.000000);
PlayerTextDrawBackgroundColor(playerid,Tacho[playerid][32], 0);

Tacho[playerid][33] = CreatePlayerTextDraw(playerid, 609.332824, 382.733245, "");
PlayerTextDrawTextSize(playerid, Tacho[playerid][33], 23.000000, 23.000000);
PlayerTextDrawAlignment(playerid, Tacho[playerid][33], 1);
PlayerTextDrawColor(playerid, Tacho[playerid][33], 0x808080FF);
PlayerTextDrawFont(playerid, Tacho[playerid][33], 5);
PlayerTextDrawSetPreviewModel(playerid, Tacho[playerid][33], 3812);
PlayerTextDrawSetPreviewRot(playerid, Tacho[playerid][33], -90.000000, 0.000000, -109.000000, 2.000000);
PlayerTextDrawBackgroundColor(playerid,Tacho[playerid][33], 0);

Tacho[playerid][34] = CreatePlayerTextDraw(playerid, 599.999633, 400.985168, "");
PlayerTextDrawTextSize(playerid, Tacho[playerid][34], 23.000000, 23.000000);
PlayerTextDrawAlignment(playerid, Tacho[playerid][34], 1);
PlayerTextDrawColor(playerid, Tacho[playerid][34], 0x808080FF);
PlayerTextDrawFont(playerid, Tacho[playerid][34], 5);
PlayerTextDrawSetPreviewModel(playerid, Tacho[playerid][34], 3812);
PlayerTextDrawSetPreviewRot(playerid, Tacho[playerid][34], -90.000000, 0.000000, -133.000000, 2.000000);
PlayerTextDrawBackgroundColor(playerid,Tacho[playerid][34], 0);

Tacho[playerid][35] = CreatePlayerTextDraw(playerid, 530.999633, 393.103607, "");
PlayerTextDrawTextSize(playerid, Tacho[playerid][35], 23.000000, 23.000000);
PlayerTextDrawAlignment(playerid, Tacho[playerid][35], 1);
PlayerTextDrawColor(playerid, Tacho[playerid][35], 0x808080FF);
PlayerTextDrawSetShadow(playerid, Tacho[playerid][35], 0);
PlayerTextDrawFont(playerid, Tacho[playerid][35], 5);
PlayerTextDrawSetProportional(playerid, Tacho[playerid][35], 0);
PlayerTextDrawSetPreviewModel(playerid, Tacho[playerid][35], 3812);
PlayerTextDrawSetPreviewRot(playerid, Tacho[playerid][35], -90.000000, 0.000000, 126.000000, 3.000000);
PlayerTextDrawBackgroundColor(playerid,Tacho[playerid][35], 0);

Tacho[playerid][36] = CreatePlayerTextDraw(playerid, 525.666442, 371.947937, "");
PlayerTextDrawTextSize(playerid, Tacho[playerid][36], 23.000000, 23.000000);
PlayerTextDrawAlignment(playerid, Tacho[playerid][36], 1);
PlayerTextDrawColor(playerid, Tacho[playerid][36], 0x808080FF);
PlayerTextDrawSetShadow(playerid, Tacho[playerid][36], 0);
PlayerTextDrawFont(playerid, Tacho[playerid][36], 5);
PlayerTextDrawSetProportional(playerid, Tacho[playerid][36], 0);
PlayerTextDrawSetPreviewModel(playerid, Tacho[playerid][36], 3812);
PlayerTextDrawSetPreviewRot(playerid, Tacho[playerid][36], -90.000000, 0.000000, 98.000000, 3.000000);
PlayerTextDrawBackgroundColor(playerid,Tacho[playerid][36], 0);

Tacho[playerid][37] = CreatePlayerTextDraw(playerid, 527.332946, 349.962677, "");
PlayerTextDrawTextSize(playerid, Tacho[playerid][37], 23.000000, 23.000000);
PlayerTextDrawAlignment(playerid, Tacho[playerid][37], 1);
PlayerTextDrawColor(playerid, Tacho[playerid][37], 0x808080FF);
PlayerTextDrawSetShadow(playerid, Tacho[playerid][37], 0);
PlayerTextDrawFont(playerid, Tacho[playerid][37], 5);
PlayerTextDrawSetProportional(playerid, Tacho[playerid][37], 0);
PlayerTextDrawSetPreviewModel(playerid, Tacho[playerid][37], 3812);
PlayerTextDrawSetPreviewRot(playerid, Tacho[playerid][37], -90.000000, 0.000000, 79.000000, 3.000000);
PlayerTextDrawBackgroundColor(playerid,Tacho[playerid][37], 0);

Tacho[playerid][38] = CreatePlayerTextDraw(playerid, 536.332885, 330.881011, "");
PlayerTextDrawTextSize(playerid, Tacho[playerid][38], 23.000000, 23.000000);
PlayerTextDrawAlignment(playerid, Tacho[playerid][38], 1);
PlayerTextDrawColor(playerid, Tacho[playerid][38], 0x808080FF);
PlayerTextDrawSetShadow(playerid, Tacho[playerid][38], 0);
PlayerTextDrawFont(playerid, Tacho[playerid][38], 5);
PlayerTextDrawSetProportional(playerid, Tacho[playerid][38], 0);
PlayerTextDrawSetPreviewModel(playerid, Tacho[playerid][38], 3812);
PlayerTextDrawSetPreviewRot(playerid, Tacho[playerid][38], -90.000000, 0.000000, 44.000000, 3.000000);
PlayerTextDrawBackgroundColor(playerid,Tacho[playerid][38], 0);

Tacho[playerid][39] = CreatePlayerTextDraw(playerid, 550.999633, 318.021575, "");
PlayerTextDrawTextSize(playerid, Tacho[playerid][39], 23.000000, 23.000000);
PlayerTextDrawAlignment(playerid, Tacho[playerid][39], 1);
PlayerTextDrawColor(playerid, Tacho[playerid][39], 0x808080FF);
PlayerTextDrawSetShadow(playerid, Tacho[playerid][39], 0);
PlayerTextDrawFont(playerid, Tacho[playerid][39], 5);
PlayerTextDrawSetProportional(playerid, Tacho[playerid][39], 0);
PlayerTextDrawSetPreviewModel(playerid, Tacho[playerid][39], 3812);
PlayerTextDrawSetPreviewRot(playerid, Tacho[playerid][39], -90.000000, 0.000000, 20.000000, 3.000000);
PlayerTextDrawBackgroundColor(playerid,Tacho[playerid][39], 0);

Tacho[playerid][40] = CreatePlayerTextDraw(playerid, 568.999572, 313.458587, "");
PlayerTextDrawTextSize(playerid, Tacho[playerid][40], 23.000000, 23.000000);
PlayerTextDrawAlignment(playerid, Tacho[playerid][40], 1);
PlayerTextDrawColor(playerid, Tacho[playerid][40], 0x808080FF);
PlayerTextDrawSetShadow(playerid, Tacho[playerid][40], 0);
PlayerTextDrawFont(playerid, Tacho[playerid][40], 5);
PlayerTextDrawSetProportional(playerid, Tacho[playerid][40], 0);
PlayerTextDrawSetPreviewModel(playerid, Tacho[playerid][40], 3812);
PlayerTextDrawSetPreviewRot(playerid, Tacho[playerid][40], -90.000000, 0.000000, 0.000000, 3.000000);
PlayerTextDrawBackgroundColor(playerid,Tacho[playerid][40], 0);

Tacho[playerid][41] = CreatePlayerTextDraw(playerid, 586.666198, 318.021545, "");
PlayerTextDrawTextSize(playerid, Tacho[playerid][41], 23.000000, 23.000000);
PlayerTextDrawAlignment(playerid, Tacho[playerid][41], 1);
PlayerTextDrawColor(playerid, Tacho[playerid][41], 0x808080FF);
PlayerTextDrawSetShadow(playerid, Tacho[playerid][41], 0);
PlayerTextDrawFont(playerid, Tacho[playerid][41], 5);
PlayerTextDrawSetProportional(playerid, Tacho[playerid][41], 0);
PlayerTextDrawSetPreviewModel(playerid, Tacho[playerid][41], 3812);
PlayerTextDrawSetPreviewRot(playerid, Tacho[playerid][41], -90.000000, 0.000000, -21.000000, 3.000000);
PlayerTextDrawBackgroundColor(playerid,Tacho[playerid][41], 0);

Tacho[playerid][42] = CreatePlayerTextDraw(playerid, 601.332763, 331.295745, "");
PlayerTextDrawTextSize(playerid, Tacho[playerid][42], 23.000000, 23.000000);
PlayerTextDrawAlignment(playerid, Tacho[playerid][42], 1);
PlayerTextDrawColor(playerid, Tacho[playerid][42], 0x808080FF);
PlayerTextDrawSetShadow(playerid, Tacho[playerid][42], 0);
PlayerTextDrawFont(playerid, Tacho[playerid][42], 5);
PlayerTextDrawSetProportional(playerid, Tacho[playerid][42], 0);
PlayerTextDrawSetPreviewModel(playerid, Tacho[playerid][42], 3812);
PlayerTextDrawSetPreviewRot(playerid, Tacho[playerid][42], -90.000000, 0.000000, -43.000000, 3.000000);
PlayerTextDrawBackgroundColor(playerid,Tacho[playerid][42], 0);

Tacho[playerid][43] = CreatePlayerTextDraw(playerid, 610.332458, 349.962432, "");
PlayerTextDrawTextSize(playerid, Tacho[playerid][43], 23.000000, 23.000000);
PlayerTextDrawAlignment(playerid, Tacho[playerid][43], 1);
PlayerTextDrawColor(playerid, Tacho[playerid][43], 0x808080FF);
PlayerTextDrawSetShadow(playerid, Tacho[playerid][43], 0);
PlayerTextDrawFont(playerid, Tacho[playerid][43], 5);
PlayerTextDrawSetProportional(playerid, Tacho[playerid][43], 0);
PlayerTextDrawSetPreviewModel(playerid, Tacho[playerid][43], 3812);
PlayerTextDrawSetPreviewRot(playerid, Tacho[playerid][43], -90.000000, 0.000000, -65.000000, 3.000000);
PlayerTextDrawBackgroundColor(playerid,Tacho[playerid][43], 0);

Tacho[playerid][44] = CreatePlayerTextDraw(playerid, 612.332214, 371.947662, "");
PlayerTextDrawTextSize(playerid, Tacho[playerid][44], 23.000000, 23.000000);
PlayerTextDrawAlignment(playerid, Tacho[playerid][44], 1);
PlayerTextDrawColor(playerid, Tacho[playerid][44], 0x808080FF);
PlayerTextDrawSetShadow(playerid, Tacho[playerid][44], 0);
PlayerTextDrawFont(playerid, Tacho[playerid][44], 5);
PlayerTextDrawSetProportional(playerid, Tacho[playerid][44], 0);
PlayerTextDrawSetPreviewModel(playerid, Tacho[playerid][44], 3812);
PlayerTextDrawSetPreviewRot(playerid, Tacho[playerid][44], -90.000000, 0.000000, -97.000000, 3.000000);
PlayerTextDrawBackgroundColor(playerid,Tacho[playerid][44], 0);

Tacho[playerid][45] = CreatePlayerTextDraw(playerid, 606.665588, 393.103363, "");
PlayerTextDrawTextSize(playerid, Tacho[playerid][45], 23.000000, 23.000000);
PlayerTextDrawAlignment(playerid, Tacho[playerid][45], 1);
PlayerTextDrawColor(playerid, Tacho[playerid][45], 0x808080FF);
PlayerTextDrawSetShadow(playerid, Tacho[playerid][45], 0);
PlayerTextDrawFont(playerid, Tacho[playerid][45], 5);
PlayerTextDrawSetProportional(playerid, Tacho[playerid][45], 0);
PlayerTextDrawSetPreviewModel(playerid, Tacho[playerid][45], 3812);
PlayerTextDrawSetPreviewRot(playerid, Tacho[playerid][45], -90.000000, 0.000000, -125.000000, 3.000000);
PlayerTextDrawBackgroundColor(playerid,Tacho[playerid][45], 0);

Tacho[playerid][46] = CreatePlayerTextDraw(playerid, 468.331909, 348.303253, "");
PlayerTextDrawTextSize(playerid, Tacho[playerid][46], 23.000000, 23.000000);
PlayerTextDrawAlignment(playerid, Tacho[playerid][46], 1);
PlayerTextDrawColor(playerid, Tacho[playerid][46], 0x808080FF);
PlayerTextDrawSetShadow(playerid, Tacho[playerid][46], 0);
PlayerTextDrawFont(playerid, Tacho[playerid][46], 5);
PlayerTextDrawSetProportional(playerid, Tacho[playerid][46], 0);
PlayerTextDrawSetPreviewModel(playerid, Tacho[playerid][46], 3812);
PlayerTextDrawSetPreviewRot(playerid, Tacho[playerid][46], -90.000000, 0.000000, 45.000000, 2.500000);
PlayerTextDrawBackgroundColor(playerid,Tacho[playerid][46], 0);

Tacho[playerid][47] = CreatePlayerTextDraw(playerid, 471.433441, 398.966705, "LD_SPAC:white");
PlayerTextDrawTextSize(playerid, Tacho[playerid][47], 56.000000, 6.000000);
PlayerTextDrawAlignment(playerid, Tacho[playerid][47], 1);
PlayerTextDrawColor(playerid, Tacho[playerid][47], 255);
PlayerTextDrawSetShadow(playerid, Tacho[playerid][47], 0);
PlayerTextDrawFont(playerid, Tacho[playerid][47], 4);
PlayerTextDrawSetProportional(playerid, Tacho[playerid][47], 0);

Tacho[playerid][48] = CreatePlayerTextDraw(playerid, 499.600097, 398.237097, "Vehicle_Owner");
PlayerTextDrawLetterSize(playerid, Tacho[playerid][48], 0.124000, 0.674961);
PlayerTextDrawTextSize(playerid, Tacho[playerid][48], 23.000000, -20.000000);
PlayerTextDrawAlignment(playerid, Tacho[playerid][48], 2);
PlayerTextDrawColor(playerid, Tacho[playerid][48], 0x808080FF);
PlayerTextDrawSetShadow(playerid, Tacho[playerid][48], 0);
PlayerTextDrawFont(playerid, Tacho[playerid][48], 1);
PlayerTextDrawSetProportional(playerid, Tacho[playerid][48], 1);

Tacho[playerid][49] = CreatePlayerTextDraw(playerid, 514.434020, 353.037048, "LD_SPAC:white");
PlayerTextDrawTextSize(playerid, Tacho[playerid][49], 8.459987, 32.020164);
PlayerTextDrawAlignment(playerid, Tacho[playerid][49], 1);
PlayerTextDrawColor(playerid, Tacho[playerid][49], 255);
PlayerTextDrawSetShadow(playerid, Tacho[playerid][49], 0);
PlayerTextDrawBackgroundColor(playerid, Tacho[playerid][49], 255);
PlayerTextDrawFont(playerid, Tacho[playerid][49], 4);
PlayerTextDrawSetProportional(playerid, Tacho[playerid][49], 0);

Tacho[playerid][50] = CreatePlayerTextDraw(playerid, 585.333007, 361.577758, "LD_BEAT:chit");
PlayerTextDrawTextSize(playerid, Tacho[playerid][50], 22.789926, 25.919929);
PlayerTextDrawAlignment(playerid, Tacho[playerid][50], 1);
PlayerTextDrawColor(playerid, Tacho[playerid][50], 255);
PlayerTextDrawSetShadow(playerid, Tacho[playerid][50], 0);
PlayerTextDrawBackgroundColor(playerid, Tacho[playerid][50], 255);
PlayerTextDrawFont(playerid, Tacho[playerid][50], 4);
PlayerTextDrawSetProportional(playerid, Tacho[playerid][50], 0);

Tacho[playerid][51] = CreatePlayerTextDraw(playerid, 583.999755, 379.414916, "LD_BEAT:chit");
PlayerTextDrawTextSize(playerid, Tacho[playerid][51], 22.789926, 25.919929);
PlayerTextDrawAlignment(playerid, Tacho[playerid][51], 1);
PlayerTextDrawColor(playerid, Tacho[playerid][51], 255);
PlayerTextDrawSetShadow(playerid, Tacho[playerid][51], 0);
PlayerTextDrawBackgroundColor(playerid, Tacho[playerid][51], 255);
PlayerTextDrawFont(playerid, Tacho[playerid][51], 4);
PlayerTextDrawSetProportional(playerid, Tacho[playerid][51], 0);

Tacho[playerid][52] = CreatePlayerTextDraw(playerid, 554.000122, 379.300140, "LD_BEAT:chit");
PlayerTextDrawTextSize(playerid, Tacho[playerid][52], 22.789926, 25.919929);
PlayerTextDrawAlignment(playerid, Tacho[playerid][52], 1);
PlayerTextDrawColor(playerid, Tacho[playerid][52], 255);
PlayerTextDrawSetShadow(playerid, Tacho[playerid][52], 0);
PlayerTextDrawBackgroundColor(playerid, Tacho[playerid][52], 255);
PlayerTextDrawFont(playerid, Tacho[playerid][52], 4);
PlayerTextDrawSetProportional(playerid, Tacho[playerid][52], 0);

Tacho[playerid][53] = CreatePlayerTextDraw(playerid, 550.999816, 361.992675, "LD_BEAT:chit");
PlayerTextDrawTextSize(playerid, Tacho[playerid][53], 22.789926, 25.919929);
PlayerTextDrawAlignment(playerid, Tacho[playerid][53], 1);
PlayerTextDrawColor(playerid, Tacho[playerid][53], 255);
PlayerTextDrawSetShadow(playerid, Tacho[playerid][53], 0);
PlayerTextDrawBackgroundColor(playerid, Tacho[playerid][53], 255);
PlayerTextDrawFont(playerid, Tacho[playerid][53], 4);
PlayerTextDrawSetProportional(playerid, Tacho[playerid][53], 0);

Tacho[playerid][54] = CreatePlayerTextDraw(playerid, 494.000488, 407.622222, "LD_SPAC:white");
PlayerTextDrawTextSize(playerid, Tacho[playerid][54], 21.000000, 22.000000);
PlayerTextDrawAlignment(playerid, Tacho[playerid][54], 1);
PlayerTextDrawColor(playerid, Tacho[playerid][54], 255);
PlayerTextDrawSetShadow(playerid, Tacho[playerid][54], 0);
PlayerTextDrawBackgroundColor(playerid, Tacho[playerid][54], 255);
PlayerTextDrawFont(playerid, Tacho[playerid][54], 4);
PlayerTextDrawSetProportional(playerid, Tacho[playerid][54], 0);

Tacho[playerid][55] = CreatePlayerTextDraw(playerid, 504.500244, 409.022430, "P");
PlayerTextDrawLetterSize(playerid, Tacho[playerid][55], 0.378333, 1.911110);
PlayerTextDrawTextSize(playerid, Tacho[playerid][55], 0.000000, -64.000000);
PlayerTextDrawAlignment(playerid, Tacho[playerid][55], 2);
PlayerTextDrawColor(playerid, Tacho[playerid][55], -1);
PlayerTextDrawSetShadow(playerid, Tacho[playerid][55], 0);
PlayerTextDrawBackgroundColor(playerid, Tacho[playerid][55], 255);
PlayerTextDrawFont(playerid, Tacho[playerid][55], 1);
PlayerTextDrawSetProportional(playerid, Tacho[playerid][55], 1);

Batterie[playerid][0] = CreatePlayerTextDraw(playerid, 560.666503, 388.396484, "LD_SPAC:white");
PlayerTextDrawTextSize(playerid, Batterie[playerid][0], 9.549997, 7.699979);
PlayerTextDrawAlignment(playerid, Batterie[playerid][0], 1);
PlayerTextDrawColor(playerid, Batterie[playerid][0], -16776961);
PlayerTextDrawSetShadow(playerid, Batterie[playerid][0], 0);
PlayerTextDrawBackgroundColor(playerid, Batterie[playerid][0], 255);
PlayerTextDrawFont(playerid, Batterie[playerid][0], 4);
PlayerTextDrawSetProportional(playerid, Batterie[playerid][0], 0);

Batterie[playerid][1] = CreatePlayerTextDraw(playerid, 561.066406, 388.696502, "LD_SPAC:white");
PlayerTextDrawTextSize(playerid, Batterie[playerid][1], 8.709997, 7.069979);
PlayerTextDrawAlignment(playerid, Batterie[playerid][1], 1);
PlayerTextDrawColor(playerid, Batterie[playerid][1], 255);
PlayerTextDrawSetShadow(playerid, Batterie[playerid][1], 0);
PlayerTextDrawBackgroundColor(playerid, Batterie[playerid][1], 255);
PlayerTextDrawFont(playerid, Batterie[playerid][1], 4);
PlayerTextDrawSetProportional(playerid, Batterie[playerid][1], 0);

Batterie[playerid][2] = CreatePlayerTextDraw(playerid, 561.366333, 387.496429, "LD_SPAC:white");
PlayerTextDrawTextSize(playerid, Batterie[playerid][2], 1.989995, 1.189978);
PlayerTextDrawAlignment(playerid, Batterie[playerid][2], 1);
PlayerTextDrawColor(playerid, Batterie[playerid][2], -16776961);
PlayerTextDrawSetShadow(playerid, Batterie[playerid][2], 0);
PlayerTextDrawBackgroundColor(playerid, Batterie[playerid][2], 255);
PlayerTextDrawFont(playerid, Batterie[playerid][2], 4);
PlayerTextDrawSetProportional(playerid, Batterie[playerid][2], 0);

Batterie[playerid][3] = CreatePlayerTextDraw(playerid, 567.064941, 387.496429, "LD_SPAC:white");
PlayerTextDrawTextSize(playerid, Batterie[playerid][3], 1.989995, 1.189978);
PlayerTextDrawAlignment(playerid, Batterie[playerid][3], 1);
PlayerTextDrawColor(playerid, Batterie[playerid][3], -16776961);
PlayerTextDrawSetShadow(playerid, Batterie[playerid][3], 0);
PlayerTextDrawBackgroundColor(playerid, Batterie[playerid][3], 255);
PlayerTextDrawFont(playerid, Batterie[playerid][3], 4);
PlayerTextDrawSetProportional(playerid, Batterie[playerid][3], 0);

Batterie[playerid][4] = CreatePlayerTextDraw(playerid, 561.999816, 389.111175, "+");
PlayerTextDrawLetterSize(playerid, Batterie[playerid][4], 0.099666, 0.427555);
PlayerTextDrawTextSize(playerid, Batterie[playerid][4], -63.000000, 0.000000);
PlayerTextDrawAlignment(playerid, Batterie[playerid][4], 1);
PlayerTextDrawColor(playerid, Batterie[playerid][4], -16776961);
PlayerTextDrawSetShadow(playerid, Batterie[playerid][4], 0);
PlayerTextDrawBackgroundColor(playerid, Batterie[playerid][4], 255);
PlayerTextDrawFont(playerid, Batterie[playerid][4], 1);
PlayerTextDrawSetProportional(playerid, Batterie[playerid][4], 1);

Batterie[playerid][5] = CreatePlayerTextDraw(playerid, 566.798645, 388.611145, "-");
PlayerTextDrawLetterSize(playerid, Batterie[playerid][5], 0.146666, 0.427555);
PlayerTextDrawTextSize(playerid, Batterie[playerid][5], -63.000000, 0.000000);
PlayerTextDrawAlignment(playerid, Batterie[playerid][5], 1);
PlayerTextDrawColor(playerid, Batterie[playerid][5], -16776961);
PlayerTextDrawSetShadow(playerid, Batterie[playerid][5], 0);
PlayerTextDrawBackgroundColor(playerid, Batterie[playerid][5], 255);
PlayerTextDrawFont(playerid, Batterie[playerid][5], 1);
PlayerTextDrawSetProportional(playerid, Batterie[playerid][5], 1);

Motorleuchte[playerid][0] = CreatePlayerTextDraw(playerid, 558.732177, 372.277893, "LD_SPAC:white");
PlayerTextDrawTextSize(playerid, Motorleuchte[playerid][0], 6.919993, 5.389977);
PlayerTextDrawAlignment(playerid, Motorleuchte[playerid][0], 1);
PlayerTextDrawColor(playerid, Motorleuchte[playerid][0], -5963521);
PlayerTextDrawSetShadow(playerid, Motorleuchte[playerid][0], 0);
PlayerTextDrawBackgroundColor(playerid, Motorleuchte[playerid][0], 255);
PlayerTextDrawFont(playerid, Motorleuchte[playerid][0], 4);
PlayerTextDrawSetProportional(playerid, Motorleuchte[playerid][0], 0);

Motorleuchte[playerid][1] = CreatePlayerTextDraw(playerid, 559.132080, 372.577911, "LD_SPAC:white");
PlayerTextDrawTextSize(playerid, Motorleuchte[playerid][1], 6.149992, 4.949976);
PlayerTextDrawAlignment(playerid, Motorleuchte[playerid][1], 1);
PlayerTextDrawColor(playerid, Motorleuchte[playerid][1], 255);
PlayerTextDrawSetShadow(playerid, Motorleuchte[playerid][1], 0);
PlayerTextDrawBackgroundColor(playerid, Motorleuchte[playerid][1], 255);
PlayerTextDrawFont(playerid, Motorleuchte[playerid][1], 4);
PlayerTextDrawSetProportional(playerid, Motorleuchte[playerid][1], 0);

Motorleuchte[playerid][2] = CreatePlayerTextDraw(playerid, 560.831665, 371.477844, "LD_SPAC:white");
PlayerTextDrawTextSize(playerid, Motorleuchte[playerid][2], 1.899999, 1.000000);
PlayerTextDrawAlignment(playerid, Motorleuchte[playerid][2], 1);
PlayerTextDrawColor(playerid, Motorleuchte[playerid][2], -5963521);
PlayerTextDrawSetShadow(playerid, Motorleuchte[playerid][2], 0);
PlayerTextDrawBackgroundColor(playerid, Motorleuchte[playerid][2], 255);
PlayerTextDrawFont(playerid, Motorleuchte[playerid][2], 4);
PlayerTextDrawSetProportional(playerid, Motorleuchte[playerid][2], 0);

Motorleuchte[playerid][3] = CreatePlayerTextDraw(playerid, 560.031860, 370.077758, "LD_SPAC:white");
PlayerTextDrawTextSize(playerid, Motorleuchte[playerid][3], 3.989999, 1.440000);
PlayerTextDrawAlignment(playerid, Motorleuchte[playerid][3], 1);
PlayerTextDrawColor(playerid, Motorleuchte[playerid][3], -5963521);
PlayerTextDrawSetShadow(playerid, Motorleuchte[playerid][3], 0);
PlayerTextDrawBackgroundColor(playerid, Motorleuchte[playerid][3], 255);
PlayerTextDrawFont(playerid, Motorleuchte[playerid][3], 4);
PlayerTextDrawSetProportional(playerid, Motorleuchte[playerid][3], 0);

Motorleuchte[playerid][4] = CreatePlayerTextDraw(playerid, 557.832397, 373.977996, "LD_SPAC:white");
PlayerTextDrawTextSize(playerid, Motorleuchte[playerid][4], 1.240000, 1.440000);
PlayerTextDrawAlignment(playerid, Motorleuchte[playerid][4], 1);
PlayerTextDrawColor(playerid, Motorleuchte[playerid][4], -5963521);
PlayerTextDrawSetShadow(playerid, Motorleuchte[playerid][4], 0);
PlayerTextDrawBackgroundColor(playerid, Motorleuchte[playerid][4], 255);
PlayerTextDrawFont(playerid, Motorleuchte[playerid][4], 4);
PlayerTextDrawSetProportional(playerid, Motorleuchte[playerid][4], 0);

Motorleuchte[playerid][5] = CreatePlayerTextDraw(playerid, 556.966003, 371.492645, "LD_SPAC:white");
PlayerTextDrawTextSize(playerid, Motorleuchte[playerid][5], 0.910000, 3.639997);
PlayerTextDrawAlignment(playerid, Motorleuchte[playerid][5], 1);
PlayerTextDrawColor(playerid, Motorleuchte[playerid][5], -5963521);
PlayerTextDrawSetShadow(playerid, Motorleuchte[playerid][5], 0);
PlayerTextDrawBackgroundColor(playerid, Motorleuchte[playerid][5], 255);
PlayerTextDrawFont(playerid, Motorleuchte[playerid][5], 4);
PlayerTextDrawSetProportional(playerid, Motorleuchte[playerid][5], 0);

Motorleuchte[playerid][6] = CreatePlayerTextDraw(playerid, 565.763854, 373.292755, "LD_SPAC:white");
PlayerTextDrawTextSize(playerid, Motorleuchte[playerid][6], 0.910000, 3.089998);
PlayerTextDrawAlignment(playerid, Motorleuchte[playerid][6], 1);
PlayerTextDrawColor(playerid, Motorleuchte[playerid][6], -5963521);
PlayerTextDrawSetShadow(playerid, Motorleuchte[playerid][6], 0);
PlayerTextDrawBackgroundColor(playerid, Motorleuchte[playerid][6], 255);
PlayerTextDrawFont(playerid, Motorleuchte[playerid][6], 4);
PlayerTextDrawSetProportional(playerid, Motorleuchte[playerid][6], 0);

Motorleuchte[playerid][7] = CreatePlayerTextDraw(playerid, 566.663635, 372.192687, "LD_SPAC:white");
PlayerTextDrawTextSize(playerid, Motorleuchte[playerid][7], 1.129999, 5.510000);
PlayerTextDrawAlignment(playerid, Motorleuchte[playerid][7], 1);
PlayerTextDrawColor(playerid, Motorleuchte[playerid][7], -5963521);
PlayerTextDrawSetShadow(playerid, Motorleuchte[playerid][7], 0);
PlayerTextDrawBackgroundColor(playerid, Motorleuchte[playerid][7], 255);
PlayerTextDrawFont(playerid, Motorleuchte[playerid][7], 4);
PlayerTextDrawSetProportional(playerid, Motorleuchte[playerid][7], 0);

Motorleuchte[playerid][8] = CreatePlayerTextDraw(playerid, 557.265930, 374.292816, "LD_SPAC:white");
PlayerTextDrawTextSize(playerid, Motorleuchte[playerid][8], 0.910000, 3.639997);
PlayerTextDrawAlignment(playerid, Motorleuchte[playerid][8], 1);
PlayerTextDrawColor(playerid, Motorleuchte[playerid][8], -5963521);
PlayerTextDrawSetShadow(playerid, Motorleuchte[playerid][8], 0);
PlayerTextDrawBackgroundColor(playerid, Motorleuchte[playerid][8], 255);
PlayerTextDrawFont(playerid, Motorleuchte[playerid][8], 4);
PlayerTextDrawSetProportional(playerid, Motorleuchte[playerid][8], 0);

Locked[playerid][0] = CreatePlayerTextDraw(playerid, 594.900146, 396.581481, "LD_BEAT:chit");
PlayerTextDrawTextSize(playerid, Locked[playerid][0], 7.619999, -8.780014);
PlayerTextDrawAlignment(playerid, Locked[playerid][0], 1);
PlayerTextDrawColor(playerid, Locked[playerid][0], -5963521);
PlayerTextDrawSetShadow(playerid, Locked[playerid][0], 0);
PlayerTextDrawBackgroundColor(playerid, Locked[playerid][0], 255);
PlayerTextDrawFont(playerid, Locked[playerid][0], 4);
PlayerTextDrawSetProportional(playerid, Locked[playerid][0], 0);

Locked[playerid][1] = CreatePlayerTextDraw(playerid, 596.099853, 395.596221, "LD_BEAT:chit");
PlayerTextDrawTextSize(playerid, Locked[playerid][1], 5.140000, -6.300014);
PlayerTextDrawAlignment(playerid, Locked[playerid][1], 1);
PlayerTextDrawColor(playerid, Locked[playerid][1], 255);
PlayerTextDrawSetShadow(playerid, Locked[playerid][1], 0);
PlayerTextDrawBackgroundColor(playerid, Locked[playerid][1], 255);
PlayerTextDrawFont(playerid, Locked[playerid][1], 4);
PlayerTextDrawSetProportional(playerid, Locked[playerid][1], 0);

Locked[playerid][2] = CreatePlayerTextDraw(playerid, 590.566589, 391.659271, "LD_SPAC:white");
PlayerTextDrawTextSize(playerid, Locked[playerid][2], 6.380000, 1.000000);
PlayerTextDrawAlignment(playerid, Locked[playerid][2], 1);
PlayerTextDrawColor(playerid, Locked[playerid][2], -5963521);
PlayerTextDrawSetShadow(playerid, Locked[playerid][2], 0);
PlayerTextDrawBackgroundColor(playerid, Locked[playerid][2], 255);
PlayerTextDrawFont(playerid, Locked[playerid][2], 4);
PlayerTextDrawSetProportional(playerid, Locked[playerid][2], 0);

Locked[playerid][3] = CreatePlayerTextDraw(playerid, 590.566589, 392.659332, "LD_SPAC:white");
PlayerTextDrawTextSize(playerid, Locked[playerid][3], 2.660000, 0.999999);
PlayerTextDrawAlignment(playerid, Locked[playerid][3], 1);
PlayerTextDrawColor(playerid, Locked[playerid][3], -5963521);
PlayerTextDrawSetShadow(playerid, Locked[playerid][3], 0);
PlayerTextDrawBackgroundColor(playerid, Locked[playerid][3], 255);
PlayerTextDrawFont(playerid, Locked[playerid][3], 4);
PlayerTextDrawSetProportional(playerid, Locked[playerid][3], 0);

Licht[playerid][0] = CreatePlayerTextDraw(playerid, 596.733398, 366.925903, "D");
PlayerTextDrawLetterSize(playerid, Licht[playerid][0], -0.290333, 1.554370);
PlayerTextDrawAlignment(playerid, Licht[playerid][0], 1);
PlayerTextDrawColor(playerid, Licht[playerid][0], 8388863);
PlayerTextDrawSetShadow(playerid, Licht[playerid][0], 0);
PlayerTextDrawBackgroundColor(playerid, Licht[playerid][0], 255);
PlayerTextDrawFont(playerid, Licht[playerid][0], 1);
PlayerTextDrawSetProportional(playerid, Licht[playerid][0], 1);

Licht[playerid][1] = CreatePlayerTextDraw(playerid, 602.231567, 365.140594, "-");
PlayerTextDrawLetterSize(playerid, Licht[playerid][1], -0.444331, 1.144371);
PlayerTextDrawAlignment(playerid, Licht[playerid][1], 1);
PlayerTextDrawColor(playerid, Licht[playerid][1], 8388863);
PlayerTextDrawSetShadow(playerid, Licht[playerid][1], 0);
PlayerTextDrawBackgroundColor(playerid, Licht[playerid][1], 255);
PlayerTextDrawFont(playerid, Licht[playerid][1], 1);
PlayerTextDrawSetProportional(playerid, Licht[playerid][1], 1);

Licht[playerid][2] = CreatePlayerTextDraw(playerid, 602.231567, 370.340911, "-");
PlayerTextDrawLetterSize(playerid, Licht[playerid][2], -0.444331, 1.144371);
PlayerTextDrawAlignment(playerid, Licht[playerid][2], 1);
PlayerTextDrawColor(playerid, Licht[playerid][2], 8388863);
PlayerTextDrawSetShadow(playerid, Licht[playerid][2], 0);
PlayerTextDrawBackgroundColor(playerid, Licht[playerid][2], 255);
PlayerTextDrawFont(playerid, Licht[playerid][2], 1);
PlayerTextDrawSetProportional(playerid, Licht[playerid][2], 1);

Licht[playerid][3] = CreatePlayerTextDraw(playerid, 602.231567, 367.740753, "-");
PlayerTextDrawLetterSize(playerid, Licht[playerid][3], -0.444331, 1.144371);
PlayerTextDrawAlignment(playerid, Licht[playerid][3], 1);
PlayerTextDrawColor(playerid, Licht[playerid][3], 8388863);
PlayerTextDrawSetShadow(playerid, Licht[playerid][3], 0);
PlayerTextDrawBackgroundColor(playerid, Licht[playerid][3], 255);
PlayerTextDrawFont(playerid, Licht[playerid][3], 1);
PlayerTextDrawSetProportional(playerid, Licht[playerid][3], 1);

Batterie[playerid][0] = CreatePlayerTextDraw(playerid, 560.666503, 388.396484, "LD_SPAC:white");
PlayerTextDrawTextSize(playerid, Batterie[playerid][0], 9.549997, 7.699979);
PlayerTextDrawAlignment(playerid, Batterie[playerid][0], 1);
PlayerTextDrawColor(playerid, Batterie[playerid][0], -16776961);
PlayerTextDrawSetShadow(playerid, Batterie[playerid][0], 0);
PlayerTextDrawBackgroundColor(playerid, Batterie[playerid][0], 255);
PlayerTextDrawFont(playerid, Batterie[playerid][0], 4);
PlayerTextDrawSetProportional(playerid, Batterie[playerid][0], 0);

Batterie[playerid][1] = CreatePlayerTextDraw(playerid, 561.066406, 388.696502, "LD_SPAC:white");
PlayerTextDrawTextSize(playerid, Batterie[playerid][1], 8.709997, 7.069979);
PlayerTextDrawAlignment(playerid, Batterie[playerid][1], 1);
PlayerTextDrawColor(playerid, Batterie[playerid][1], 255);
PlayerTextDrawSetShadow(playerid, Batterie[playerid][1], 0);
PlayerTextDrawBackgroundColor(playerid, Batterie[playerid][1], 255);
PlayerTextDrawFont(playerid, Batterie[playerid][1], 4);
PlayerTextDrawSetProportional(playerid, Batterie[playerid][1], 0);

Batterie[playerid][2] = CreatePlayerTextDraw(playerid, 561.366333, 387.496429, "LD_SPAC:white");
PlayerTextDrawTextSize(playerid, Batterie[playerid][2], 1.989995, 1.189978);
PlayerTextDrawAlignment(playerid, Batterie[playerid][2], 1);
PlayerTextDrawColor(playerid, Batterie[playerid][2], -16776961);
PlayerTextDrawSetShadow(playerid, Batterie[playerid][2], 0);
PlayerTextDrawBackgroundColor(playerid, Batterie[playerid][2], 255);
PlayerTextDrawFont(playerid, Batterie[playerid][2], 4);
PlayerTextDrawSetProportional(playerid, Batterie[playerid][2], 0);

Batterie[playerid][3] = CreatePlayerTextDraw(playerid, 567.064941, 387.496429, "LD_SPAC:white");
PlayerTextDrawTextSize(playerid, Batterie[playerid][3], 1.989995, 1.189978);
PlayerTextDrawAlignment(playerid, Batterie[playerid][3], 1);
PlayerTextDrawColor(playerid, Batterie[playerid][3], -16776961);
PlayerTextDrawSetShadow(playerid, Batterie[playerid][3], 0);
PlayerTextDrawBackgroundColor(playerid, Batterie[playerid][3], 255);
PlayerTextDrawFont(playerid, Batterie[playerid][3], 4);
PlayerTextDrawSetProportional(playerid, Batterie[playerid][3], 0);

Batterie[playerid][4] = CreatePlayerTextDraw(playerid, 561.999816, 389.111175, "+");
PlayerTextDrawLetterSize(playerid, Batterie[playerid][4], 0.099666, 0.427555);
PlayerTextDrawTextSize(playerid, Batterie[playerid][4], -63.000000, 0.000000);
PlayerTextDrawAlignment(playerid, Batterie[playerid][4], 1);
PlayerTextDrawColor(playerid, Batterie[playerid][4], -16776961);
PlayerTextDrawSetShadow(playerid, Batterie[playerid][4], 0);
PlayerTextDrawBackgroundColor(playerid, Batterie[playerid][4], 255);
PlayerTextDrawFont(playerid, Batterie[playerid][4], 1);
PlayerTextDrawSetProportional(playerid, Batterie[playerid][4], 1);

Batterie[playerid][5] = CreatePlayerTextDraw(playerid, 566.798645, 388.611145, "-");
PlayerTextDrawLetterSize(playerid, Batterie[playerid][5], 0.146666, 0.427555);
PlayerTextDrawTextSize(playerid, Batterie[playerid][5], -63.000000, 0.000000);
PlayerTextDrawAlignment(playerid, Batterie[playerid][5], 1);
PlayerTextDrawColor(playerid, Batterie[playerid][5], -16776961);
PlayerTextDrawSetShadow(playerid, Batterie[playerid][5], 0);
PlayerTextDrawBackgroundColor(playerid, Batterie[playerid][5], 255);
PlayerTextDrawFont(playerid, Batterie[playerid][5], 1);
PlayerTextDrawSetProportional(playerid, Batterie[playerid][5], 1);

KMH[playerid] = CreatePlayerTextDraw(playerid, 579.666320, 353.022186, "000_km/h");
PlayerTextDrawLetterSize(playerid, KMH[playerid], 0.161329, 1.060739);
PlayerTextDrawTextSize(playerid, KMH[playerid], 0.000000, 30.000000);
PlayerTextDrawAlignment(playerid, KMH[playerid], 2);
PlayerTextDrawColor(playerid, KMH[playerid], 0x808080FF);
PlayerTextDrawUseBox(playerid, KMH[playerid], 1);
PlayerTextDrawBoxColor(playerid, KMH[playerid], 255);
PlayerTextDrawSetShadow(playerid, KMH[playerid], 0);
PlayerTextDrawBackgroundColor(playerid, KMH[playerid], 255);
PlayerTextDrawFont(playerid, KMH[playerid], 1);
PlayerTextDrawSetProportional(playerid, KMH[playerid], 1);

Kilometerstand[playerid] = CreatePlayerTextDraw(playerid, 580.332824, 415.244659, "000000_km");
PlayerTextDrawLetterSize(playerid, Kilometerstand[playerid], 0.164331, 1.135406);
PlayerTextDrawTextSize(playerid, Kilometerstand[playerid], 0.000000, 35.000000);
PlayerTextDrawAlignment(playerid, Kilometerstand[playerid], 2);
PlayerTextDrawColor(playerid, Kilometerstand[playerid], 0x808080FF);
PlayerTextDrawUseBox(playerid, Kilometerstand[playerid], 1);
PlayerTextDrawBoxColor(playerid, Kilometerstand[playerid], 255);
PlayerTextDrawSetShadow(playerid, Kilometerstand[playerid], 0);
PlayerTextDrawBackgroundColor(playerid, Kilometerstand[playerid], 255);
PlayerTextDrawFont(playerid, Kilometerstand[playerid], 1);
PlayerTextDrawSetProportional(playerid, Kilometerstand[playerid], 1);

Sprit[playerid] = CreatePlayerTextDraw(playerid, 492.665710, 366.711425, "100");
PlayerTextDrawLetterSize(playerid, Sprit[playerid], 0.172664, 1.168591);
PlayerTextDrawTextSize(playerid, Sprit[playerid], 0.000000, 12.000000);
PlayerTextDrawAlignment(playerid, Sprit[playerid], 2);
PlayerTextDrawColor(playerid, Sprit[playerid], 0x808080FF);
PlayerTextDrawUseBox(playerid, Sprit[playerid], 1);
PlayerTextDrawBoxColor(playerid, Sprit[playerid], 255);
PlayerTextDrawSetShadow(playerid, Sprit[playerid], 0);
PlayerTextDrawBackgroundColor(playerid, Sprit[playerid], 255);
PlayerTextDrawFont(playerid, Sprit[playerid], 1);
PlayerTextDrawSetProportional(playerid, Sprit[playerid], 1);

AutoHP[playerid][0] = CreatePlayerTextDraw(playerid, 513.000427, 387.037231, "200");
PlayerTextDrawLetterSize(playerid, AutoHP[playerid][0], 0.176332, 0.758406);
PlayerTextDrawTextSize(playerid, AutoHP[playerid][0], 525.000000, 0.000000);
PlayerTextDrawAlignment(playerid, AutoHP[playerid][0], 1);
PlayerTextDrawColor(playerid, AutoHP[playerid][0], 0x808080FF);
PlayerTextDrawUseBox(playerid, AutoHP[playerid][0], 1);
PlayerTextDrawBoxColor(playerid, AutoHP[playerid][0], 255);
PlayerTextDrawSetShadow(playerid, AutoHP[playerid][0], 0);
PlayerTextDrawBackgroundColor(playerid, AutoHP[playerid][0], 255);
PlayerTextDrawFont(playerid, AutoHP[playerid][0], 1);
PlayerTextDrawSetProportional(playerid, AutoHP[playerid][0], 1);

AutoHP[playerid][1] = CreatePlayerTextDraw(playerid, 515.666564, 377.340728, "LD_SPAC:white");
PlayerTextDrawTextSize(playerid, AutoHP[playerid][1], 6.000000, 6.000000);
PlayerTextDrawAlignment(playerid, AutoHP[playerid][1], 1);
PlayerTextDrawColor(playerid, AutoHP[playerid][1], -16776961);
PlayerTextDrawSetShadow(playerid, AutoHP[playerid][1], 0);
PlayerTextDrawFont(playerid, AutoHP[playerid][1], 4);
PlayerTextDrawSetProportional(playerid, AutoHP[playerid][1], 0);

AutoHP[playerid][2] = CreatePlayerTextDraw(playerid, 515.666564, 369.873931, "LD_SPAC:white");
PlayerTextDrawTextSize(playerid, AutoHP[playerid][2], 6.000000, 6.000000);
PlayerTextDrawAlignment(playerid, AutoHP[playerid][2], 1);
PlayerTextDrawColor(playerid, AutoHP[playerid][2], -5963521);
PlayerTextDrawSetShadow(playerid, AutoHP[playerid][2], 0);
PlayerTextDrawFont(playerid, AutoHP[playerid][2], 4);
PlayerTextDrawSetProportional(playerid, AutoHP[playerid][2], 0);

AutoHP[playerid][3] = CreatePlayerTextDraw(playerid, 515.666564, 361.977447, "LD_SPAC:white");
PlayerTextDrawTextSize(playerid, AutoHP[playerid][3], 6.000000, 6.000000);
PlayerTextDrawAlignment(playerid, AutoHP[playerid][3], 1);
PlayerTextDrawColor(playerid, AutoHP[playerid][3], 16711935);
PlayerTextDrawSetShadow(playerid, AutoHP[playerid][3], 0);
PlayerTextDrawFont(playerid, AutoHP[playerid][3], 4);
PlayerTextDrawSetProportional(playerid, AutoHP[playerid][3], 0);

AutoHP[playerid][4] = CreatePlayerTextDraw(playerid, 515.666564, 354.095825, "LD_SPAC:white");
PlayerTextDrawTextSize(playerid, AutoHP[playerid][4], 6.000000, 6.000000);
PlayerTextDrawAlignment(playerid, AutoHP[playerid][4], 1);
PlayerTextDrawColor(playerid, AutoHP[playerid][4], -1);
PlayerTextDrawSetShadow(playerid, AutoHP[playerid][4], 0);
PlayerTextDrawFont(playerid, AutoHP[playerid][4], 4);
PlayerTextDrawSetProportional(playerid, AutoHP[playerid][4], 0);

/*AutoHP[playerid] = CreatePlayerTextDraw(playerid, 512.999084, 407.778137, "100_%");
PlayerTextDrawLetterSize(playerid, AutoHP[playerid], 0.172664, 1.168591);
PlayerTextDrawTextSize(playerid, AutoHP[playerid], 0.000000, 19.000000);
PlayerTextDrawAlignment(playerid, AutoHP[playerid], 2);
PlayerTextDrawColor(playerid, AutoHP[playerid], -1);
PlayerTextDrawUseBox(playerid, AutoHP[playerid], 1);
PlayerTextDrawBoxColor(playerid, AutoHP[playerid], 255);
PlayerTextDrawSetShadow(playerid, AutoHP[playerid], 0);
PlayerTextDrawBackgroundColor(playerid, AutoHP[playerid], 255);
PlayerTextDrawFont(playerid, AutoHP[playerid], 1);
PlayerTextDrawSetProportional(playerid, AutoHP[playerid], 1);*/

Tachonadel[playerid]= CreatePlayerTextDraw(playerid, 516.333007, 327.148559, "");
PlayerTextDrawSetPreviewRot(playerid, Tachonadel[playerid], 0.000000, 132.500000, 0.000000, 2.00000);
PlayerTextDrawTextSize(playerid, Tachonadel[playerid], 120.000000, 150.000000);
PlayerTextDrawAlignment(playerid, Tachonadel[playerid], 1);
PlayerTextDrawColor(playerid, Tachonadel[playerid], -1);
PlayerTextDrawSetShadow(playerid, Tachonadel[playerid], 0);
PlayerTextDrawBackgroundColor(playerid, Tachonadel[playerid],0);
PlayerTextDrawFont(playerid, Tachonadel[playerid], 5);
PlayerTextDrawSetProportional(playerid, Tachonadel[playerid], 0);
PlayerTextDrawSetPreviewModel(playerid, Tachonadel[playerid], 19348);

Spritnadel[playerid]= CreatePlayerTextDraw(playerid, 449.666534, 351.622955, "");
PlayerTextDrawSetPreviewRot(playerid, Spritnadel[playerid], 0.000000, 90.000000, 0.000000, 2.00000);
PlayerTextDrawTextSize(playerid, Spritnadel[playerid], 102.000000, 112.000000);
PlayerTextDrawAlignment(playerid, Spritnadel[playerid], 1);
PlayerTextDrawColor(playerid, Spritnadel[playerid], -1);
PlayerTextDrawSetShadow(playerid, Spritnadel[playerid], 0);
PlayerTextDrawBackgroundColor(playerid, Spritnadel[playerid],0);
PlayerTextDrawFont(playerid, Spritnadel[playerid], 5);
PlayerTextDrawSetProportional(playerid, Spritnadel[playerid], 0);
PlayerTextDrawSetPreviewModel(playerid, Spritnadel[playerid], 19348);

Tacho_Mitte[playerid] = CreatePlayerTextDraw(playerid, 572.366394, 369.588958, "ld_pool:ball");
PlayerTextDrawTextSize(playerid, Tacho_Mitte[playerid], 15.000000, 17.000000);
PlayerTextDrawAlignment(playerid, Tacho_Mitte[playerid], 1);
PlayerTextDrawColor(playerid, Tacho_Mitte[playerid], 255);
PlayerTextDrawSetShadow(playerid, Tacho_Mitte[playerid], 0);
PlayerTextDrawBackgroundColor(playerid, Tacho_Mitte[playerid], 255);
PlayerTextDrawFont(playerid, Tacho_Mitte[playerid], 4);
PlayerTextDrawSetProportional(playerid, Tacho_Mitte[playerid], 0);

Sprit_Mitte[playerid] = CreatePlayerTextDraw(playerid, 498.033020, 382.863098, "ld_pool:ball");
PlayerTextDrawTextSize(playerid, Sprit_Mitte[playerid], 11.500000, 13.500000);
PlayerTextDrawAlignment(playerid, Sprit_Mitte[playerid], 1);
PlayerTextDrawColor(playerid, Sprit_Mitte[playerid], 255);
PlayerTextDrawSetShadow(playerid, Sprit_Mitte[playerid], 0);
PlayerTextDrawBackgroundColor(playerid, Sprit_Mitte[playerid], 255);
PlayerTextDrawFont(playerid, Sprit_Mitte[playerid], 4);
PlayerTextDrawSetProportional(playerid, Sprit_Mitte[playerid], 0);

Tacho[playerid][0] = CreatePlayerTextDraw(playerid, 553.666564, 400.310791, "0");
PlayerTextDrawLetterSize(playerid, Tacho[playerid][0], 0.156332, 1.317926);
PlayerTextDrawTextSize(playerid, Tacho[playerid][0], -146.000000, 0.000000);
PlayerTextDrawAlignment(playerid, Tacho[playerid][0], 1);
PlayerTextDrawColor(playerid, Tacho[playerid][0], 0x808080FF);
PlayerTextDrawSetShadow(playerid, Tacho[playerid][0], 0);
PlayerTextDrawBackgroundColor(playerid, Tacho[playerid][0], 255);
PlayerTextDrawFont(playerid, Tacho[playerid][0], 1);
PlayerTextDrawSetProportional(playerid, Tacho[playerid][0], 1);

Tacho[playerid][1] = CreatePlayerTextDraw(playerid, 545.666748, 383.718109, "20");
PlayerTextDrawLetterSize(playerid, Tacho[playerid][1], 0.156332, 1.317926);
PlayerTextDrawTextSize(playerid, Tacho[playerid][1], -146.000000, 0.000000);
PlayerTextDrawAlignment(playerid, Tacho[playerid][1], 1);
PlayerTextDrawColor(playerid, Tacho[playerid][1], 0x808080FF);
PlayerTextDrawSetShadow(playerid, Tacho[playerid][1], 0);
PlayerTextDrawBackgroundColor(playerid, Tacho[playerid][1], 255);
PlayerTextDrawFont(playerid, Tacho[playerid][1], 1);
PlayerTextDrawSetProportional(playerid, Tacho[playerid][1], 1);

Tacho[playerid][2] = CreatePlayerTextDraw(playerid, 544.333496, 366.710601, "40");
PlayerTextDrawLetterSize(playerid, Tacho[playerid][2], 0.156332, 1.317926);
PlayerTextDrawTextSize(playerid, Tacho[playerid][2], -146.000000, 0.000000);
PlayerTextDrawAlignment(playerid, Tacho[playerid][2], 1);
PlayerTextDrawColor(playerid, Tacho[playerid][2], 0x808080FF);
PlayerTextDrawSetShadow(playerid, Tacho[playerid][2], 0);
PlayerTextDrawBackgroundColor(playerid, Tacho[playerid][2], 255);
PlayerTextDrawFont(playerid, Tacho[playerid][2], 1);
PlayerTextDrawSetProportional(playerid, Tacho[playerid][2], 1);

Tacho[playerid][3] = CreatePlayerTextDraw(playerid, 548.333312, 350.117736, "60");
PlayerTextDrawLetterSize(playerid, Tacho[playerid][3], 0.156332, 1.317926);
PlayerTextDrawTextSize(playerid, Tacho[playerid][3], -146.000000, 0.000000);
PlayerTextDrawAlignment(playerid, Tacho[playerid][3], 1);
PlayerTextDrawColor(playerid, Tacho[playerid][3], 0x808080FF);
PlayerTextDrawSetShadow(playerid, Tacho[playerid][3], 0);
PlayerTextDrawBackgroundColor(playerid, Tacho[playerid][3], 255);
PlayerTextDrawFont(playerid, Tacho[playerid][3], 1);
PlayerTextDrawSetProportional(playerid, Tacho[playerid][3], 1);

Tacho[playerid][4] = CreatePlayerTextDraw(playerid, 556.666503, 339.332580, "80");
PlayerTextDrawLetterSize(playerid, Tacho[playerid][4], 0.156332, 1.317926);
PlayerTextDrawTextSize(playerid, Tacho[playerid][4], -146.000000, 0.000000);
PlayerTextDrawAlignment(playerid, Tacho[playerid][4], 1);
PlayerTextDrawColor(playerid, Tacho[playerid][4], 0x808080FF);
PlayerTextDrawSetShadow(playerid, Tacho[playerid][4], 0);
PlayerTextDrawBackgroundColor(playerid, Tacho[playerid][4], 255);
PlayerTextDrawFont(playerid, Tacho[playerid][4], 1);
PlayerTextDrawSetProportional(playerid, Tacho[playerid][4], 1);

Tacho[playerid][5] = CreatePlayerTextDraw(playerid, 567.999816, 333.525085, "100");
PlayerTextDrawLetterSize(playerid, Tacho[playerid][5], 0.156332, 1.317926);
PlayerTextDrawTextSize(playerid, Tacho[playerid][5], -146.000000, 0.000000);
PlayerTextDrawAlignment(playerid, Tacho[playerid][5], 1);
PlayerTextDrawColor(playerid, Tacho[playerid][5], 0x808080FF);
PlayerTextDrawSetShadow(playerid, Tacho[playerid][5], 0);
PlayerTextDrawBackgroundColor(playerid, Tacho[playerid][5], 255);
PlayerTextDrawFont(playerid, Tacho[playerid][5], 1);
PlayerTextDrawSetProportional(playerid, Tacho[playerid][5], 1);

Tacho[playerid][6] = CreatePlayerTextDraw(playerid, 582.999816, 332.695495, "120");
PlayerTextDrawLetterSize(playerid, Tacho[playerid][6], 0.156332, 1.317926);
PlayerTextDrawTextSize(playerid, Tacho[playerid][6], -146.000000, 0.000000);
PlayerTextDrawAlignment(playerid, Tacho[playerid][6], 1);
PlayerTextDrawColor(playerid, Tacho[playerid][6], 0x808080FF);
PlayerTextDrawSetShadow(playerid, Tacho[playerid][6], 0);
PlayerTextDrawBackgroundColor(playerid, Tacho[playerid][6], 255);
PlayerTextDrawFont(playerid, Tacho[playerid][6], 1);
PlayerTextDrawSetProportional(playerid, Tacho[playerid][6], 1);

Tacho[playerid][7] = CreatePlayerTextDraw(playerid, 594.665954, 339.332550, "140");
PlayerTextDrawLetterSize(playerid, Tacho[playerid][7], 0.156332, 1.317926);
PlayerTextDrawTextSize(playerid, Tacho[playerid][7], -146.000000, 0.000000);
PlayerTextDrawAlignment(playerid, Tacho[playerid][7], 1);
PlayerTextDrawColor(playerid, Tacho[playerid][7], 0x808080FF);
PlayerTextDrawSetShadow(playerid, Tacho[playerid][7], 0);
PlayerTextDrawBackgroundColor(playerid, Tacho[playerid][7], 255);
PlayerTextDrawFont(playerid, Tacho[playerid][7], 1);
PlayerTextDrawSetProportional(playerid, Tacho[playerid][7], 1);

Tacho[playerid][8] = CreatePlayerTextDraw(playerid, 602.999328, 350.532379, "160");
PlayerTextDrawLetterSize(playerid, Tacho[playerid][8], 0.156332, 1.317926);
PlayerTextDrawTextSize(playerid, Tacho[playerid][8], -146.000000, 0.000000);
PlayerTextDrawAlignment(playerid, Tacho[playerid][8], 1);
PlayerTextDrawColor(playerid, Tacho[playerid][8], 0x808080FF);
PlayerTextDrawSetShadow(playerid, Tacho[playerid][8], 0);
PlayerTextDrawBackgroundColor(playerid, Tacho[playerid][8], 255);
PlayerTextDrawFont(playerid, Tacho[playerid][8], 1);
PlayerTextDrawSetProportional(playerid, Tacho[playerid][8], 1);

Tacho[playerid][9] = CreatePlayerTextDraw(playerid, 608.332397, 367.539886, "180");
PlayerTextDrawLetterSize(playerid, Tacho[playerid][9], 0.156332, 1.317926);
PlayerTextDrawTextSize(playerid, Tacho[playerid][9], -146.000000, 0.000000);
PlayerTextDrawAlignment(playerid, Tacho[playerid][9], 1);
PlayerTextDrawColor(playerid, Tacho[playerid][9], 0x808080FF);
PlayerTextDrawSetShadow(playerid, Tacho[playerid][9], 0);
PlayerTextDrawBackgroundColor(playerid, Tacho[playerid][9], 255);
PlayerTextDrawFont(playerid, Tacho[playerid][9], 1);
PlayerTextDrawSetProportional(playerid, Tacho[playerid][9], 1);

Tacho[playerid][10] = CreatePlayerTextDraw(playerid, 605.332580, 385.791870, "200");
PlayerTextDrawLetterSize(playerid, Tacho[playerid][10], 0.156332, 1.317926);
PlayerTextDrawTextSize(playerid, Tacho[playerid][10], -146.000000, 0.000000);
PlayerTextDrawAlignment(playerid, Tacho[playerid][10], 1);
PlayerTextDrawColor(playerid, Tacho[playerid][10], 0x808080FF);
PlayerTextDrawSetShadow(playerid, Tacho[playerid][10], 0);
PlayerTextDrawBackgroundColor(playerid, Tacho[playerid][10], 255);
PlayerTextDrawFont(playerid, Tacho[playerid][10], 1);
PlayerTextDrawSetProportional(playerid, Tacho[playerid][10], 1);

Tacho[playerid][11] = CreatePlayerTextDraw(playerid, 596.999389, 400.725311, "220");
PlayerTextDrawLetterSize(playerid, Tacho[playerid][11], 0.156332, 1.317926);
PlayerTextDrawTextSize(playerid, Tacho[playerid][11], -146.000000, 0.000000);
PlayerTextDrawAlignment(playerid, Tacho[playerid][11], 1);
PlayerTextDrawColor(playerid, Tacho[playerid][11], 0x808080FF);
PlayerTextDrawSetShadow(playerid, Tacho[playerid][11], 0);
PlayerTextDrawBackgroundColor(playerid, Tacho[playerid][11], 255);
PlayerTextDrawFont(playerid, Tacho[playerid][11], 1);
PlayerTextDrawSetProportional(playerid, Tacho[playerid][11], 1);

Tacho[playerid][12] = CreatePlayerTextDraw(playerid, 501.999389, 353.021453, "F");
PlayerTextDrawLetterSize(playerid, Tacho[playerid][12], 0.156332, 1.317926);
PlayerTextDrawTextSize(playerid, Tacho[playerid][12], -146.000000, 0.000000);
PlayerTextDrawAlignment(playerid, Tacho[playerid][12], 1);
PlayerTextDrawColor(playerid, Tacho[playerid][12], 0x808080FF);
PlayerTextDrawSetShadow(playerid, Tacho[playerid][12], 0);
PlayerTextDrawBackgroundColor(playerid, Tacho[playerid][12], 255);
PlayerTextDrawFont(playerid, Tacho[playerid][12], 1);
PlayerTextDrawSetProportional(playerid, Tacho[playerid][12], 1);

Tacho[playerid][13] = CreatePlayerTextDraw(playerid, 472.666076, 382.473388, "E");
PlayerTextDrawLetterSize(playerid, Tacho[playerid][13], 0.156332, 1.317926);
PlayerTextDrawTextSize(playerid, Tacho[playerid][13], -146.000000, 0.000000);
PlayerTextDrawAlignment(playerid, Tacho[playerid][13], 1);
PlayerTextDrawColor(playerid, Tacho[playerid][13], -16776961);
PlayerTextDrawSetShadow(playerid, Tacho[playerid][13], 0);
PlayerTextDrawBackgroundColor(playerid, Tacho[playerid][13], 255);
PlayerTextDrawFont(playerid, Tacho[playerid][13], 1);
PlayerTextDrawSetProportional(playerid, Tacho[playerid][13], 1);

Tacho[playerid][14] = CreatePlayerTextDraw(playerid, 465.666198, 383.717773, "-");
PlayerTextDrawLetterSize(playerid, Tacho[playerid][14], 0.510333, 0.961184);
PlayerTextDrawTextSize(playerid, Tacho[playerid][14], -1455.000000, 0.000000);
PlayerTextDrawAlignment(playerid, Tacho[playerid][14], 1);
PlayerTextDrawColor(playerid, Tacho[playerid][14], -16776961);
PlayerTextDrawSetShadow(playerid, Tacho[playerid][14], 0);
PlayerTextDrawBackgroundColor(playerid, Tacho[playerid][14], 255);
PlayerTextDrawFont(playerid, Tacho[playerid][14], 1);
PlayerTextDrawSetProportional(playerid, Tacho[playerid][14], 1);

Tacho[playerid][15] = CreatePlayerTextDraw(playerid, 501.999572, 341.406799, "I");
PlayerTextDrawLetterSize(playerid, Tacho[playerid][15], 0.307999, 1.454815);
PlayerTextDrawTextSize(playerid, Tacho[playerid][15], -1521.000000, 0.000000);
PlayerTextDrawAlignment(playerid, Tacho[playerid][15], 1);
PlayerTextDrawColor(playerid, Tacho[playerid][15], 0x808080FF);
PlayerTextDrawSetShadow(playerid, Tacho[playerid][15], 0);
PlayerTextDrawBackgroundColor(playerid, Tacho[playerid][15], 255);
PlayerTextDrawFont(playerid, Tacho[playerid][15], 1);
PlayerTextDrawSetProportional(playerid, Tacho[playerid][15], 1);

Tacho[playerid][16] = CreatePlayerTextDraw(playerid, 484.966705, 385.222320, "LD_SPAC:white");
PlayerTextDrawTextSize(playerid, Tacho[playerid][16], 4.050001, 9.000000);
PlayerTextDrawAlignment(playerid, Tacho[playerid][16], 1);
PlayerTextDrawColor(playerid, Tacho[playerid][16], -1);
PlayerTextDrawSetShadow(playerid, Tacho[playerid][16], 0);
PlayerTextDrawBackgroundColor(playerid, Tacho[playerid][16], 255);
PlayerTextDrawFont(playerid, Tacho[playerid][16], 4);
PlayerTextDrawSetProportional(playerid, Tacho[playerid][16], 0);

Tacho[playerid][17] = CreatePlayerTextDraw(playerid, 485.466735, 385.822357, "LD_SPAC:white");
PlayerTextDrawTextSize(playerid, Tacho[playerid][17], 3.000000, 3.000000);
PlayerTextDrawAlignment(playerid, Tacho[playerid][17], 1);
PlayerTextDrawColor(playerid, Tacho[playerid][17], 255);
PlayerTextDrawSetShadow(playerid, Tacho[playerid][17], 0);
PlayerTextDrawBackgroundColor(playerid, Tacho[playerid][17], 255);
PlayerTextDrawFont(playerid, Tacho[playerid][17], 4);
PlayerTextDrawSetProportional(playerid, Tacho[playerid][17], 0);

Tacho[playerid][18] = CreatePlayerTextDraw(playerid, 488.033508, 383.274291, "D");
PlayerTextDrawLetterSize(playerid, Tacho[playerid][18], 0.126999, 1.203112);
PlayerTextDrawAlignment(playerid, Tacho[playerid][18], 1);
PlayerTextDrawColor(playerid, Tacho[playerid][18], -1);
PlayerTextDrawSetShadow(playerid, Tacho[playerid][18], 0);
PlayerTextDrawBackgroundColor(playerid, Tacho[playerid][18], 255);
PlayerTextDrawFont(playerid, Tacho[playerid][18], 1);
PlayerTextDrawSetProportional(playerid, Tacho[playerid][18], 1);

BlinkerRechts[playerid] = CreatePlayerTextDraw(playerid, 522.666137, 407.622314, "LD_BEAT:right");
PlayerTextDrawTextSize(playerid, BlinkerRechts[playerid], 10.000000, 9.000000);
PlayerTextDrawAlignment(playerid, BlinkerRechts[playerid], 1);
PlayerTextDrawColor(playerid, BlinkerRechts[playerid], 16711935);
PlayerTextDrawSetShadow(playerid, BlinkerRechts[playerid], 0);
PlayerTextDrawBackgroundColor(playerid, BlinkerRechts[playerid], 255);
PlayerTextDrawFont(playerid, BlinkerRechts[playerid], 4);
PlayerTextDrawSetProportional(playerid, BlinkerRechts[playerid], 0);

BlinkerLinks[playerid] = CreatePlayerTextDraw(playerid, 485.666046, 407.207489, "LD_BEAT:right");
PlayerTextDrawTextSize(playerid, BlinkerLinks[playerid], -10.000000, 9.000000);
PlayerTextDrawAlignment(playerid, BlinkerLinks[playerid], 1);
PlayerTextDrawColor(playerid, BlinkerLinks[playerid], 16711935);
PlayerTextDrawSetShadow(playerid, BlinkerLinks[playerid], 0);
PlayerTextDrawBackgroundColor(playerid, BlinkerLinks[playerid], 255);
PlayerTextDrawFont(playerid, BlinkerLinks[playerid], 4);
PlayerTextDrawSetProportional(playerid, BlinkerLinks[playerid], 0);
PlayerTextDrawSetSelectable(playerid, BlinkerLinks[playerid], true);

/*Tacho[playerid] = CreatePlayerTextDraw(playerid, 455.999969, 310.555694, "Tacho:Tacho");
PlayerTextDrawTextSize(playerid, Tacho[playerid], 184.000000, 140.000000);
PlayerTextDrawAlignment(playerid, Tacho[playerid], 1);
PlayerTextDrawColor(playerid, Tacho[playerid], -1);
PlayerTextDrawSetShadow(playerid, Tacho[playerid], 0);
PlayerTextDrawBackgroundColor(playerid, Tacho[playerid], 255);
PlayerTextDrawFont(playerid, Tacho[playerid], 4);
PlayerTextDrawSetProportional(playerid, Tacho[playerid], 0);*/

Airspeeed[playerid] = CreatePlayerTextDraw(playerid, 539.999816, 333.370391, "Tacho:SteamGauge");
PlayerTextDrawTextSize(playerid, Airspeeed[playerid], 100.000000, 109.000000);
PlayerTextDrawAlignment(playerid, Airspeeed[playerid], 1);
PlayerTextDrawColor(playerid, Airspeeed[playerid], -1);
PlayerTextDrawSetShadow(playerid, Airspeeed[playerid], 0);
PlayerTextDrawBackgroundColor(playerid, Airspeeed[playerid], 0);
PlayerTextDrawFont(playerid, Airspeeed[playerid], 4);
PlayerTextDrawSetProportional(playerid, Airspeeed[playerid], 0);

Airspeed[playerid] = CreatePlayerTextDraw(playerid, 547.999511, 343.325866, "Tacho:Airspeed");
PlayerTextDrawTextSize(playerid, Airspeed[playerid], 84.000000, 90.000000);
PlayerTextDrawAlignment(playerid, Airspeed[playerid], 1);
PlayerTextDrawColor(playerid, Airspeed[playerid], -1);
PlayerTextDrawSetShadow(playerid, Airspeed[playerid], 0);
PlayerTextDrawBackgroundColor(playerid, Airspeed[playerid], 255);
PlayerTextDrawFont(playerid, Airspeed[playerid], 4);
PlayerTextDrawSetProportional(playerid, Airspeed[playerid], 0);

Airspeeddisplay[playerid] = CreatePlayerTextDraw(playerid, 585.666931, 392.429656, "000");
PlayerTextDrawLetterSize(playerid, Airspeeddisplay[playerid], 0.139665, 0.567109);
PlayerTextDrawTextSize(playerid, Airspeeddisplay[playerid], 594.000000, 0.000000);
PlayerTextDrawAlignment(playerid, Airspeeddisplay[playerid], 1);
PlayerTextDrawColor(playerid, Airspeeddisplay[playerid], -1);
PlayerTextDrawUseBox(playerid, Airspeeddisplay[playerid], 1);
PlayerTextDrawBoxColor(playerid, Airspeeddisplay[playerid], 255);
PlayerTextDrawSetShadow(playerid, Airspeeddisplay[playerid], 0);
PlayerTextDrawBackgroundColor(playerid, Airspeeddisplay[playerid], 255);
PlayerTextDrawFont(playerid, Airspeeddisplay[playerid], 1);
PlayerTextDrawSetProportional(playerid, Airspeeddisplay[playerid], 1);

Airspeedindicator[playerid] = CreatePlayerTextDraw(playerid, 525.999511, 340.836730, "");
PlayerTextDrawTextSize(playerid, Airspeedindicator[playerid], 122.000000, 129.000000);
PlayerTextDrawAlignment(playerid, Airspeedindicator[playerid], 1);
PlayerTextDrawColor(playerid, Airspeedindicator[playerid], -16776961);
PlayerTextDrawSetShadow(playerid, Airspeedindicator[playerid], 0);
PlayerTextDrawFont(playerid, Airspeedindicator[playerid], 5);
PlayerTextDrawBackgroundColor(playerid, Airspeedindicator[playerid], 0);
PlayerTextDrawSetProportional(playerid, Airspeedindicator[playerid], 0);
PlayerTextDrawSetPreviewModel(playerid, Airspeedindicator[playerid], 19348);
PlayerTextDrawSetPreviewRot(playerid, Airspeedindicator[playerid], 0.000000, 325.000000, 0.000000, 2.500000);

Alittudegauge[playerid] = CreatePlayerTextDraw(playerid, 439.000061, 332.955566, "Tacho:SteamGauge");
PlayerTextDrawTextSize(playerid, Alittudegauge[playerid], 100.000000, 109.000000);
PlayerTextDrawAlignment(playerid, Alittudegauge[playerid], 1);
PlayerTextDrawColor(playerid, Alittudegauge[playerid], -1);
PlayerTextDrawSetShadow(playerid, Alittudegauge[playerid], 0);
PlayerTextDrawBackgroundColor(playerid, Alittudegauge[playerid], 255);
PlayerTextDrawFont(playerid, Alittudegauge[playerid], 4);
PlayerTextDrawSetProportional(playerid, Alittudegauge[playerid], 0);

Altimeter[playerid] = CreatePlayerTextDraw(playerid, 450.333496, 344.570434, "Tacho:Altimeter");
PlayerTextDrawTextSize(playerid, Altimeter[playerid], 78.000000, 86.000000);
PlayerTextDrawAlignment(playerid, Altimeter[playerid], 1);
PlayerTextDrawColor(playerid, Altimeter[playerid], -1);
PlayerTextDrawSetShadow(playerid, Altimeter[playerid], 0);
PlayerTextDrawBackgroundColor(playerid, Altimeter[playerid], 255);
PlayerTextDrawFont(playerid, Altimeter[playerid], 4);
PlayerTextDrawSetProportional(playerid, Altimeter[playerid], 0);

Altdisplay[playerid] = CreatePlayerTextDraw(playerid, 479.666992, 369.614746, "0000");
PlayerTextDrawLetterSize(playerid, Altdisplay[playerid], 0.221331, 1.089774);
PlayerTextDrawTextSize(playerid, Altdisplay[playerid], 485.000000, 0.000000);
PlayerTextDrawAlignment(playerid, Altdisplay[playerid], 1);
PlayerTextDrawColor(playerid, Altdisplay[playerid], -1);
PlayerTextDrawSetShadow(playerid, Altdisplay[playerid], 0);
PlayerTextDrawBackgroundColor(playerid, Altdisplay[playerid], 255);
PlayerTextDrawFont(playerid, Altdisplay[playerid], 1);
PlayerTextDrawSetProportional(playerid, Altdisplay[playerid], 1);

Tausendnadel[playerid] = CreatePlayerTextDraw(playerid, 427.333007, 338.762634, "");
PlayerTextDrawTextSize(playerid, Tausendnadel[playerid], 118.000000, 139.000000);
PlayerTextDrawAlignment(playerid, Tausendnadel[playerid], 1);
PlayerTextDrawColor(playerid, Tausendnadel[playerid], -16776961);
PlayerTextDrawSetShadow(playerid, Tausendnadel[playerid], 0);
PlayerTextDrawFont(playerid, Tausendnadel[playerid], 5);
PlayerTextDrawBackgroundColor(playerid, Tausendnadel[playerid],0);
PlayerTextDrawSetProportional(playerid, Tausendnadel[playerid], 0);
PlayerTextDrawSetPreviewModel(playerid, Tausendnadel[playerid], 19348);
PlayerTextDrawSetPreviewRot(playerid, Tausendnadel[playerid], 0.000000, 0.000000, 0.000000, 2.500000);

Hundertnadel[playerid] = CreatePlayerTextDraw(playerid, 436.666320, 350.792602, "");
PlayerTextDrawTextSize(playerid, Hundertnadel[playerid], 100.000000, 110.000000);
PlayerTextDrawAlignment(playerid, Hundertnadel[playerid], 1);
PlayerTextDrawColor(playerid, Hundertnadel[playerid], -16776961);
PlayerTextDrawSetShadow(playerid, Hundertnadel[playerid], 0);
PlayerTextDrawFont(playerid, Hundertnadel[playerid], 5);
PlayerTextDrawBackgroundColor(playerid, Hundertnadel[playerid],0);
PlayerTextDrawSetProportional(playerid, Hundertnadel[playerid], 0);
PlayerTextDrawSetPreviewModel(playerid, Hundertnadel[playerid], 19348);
PlayerTextDrawSetPreviewRot(playerid, Hundertnadel[playerid], 0.000000, 0.000000, 0.000000, 2.500000);

SteigtSinkt[playerid] = CreatePlayerTextDraw(playerid, 338.999969, 332.125946, "Tacho:SteamGauge");
PlayerTextDrawTextSize(playerid, SteigtSinkt[playerid], 100.000000, 109.000000);
PlayerTextDrawAlignment(playerid, SteigtSinkt[playerid], 1);
PlayerTextDrawColor(playerid, SteigtSinkt[playerid], -1);
PlayerTextDrawSetShadow(playerid, SteigtSinkt[playerid], 0);
PlayerTextDrawBackgroundColor(playerid, SteigtSinkt[playerid], 255);
PlayerTextDrawFont(playerid, SteigtSinkt[playerid], 4);
PlayerTextDrawSetProportional(playerid, SteigtSinkt[playerid], 0);

SteigtHintergrund[playerid] = CreatePlayerTextDraw(playerid, 486.666870, 387.296386, "LD_POOL:ball");
PlayerTextDrawTextSize(playerid, SteigtHintergrund[playerid], 6.000000, 7.000000);
PlayerTextDrawAlignment(playerid, SteigtHintergrund[playerid], 1);
PlayerTextDrawColor(playerid, SteigtHintergrund[playerid], 255);
PlayerTextDrawSetShadow(playerid, SteigtHintergrund[playerid], 0);
PlayerTextDrawBackgroundColor(playerid, SteigtHintergrund[playerid], 255);
PlayerTextDrawFont(playerid, SteigtHintergrund[playerid], 4);
PlayerTextDrawSetProportional(playerid, SteigtHintergrund[playerid], 0);

Variometer[playerid] = CreatePlayerTextDraw(playerid, 350.000030, 343.740631, "Tacho:Variometer");
PlayerTextDrawTextSize(playerid, Variometer[playerid], 78.000000, 86.000000);
PlayerTextDrawAlignment(playerid, Variometer[playerid], 1);
PlayerTextDrawColor(playerid, Variometer[playerid], -1);
PlayerTextDrawSetShadow(playerid, Variometer[playerid], 0);
PlayerTextDrawBackgroundColor(playerid, Variometer[playerid], 255);
PlayerTextDrawFont(playerid, Variometer[playerid], 4);
PlayerTextDrawSetProportional(playerid, Variometer[playerid], 0);

Variodisplay[playerid] = CreatePlayerTextDraw(playerid, 423.333801, 382.059234, "0000_ft/min");
PlayerTextDrawLetterSize(playerid, Variodisplay[playerid], 0.121996, 0.815994);
PlayerTextDrawTextSize(playerid, Variodisplay[playerid], 485.000000, 0.000000);
PlayerTextDrawAlignment(playerid, Variodisplay[playerid], 3);
PlayerTextDrawColor(playerid, Variodisplay[playerid], -1);
PlayerTextDrawSetShadow(playerid, Variodisplay[playerid], 0);
PlayerTextDrawBackgroundColor(playerid, Variodisplay[playerid], 255);
PlayerTextDrawFont(playerid, Variodisplay[playerid], 1);
PlayerTextDrawSetProportional(playerid, Variodisplay[playerid], 1);

Steigtnadel[playerid] = CreatePlayerTextDraw(playerid, 337.999603, 344.570312, "");
PlayerTextDrawTextSize(playerid, Steigtnadel[playerid], 102.000000, 116.000000);
PlayerTextDrawAlignment(playerid, Steigtnadel[playerid], 1);
PlayerTextDrawColor(playerid, Steigtnadel[playerid], -16776961);
PlayerTextDrawSetShadow(playerid, Steigtnadel[playerid], 0);
PlayerTextDrawFont(playerid, Steigtnadel[playerid], 5);
PlayerTextDrawBackgroundColor(playerid, Steigtnadel[playerid],0);
PlayerTextDrawSetProportional(playerid, Steigtnadel[playerid], 0);
PlayerTextDrawSetPreviewModel(playerid, Steigtnadel[playerid], 19348);
PlayerTextDrawSetPreviewRot(playerid, Steigtnadel[playerid], 0.000000, 90.000000, 0.000000, 2.500000);

Altideckel[playerid] = CreatePlayerTextDraw(playerid, 586.666748, 385.637145, "LD_POOL:ball");
PlayerTextDrawTextSize(playerid, Altideckel[playerid], 6.000000, 7.000000);
PlayerTextDrawAlignment(playerid, Altideckel[playerid], 1);
PlayerTextDrawColor(playerid, Altideckel[playerid], 255);
PlayerTextDrawSetShadow(playerid, Altideckel[playerid], 0);
PlayerTextDrawBackgroundColor(playerid, Altideckel[playerid], 255);
PlayerTextDrawFont(playerid, Altideckel[playerid], 4);
PlayerTextDrawSetProportional(playerid, Altideckel[playerid], 0);

Airspeeddeckel[playerid] = CreatePlayerTextDraw(playerid, 388.000091, 383.563049, "LD_POOL:ball");
PlayerTextDrawTextSize(playerid, Airspeeddeckel[playerid], 6.000000, 7.000000);
PlayerTextDrawAlignment(playerid, Airspeeddeckel[playerid], 1);
PlayerTextDrawColor(playerid, Airspeeddeckel[playerid], 255);
PlayerTextDrawSetShadow(playerid, Airspeeddeckel[playerid], 0);
PlayerTextDrawBackgroundColor(playerid, Airspeeddeckel[playerid], 255);
PlayerTextDrawFont(playerid, Airspeeddeckel[playerid], 4);
PlayerTextDrawSetProportional(playerid, Airspeeddeckel[playerid], 0);

CRTLboard_plane[playerid] = CreatePlayerTextDraw(playerid, -19.666675, 346.644622, "LD_SPAC:white");
PlayerTextDrawTextSize(playerid, CRTLboard_plane[playerid], 56.000000, 64.000000);
PlayerTextDrawAlignment(playerid, CRTLboard_plane[playerid], 1);
PlayerTextDrawColor(playerid, CRTLboard_plane[playerid], 1094795775);
PlayerTextDrawSetShadow(playerid, CRTLboard_plane[playerid], 0);
PlayerTextDrawBackgroundColor(playerid, CRTLboard_plane[playerid], 255);
PlayerTextDrawFont(playerid, CRTLboard_plane[playerid], 4);
PlayerTextDrawSetProportional(playerid, CRTLboard_plane[playerid], 0);

CRTLboard1_plane[playerid] = CreatePlayerTextDraw(playerid, -8.666679, 320.096343, "LD_SPAC:white");
PlayerTextDrawTextSize(playerid, CRTLboard1_plane[playerid], 56.000000, 35.000000);
PlayerTextDrawAlignment(playerid, CRTLboard1_plane[playerid], 1);
PlayerTextDrawColor(playerid, CRTLboard1_plane[playerid], 1094795775);
PlayerTextDrawSetShadow(playerid, CRTLboard1_plane[playerid], 0);
PlayerTextDrawBackgroundColor(playerid, CRTLboard1_plane[playerid], 255);
PlayerTextDrawFont(playerid, CRTLboard1_plane[playerid], 4);
PlayerTextDrawSetProportional(playerid, CRTLboard1_plane[playerid], 0);

CRTLboard2_plane[playerid] = CreatePlayerTextDraw(playerid, -11.000013, 399.740844, "LD_SPAC:white");
PlayerTextDrawTextSize(playerid, CRTLboard2_plane[playerid], 56.000000, 35.000000);
PlayerTextDrawAlignment(playerid, CRTLboard2_plane[playerid], 1);
PlayerTextDrawColor(playerid, CRTLboard2_plane[playerid], 1094795775);
PlayerTextDrawSetShadow(playerid, CRTLboard2_plane[playerid], 0);
PlayerTextDrawBackgroundColor(playerid, CRTLboard2_plane[playerid], 255);
PlayerTextDrawFont(playerid, CRTLboard2_plane[playerid], 4);
PlayerTextDrawSetProportional(playerid, CRTLboard2_plane[playerid], 0);

ArtHorizon[playerid] = CreatePlayerTextDraw(playerid, 12.666863, 313.459136, "Tacho:SteamGauge");
PlayerTextDrawTextSize(playerid,ArtHorizon[playerid], 114.000000, 129.000000);
PlayerTextDrawAlignment(playerid,ArtHorizon[playerid], 1);
PlayerTextDrawColor(playerid,ArtHorizon[playerid], -1);
PlayerTextDrawSetShadow(playerid,ArtHorizon[playerid], 0);
PlayerTextDrawBackgroundColor(playerid,ArtHorizon[playerid], 255);
PlayerTextDrawFont(playerid,ArtHorizon[playerid], 4);
PlayerTextDrawSetProportional(playerid,ArtHorizon[playerid], 0);

Kompass_Gauge[playerid] = CreatePlayerTextDraw(playerid, 239.000274, 332.125854, "Tacho:SteamGauge");
PlayerTextDrawTextSize(playerid, Kompass_Gauge[playerid], 100.000000, 109.000000);
PlayerTextDrawAlignment(playerid, Kompass_Gauge[playerid], 1);
PlayerTextDrawColor(playerid, Kompass_Gauge[playerid], -1);
PlayerTextDrawSetShadow(playerid, Kompass_Gauge[playerid], 0);
PlayerTextDrawBackgroundColor(playerid, Kompass_Gauge[playerid], 255);
PlayerTextDrawFont(playerid, Kompass_Gauge[playerid], 4);
PlayerTextDrawSetProportional(playerid, Kompass_Gauge[playerid], 0);

Kompass_Hintergrund[playerid] = CreatePlayerTextDraw(playerid, 262.999893, 357.014770, "LD_SPAC:white");
PlayerTextDrawTextSize(playerid, Kompass_Hintergrund[playerid], 53.000000, 60.000000);
PlayerTextDrawAlignment(playerid, Kompass_Hintergrund[playerid], 1);
PlayerTextDrawColor(playerid, Kompass_Hintergrund[playerid], 255);
PlayerTextDrawSetShadow(playerid, Kompass_Hintergrund[playerid], 0);
PlayerTextDrawBackgroundColor(playerid, Kompass_Hintergrund[playerid], 255);
PlayerTextDrawFont(playerid, Kompass_Hintergrund[playerid], 4);
PlayerTextDrawSetProportional(playerid, Kompass_Hintergrund[playerid], 0);

Kompass_N[playerid] = CreatePlayerTextDraw(playerid, 283.999938, 347.629608, "N");
PlayerTextDrawLetterSize(playerid, Kompass_N[playerid], 0.400000, 1.600000);
PlayerTextDrawAlignment(playerid, Kompass_N[playerid], 1);
PlayerTextDrawColor(playerid, Kompass_N[playerid], -1);
PlayerTextDrawSetShadow(playerid, Kompass_N[playerid], 0);
PlayerTextDrawBackgroundColor(playerid, Kompass_N[playerid], 255);
PlayerTextDrawFont(playerid, Kompass_N[playerid], 1);
PlayerTextDrawSetProportional(playerid, Kompass_N[playerid], 1);

Kompass_E[playerid] = CreatePlayerTextDraw(playerid, 317.333343, 379.155700, "E");
PlayerTextDrawLetterSize(playerid, Kompass_E[playerid], 0.400000, 1.600000);
PlayerTextDrawAlignment(playerid, Kompass_E[playerid], 1);
PlayerTextDrawColor(playerid, Kompass_E[playerid], -1);
PlayerTextDrawSetShadow(playerid, Kompass_E[playerid], 0);
PlayerTextDrawBackgroundColor(playerid, Kompass_E[playerid], 255);
PlayerTextDrawFont(playerid, Kompass_E[playerid], 1);
PlayerTextDrawSetProportional(playerid, Kompass_E[playerid], 1);

Kompass_S[playerid] = CreatePlayerTextDraw(playerid, 285.333221, 411.511352, "S");
PlayerTextDrawLetterSize(playerid, Kompass_S[playerid], 0.400000, 1.600000);
PlayerTextDrawAlignment(playerid, Kompass_S[playerid], 1);
PlayerTextDrawColor(playerid, Kompass_S[playerid], -1);
PlayerTextDrawSetShadow(playerid, Kompass_S[playerid], 0);
PlayerTextDrawBackgroundColor(playerid, Kompass_S[playerid], 255);
PlayerTextDrawFont(playerid, Kompass_S[playerid], 1);
PlayerTextDrawSetProportional(playerid, Kompass_S[playerid], 1);

Kompass_W[playerid] = CreatePlayerTextDraw(playerid, 252.999969, 379.570434, "W");
PlayerTextDrawLetterSize(playerid, Kompass_W[playerid], 0.349666, 1.554370);
PlayerTextDrawAlignment(playerid, Kompass_W[playerid], 1);
PlayerTextDrawColor(playerid, Kompass_W[playerid], -1);
PlayerTextDrawSetShadow(playerid, Kompass_W[playerid], 0);
PlayerTextDrawBackgroundColor(playerid, Kompass_W[playerid], 255);
PlayerTextDrawFont(playerid, Kompass_W[playerid], 1);
PlayerTextDrawSetProportional(playerid, Kompass_W[playerid], 1);

Kompass_Icon[playerid] = CreatePlayerTextDraw(playerid, 253.666580, 351.207550, "");
PlayerTextDrawTextSize(playerid, Kompass_Icon[playerid], 76.000000, 70.000000);
PlayerTextDrawAlignment(playerid, Kompass_Icon[playerid], 1);
PlayerTextDrawColor(playerid, Kompass_Icon[playerid], -1);
PlayerTextDrawSetShadow(playerid, Kompass_Icon[playerid], 0);
PlayerTextDrawFont(playerid, Kompass_Icon[playerid], 5);
PlayerTextDrawBackgroundColor(playerid, Kompass_Icon[playerid],0);
PlayerTextDrawSetProportional(playerid, Kompass_Icon[playerid], 0);
PlayerTextDrawSetPreviewModel(playerid, Kompass_Icon[playerid], 476);
PlayerTextDrawSetPreviewRot(playerid, Kompass_Icon[playerid], 90.000000, 180.000000, 0.000000, 1.000000);
PlayerTextDrawSetPreviewVehCol(playerid, Kompass_Icon[playerid], 1, 1);

Flug_Info[playerid] = CreatePlayerTextDraw(playerid, 137.000198, 332.540679, "Tacho:SteamGauge");
PlayerTextDrawTextSize(playerid, Flug_Info[playerid], 100.000000, 109.000000);
PlayerTextDrawAlignment(playerid, Flug_Info[playerid], 1);
PlayerTextDrawColor(playerid, Flug_Info[playerid], -1);
PlayerTextDrawSetShadow(playerid, Flug_Info[playerid], 0);
PlayerTextDrawBackgroundColor(playerid, Flug_Info[playerid], 255);
PlayerTextDrawFont(playerid, Flug_Info[playerid], 4);
PlayerTextDrawSetProportional(playerid, Flug_Info[playerid], 0);

Flug_InfoHintergrund[playerid] = CreatePlayerTextDraw(playerid, 160.999908, 357.429565, "LD_SPAC:white");
PlayerTextDrawTextSize(playerid, Flug_InfoHintergrund[playerid], 53.000000, 60.000000);
PlayerTextDrawAlignment(playerid, Flug_InfoHintergrund[playerid], 1);
PlayerTextDrawColor(playerid, Flug_InfoHintergrund[playerid], 255);
PlayerTextDrawSetShadow(playerid, Flug_InfoHintergrund[playerid], 0);
PlayerTextDrawBackgroundColor(playerid, Flug_InfoHintergrund[playerid], 255);
PlayerTextDrawFont(playerid, Flug_InfoHintergrund[playerid], 4);
PlayerTextDrawSetProportional(playerid, Flug_InfoHintergrund[playerid], 0);

Abgrenzung[playerid][1] = CreatePlayerTextDraw(playerid, 144.333419, 375.422302, "-");
PlayerTextDrawLetterSize(playerid, Abgrenzung[playerid][1], 6.089662, 0.662518);
PlayerTextDrawAlignment(playerid, Abgrenzung[playerid][1], 1);
PlayerTextDrawColor(playerid, Abgrenzung[playerid][1], -1);
PlayerTextDrawSetShadow(playerid, Abgrenzung[playerid][1], 0);
PlayerTextDrawBackgroundColor(playerid, Abgrenzung[playerid][1], 255);
PlayerTextDrawFont(playerid, Abgrenzung[playerid][1], 1);
PlayerTextDrawSetProportional(playerid, Abgrenzung[playerid][1], 1);

LFuel[playerid] = CreatePlayerTextDraw(playerid, 164.333267, 359.659423, "Fuel_L:");
PlayerTextDrawLetterSize(playerid, LFuel[playerid], 0.135666, 0.791111);
PlayerTextDrawTextSize(playerid, LFuel[playerid], -82.000000, 0.000000);
PlayerTextDrawAlignment(playerid, LFuel[playerid], 1);
PlayerTextDrawColor(playerid, LFuel[playerid], -1);
PlayerTextDrawSetShadow(playerid, LFuel[playerid], 0);
PlayerTextDrawBackgroundColor(playerid, LFuel[playerid], 255);
PlayerTextDrawFont(playerid, LFuel[playerid], 1);
PlayerTextDrawSetProportional(playerid, LFuel[playerid], 1);

RFuel[playerid] = CreatePlayerTextDraw(playerid, 195.999862, 359.659332, "Fuel_R:");
PlayerTextDrawLetterSize(playerid, RFuel[playerid], 0.135666, 0.791111);
PlayerTextDrawTextSize(playerid, RFuel[playerid], -82.000000, 0.000000);
PlayerTextDrawAlignment(playerid, RFuel[playerid], 1);
PlayerTextDrawColor(playerid, RFuel[playerid], -1);
PlayerTextDrawSetShadow(playerid, RFuel[playerid], 0);
PlayerTextDrawBackgroundColor(playerid, RFuel[playerid], 255);
PlayerTextDrawFont(playerid, RFuel[playerid], 1);
PlayerTextDrawSetProportional(playerid, RFuel[playerid], 1);

Fuel1[playerid] = CreatePlayerTextDraw(playerid, 164.666519, 368.370422, "100_%");
PlayerTextDrawLetterSize(playerid, Fuel1[playerid], 0.134663, 0.791109);
PlayerTextDrawTextSize(playerid, Fuel1[playerid], 222.000000, 0.000000);
PlayerTextDrawAlignment(playerid, Fuel1[playerid], 1);
PlayerTextDrawColor(playerid, Fuel1[playerid], -1);
PlayerTextDrawSetShadow(playerid, Fuel1[playerid], 0);
PlayerTextDrawBackgroundColor(playerid, Fuel1[playerid], 255);
PlayerTextDrawFont(playerid, Fuel1[playerid], 1);
PlayerTextDrawSetProportional(playerid, Fuel1[playerid], 1);

Fuel2[playerid] = CreatePlayerTextDraw(playerid, 196.333175, 368.370422, "100_%");
PlayerTextDrawLetterSize(playerid, Fuel2[playerid], 0.134663, 0.791109);
PlayerTextDrawTextSize(playerid, Fuel2[playerid], 222.000000, 0.000000);
PlayerTextDrawAlignment(playerid, Fuel2[playerid], 1);
PlayerTextDrawColor(playerid, Fuel2[playerid], -1);
PlayerTextDrawSetShadow(playerid, Fuel2[playerid], 0);
PlayerTextDrawBackgroundColor(playerid, Fuel2[playerid], 255);
PlayerTextDrawFont(playerid, Fuel2[playerid], 1);
PlayerTextDrawSetProportional(playerid, Fuel2[playerid], 1);

Condition[playerid] = CreatePlayerTextDraw(playerid, 158.999816, 384.133331, "Condition:");
PlayerTextDrawLetterSize(playerid, Condition[playerid], 0.135666, 0.791111);
PlayerTextDrawTextSize(playerid, Condition[playerid], -82.000000, 0.000000);
PlayerTextDrawAlignment(playerid, Condition[playerid], 1);
PlayerTextDrawColor(playerid, Condition[playerid], -1);
PlayerTextDrawSetShadow(playerid, Condition[playerid], 0);
PlayerTextDrawBackgroundColor(playerid, Condition[playerid], 255);
PlayerTextDrawFont(playerid, Condition[playerid], 1);
PlayerTextDrawSetProportional(playerid, Condition[playerid], 1);

Zustand[playerid] = CreatePlayerTextDraw(playerid, 195.999832, 384.548065, "100%");
PlayerTextDrawLetterSize(playerid, Zustand[playerid], 0.135666, 0.791111);
PlayerTextDrawTextSize(playerid, Zustand[playerid], -82.000000, 0.000000);
PlayerTextDrawAlignment(playerid, Zustand[playerid], 1);
PlayerTextDrawColor(playerid, Zustand[playerid], -1);
PlayerTextDrawSetShadow(playerid, Zustand[playerid], 0);
PlayerTextDrawBackgroundColor(playerid, Zustand[playerid], 255);
PlayerTextDrawFont(playerid, Zustand[playerid], 1);
PlayerTextDrawSetProportional(playerid, Zustand[playerid], 1);

Abgrenzung[playerid][2] = CreatePlayerTextDraw(playerid, 153.666763, 354.681488, "-");
PlayerTextDrawLetterSize(playerid, Abgrenzung[playerid][2], 5.388662, 0.753777);
PlayerTextDrawTextSize(playerid, Abgrenzung[playerid][2], -5585.000000, 0.000000);
PlayerTextDrawAlignment(playerid, Abgrenzung[playerid][2], 1);
PlayerTextDrawColor(playerid, Abgrenzung[playerid][2], -1);
PlayerTextDrawSetShadow(playerid, Abgrenzung[playerid][2], 0);
PlayerTextDrawBackgroundColor(playerid, Abgrenzung[playerid][2], 255);
PlayerTextDrawFont(playerid, Abgrenzung[playerid][2], 2);
PlayerTextDrawSetProportional(playerid, Abgrenzung[playerid][2], 1);

Fname[playerid] = CreatePlayerTextDraw(playerid, 187.333175, 348.459259, "Hydra");
PlayerTextDrawLetterSize(playerid, Fname[playerid], 0.135666, 0.791111);
PlayerTextDrawTextSize(playerid, Fname[playerid], -82.000000, 0.000000);
PlayerTextDrawAlignment(playerid, Fname[playerid], 2);
PlayerTextDrawColor(playerid, Fname[playerid], -1);
PlayerTextDrawSetShadow(playerid, Fname[playerid], 0);
PlayerTextDrawBackgroundColor(playerid, Fname[playerid], 255);
PlayerTextDrawFont(playerid, Fname[playerid], 1);
PlayerTextDrawSetProportional(playerid, Fname[playerid], 1);

Abgrenzung[playerid][3] = CreatePlayerTextDraw(playerid, 143.333328, 394.503692, "-");
PlayerTextDrawLetterSize(playerid, Abgrenzung[playerid][3], 5.978998, 0.616888);
PlayerTextDrawAlignment(playerid, Abgrenzung[playerid][3], 1);
PlayerTextDrawColor(playerid, Abgrenzung[playerid][3], -1);
PlayerTextDrawSetShadow(playerid, Abgrenzung[playerid][3], 0);
PlayerTextDrawBackgroundColor(playerid, Abgrenzung[playerid][3], 255);
PlayerTextDrawFont(playerid, Abgrenzung[playerid][3], 1);
PlayerTextDrawSetProportional(playerid, Abgrenzung[playerid][3], 1);

Distance[playerid] = CreatePlayerTextDraw(playerid, 175.666412, 400.311157, "Distance:");
PlayerTextDrawLetterSize(playerid, Distance[playerid], 0.135666, 0.791111);
PlayerTextDrawTextSize(playerid, Distance[playerid], -82.000000, 0.000000);
PlayerTextDrawAlignment(playerid, Distance[playerid], 1);
PlayerTextDrawColor(playerid, Distance[playerid], -1);
PlayerTextDrawSetShadow(playerid, Distance[playerid], 0);
PlayerTextDrawBackgroundColor(playerid, Distance[playerid], 255);
PlayerTextDrawFont(playerid, Distance[playerid], 1);
PlayerTextDrawSetProportional(playerid, Distance[playerid], 1);

KMStandFlieger[playerid] = CreatePlayerTextDraw(playerid, 199.333068, 411.096343, "0000000_NM");
PlayerTextDrawLetterSize(playerid, KMStandFlieger[playerid], 0.138997, 0.737183);
PlayerTextDrawTextSize(playerid, KMStandFlieger[playerid], -82.000000, 0.000000);
PlayerTextDrawAlignment(playerid, KMStandFlieger[playerid], 3);
PlayerTextDrawColor(playerid, KMStandFlieger[playerid], -1);
PlayerTextDrawSetShadow(playerid, KMStandFlieger[playerid], 0);
PlayerTextDrawBackgroundColor(playerid, KMStandFlieger[playerid], 255);
PlayerTextDrawFont(playerid, KMStandFlieger[playerid], 1);
PlayerTextDrawSetProportional(playerid, KMStandFlieger[playerid], 1);

Fuelpumpen[playerid] = CreatePlayerTextDraw(playerid, 2.699625, 327.718475, "Fuel_~n~Pumps");
PlayerTextDrawLetterSize(playerid, Fuelpumpen[playerid], 0.137333, 0.513185);
PlayerTextDrawAlignment(playerid, Fuelpumpen[playerid], 1);
PlayerTextDrawColor(playerid, Fuelpumpen[playerid], -1);
PlayerTextDrawSetShadow(playerid, Fuelpumpen[playerid], 0);
PlayerTextDrawBackgroundColor(playerid, Fuelpumpen[playerid], 255);
PlayerTextDrawFont(playerid, Fuelpumpen[playerid], 1);
PlayerTextDrawSetProportional(playerid, Fuelpumpen[playerid], 1);

FPON[playerid] = CreatePlayerTextDraw(playerid, 5.366291, 340.577789, "On");
PlayerTextDrawLetterSize(playerid, FPON[playerid], 0.137333, 0.513185);
PlayerTextDrawTextSize(playerid, FPON[playerid], 13.000000, 0.000000);
PlayerTextDrawAlignment(playerid, FPON[playerid], 1);
PlayerTextDrawColor(playerid, FPON[playerid], -1);
PlayerTextDrawUseBox(playerid, FPON[playerid], 1);
PlayerTextDrawBoxColor(playerid, FPON[playerid], 16711935);
PlayerTextDrawSetShadow(playerid, FPON[playerid], 0);
PlayerTextDrawBackgroundColor(playerid, FPON[playerid], 16711935);
PlayerTextDrawFont(playerid, FPON[playerid], 1);
PlayerTextDrawSetProportional(playerid, FPON[playerid], 1);

FPOFF[playerid] = CreatePlayerTextDraw(playerid, 5.366291, 340.577789, "Off");
PlayerTextDrawLetterSize(playerid, FPOFF[playerid], 0.137333, 0.513185);
PlayerTextDrawTextSize(playerid, FPOFF[playerid], 13.000000, 0.000000);
PlayerTextDrawAlignment(playerid, FPOFF[playerid], 1);
PlayerTextDrawColor(playerid, FPOFF[playerid], -1);
PlayerTextDrawUseBox(playerid, FPOFF[playerid], 1);
PlayerTextDrawBoxColor(playerid, FPOFF[playerid], -16776961);
PlayerTextDrawSetShadow(playerid, FPOFF[playerid], 0);
PlayerTextDrawBackgroundColor(playerid, FPOFF[playerid], 16711935);
PlayerTextDrawFont(playerid, FPOFF[playerid], 1);
PlayerTextDrawSetProportional(playerid, FPOFF[playerid], 1);

PEngine[playerid] = CreatePlayerTextDraw(playerid, 2.032958, 358.414764, "Engine");
PlayerTextDrawLetterSize(playerid, PEngine[playerid], 0.137333, 0.513185);
PlayerTextDrawAlignment(playerid, PEngine[playerid], 1);
PlayerTextDrawColor(playerid, PEngine[playerid], -1);
PlayerTextDrawSetShadow(playerid, PEngine[playerid], 0);
PlayerTextDrawBackgroundColor(playerid, PEngine[playerid], 255);
PlayerTextDrawFont(playerid, PEngine[playerid], 1);
PlayerTextDrawSetProportional(playerid, PEngine[playerid], 1);

PEON[playerid] = CreatePlayerTextDraw(playerid, 5.032958, 367.540924, "On");
PlayerTextDrawLetterSize(playerid, PEON[playerid], 0.137333, 0.513185);
PlayerTextDrawTextSize(playerid, PEON[playerid], 13.000000, 0.000000);
PlayerTextDrawAlignment(playerid, PEON[playerid], 1);
PlayerTextDrawColor(playerid, PEON[playerid], -1);
PlayerTextDrawUseBox(playerid, PEON[playerid], 1);
PlayerTextDrawBoxColor(playerid, PEON[playerid], 16711935);
PlayerTextDrawSetShadow(playerid, PEON[playerid], 0);
PlayerTextDrawBackgroundColor(playerid, PEON[playerid], 16711935);
PlayerTextDrawFont(playerid, PEON[playerid], 1);
PlayerTextDrawSetProportional(playerid, PEON[playerid], 1);

PEOFF[playerid] = CreatePlayerTextDraw(playerid, 5.032958, 367.540924, "Off");
PlayerTextDrawLetterSize(playerid, PEOFF[playerid], 0.137333, 0.513185);
PlayerTextDrawTextSize(playerid, PEOFF[playerid], 13.000000, 0.000000);
PlayerTextDrawAlignment(playerid, PEOFF[playerid], 1);
PlayerTextDrawColor(playerid, PEOFF[playerid], -1);
PlayerTextDrawUseBox(playerid, PEOFF[playerid], 1);
PlayerTextDrawBoxColor(playerid, PEOFF[playerid], -16776961);
PlayerTextDrawSetShadow(playerid, PEOFF[playerid], 0);
PlayerTextDrawBackgroundColor(playerid, PEOFF[playerid], 16711935);
PlayerTextDrawFont(playerid, PEOFF[playerid], 1);
PlayerTextDrawSetProportional(playerid, PEOFF[playerid], 1);

LDGear[playerid] = CreatePlayerTextDraw(playerid, 0.699625, 382.888824, "Landing~n~Gear");
PlayerTextDrawLetterSize(playerid, LDGear[playerid], 0.137333, 0.513185);
PlayerTextDrawAlignment(playerid, LDGear[playerid], 1);
PlayerTextDrawColor(playerid, LDGear[playerid], -1);
PlayerTextDrawSetShadow(playerid, LDGear[playerid], 0);
PlayerTextDrawBackgroundColor(playerid, LDGear[playerid], 255);
PlayerTextDrawFont(playerid, LDGear[playerid], 1);
PlayerTextDrawSetProportional(playerid, LDGear[playerid], 1);

LDGON[playerid] = CreatePlayerTextDraw(playerid, 3.366291, 396.992828, "Down");
PlayerTextDrawLetterSize(playerid, LDGON[playerid], 0.137333, 0.513185);
PlayerTextDrawTextSize(playerid, LDGON[playerid], 14.000000, 0.000000);
PlayerTextDrawAlignment(playerid, LDGON[playerid], 1);
PlayerTextDrawColor(playerid, LDGON[playerid], -1);
PlayerTextDrawUseBox(playerid, LDGON[playerid], 1);
PlayerTextDrawBoxColor(playerid, LDGON[playerid], 16711935);
PlayerTextDrawSetShadow(playerid, LDGON[playerid], 0);
PlayerTextDrawBackgroundColor(playerid, LDGON[playerid], 16711935);
PlayerTextDrawFont(playerid, LDGON[playerid], 1);
PlayerTextDrawSetProportional(playerid, LDGON[playerid], 1);

LDGOFF[playerid] = CreatePlayerTextDraw(playerid, 3.366291, 396.992828, "Up");
PlayerTextDrawLetterSize(playerid, LDGOFF[playerid], 0.137333, 0.513185);
PlayerTextDrawTextSize(playerid, LDGOFF[playerid], 14.000000, 0.000000);
PlayerTextDrawAlignment(playerid, LDGOFF[playerid], 1);
PlayerTextDrawColor(playerid, LDGOFF[playerid], -1);
PlayerTextDrawUseBox(playerid, LDGOFF[playerid], 1);
PlayerTextDrawBoxColor(playerid, LDGOFF[playerid], -16776961);
PlayerTextDrawSetShadow(playerid, LDGOFF[playerid], 0);
PlayerTextDrawBackgroundColor(playerid, LDGOFF[playerid], 16711935);
PlayerTextDrawFont(playerid, LDGOFF[playerid], 1);
PlayerTextDrawSetProportional(playerid, LDGOFF[playerid], 1);

LowFuel[playerid] = CreatePlayerTextDraw(playerid, 3.699624, 408.192687, "Low~n~Fuel");
PlayerTextDrawLetterSize(playerid, LowFuel[playerid], 0.137333, 0.513185);
PlayerTextDrawAlignment(playerid, LowFuel[playerid], 1);
PlayerTextDrawColor(playerid, LowFuel[playerid], -1);
PlayerTextDrawSetShadow(playerid, LowFuel[playerid], 0);
PlayerTextDrawBackgroundColor(playerid, LowFuel[playerid], 255);
PlayerTextDrawFont(playerid, LowFuel[playerid], 1);
PlayerTextDrawSetProportional(playerid, LowFuel[playerid], 1);

LowFuelW[playerid] = CreatePlayerTextDraw(playerid, 2.032957, 423.541015, "Warning");
PlayerTextDrawLetterSize(playerid, LowFuelW[playerid], 0.137333, 0.513185);
PlayerTextDrawTextSize(playerid, LowFuelW[playerid], 20.000000, 0.000000);
PlayerTextDrawAlignment(playerid, LowFuelW[playerid], 1);
PlayerTextDrawColor(playerid, LowFuelW[playerid], -1);
PlayerTextDrawUseBox(playerid, LowFuelW[playerid], 1);
PlayerTextDrawBoxColor(playerid, LowFuelW[playerid], -16776961);
PlayerTextDrawSetShadow(playerid, LowFuelW[playerid], 0);
PlayerTextDrawBackgroundColor(playerid, LowFuelW[playerid], 16711935);
PlayerTextDrawFont(playerid, LowFuelW[playerid], 1);
PlayerTextDrawSetProportional(playerid, LowFuelW[playerid], 1);
return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
       new vID=GetPlayerVehicleID(playerid),
	   tmp_engine,
	   tmp_lights,
	   tmp_alarm,
	   tmp_doors,
	   tmp_hood,
       tmp_trunk,
	   tmp_objective;
	   GetVehicleParamsEx(vID,tmp_engine, tmp_lights, tmp_alarm, tmp_doors, tmp_hood, tmp_trunk, tmp_objective);

     if(IsPlayerDriver(playerid) && !IsAMountainBike(GetPlayerVehicleID(playerid)) && !IsAAircraft(GetPlayerVehicleID(playerid)) && !IsABoat(GetPlayerVehicleID(playerid)))
     {
 	   Speedometer_Show(playerid, 0);
 	   SetVehicleParamsEx(vID, 0, tmp_lights, 0, 0, 0, 0, 0);
	   SetVehicleParamsCarDoors(vID, 0, 0, 0, 0);
	   SetVehicleParamsCarWindows(vID, 0, 0, 0, 0);
	   SetPVarInt(playerid, "KMLaden",0);
       DeletePVar(playerid, "KEINSPRIT");
       if(GetSVarInt("NachtZeit") == 1 && tmp_lights == 0)
       {
		  SendInfoText(playerid, "Switch your lights on!");//wtf
       }
     }
     else if(IsPlayerDriver(playerid) && IsAAircraft(GetPlayerVehicleID(playerid)))
     {
 	   PlayerTextDrawShow(playerid, Airspeeed[playerid]);
 	   PlayerTextDrawShow(playerid, Airspeed[playerid]);
 	   PlayerTextDrawShow(playerid, Airspeedindicator[playerid]);
 	   PlayerTextDrawShow(playerid, Airspeeddisplay[playerid]);
 	   PlayerTextDrawShow(playerid, Alittudegauge[playerid]);
 	   PlayerTextDrawShow(playerid, Altimeter[playerid]);
 	   PlayerTextDrawShow(playerid, Altdisplay[playerid]);
 	   PlayerTextDrawShow(playerid, Tausendnadel[playerid]);
 	   PlayerTextDrawShow(playerid, Hundertnadel[playerid]);
 	   PlayerTextDrawShow(playerid, SteigtSinkt[playerid]);
 	   PlayerTextDrawShow(playerid, SteigtHintergrund[playerid]);
 	   PlayerTextDrawShow(playerid, Steigtnadel[playerid]);
 	   PlayerTextDrawShow(playerid, Variometer[playerid]);
 	   PlayerTextDrawShow(playerid, Variodisplay[playerid]);
 	   PlayerTextDrawShow(playerid, Altideckel[playerid]);
 	   PlayerTextDrawShow(playerid, Airspeeddeckel[playerid]);
 	   PlayerTextDrawShow(playerid, ArtHorizon[playerid]);
 	   PlayerTextDrawShow(playerid, CRTLboard_plane[playerid]);
 	   PlayerTextDrawShow(playerid, CRTLboard1_plane[playerid]);
 	   PlayerTextDrawShow(playerid, CRTLboard2_plane[playerid]);
 	   PlayerTextDrawShow(playerid, Kompass_Gauge[playerid]);
 	   PlayerTextDrawShow(playerid, Kompass_Hintergrund[playerid]);
 	   PlayerTextDrawShow(playerid, Kompass_N[playerid]);
 	   PlayerTextDrawShow(playerid, Kompass_E[playerid]);
 	   PlayerTextDrawShow(playerid, Kompass_S[playerid]);
 	   PlayerTextDrawShow(playerid, Kompass_W[playerid]);
 	   PlayerTextDrawShow(playerid, Kompass_Icon[playerid]);
 	   PlayerTextDrawShow(playerid, Flug_Info[playerid]);
 	   PlayerTextDrawShow(playerid, Flug_InfoHintergrund[playerid]);
 	   PlayerTextDrawShow(playerid, Fname[playerid]);
 	   PlayerTextDrawShow(playerid, RFuel[playerid]);
 	   PlayerTextDrawShow(playerid, LFuel[playerid]);
 	   PlayerTextDrawShow(playerid, Fuel1[playerid]);
 	   PlayerTextDrawShow(playerid, Fuel2[playerid]);
 	   PlayerTextDrawShow(playerid, Abgrenzung[playerid][1]);
 	   PlayerTextDrawShow(playerid, Abgrenzung[playerid][2]);
 	   PlayerTextDrawShow(playerid, Abgrenzung[playerid][3]);
 	   PlayerTextDrawShow(playerid, Condition[playerid]);
 	   PlayerTextDrawShow(playerid, Zustand[playerid]);
 	   PlayerTextDrawShow(playerid, Distance[playerid]);
 	   PlayerTextDrawShow(playerid, KMStandFlieger[playerid]);
 	   PlayerTextDrawShow(playerid, Fuelpumpen[playerid]);
 	   PlayerTextDrawShow(playerid, LowFuel[playerid]);
 	   PlayerTextDrawShow(playerid, LDGear[playerid]);
 	   PlayerTextDrawShow(playerid, PEngine[playerid]);
 	   PlayerTextDrawShow(playerid, LDGON[playerid]);
 	   LandingGearCRTL[playerid] = 1;
       SetVehicleParamsEx(vID, 0, 0, 0, 0, 0, 0, 0);
	   SetPVarInt(playerid, "PKMLaden",0);
       DeletePVar(playerid, "KEINSPRIT");
     }
     else if(!IsPlayerDriver(playerid))
     {
 	   Speedometer_Hide(playerid, 0);
       DeletePVar(playerid, "KEINSPRIT");
     }
    return 1;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
     new vID=GetPlayerVehicleID(playerid),
	 tmp_engine,
	 tmp_lights,
	 tmp_alarm,
	 tmp_doors,
	 tmp_hood,
     tmp_trunk,
	 tmp_objective,
	 tmp_driverdoor,
	 tmp_passengerdoor,
	 tmp_backrightdoor,
	 tmp_backleftdoor,
	 tmp_driverwindow,
	 tmp_passengerwindow,
	 tmp_backrightwindow,
	 tmp_backleftwindow;
	 GetVehicleParamsEx(vID,tmp_engine, tmp_lights, tmp_alarm, tmp_doors, tmp_hood, tmp_trunk, tmp_objective);
	 GetVehicleParamsCarDoors(vID,tmp_driverdoor, tmp_passengerdoor, tmp_backleftdoor, tmp_backrightdoor);
	 GetVehicleParamsCarWindows(vID, tmp_driverwindow, tmp_passengerwindow, tmp_backleftwindow, tmp_backrightwindow);
	 if(IsPlayerDriver(playerid) && !IsAMountainBike(GetPlayerVehicleID(playerid)) && !IsAAircraft(GetPlayerVehicleID(playerid)) && !IsABoat(GetPlayerVehicleID(playerid)))
	 {
	   if (newkeys & KEY_SPRINT || newkeys & KEY_JUMP)
 	   {
         if(GetPVarInt(playerid, "KEINSPRIT") == 1)
		 {
		    tmp_engine = 0;
    	 }
         else
         {
	       tmp_engine = 1;
           SetVehicleParamsEx(GetPlayerVehicleID(playerid), tmp_engine, tmp_lights, tmp_alarm, tmp_doors, tmp_hood, tmp_trunk, tmp_objective);
         }
 	   }
	 }
	 //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
     if (newkeys == KEY_NO)
     {
       if(IsPlayerDriver(playerid) && IsAAircraft(GetPlayerVehicleID(playerid)))
       {
           ShowPlayerDialog(playerid, PLANED, DIALOG_STYLE_LIST, "Menu","{FFFF00}Aircraft Actions\nHelp\nInventory\nVehicle Stats\nPlayer Stats","Select","Close");
       }
     }
	 //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	 if (newkeys == KEY_NO)
     {
           ShowPlayerDialog(playerid, AUTOD, DIALOG_STYLE_LIST, "Menu","{FFFF00}Car Actions\nHelp\nInventory\nVehicle Stats\nPlayer Stats","Select","Close");
     }
	 //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	 if (newkeys & KEY_SUBMISSION)
	 {
	    if (IsAAircraft(GetPlayerVehicleID(playerid)) == 1)
	    {
	      if(LandingGearCRTL[playerid] == 1)
          {
           LandingGearCRTL[playerid] = 0;
           PlayerTextDrawShow(playerid, PlayerText: LDGOFF[playerid]);
           PlayerTextDrawHide(playerid, PlayerText: LDGON[playerid]);
          }
          else
          {
           LandingGearCRTL[playerid] = 1;
           PlayerTextDrawHide(playerid, PlayerText: LDGOFF[playerid]);
           PlayerTextDrawShow(playerid, PlayerText: LDGON[playerid]);
          }
	    }
	    SetVehicleParamsEx(vID, tmp_engine, tmp_lights, tmp_alarm, tmp_doors, tmp_hood, tmp_trunk, tmp_objective);
	 }
	 //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
     if (newkeys & KEY_LOOK_LEFT)
     {
	  new vehicleid = GetPlayerVehicleID(playerid);
	  if (BlinkerL[vehicleid] == 0)
	  {
	    BlinkerTimer = SetTimerEx("Blinker", 500, false, "%i, %i", vehicleid, playerid);
	    PlayerTextDrawShow(playerid, PlayerText:BlinkerLinks[playerid]);
	    BlinkerL[vehicleid] = 1;
	    AddBlinkerToCar(vehicleid);
	  }
	  else if (BlinkerR[vehicleid] == 1 && BlinkerL[vehicleid] == 1)
	  {
		KillTimer(BlinkerTimer);
		BlinkerR[vehicleid] = 0;
		BlinkerL[vehicleid] = 0;
		DestroyObject(BlinkerVL);
		DestroyObject(BlinkerHL);
		DestroyObject(BlinkerVR);
		DestroyObject(BlinkerHR);
		PlayerTextDrawHide(playerid, PlayerText:BlinkerRechts[playerid]);
		PlayerTextDrawHide(playerid, PlayerText:BlinkerLinks[playerid]);
	  }
	  else if (BlinkerL[vehicleid] == 1)
	  {
		KillTimer(BlinkerTimer);
		BlinkerL[vehicleid] = 0;
		DestroyObject(BlinkerVL);
		DestroyObject(BlinkerHL);
		DestroyObject(BlinkerVR);
		DestroyObject(BlinkerHR);
		PlayerTextDrawHide(playerid, PlayerText:BlinkerLinks[playerid]);
	  }
     }
	 //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
     if (newkeys & KEY_LOOK_RIGHT)
     {
	  new vehicleid = GetPlayerVehicleID(playerid);
	  if (BlinkerR[vehicleid] == 0)
	  {
	    BlinkerR[vehicleid] = 1;
	    BlinkerTimer = SetTimerEx("Blinker", 500, false, "%i, %i", vehicleid, playerid);
	    PlayerTextDrawShow(playerid, PlayerText:BlinkerRechts[playerid]);
        AddBlinkerToCar(vehicleid);
	  }
	  else if (BlinkerR[vehicleid] == 1 && BlinkerL[vehicleid] == 1)
	  {
		KillTimer(BlinkerTimer);
		BlinkerR[vehicleid] = 0;
		BlinkerL[vehicleid] = 0;
		DestroyObject(BlinkerVL);
		DestroyObject(BlinkerHL);
		DestroyObject(BlinkerVR);
		DestroyObject(BlinkerHR);
		PlayerTextDrawHide(playerid, PlayerText:BlinkerRechts[playerid]);
		PlayerTextDrawHide(playerid, PlayerText:BlinkerLinks[playerid]);
	  }
	  else if (BlinkerR[vehicleid] == 1)
	  {
		KillTimer(BlinkerTimer);
		BlinkerR[vehicleid] = 0;
		DestroyObject(BlinkerVL);
		DestroyObject(BlinkerHL);
		DestroyObject(BlinkerVR);
		DestroyObject(BlinkerHR);
		PlayerTextDrawHide(playerid, PlayerText:BlinkerRechts[playerid]);
	  }
     }
return 1;
}

forward Blinker(vehicleid, playerid);
public Blinker(vehicleid, playerid)
{
PlayerTextDrawHide(playerid, PlayerText:BlinkerLinks[playerid]);
PlayerTextDrawHide(playerid, PlayerText:BlinkerRechts[playerid]);
SetTimerEx("Blinker2", 400, false, "%i %i", vehicleid, playerid);
return 1;
}

forward Blinker2(vehicleid, playerid);
public Blinker2(vehicleid, playerid)
{
  if (BlinkerR[vehicleid] == 1 && BlinkerL[vehicleid] == 1)
  {
	    if(IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER && GetPlayerVehicleID(playerid) == vehicleid)
	    {
          PlayerTextDrawShow(playerid, PlayerText:BlinkerRechts[playerid]);
          PlayerTextDrawShow(playerid, PlayerText:BlinkerLinks[playerid]);
	    }
	    KillTimer(BlinkerTimer);
	    BlinkerTimer = SetTimerEx("Blinker", 400, false, "%i, %i", vehicleid, playerid);
  }
  else if (BlinkerL[vehicleid] == 1)
  {
	    BlinkerTimer = SetTimerEx("Blinker", 400, false, "%i, %i", vehicleid, playerid);
	    if(IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER && GetPlayerVehicleID(playerid) == vehicleid)
	    {
           PlayerTextDrawShow(playerid, PlayerText:BlinkerLinks[playerid]);
	    }
  }
  else if (BlinkerR[vehicleid] == 1)
  {
	    BlinkerTimer = SetTimerEx("Blinker", 400, false, "%i, %i", vehicleid, playerid);
	    if(IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER && GetPlayerVehicleID(playerid) == vehicleid)
	    {
            PlayerTextDrawShow(playerid, PlayerText:BlinkerRechts[playerid]);
	    }
  }
  return 1;
}

stock AddBlinkerToCar(vehicleid)
{
 new Float:X, Float:Z, Float:Y, Float: VZ, Float: HZ;
 GetVehicleModelInfo(GetVehicleModel(vehicleid), VEHICLE_MODEL_INFO_FRONT_BUMPER_Z, X, Y, VZ);
 GetVehicleModelInfo(GetVehicleModel(vehicleid), VEHICLE_MODEL_INFO_REAR_BUMPER_Z, X, Y, HZ);
 GetVehicleModelInfo(GetVehicleModel(vehicleid), VEHICLE_MODEL_INFO_SIZE, X, Y, Z);
 if (BlinkerL[vehicleid] == 1 && BlinkerR[vehicleid] == 1)
 {
   DestroyObject(BlinkerVR);
   DestroyObject(BlinkerHR);
   DestroyObject(BlinkerVL);
   DestroyObject(BlinkerHL);
   BlinkerVL = CreateObject(19294, 0, 0, 0, 0, 0, 0, 100);
   AttachObjectToVehicle(BlinkerVL, vehicleid, -X/2, Y/2, VZ, 0, 0, 0);
   BlinkerHL = CreateObject(19294, 0, 0, 0, 0, 0, 0, 100);
   AttachObjectToVehicle(BlinkerHL, vehicleid, -X/2, -Y/2, HZ, 0, 0, 0);
   BlinkerVR = CreateObject(19294, 0, 0, 0, 0, 0, 0, 100);
   AttachObjectToVehicle(BlinkerVR, vehicleid, X/2, Y/2, VZ, 0, 0, 0);
   BlinkerHR = CreateObject(19294, 0, 0, 0, 0, 0, 0, 100);
   AttachObjectToVehicle(BlinkerHR, vehicleid, X/2, -Y/2, HZ, 0, 0, 0);
 }
 else if (BlinkerR[vehicleid] == 1)
 {
   DestroyObject(BlinkerVR);
   DestroyObject(BlinkerHR);
   BlinkerVR = CreateObject(19294, 0, 0, 0, 0, 0, 0, 100);
   AttachObjectToVehicle(BlinkerVR, vehicleid, X/2, Y/2, VZ, 0, 0, 0);
   BlinkerHR = CreateObject(19294, 0, 0, 0, 0, 0, 0, 100);
   AttachObjectToVehicle(BlinkerHR, vehicleid, X/2, -Y/2, HZ, 0, 0, 0);
 }
 else if (BlinkerL[vehicleid] == 1)
 {
   DestroyObject(BlinkerVL);
   DestroyObject(BlinkerHL);
   BlinkerVL = CreateObject(19294, 0, 0, 0, 0, 0, 0, 100);
   AttachObjectToVehicle(BlinkerVL, vehicleid, -X/2, Y/2, VZ, 0, 0, 0);
   BlinkerHL = CreateObject(19294, 0, 0, 0, 0, 0, 0, 100);
   AttachObjectToVehicle(BlinkerHL, vehicleid, -X/2, -Y/2, HZ, 0, 0, 0);
 }
}

/*stock GetClosestVehicle(playerid)
{
	new Float:x, Float:y, Float:z;
	new Float:dist, Float:closedist=9999, closeveh;
	for(new i=1; i < MAX_VEHICLES; i++)
	{
		if(GetVehiclePos(i, x, y, z))
		{
			dist = GetPlayerDistanceFromPoint(playerid, x, y, z);
			if(dist < closedist)
			{
				closedist = dist;
				closeveh = i;
			}
		}
	}
	return closeveh;
}*/

stock IsPlayerDriver(playerid)
{
   return (IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER);
}
/*
forward UnFreeze(playerid);
public UnFreeze(playerid)
{
   TogglePlayerControllable(playerid,1);
}
*/
stock HealthColor(Float:percentage)
{
   new string[5];
   if (percentage<= 25)
	   format(string,sizeof(string), "r");
   else if (percentage <= 75)
	   format(string,sizeof(string), "y");
   else
	   format(string,sizeof(string), "g");
   return string;
}

stock SpeedColor(Float:speed, playerid)
{
   new string[5];
   if (IsPlayerIn50Zone(speed, playerid))
   {
       format(string,sizeof(string), "r");
   }
   else if (IsPlayerIn70Zone(speed, playerid))
   {
       format(string,sizeof(string), "r");
   }
   else
   {
       format(string,sizeof(string), "");
   }
return string;
}

stock IsPlayerIn70Zone(Float:Geschwindigkeit, playerid)
{
  if(IsPlayerDriver(playerid) && !IsAMountainBike(GetPlayerVehicleID(playerid)) && !IsAAircraft(GetPlayerVehicleID(playerid)) && !IsABoat(GetPlayerVehicleID(playerid)))
  {
   if (Geschwindigkeit >=70)
   {
	 if(IsPlayerInLosSantos(playerid)) return 1;
	 if(IsPlayerInLasVenturas(playerid)) return 1;
	 if(IsPlayerInSanFierro(playerid)) return 1;
   }
}
return 0;
}

stock IsPlayerIn50Zone(Float:Geschwindigkeit, playerid)
{
  if(IsPlayerDriver(playerid) && !IsAMountainBike(GetPlayerVehicleID(playerid)) && !IsAAircraft(GetPlayerVehicleID(playerid)) && !IsABoat(GetPlayerVehicleID(playerid)))
  {
   if (Geschwindigkeit >=50)
   {
   /*if (IsPlayerInRangeOfPoint(playerid, 175, -2149.3267,-2392.4822,37.7891))//Angel Pine
    {
    return 1;
    }
   else if (IsPlayerInRangeOfPoint(playerid, 175,  1303.4069,294.3828,19.5547))//Montgomery
    {
    return 1;
    }
   else if (IsPlayerInRangeOfPoint(playerid, 250,  2337.3416,30.1705,26.1799))//Palomino Creek
    {
    return 1;
    }
   else if (IsPlayerInRangeOfPoint(playerid, 150,  680.5602,-530.9727,15.8810))//Dillimore
    {
    return 1;
    }
   return 0;*/
  if(IsPlayerInRangeOfPoint(playerid, 175, -2149.3267,-2392.4822,37.7891))return 1;//Angel Pine
  else if (IsPlayerInRangeOfPoint(playerid, 210,  228.7886, -143.8747, 1.4297))return 1;//Blueberry
  else if(IsPlayerInZone(playerid, "Dillimore")) return 1;
  else if(IsPlayerInZone(playerid, "Montgomery")) return 1;
  else if(IsPlayerInZone(playerid, "Palomino Creek")) return 1;
  else if(IsPlayerInZone(playerid, "Bayside")) return 1;
  else if(IsPlayerInZone(playerid, "Las Payasadas")) return 1;
  }
}
return 0;
}

stock FuelColor(Float:fuel)
{
   new string[5];
   if (fuel >=15)
   {
	   format(string, sizeof(string), "w");
   }
   else
   {
	   format(string,sizeof(string), "r");
   }
   return string;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
    new ccmd[256+1], idxx;
    ccmd = strtok(cmdtext, idxx);
    if(strcmp(ccmd, "/setfuel", true) == 0)
	{
	    new vehicleid = GetPlayerVehicleID(playerid);
	    if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, Hellrot, "You are not in a car");
	    {
		  new ttmp[256+1];
		  ttmp = strtok(cmdtext, idxx);
		  if(strlen(ttmp) == 0) return SendClientMessage(playerid, Hellrot, "/setfuel amount_of_fuel");
		  if(strval(ttmp) > 100) return SendClientMessage(playerid, Hellrot, "You cannot have more than 100%% Fuel");
		  if(strval(ttmp) < 0) return SendClientMessage(playerid, Hellrot, "You cannot have less than 0%% Fuel");
		  Fuel[vehicleid] = (strval(ttmp));
	    }
	    return 1;
	}
    if(strcmp(ccmd, "/sethealth", true) == 0)
	{
	    new vehicleid = GetPlayerVehicleID(playerid);
	    if(!IsPlayerInAnyVehicle(playerid)) return SendClientMessage(playerid, Hellrot, "You are not in a car");
	    {
		  new ttmp[256+1];
		  ttmp = strtok(cmdtext, idxx);
		  if(strlen(ttmp) == 0) return SendClientMessage(playerid, Hellrot, "/sethealth health");
		  if(strval(ttmp) > 175) return SendClientMessage(playerid, Hellrot, "You cannot have more than 200%% Health");
		  if(strval(ttmp) < 0) return SendClientMessage(playerid, Hellrot, "You cannot have less than 0%% Health");
		  SetVehicleHealth(vehicleid, strval(ttmp)*10.0);
	    }
	    return 1;
	}
    if(strcmp(cmdtext, "/km", true) == 0)
	{
		new string[20];
	    format(string, sizeof string, "%f", Milage[GetPlayerVehicleID(playerid)]);
	    SendClientMessage(playerid, Hellblau, string);
	    return 1;
	}
    return 0;
}

forward Speedometer(playerid);
public Speedometer(playerid)
{
   new nvehicleid = GetPlayerVehicleID(playerid);//wenn jmd im auto ist funktioniert es für den anderen nicht
   new tmp_engine, tmp_lights, tmp_alarm, tmp_doors, tmp_hood, tmp_boot, tmp_objective;
   new string[50], strrr[50], struing[50];
   if(IsPlayerConnected(playerid) && (IsPlayerDriver(playerid) && !IsAMountainBike(GetPlayerVehicleID(playerid)) && !IsAAircraft(GetPlayerVehicleID(playerid)) && !IsABoat(GetPlayerVehicleID(playerid))))
	  {
		  new Speed = GetPlayerSpeed(playerid)*107/100;
		  nvehicleid = GetPlayerVehicleID(playerid);
		  if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
		  {
			 if((!IsABoat(nvehicleid) && (!IsAAircraft(nvehicleid) && Fuel[nvehicleid] > 0)))
			 SetPVarInt(playerid, "KEINSPRIT", 0);
			 {
	         if (tmp_engine == 1)
				 {
				   return 1;
				 }
				 else
				 {
				   new Keys, ud, lr;
				   GetPlayerKeys(playerid, Keys, ud, lr);
				   if (Keys == KEY_SPRINT || Keys == KEY_JUMP)
				   {
        			 Fuel[nvehicleid] -= GetPlayerSpeed(playerid)/3000.0*GetPlayerSpeed(playerid)/500.0;
				   }
				 if(Fuel[nvehicleid] <= 0)
				 {
					  GameTextForPlayer(playerid, "~r~You are out of Fuel",1500,3);
					  SetPVarInt(playerid, "KEINSPRIT", 1);
                      PlayerTextDrawSetPreviewRot(playerid,PlayerText:Spritnadel[playerid],0.000000, 90.0, 0.000000, 2.000000);
                      if(GetPVarInt(playerid, "TachoHide") == 0)
                      {
                         PlayerTextDrawShow(playerid,PlayerText:Spritnadel[playerid]);
                      }
					  GetVehicleParamsEx(nvehicleid,tmp_engine, tmp_lights, tmp_alarm, tmp_doors, tmp_hood, tmp_boot, tmp_objective);
					  if (tmp_engine == 1)
					  {
						tmp_engine = 0;
					  }
					  SetVehicleParamsEx(nvehicleid, tmp_engine, tmp_lights, tmp_alarm, tmp_doors, tmp_hood, tmp_boot, tmp_objective);

				 }
				 if(Fuel[nvehicleid] <= 101)
				 PlayerTextDrawHide(playerid,PlayerText:Spritnadel[playerid]);
				 if(GetPVarInt(playerid, "TachoHide") == 1) return 0;
				 {
				   if(Fuel[nvehicleid] == 99 || Fuel[nvehicleid] <= 100)
				   {PlayerTextDrawSetPreviewRot(playerid,PlayerText:Spritnadel[playerid],0.000000, 0.0, 0.000000, 2.000000);}
				   if(Fuel[nvehicleid] == 97 || Fuel[nvehicleid] <= 99)
				   {PlayerTextDrawSetPreviewRot(playerid,PlayerText:Spritnadel[playerid],0.000000, 1.8, 0.000000, 2.000000);}
				   if(Fuel[nvehicleid] == 95 || Fuel[nvehicleid] <= 97)
				   {PlayerTextDrawSetPreviewRot(playerid,PlayerText:Spritnadel[playerid],0.000000, 3.6, 0.000000, 2.000000);}
				   if(Fuel[nvehicleid] == 93 || Fuel[nvehicleid] <= 95)
				   {PlayerTextDrawSetPreviewRot(playerid,PlayerText:Spritnadel[playerid],0.000000, 5.4, 0.000000, 2.000000);}
				   if(Fuel[nvehicleid] == 91 || Fuel[nvehicleid] <= 93)
				   {PlayerTextDrawSetPreviewRot(playerid,PlayerText:Spritnadel[playerid],0.000000, 7.2, 0.000000, 2.000000);}
				   if(Fuel[nvehicleid] == 89 || Fuel[nvehicleid] <= 91)
				   {PlayerTextDrawSetPreviewRot(playerid,PlayerText:Spritnadel[playerid],0.000000, 9, 0.000000, 2.000000);}
				   if(Fuel[nvehicleid] == 87 || Fuel[nvehicleid] <= 89)
				   {PlayerTextDrawSetPreviewRot(playerid,PlayerText:Spritnadel[playerid],0.000000, 10.8, 0.000000, 2.000000);}
				   if(Fuel[nvehicleid] == 85 || Fuel[nvehicleid] <= 87)
				   {PlayerTextDrawSetPreviewRot(playerid,PlayerText:Spritnadel[playerid],0.000000, 12.6, 0.000000, 2.000000);}
				   if(Fuel[nvehicleid] == 83 || Fuel[nvehicleid] <= 85)
				   {PlayerTextDrawSetPreviewRot(playerid,PlayerText:Spritnadel[playerid],0.000000, 14.4, 0.000000, 2.000000);}
				   if(Fuel[nvehicleid] == 81 || Fuel[nvehicleid] <= 83)
				   {PlayerTextDrawSetPreviewRot(playerid,PlayerText:Spritnadel[playerid],0.000000, 16.2, 0.000000, 2.000000);}
				   if(Fuel[nvehicleid] == 79 || Fuel[nvehicleid] <= 81)
				   {PlayerTextDrawSetPreviewRot(playerid,PlayerText:Spritnadel[playerid],0.000000, 18.0, 0.000000, 2.000000);}
				   if(Fuel[nvehicleid] == 77 || Fuel[nvehicleid] <= 79)
				   {PlayerTextDrawSetPreviewRot(playerid,PlayerText:Spritnadel[playerid],0.000000, 19.8, 0.000000, 2.000000);}
				   if(Fuel[nvehicleid] == 75 || Fuel[nvehicleid] <= 77)
				   {PlayerTextDrawSetPreviewRot(playerid,PlayerText:Spritnadel[playerid],0.000000, 21.6, 0.000000, 2.000000);}
				   if(Fuel[nvehicleid] == 73 || Fuel[nvehicleid] <= 75)
				   {PlayerTextDrawSetPreviewRot(playerid,PlayerText:Spritnadel[playerid],0.000000, 23.4, 0.000000, 2.000000);}
				   if(Fuel[nvehicleid] == 71 || Fuel[nvehicleid] <= 73)
				   {PlayerTextDrawSetPreviewRot(playerid,PlayerText:Spritnadel[playerid],0.000000, 25.2, 0.000000, 2.000000);}
				   if(Fuel[nvehicleid] == 69 || Fuel[nvehicleid] <= 71)
				   {PlayerTextDrawSetPreviewRot(playerid,PlayerText:Spritnadel[playerid],0.000000, 27.0, 0.000000, 2.000000);}
				   if(Fuel[nvehicleid] == 67 || Fuel[nvehicleid] <= 69)
				   {PlayerTextDrawSetPreviewRot(playerid,PlayerText:Spritnadel[playerid],0.000000, 28.8, 0.000000, 2.000000);}
				   if(Fuel[nvehicleid] == 65 || Fuel[nvehicleid] <= 67)
				   {PlayerTextDrawSetPreviewRot(playerid,PlayerText:Spritnadel[playerid],0.000000, 30.6, 0.000000, 2.000000);}
				   if(Fuel[nvehicleid] == 63 || Fuel[nvehicleid] <= 65)
				   {PlayerTextDrawSetPreviewRot(playerid,PlayerText:Spritnadel[playerid],0.000000, 32.4, 0.000000, 2.000000);}
				   if(Fuel[nvehicleid] == 61 || Fuel[nvehicleid] <= 63)
				   {PlayerTextDrawSetPreviewRot(playerid,PlayerText:Spritnadel[playerid],0.000000, 34.2, 0.000000, 2.000000);}
				   if(Fuel[nvehicleid] == 59 || Fuel[nvehicleid] <= 61)
				   {PlayerTextDrawSetPreviewRot(playerid,PlayerText:Spritnadel[playerid],0.000000, 36, 0.000000, 2.000000);}
				   if(Fuel[nvehicleid] == 57 || Fuel[nvehicleid] <= 59)
				   {PlayerTextDrawSetPreviewRot(playerid,PlayerText:Spritnadel[playerid],0.000000, 37.8, 0.000000, 2.000000);}
				   if(Fuel[nvehicleid] == 55 || Fuel[nvehicleid] <= 57)
				   {PlayerTextDrawSetPreviewRot(playerid,PlayerText:Spritnadel[playerid],0.000000, 39.6, 0.000000, 2.000000);}
				   if(Fuel[nvehicleid] == 53 || Fuel[nvehicleid] <= 55)
				   {PlayerTextDrawSetPreviewRot(playerid,PlayerText:Spritnadel[playerid],0.000000, 41.4, 0.000000, 2.000000);}
				   if(Fuel[nvehicleid] == 51 || Fuel[nvehicleid] <= 53)
				   {PlayerTextDrawSetPreviewRot(playerid,PlayerText:Spritnadel[playerid],0.000000, 43.2, 0.000000, 2.000000);}
				   if(Fuel[nvehicleid] == 49 || Fuel[nvehicleid] <= 51)
				   {PlayerTextDrawSetPreviewRot(playerid,PlayerText:Spritnadel[playerid],0.000000, 45, 0.000000, 2.000000);}
				   if(Fuel[nvehicleid] == 47 || Fuel[nvehicleid] <= 49)
				   {PlayerTextDrawSetPreviewRot(playerid,PlayerText:Spritnadel[playerid],0.000000, 46.8, 0.000000, 2.000000);}
				   if(Fuel[nvehicleid] == 45 || Fuel[nvehicleid] <= 47)
				   {PlayerTextDrawSetPreviewRot(playerid,PlayerText:Spritnadel[playerid],0.000000, 48.6, 0.000000, 2.000000);}
				   if(Fuel[nvehicleid] == 43 || Fuel[nvehicleid] <= 45)
				   {PlayerTextDrawSetPreviewRot(playerid,PlayerText:Spritnadel[playerid],0.000000, 50.4, 0.000000, 2.000000);}
				   if(Fuel[nvehicleid] == 41 || Fuel[nvehicleid] <= 43)
				   {PlayerTextDrawSetPreviewRot(playerid,PlayerText:Spritnadel[playerid],0.000000, 52.2, 0.000000, 2.000000);}
				   if(Fuel[nvehicleid] == 39 || Fuel[nvehicleid] <= 41)
				   {PlayerTextDrawSetPreviewRot(playerid,PlayerText:Spritnadel[playerid],0.000000, 54, 0.000000, 2.000000);}
				   if(Fuel[nvehicleid] == 37 || Fuel[nvehicleid] <= 39)
				   {PlayerTextDrawSetPreviewRot(playerid,PlayerText:Spritnadel[playerid],0.000000, 55.8, 0.000000, 2.000000);}
				   if(Fuel[nvehicleid] == 35 || Fuel[nvehicleid] <= 37)
				   {PlayerTextDrawSetPreviewRot(playerid,PlayerText:Spritnadel[playerid],0.000000, 57.6, 0.000000, 2.000000);}
				   if(Fuel[nvehicleid] == 33 || Fuel[nvehicleid] <= 35)
				   {PlayerTextDrawSetPreviewRot(playerid,PlayerText:Spritnadel[playerid],0.000000, 59.4, 0.000000, 2.000000);}
				   if(Fuel[nvehicleid] == 31 || Fuel[nvehicleid] <= 33)
				   {PlayerTextDrawSetPreviewRot(playerid,PlayerText:Spritnadel[playerid],0.000000, 61.2, 0.000000, 2.000000);}
				   if(Fuel[nvehicleid] == 29 || Fuel[nvehicleid] <= 31)
				   {PlayerTextDrawSetPreviewRot(playerid,PlayerText:Spritnadel[playerid],0.000000, 63, 0.000000, 2.000000);}
				   if(Fuel[nvehicleid] == 27 || Fuel[nvehicleid] <= 29)
				   {PlayerTextDrawSetPreviewRot(playerid,PlayerText:Spritnadel[playerid],0.000000, 64.8, 0.000000, 2.000000);}
				   if(Fuel[nvehicleid] == 25 || Fuel[nvehicleid] <= 27)
				   {PlayerTextDrawSetPreviewRot(playerid,PlayerText:Spritnadel[playerid],0.000000, 66.6, 0.000000, 2.000000);}
				   if(Fuel[nvehicleid] == 23 || Fuel[nvehicleid] <= 25)
				   {PlayerTextDrawSetPreviewRot(playerid,PlayerText:Spritnadel[playerid],0.000000, 68.4, 0.000000, 2.000000);}
				   if(Fuel[nvehicleid] == 21 || Fuel[nvehicleid] <= 23)
				   {PlayerTextDrawSetPreviewRot(playerid,PlayerText:Spritnadel[playerid],0.000000, 70.2, 0.000000, 2.000000);}
				   if(Fuel[nvehicleid] == 19 || Fuel[nvehicleid] <= 21)
				   {PlayerTextDrawSetPreviewRot(playerid,PlayerText:Spritnadel[playerid],0.000000, 72, 0.000000, 2.000000);}
				   if(Fuel[nvehicleid] == 17 || Fuel[nvehicleid] <= 19)
				   {PlayerTextDrawSetPreviewRot(playerid,PlayerText:Spritnadel[playerid],0.000000, 73.8, 0.000000, 2.000000);}
				   if(Fuel[nvehicleid] == 15 || Fuel[nvehicleid] <= 17)
				   {PlayerTextDrawSetPreviewRot(playerid,PlayerText:Spritnadel[playerid],0.000000, 75.6, 0.000000, 2.000000);}
				   if(Fuel[nvehicleid] == 13 || Fuel[nvehicleid] <= 15)
				   {PlayerTextDrawSetPreviewRot(playerid,PlayerText:Spritnadel[playerid],0.000000, 77.4, 0.000000, 2.000000);}
				   if(Fuel[nvehicleid] == 11 || Fuel[nvehicleid] <= 13)
				   {PlayerTextDrawSetPreviewRot(playerid,PlayerText:Spritnadel[playerid],0.000000, 79.2, 0.000000, 2.000000);}
				   if(Fuel[nvehicleid] == 9 || Fuel[nvehicleid] <= 11)
				   {PlayerTextDrawSetPreviewRot(playerid,PlayerText:Spritnadel[playerid],0.000000, 81, 0.000000, 2.000000);}
				   if(Fuel[nvehicleid] == 7 || Fuel[nvehicleid] <= 9)
				   {PlayerTextDrawSetPreviewRot(playerid,PlayerText:Spritnadel[playerid],0.000000, 82.8, 0.000000, 2.000000);}
				   if(Fuel[nvehicleid] == 5 || Fuel[nvehicleid] <= 7)
				   {PlayerTextDrawSetPreviewRot(playerid,PlayerText:Spritnadel[playerid],0.000000, 84.6, 0.000000, 2.000000);}
				   if(Fuel[nvehicleid] == 3 || Fuel[nvehicleid] <= 5)
				   {PlayerTextDrawSetPreviewRot(playerid,PlayerText:Spritnadel[playerid],0.000000, 86.4, 0.000000, 2.000000);}
				   if(Fuel[nvehicleid] == 1 || Fuel[nvehicleid] <= 3)
				   {PlayerTextDrawSetPreviewRot(playerid,PlayerText:Spritnadel[playerid],0.000000, 88.2, 0.000000, 2.000000);}
				   if(Fuel[nvehicleid] == 0 || Fuel[nvehicleid] <= 1)
				   {PlayerTextDrawSetPreviewRot(playerid,PlayerText:Spritnadel[playerid],0.000000, 90, 0.000000, 2.000000);}
                   PlayerTextDrawShow(playerid,PlayerText:Spritnadel[playerid]);
				 }
			 }
		  }
	      Checklights(playerid);
		  if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
		  {
		   if(GetPVarInt(playerid, "KMLaden") == 0)
		   {
		       Milage[nvehicleid] = 0;
		   }
           Milage[nvehicleid] += GetPlayerSpeed(playerid)/3600.0 + KMGet(playerid);

           if(Speed >= 250)
           {
              format(strrr,sizeof(strrr), "~%s~WTF", SpeedColor(Speed,playerid));
           }
            else
           {
		      format(strrr,sizeof(strrr), "~%s~%03d km/h", SpeedColor(Speed,playerid), Speed);
		   }
		   if(Speed >= 1)
		   {
		      GetVehicleParamsEx(nvehicleid,tmp_engine, tmp_lights, tmp_alarm, tmp_doors, tmp_hood, tmp_boot, tmp_objective);
			  if(tmp_engine == 1)
			  {
			     if(IsVehicleDrivingBackwards(nvehicleid))
			     {
			        PlayerTextDrawSetString(playerid, Tacho[playerid][55], "R");
			     }
			     else
			     {
				    new gear;
				    gear = (Speed/46)+1;
				    format(string, sizeof string, "D%i", gear);
			        PlayerTextDrawSetString(playerid, Tacho[playerid][55], string);
			     }
			  }
			  else
			  {
			     PlayerTextDrawSetString(playerid, Tacho[playerid][55], "N");
			  }
		   }
		   else
		   {
			  PlayerTextDrawSetString(playerid, Tacho[playerid][55], "P");
		   }
		   PlayerTextDrawSetString(playerid, KMH[playerid], strrr);
		   IsPlayerInRangeOf50Blitzer(Speed,playerid);
		   //IsPlayerInRangeOf70Blitzer(Speed,i);

		  new Float: health;
		  GetVehicleHealth(nvehicleid, health);
		  new Float: percentage = (((health - 250.0) / (1000.0 - 250.0)) * 100.0);
		  format(struing, sizeof(struing), "%03.0f", percentage);
		  if(percentage <= 25 && GetPVarInt(playerid, "TachoHide") == 0)
		  {
              PlayerTextDrawShow(playerid, AutoHP[playerid][1]);
              PlayerTextDrawHide(playerid, AutoHP[playerid][2]);
              PlayerTextDrawHide(playerid, AutoHP[playerid][3]);
              PlayerTextDrawHide(playerid, AutoHP[playerid][4]);
		  }
		  else if(percentage >= 25 && percentage <= 75 && GetPVarInt(playerid, "TachoHide") == 0)
		  {
              PlayerTextDrawShow(playerid, AutoHP[playerid][1]);
              PlayerTextDrawShow(playerid, AutoHP[playerid][2]);
              PlayerTextDrawHide(playerid, AutoHP[playerid][3]);
              PlayerTextDrawHide(playerid, AutoHP[playerid][4]);
		  }
		  else if(percentage >= 75 && percentage <= 100 && GetPVarInt(playerid, "TachoHide") == 0)
		  {
              PlayerTextDrawShow(playerid, AutoHP[playerid][1]);
              PlayerTextDrawShow(playerid, AutoHP[playerid][2]);
              PlayerTextDrawShow(playerid, AutoHP[playerid][3]);
              PlayerTextDrawHide(playerid, AutoHP[playerid][4]);
		  }
		  else if(percentage > 100 && GetPVarInt(playerid, "TachoHide") == 0)
		  {
              PlayerTextDrawShow(playerid, AutoHP[playerid][1]);
              PlayerTextDrawShow(playerid, AutoHP[playerid][2]);
              PlayerTextDrawShow(playerid, AutoHP[playerid][3]);
              PlayerTextDrawShow(playerid, AutoHP[playerid][4]);
		  }
		  PlayerTextDrawSetString(playerid, AutoHP[playerid][0], struing);
		  VHealth(percentage, playerid);

		  if(Fuel[nvehicleid] <= 0)
		  {
		     format(string,sizeof(string), "~r~0");
		  }
		  else
		  {
		     format(string,sizeof(string), "%d", floatround(Fuel[nvehicleid]*1.0));
		  }
		  PlayerTextDrawSetString(playerid, Sprit[playerid], string);

		  new Float:KMCompare = floatround(Milage[nvehicleid], floatround_floor);
		  format(string,sizeof(string), "%06.0f km", KMCompare);
		  PlayerTextDrawSetString(playerid, Kilometerstand[playerid], string);
		  format(Spieler,sizeof(Spieler),"/Spieler/%s.txt",GetSname(playerid));

          new Float:Ausgangsstand = GetPVarFloat(playerid, "Ausgangstankfüllung");
		  if(IsPlayerInAnyVehicle(playerid))
		  {
		      if(floatround(Ausgangsstand) > floatround(Fuel[nvehicleid]))
		      {
				new Float:GetSprit;
				GetSprit = dini_Float(Spieler, "VerbrauchterSprit");
		        dini_FloatSet(Spieler,"VerbrauchterSprit",GetSprit + Ausgangsstand - floatround(Fuel[nvehicleid]));
		        SetPVarFloat(playerid, "Ausgangstankfüllung", floatround(Fuel[nvehicleid]));

		        /*format(string, sizeof string, "Old: %f \nNew: %f", GetSprit, GetSprit + Ausgangsstand - floatround(Fuel[nvehicleid]));
		        SendClientMessage(playerid, Weis, string);
                format(string, sizeof string, "neue Ausgangstankfüllung: %f", GetPVarFloat(playerid, "Ausgangstankfüllung"));
                SendClientMessage(playerid, Hellgrün, string);*/
		      }
		      if(GetPlayerSpeed(playerid) <= 10)
		      {
		        SetPVarFloat(playerid, "Ausgangstankfüllung", floatround(Fuel[nvehicleid]));
                /*format(string, sizeof string, "neue Ausgangstankfüllung: %f", GetPVarFloat(playerid, "Ausgangstankfüllung"));
                SendClientMessage(playerid, Hellgrün, string);*/
		      }
		  }



		  if(GetPlayerSpeed(playerid) >= 25)
		   {
		    if(IsPlayerInAnyVehicle(playerid))
		     {
		      if(IsAMotorBike(nvehicleid)&& (KMCompare > dini_Float(Spieler, "KMStandMotorrad")))
		      {
		        dini_Set(Spieler,"KMStandMotorrad",string);
		        SendClientMessage(playerid, Weis, "Motorrad KM gespeichert");
		      }
		      if(IsATruck(nvehicleid)&& (KMCompare > dini_Float(Spieler, "KMStandLKW")))
		      {
		        dini_Set(Spieler,"KMStandLKW",string);
		        SendClientMessage(playerid, Weis, "LKW KM gespeichert");
		      }
		      else if(!IsAAircraft(nvehicleid) && !IsABoat(nvehicleid) && !IsAMountainBike(nvehicleid) && !IsAMotorBike(nvehicleid) && !IsATruck(nvehicleid) && (KMCompare > dini_Float(Spieler, "KMStandAuto")))
		      {
		        dini_Set(Spieler,"KMStandAuto",string);
		        SendClientMessage(playerid, Weis, "Auto KM gespeichert");
		      }
		      Milage[playerid] = 0;
		    }
		    return 1;
		  }}}}
       return 1;
}

public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	if(!ispassenger)
	{
	      if (NVehicleLocked[vehicleid] == 1)
	      {
	          GetPlayerName(playerid, Sname, sizeof(Sname));
	          /*if(strcmp(VehicleOwner[id], Sname) == 0) //Need a array to save the playerid that locked the vehicle
	          {
	             SetVehicleParamsForPlayer(vehicleid, playerid, 0, 0);
	             DebugMessage(playerid, "You are owner");
	          }
	          else
	          {
	             SetVehicleParamsForPlayer(vehicleid, playerid, 0, 1);
	             DebugMessage(playerid, "You are not owner");
	             RemovePlayerFromVehicle(playerid);
	          }*/
	      }
	}
    SetPVarFloat(playerid, "Ausgangstankfüllung", floatround(Fuel[vehicleid]));
    return 1;
}

stock Checklights(playerid)
{
     new nvehicleid = GetPlayerVehicleID(playerid);
     new tmp_engine, tmp_lights, tmp_alarm, tmp_doors, tmp_hood, tmp_boot, tmp_objective;
	 GetVehicleParamsEx(nvehicleid, tmp_engine, tmp_lights, tmp_alarm, tmp_doors, tmp_hood, tmp_boot, tmp_objective);
	 if(IsPlayerDriver(playerid) && !IsAMountainBike(GetPlayerVehicleID(playerid)) && !IsAAircraft(GetPlayerVehicleID(playerid)) && !IsABoat(GetPlayerVehicleID(playerid)))
	 {
	    if (tmp_engine == 0)
	    {
 	 	   PlayerTextDrawShow(playerid, Batterie[playerid][0]);
 	 	   PlayerTextDrawShow(playerid, Batterie[playerid][1]);
 	 	   PlayerTextDrawShow(playerid, Batterie[playerid][2]);
 	 	   PlayerTextDrawShow(playerid, Batterie[playerid][3]);
 	 	   PlayerTextDrawShow(playerid, Batterie[playerid][4]);
 	 	   PlayerTextDrawShow(playerid, Batterie[playerid][5]);
 	       PlayerTextDrawShow(playerid, Tacho[playerid][52]);
	    }
	    if (tmp_engine == 1)
	    {
 	 	   PlayerTextDrawHide(playerid, Batterie[playerid][0]);
 	 	   PlayerTextDrawHide(playerid, Batterie[playerid][1]);
 	 	   PlayerTextDrawHide(playerid, Batterie[playerid][2]);
 	 	   PlayerTextDrawHide(playerid, Batterie[playerid][3]);
 	 	   PlayerTextDrawHide(playerid, Batterie[playerid][4]);
 	 	   PlayerTextDrawHide(playerid, Batterie[playerid][5]);
 	       PlayerTextDrawHide(playerid, Tacho[playerid][52]);
	    }
	    if (tmp_lights == 0)
	    {
	 	   PlayerTextDrawHide(playerid, Licht[playerid][0]);
	 	   PlayerTextDrawHide(playerid, Licht[playerid][1]);
	 	   PlayerTextDrawHide(playerid, Licht[playerid][2]);
	 	   PlayerTextDrawHide(playerid, Licht[playerid][3]);
 	       PlayerTextDrawHide(playerid, Tacho[playerid][50]);
	    }
	    if (tmp_lights == 1)
	    {
		   PlayerTextDrawShow(playerid, Licht[playerid][0]);
		   PlayerTextDrawShow(playerid, Licht[playerid][1]);
		   PlayerTextDrawShow(playerid, Licht[playerid][2]);
		   PlayerTextDrawShow(playerid, Licht[playerid][3]);
 	       PlayerTextDrawShow(playerid, Tacho[playerid][50]);
	    }
	    {
	       if (NVehicleLocked[nvehicleid] == 1)
	       {
		      PlayerTextDrawShow(playerid, Locked[playerid][0]);
		      PlayerTextDrawShow(playerid, Locked[playerid][1]);
		      PlayerTextDrawShow(playerid, Locked[playerid][2]);
		      PlayerTextDrawShow(playerid, Locked[playerid][3]);
		      PlayerTextDrawShow(playerid, Tacho[playerid][51]);
	       }
	       if (NVehicleLocked[nvehicleid] == 0)
	       {
		      PlayerTextDrawHide(playerid, Locked[playerid][0]);
		      PlayerTextDrawHide(playerid, Locked[playerid][1]);
		      PlayerTextDrawHide(playerid, Locked[playerid][2]);
		      PlayerTextDrawHide(playerid, Locked[playerid][3]);
		      PlayerTextDrawHide(playerid, Tacho[playerid][51]);
	       }
	       if(GetPVarInt(playerid, "Healthcheck") == 1)
	       {
              PlayerTextDrawShow(playerid, Motorleuchte[playerid][0]);
              PlayerTextDrawShow(playerid, Motorleuchte[playerid][1]);
              PlayerTextDrawShow(playerid, Motorleuchte[playerid][2]);
              PlayerTextDrawShow(playerid, Motorleuchte[playerid][3]);
              PlayerTextDrawShow(playerid, Motorleuchte[playerid][4]);
              PlayerTextDrawShow(playerid, Motorleuchte[playerid][5]);
              PlayerTextDrawShow(playerid, Motorleuchte[playerid][6]);
              PlayerTextDrawShow(playerid, Motorleuchte[playerid][7]);
              PlayerTextDrawShow(playerid, Motorleuchte[playerid][8]);
              PlayerTextDrawShow(playerid, Tacho[playerid][53]);
	       }
	       else if(GetPVarInt(playerid, "Healthcheck") == 0)
	       {
              PlayerTextDrawHide(playerid, Motorleuchte[playerid][0]);
              PlayerTextDrawHide(playerid, Motorleuchte[playerid][1]);
              PlayerTextDrawHide(playerid, Motorleuchte[playerid][2]);
              PlayerTextDrawHide(playerid, Motorleuchte[playerid][3]);
              PlayerTextDrawHide(playerid, Motorleuchte[playerid][4]);
              PlayerTextDrawHide(playerid, Motorleuchte[playerid][5]);
              PlayerTextDrawHide(playerid, Motorleuchte[playerid][6]);
              PlayerTextDrawHide(playerid, Motorleuchte[playerid][7]);
              PlayerTextDrawHide(playerid, Motorleuchte[playerid][8]);
              PlayerTextDrawHide(playerid, Tacho[playerid][53]);
	       }
	    }
	 }
	 else if (IsAAircraft(GetPlayerVehicleID(playerid)) && (IsPlayerDriver(playerid)))
	 {
	   if (tmp_engine == 0)
	   {
 		PlayerTextDrawShow(playerid, FPOFF[playerid]);
 		PlayerTextDrawShow(playerid, PEOFF[playerid]);
 		PlayerTextDrawHide(playerid, FPON[playerid]);
 		PlayerTextDrawHide(playerid, PEON[playerid]);
	   }
	   if (tmp_engine == 1)
	   {
 		PlayerTextDrawShow(playerid, FPON[playerid]);
 		PlayerTextDrawShow(playerid, PEON[playerid]);
 		PlayerTextDrawHide(playerid, FPOFF[playerid]);
 		PlayerTextDrawHide(playerid, PEOFF[playerid]);
	   }
	   }
return 1;
}

stock IsPlayerInRangeOf50Blitzer(Geschwindigkeit,playerid)
{
if(GetPVarInt(playerid, "Blitzertimer") == 0)
  {
  if (Geschwindigkeit >=55)
    {
    if (Player50BZone(playerid)==1)
       {
	   SetPVarInt(playerid, "Blitzertimer", 1);
	   GivePlayerMoney(playerid,-((Geschwindigkeit-50)*10));
       new Blitzernachricht[128];
       format(Blitzernachricht,sizeof(Blitzernachricht),"You were driving %i km/h in a 50-Zone. Thats %i km/h to fast and you have to pay $%i. Drive within the speed limit next time!",Geschwindigkeit, Geschwindigkeit-50,(Geschwindigkeit-50)*10);
       SendClientMessage(playerid,Hellrot,Blitzernachricht);
       Blitz[playerid] = CreatePlayerTextDraw(playerid, 0, 0, "LD_SPAC:white");
       PlayerTextDrawFont(playerid, Blitz[playerid], 4);
       PlayerTextDrawTextSize(playerid, Blitz[playerid], 29800.000000, 28600.000000);
       PlayerTextDrawShow(playerid, PlayerText:Blitz[playerid]);
       PlayerPlaySound(playerid, 1132, 0.0, 0.0, 0.0);
       Blitztimer = SetTimerEx("Blitzz", 125, false, "i", playerid);
	   NBlitzertimer = SetTimerEx("Blitzer", 5000, false, "i", playerid);
       format(Spieler, sizeof Spieler, "/Spieler/%s.txt", GetSname(playerid));
       new SaveBlitzer = dini_Int(Spieler, "Blitzer");
       dini_IntSet(Spieler,"Blitzer",SaveBlitzer+1);
       SaveBlitzer = dini_Int(Spieler, "BlitzerMoney");
       dini_IntSet(Spieler,"BlitzerMoney",SaveBlitzer+(Geschwindigkeit-50)*10);
	   }
    }
  }
  return 1;
}

stock Player50BZone(playerid)
{
  if (IsPlayerInRangeOfPoint(playerid, 25, -2094.7307,-2442.9524,30.6250))
  {
     return 1;
  }
  else if (IsPlayerInRangeOfPoint(playerid, 25, 222.8916, -88.4675, 1.5781))
  {
     return 1;
  }
  else if (IsPlayerInRangeOfPoint(playerid, 25, 2505.8149, 47.2566, 24.4844))
  {
     return 1;
  }
  /*else if (IsPlayerInRangeOfPoint(playerid, HIER EIGENEN BLITZER EINFÜGEN))
  {
     return 1;
  }*/
return 0;
}

forward Blitzz(playerid);
public Blitzz(playerid)
{
PlayerTextDrawHide(playerid, PlayerText:Blitz[playerid]);
PlayerTextDrawDestroy(playerid, PlayerText:Blitz[playerid]);
KillTimer(Blitztimer);
return 1;
}

forward Blitzer(playerid);
public Blitzer(playerid)
{
SetPVarInt(playerid, "Blitzertimer", 0);
KillTimer(NBlitzertimer);
return 1;
}

stock VHealth(Float:percentage, playerid)
{
 if (percentage>= 25)
 {
   SetPVarInt(playerid, "Healthcheck", 0);
 }
 if (percentage<= 25)
 {
   if(GetPVarInt(playerid, "Healthcheck") == 0)
   {
     PlayerTextDrawShow(playerid, Motorleuchte[playerid][0]);
     PlayerTextDrawShow(playerid, Motorleuchte[playerid][1]);
     PlayerTextDrawShow(playerid, Motorleuchte[playerid][2]);
     PlayerTextDrawShow(playerid, Motorleuchte[playerid][3]);
     PlayerTextDrawShow(playerid, Motorleuchte[playerid][4]);
     PlayerTextDrawShow(playerid, Motorleuchte[playerid][5]);
     PlayerTextDrawShow(playerid, Motorleuchte[playerid][6]);
     PlayerTextDrawShow(playerid, Motorleuchte[playerid][7]);
     PlayerTextDrawShow(playerid, Motorleuchte[playerid][8]);
     PlayerTextDrawShow(playerid, Tacho[playerid][53]);
     format(Spieler, sizeof Spieler, "/Spieler/%s.txt", GetSname(playerid));
     new MotorCL = dini_Int(Spieler, "MotorCheckLeuchte");
     dini_IntSet(Spieler,"MotorCheckLeuchte",MotorCL+1);
     SetPVarInt(playerid, "Healthcheck", 1);
   }
 }
 return 1;
}


Float:GetPSpeed(vehicleid)
{
	new Float:vx, Float:vy, Float:vz, Float:vel;
	vel = GetVehicleVelocity(vehicleid, vx, vy, vz);
	vel = ((floatsqroot(((vx*vx)+(vy*vy)+(vz*vz)))* 229)*211/200);
	return vel;
}

forward Speedo();
public Speedo()
foreach(new i : Player)
if(IsPlayerDriver(i) && !IsAMountainBike(GetPlayerVehicleID(i)) && !IsAAircraft(GetPlayerVehicleID(i)) && !IsABoat(GetPlayerVehicleID(i)))
{
   if(GetPVarInt(i, "TachoHide") == 0){
	new Float:speed, Float:result;
	{
	    if(GetPlayerState(i) != 2) continue;
		speed = GetPSpeed(GetPlayerVehicleID(i));
		if(speed > 260)
		{
		    PlayerTextDrawHide(i, Tachonadel[i]);
		    PlayerTextDrawSetPreviewRot(i, Tachonadel[i], 0.000000, -131.0, 0.000000, 2.000000);
		    PlayerTextDrawShow(i, Tachonadel[i]);
		    continue;
		}
		if(speed < 132.5)
		{
		    result = floatabs((132.5-speed));
		    PlayerTextDrawHide(i, Tachonadel[i]);
		    PlayerTextDrawSetPreviewRot(i, Tachonadel[i], 0.000000, result, 0.000000, 2.000000);
		    PlayerTextDrawShow(i, Tachonadel[i]);
		    continue;
		}
  		result = 132.5-speed;
  		PlayerTextDrawHide(i, Tachonadel[i]);
  		PlayerTextDrawSetPreviewRot(i, Tachonadel[i], 0.000000, result, 0.000000, 2.000000);
  		PlayerTextDrawShow(i, Tachonadel[i]);
	}}
}

stock GetPlaneSpeed(playerid, bool: kmh = true)
{
   new Float:xx,
	   Float:yy,
	   Float:zz,
    Float:pSpeed;
   GetVehicleVelocity(GetPlayerVehicleID(playerid),xx,yy,zz);
   pSpeed = floatsqroot((xx * xx) + (yy * yy) + (zz * zz));
   return kmh ? floatround(pSpeed * 187.0/1.8) : floatround(pSpeed * 120.9/1.8);
}

forward PlaneSpeedo();
public PlaneSpeedo()
foreach(new i : Player)
if(IsPlayerDriver(i) && IsAAircraft(GetPlayerVehicleID(i)))
{
    new tmp_engine,
	   tmp_lights,
	   tmp_alarm,
	   tmp_doors,
	   tmp_hood,
       tmp_trunk,
	   tmp_objective;
	new Float:speed, Float:result;
    new vehicleid = GetPlayerVehicleID(i);
  	new Float:x, Float:y, Float:z;
  	new Float: rz;
	new Speed = GetPlaneSpeed(i);
	new strrri[4], fstr[13], struing[5], vstr[15];

    GetVehicleZAngle(vehicleid, rz);
    PlayerTextDrawSetPreviewRot(i, Kompass_Icon[i], 90.000000, 180, rz, 1.000000);
	PlayerTextDrawShow(i, Kompass_Icon[i]);


  	GetVehiclePos(vehicleid, x, y, z);
  	if (z <= 1)
  	{
 	format(struing,sizeof(struing), "0000");
	}
  	else
  	{
	format(struing,sizeof(struing), "%04.0f", z*3.3);
	}
  	PlayerTextDrawSetString(i, PlayerText:Altdisplay[i], struing);

	format(strrri,sizeof(strrri), "%03d", Speed);
	PlayerTextDrawSetString(i, Airspeeddisplay[i], strrri);


	Pfuel[vehicleid] -= GetPlayerSpeed(i)/5000.0;
			if(Pfuel[vehicleid] <= 0)
			{
				GameTextForPlayer(i, "~r~You are out of Fuel",3000,3);
				SetPVarInt(i, "KEINSPRIT", 1);
		        format(fstr,sizeof(fstr), "~r~0");
				GetVehicleParamsEx(vehicleid,tmp_engine, tmp_lights, tmp_alarm, tmp_doors, tmp_hood, tmp_trunk, tmp_objective);
				if (tmp_engine == 1)
				{
					tmp_engine = 0;
				}
				SetVehicleParamsEx(vehicleid, tmp_engine, tmp_lights, tmp_alarm, tmp_doors, tmp_hood, tmp_trunk, tmp_objective);

			}
			else
		    {
		    format(fstr,sizeof(fstr), "~%s~%d %", FuelColor(Pfuel[vehicleid]), floatround(Pfuel[vehicleid]*1.0));
		    }
		    PlayerTextDrawSetString(i, Fuel1[i], fstr);
		    PlayerTextDrawSetString(i, Fuel2[i], fstr);

		    if(Pfuel[vehicleid] <= 10)
		    {
		    	PlayerTextDrawShow(i,PlayerText:LowFuelW[i]);
		    }
	if(GetPlayerState(i) != 2) continue;
        {
    	   new Float:vx, Float:vy, Float:vz;
		   new strrruui[15];
		   GetVehicleVelocity(vehicleid, vx, vy, vz);
		   format(strrruui,sizeof(strrruui), "%0.0f ft/min", vz*10126);
		   PlayerTextDrawSetString(i, Variodisplay[i], strrruui);
		   PlayerTextDrawHide(i, Steigtnadel[i]);

	       format(vstr,sizeof(vstr),"%s", VehicleNames[GetVehicleModel(GetPlayerVehicleID(i))-400]);
           PlayerTextDrawSetString(i, Fname[i], vstr);

		   new Float: health;
		   new hstruing[15];
		   GetVehicleHealth(vehicleid, health);
		   new Float: percentage = (((health - 250.0) / (1000.0 - 250.0)) * 100.0);
		   format(hstruing, sizeof(hstruing), "~%s~%.0f%", HealthColor(percentage), percentage);
		   PlayerTextDrawSetString(i, Zustand[i], hstruing);

		   new strpkm[15];
           if(GetPVarInt(i, "PKMLaden") == 0)
		   {
		       Pdistance [vehicleid] = 0;
		   }
	       Pdistance [vehicleid] += GetPlaneSpeed(i)/3600.0 + NMGet(i);
		   format(strpkm,sizeof(strpkm), "%07.0f NM", Pdistance [vehicleid]);
		   PlayerTextDrawSetString(i, KMStandFlieger[i], strpkm);
		   GetPlayerName(i,Sname,sizeof(Sname));
           format (Spieler,sizeof(Spieler),"/Spieler/%s.txt",Sname);
           if(IsAPlane(GetPlayerVehicleID(i)))
		   {
            dini_Set(Spieler,"KMStandFlugzeug",strpkm);
           }
           if(IsABoat(GetPlayerVehicleID(i)))
		   {
            dini_Set(Spieler,"KMStandBoot",strpkm);
		   }
		   if(IsAHeli(GetPlayerVehicleID(i)))
		   {
            dini_Set(Spieler,"KMStandHubs",strpkm);
		   }
		   if (vz >= 0.5968449197860963)
		   {
		   PlayerTextDrawSetPreviewRot(i, Steigtnadel[i], 0.000000, 340, 0.000000, 2.500000);
		   PlayerTextDrawShow(i, Steigtnadel[i]);
		   }
		   else if (vz <= -0.5968449197860963)
		   {
		   PlayerTextDrawSetPreviewRot(i, Steigtnadel[i], 0.000000, 200, 0.000000, 2.500000);
		   PlayerTextDrawShow(i, Steigtnadel[i]);
		   }
		   else
		   {
		   PlayerTextDrawSetPreviewRot(i, Steigtnadel[i], 0.000000, (vz*187-90)*-1, 0.000000, 2.500000);
		   PlayerTextDrawShow(i, Steigtnadel[i]);
		   }
		   }
		   {
		    PlayerTextDrawHide(i, Hundertnadel[i]);
		    PlayerTextDrawSetPreviewRot(i, Hundertnadel[i], 0.000000, -(z*1.19)/10, 0.000000, 2.500000);
		    PlayerTextDrawShow(i, Hundertnadel[i]);
		   }
		   {
		    PlayerTextDrawHide(i, Tausendnadel[i]);
		    PlayerTextDrawSetPreviewRot(i, Tausendnadel[i], 0.000000, -z*1.19, 0.000000, 2.500000);
		    PlayerTextDrawShow(i, Tausendnadel[i]);
		   }

	{
	    if(GetPlayerState(i) != 2) continue;
	    {
		  speed = (GetPSpeed(GetPlayerVehicleID(i))/1.3);
		  {
		    if(speed > 300)
		    {
		    PlayerTextDrawHide(i, Airspeedindicator[i]);
		    PlayerTextDrawSetPreviewRot(i, Airspeedindicator[i], 0.000000, 60.0, 0.000000, 2.500000);
		    PlayerTextDrawShow(i, Airspeedindicator[i]);
		    continue;
		    }
            if(speed < 45)
		    {
		    PlayerTextDrawHide(i, Airspeedindicator[i]);
		    PlayerTextDrawSetPreviewRot(i, Airspeedindicator[i], 0.000000, 325, 0.000000, 2.500000);
		    PlayerTextDrawShow(i, Airspeedindicator[i]);
		    continue;
	        }
		    result = 22-speed;
		    PlayerTextDrawHide(i, Airspeedindicator[i]);
		    PlayerTextDrawSetPreviewRot(i, Airspeedindicator[i], 0.000000, result, 0.000000, 2.500000);
		    PlayerTextDrawShow(i, Airspeedindicator[i]);
		  }
		  /*speed = (GetPSpeed(GetPlayerVehicleID(i)));
		  PlayerTextDrawHide(i, Airspeedindicator[i]);
		  PlayerTextDrawSetPreviewRot(i, Airspeedindicator[i], 0.000000, -(speed/1.6)-36, 0.000000, 2.500000);//hier
		  PlayerTextDrawShow(i, Airspeedindicator[i]);*/

	}
	}
}

stock NMGet(playerid)
{
if(IsPlayerDriver(playerid)/* && IsAAircraft(GetPlayerVehicleID(playerid))*/)
{
  if(GetPVarInt(playerid, "PKMLaden") == 0)
  {
     SetPVarInt(playerid, "PKMLaden",1);
     if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
	  {
	    if(IsAPlane(GetPlayerVehicleID(playerid)))
	    {
          GetPlayerName(playerid,Sname,sizeof(Sname));
          format (Spieler,sizeof(Spieler),"/Spieler/%s.txt",Sname);
          return dini_Int(Spieler, "KMStandFlugzeug");
        }
        if(IsABoat(GetPlayerVehicleID(playerid)))
	    {
          GetPlayerName(playerid,Sname,sizeof(Sname));
          format (Spieler,sizeof(Spieler),"/Spieler/%s.txt",Sname);
          return dini_Int(Spieler, "KMStandBoot");
        }
		if(IsAHeli(GetPlayerVehicleID(playerid)))
	    {
          GetPlayerName(playerid,Sname,sizeof(Sname));
          format (Spieler,sizeof(Spieler),"/Spieler/%s.txt",Sname);
          return dini_Int(Spieler, "KMStandHubs");
        }
	}
  }
}
return 0;
}

stock GetVehicleRotation(vehicleid,&Float:rx,&Float:ry,&Float:rz)
{
	new Float:qw,Float:qx,Float:qy,Float:qz;
	GetVehicleRotationQuat(vehicleid,qw,qx,qy,qz);
	rx = asin(2*qy*qz-2*qx*qw);
	ry = -atan2(qx*qz+qy*qw,0.5-qx*qx-qy*qy);
	rz = -atan2(qx*qy+qz*qw,0.5-qx*qx-qz*qz);
}

stock KMGet(playerid)
{
 if(IsPlayerDriver(playerid) && !IsAMountainBike(GetPlayerVehicleID(playerid)) && !IsAAircraft(GetPlayerVehicleID(playerid)) && !IsABoat(GetPlayerVehicleID(playerid)))
 {
  if(GetPVarInt(playerid, "KMLaden") == 0)
  {
   SetPVarInt(playerid, "KMLaden",1);
   if(IsPlayerConnected(playerid) && GetPlayerState(playerid) == 2)
   {
       format(Spieler,sizeof(Spieler),"/Spieler/%s.txt",GetSname(playerid));
       if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
	   {
	    if(IsAMotorBike(GetPlayerVehicleID(playerid)))
	    {
          return dini_Int(Spieler, "KMStandMotorrad");
        }
        else if(IsATruck(GetPlayerVehicleID(playerid)))
	    {
          return dini_Int(Spieler, "KMStandLKW");
        }
        else if(!IsAAircraft(GetPlayerVehicleID(playerid)) && !IsABoat(GetPlayerVehicleID(playerid)) && !IsAMountainBike(GetPlayerVehicleID(playerid)) && !IsAMotorBike(GetPlayerVehicleID(playerid)) && !IsATruck(GetPlayerVehicleID(playerid)))
        {
          return dini_Int(Spieler, "KMStandAuto");
	    }
   }
  }
 }
}
return 0;
}

forward Speedometer_Show(playerid, modshop);
public Speedometer_Show(playerid, modshop)
{
 	   PlayerTextDrawShow(playerid, Tacho[playerid][0]);
 	   PlayerTextDrawShow(playerid, Tacho[playerid][1]);
 	   PlayerTextDrawShow(playerid, Tacho[playerid][2]);
 	   PlayerTextDrawShow(playerid, Tacho[playerid][3]);
 	   PlayerTextDrawShow(playerid, Tacho[playerid][4]);
 	   PlayerTextDrawShow(playerid, Tacho[playerid][5]);
 	   PlayerTextDrawShow(playerid, Tacho[playerid][6]);
 	   PlayerTextDrawShow(playerid, Tacho[playerid][7]);
 	   PlayerTextDrawShow(playerid, Tacho[playerid][8]);
 	   PlayerTextDrawShow(playerid, Tacho[playerid][9]);
 	   PlayerTextDrawShow(playerid, Tacho[playerid][10]);
 	   PlayerTextDrawShow(playerid, Tacho[playerid][11]);
 	   PlayerTextDrawShow(playerid, Tacho[playerid][12]);
 	   PlayerTextDrawShow(playerid, Tacho[playerid][13]);
 	   PlayerTextDrawShow(playerid, Tacho[playerid][14]);
 	   PlayerTextDrawShow(playerid, Tacho[playerid][15]);
 	   PlayerTextDrawShow(playerid, Tacho[playerid][16]);
 	   PlayerTextDrawShow(playerid, Tacho[playerid][17]);
 	   PlayerTextDrawShow(playerid, Tacho[playerid][18]);
 	   PlayerTextDrawShow(playerid, Tacho[playerid][19]);
 	   PlayerTextDrawShow(playerid, Tacho[playerid][20]);
 	   PlayerTextDrawShow(playerid, Tacho[playerid][21]);
 	   PlayerTextDrawShow(playerid, Tacho[playerid][22]);
 	   PlayerTextDrawShow(playerid, Tacho[playerid][23]);
 	   PlayerTextDrawShow(playerid, Tacho[playerid][24]);
 	   PlayerTextDrawShow(playerid, Tacho[playerid][25]);
 	   PlayerTextDrawShow(playerid, Tacho[playerid][26]);
 	   PlayerTextDrawShow(playerid, Tacho[playerid][27]);
 	   PlayerTextDrawShow(playerid, Tacho[playerid][28]);
 	   PlayerTextDrawShow(playerid, Tacho[playerid][29]);
 	   PlayerTextDrawShow(playerid, Tacho[playerid][30]);
 	   PlayerTextDrawShow(playerid, Tacho[playerid][31]);
 	   PlayerTextDrawShow(playerid, Tacho[playerid][32]);
 	   PlayerTextDrawShow(playerid, Tacho[playerid][33]);
 	   PlayerTextDrawShow(playerid, Tacho[playerid][34]);
 	   PlayerTextDrawShow(playerid, Tacho[playerid][35]);
 	   PlayerTextDrawShow(playerid, Tacho[playerid][36]);
 	   PlayerTextDrawShow(playerid, Tacho[playerid][37]);
 	   PlayerTextDrawShow(playerid, Tacho[playerid][38]);
 	   PlayerTextDrawShow(playerid, Tacho[playerid][39]);
 	   PlayerTextDrawShow(playerid, Tacho[playerid][40]);
 	   PlayerTextDrawShow(playerid, Tacho[playerid][41]);
 	   PlayerTextDrawShow(playerid, Tacho[playerid][42]);
 	   PlayerTextDrawShow(playerid, Tacho[playerid][43]);
 	   PlayerTextDrawShow(playerid, Tacho[playerid][44]);
 	   PlayerTextDrawShow(playerid, Tacho[playerid][45]);
 	   PlayerTextDrawShow(playerid, Tacho[playerid][46]);
 	   PlayerTextDrawShow(playerid, Tacho[playerid][47]);
 	   PlayerTextDrawShow(playerid, Tacho[playerid][48]);
 	   PlayerTextDrawShow(playerid, Tacho[playerid][49]);
 	   PlayerTextDrawShow(playerid, Tacho[playerid][50]);
 	   PlayerTextDrawShow(playerid, Tacho[playerid][51]);
 	   PlayerTextDrawShow(playerid, Tacho[playerid][52]);
 	   PlayerTextDrawShow(playerid, Tacho[playerid][53]);
 	   PlayerTextDrawShow(playerid, Tacho[playerid][54]);
 	   PlayerTextDrawShow(playerid, Tacho[playerid][55]);
	   PlayerTextDrawShow(playerid, Sprit[playerid]);
	   PlayerTextDrawShow(playerid, Licht[playerid][0]);
	   PlayerTextDrawShow(playerid, Licht[playerid][1]);
	   PlayerTextDrawShow(playerid, Licht[playerid][2]);
	   PlayerTextDrawShow(playerid, Licht[playerid][3]);
	   PlayerTextDrawShow(playerid, Batterie[playerid][0]);
	   PlayerTextDrawShow(playerid, Batterie[playerid][1]);
	   PlayerTextDrawShow(playerid, Batterie[playerid][2]);
	   PlayerTextDrawShow(playerid, Batterie[playerid][3]);
	   PlayerTextDrawShow(playerid, Batterie[playerid][4]);
	   PlayerTextDrawShow(playerid, Batterie[playerid][5]);
	   PlayerTextDrawShow(playerid, Locked[playerid][0]);
	   PlayerTextDrawShow(playerid, Locked[playerid][1]);
	   PlayerTextDrawShow(playerid, Locked[playerid][2]);
	   PlayerTextDrawShow(playerid, Locked[playerid][3]);
	   PlayerTextDrawShow(playerid, KMH[playerid]);
	   PlayerTextDrawShow(playerid, Kilometerstand[playerid]);
	   PlayerTextDrawSetPreviewRot(playerid, Tachonadel[playerid], 0.000000, 133.0, 0.000000, 2.000000);
       PlayerTextDrawSetPreviewRot(playerid,PlayerText:Spritnadel[playerid],0.000000, 0.0, 0.000000, 2.000000);
	   PlayerTextDrawShow(playerid, Tachonadel[playerid]);
	   PlayerTextDrawShow(playerid, Spritnadel[playerid]);
	   PlayerTextDrawShow(playerid, AutoHP[playerid][0]);
	   PlayerTextDrawShow(playerid, AutoHP[playerid][1]);
	   PlayerTextDrawShow(playerid, AutoHP[playerid][2]);
	   PlayerTextDrawShow(playerid, AutoHP[playerid][3]);
	   PlayerTextDrawShow(playerid, Sprit_Mitte[playerid]);
	   PlayerTextDrawShow(playerid, Tacho_Mitte[playerid]);
	   PlayerTextDrawSetString(playerid, KMH[playerid], "000 km/h");
	   PlayerTextDrawSetString(playerid, Sprit[playerid], "100");
	   PlayerTextDrawSetString(playerid, AutoHP[playerid][0], "100");
	   PlayerTextDrawSetString(playerid,Kilometerstand[playerid], "000000 km");
	   DeletePVar(playerid, "TachoHide");
	   if(modshop == 1)
	   {
	      PlayerTextDrawShow(playerid, Motorleuchte[playerid][0]);
	      PlayerTextDrawShow(playerid, Motorleuchte[playerid][1]);
	      PlayerTextDrawShow(playerid, Motorleuchte[playerid][2]);
	      PlayerTextDrawShow(playerid, Motorleuchte[playerid][3]);
	      PlayerTextDrawShow(playerid, Motorleuchte[playerid][4]);
	      PlayerTextDrawShow(playerid, Motorleuchte[playerid][5]);
	      PlayerTextDrawShow(playerid, Motorleuchte[playerid][6]);
	      PlayerTextDrawShow(playerid, Motorleuchte[playerid][7]);
	      PlayerTextDrawShow(playerid, Motorleuchte[playerid][8]);
	      PlayerTextDrawShow(playerid, BlinkerLinks[playerid]);
	      PlayerTextDrawShow(playerid, BlinkerRechts[playerid]);
	   }
return 1;
}

forward Speedometer_Hide(playerid, disable);
public Speedometer_Hide(playerid, disable)
{
 	   PlayerTextDrawHide(playerid, Tacho[playerid][0]);
 	   PlayerTextDrawHide(playerid, Tacho[playerid][1]);
 	   PlayerTextDrawHide(playerid, Tacho[playerid][2]);
 	   PlayerTextDrawHide(playerid, Tacho[playerid][3]);
 	   PlayerTextDrawHide(playerid, Tacho[playerid][4]);
 	   PlayerTextDrawHide(playerid, Tacho[playerid][5]);
 	   PlayerTextDrawHide(playerid, Tacho[playerid][6]);
 	   PlayerTextDrawHide(playerid, Tacho[playerid][7]);
 	   PlayerTextDrawHide(playerid, Tacho[playerid][8]);
 	   PlayerTextDrawHide(playerid, Tacho[playerid][9]);
 	   PlayerTextDrawHide(playerid, Tacho[playerid][10]);
 	   PlayerTextDrawHide(playerid, Tacho[playerid][11]);
 	   PlayerTextDrawHide(playerid, Tacho[playerid][12]);
 	   PlayerTextDrawHide(playerid, Tacho[playerid][13]);
 	   PlayerTextDrawHide(playerid, Tacho[playerid][14]);
 	   PlayerTextDrawHide(playerid, Tacho[playerid][15]);
 	   PlayerTextDrawHide(playerid, Tacho[playerid][16]);
 	   PlayerTextDrawHide(playerid, Tacho[playerid][17]);
 	   PlayerTextDrawHide(playerid, Tacho[playerid][18]);
 	   PlayerTextDrawHide(playerid, Tacho[playerid][19]);
 	   PlayerTextDrawHide(playerid, Tacho[playerid][20]);
 	   PlayerTextDrawHide(playerid, Tacho[playerid][21]);
 	   PlayerTextDrawHide(playerid, Tacho[playerid][22]);
 	   PlayerTextDrawHide(playerid, Tacho[playerid][23]);
 	   PlayerTextDrawHide(playerid, Tacho[playerid][24]);
 	   PlayerTextDrawHide(playerid, Tacho[playerid][25]);
 	   PlayerTextDrawHide(playerid, Tacho[playerid][26]);
 	   PlayerTextDrawHide(playerid, Tacho[playerid][27]);
 	   PlayerTextDrawHide(playerid, Tacho[playerid][28]);
 	   PlayerTextDrawHide(playerid, Tacho[playerid][29]);
 	   PlayerTextDrawHide(playerid, Tacho[playerid][30]);
 	   PlayerTextDrawHide(playerid, Tacho[playerid][31]);
 	   PlayerTextDrawHide(playerid, Tacho[playerid][32]);
 	   PlayerTextDrawHide(playerid, Tacho[playerid][33]);
 	   PlayerTextDrawHide(playerid, Tacho[playerid][34]);
 	   PlayerTextDrawHide(playerid, Tacho[playerid][35]);
 	   PlayerTextDrawHide(playerid, Tacho[playerid][36]);
 	   PlayerTextDrawHide(playerid, Tacho[playerid][37]);
 	   PlayerTextDrawHide(playerid, Tacho[playerid][38]);
 	   PlayerTextDrawHide(playerid, Tacho[playerid][39]);
 	   PlayerTextDrawHide(playerid, Tacho[playerid][40]);
 	   PlayerTextDrawHide(playerid, Tacho[playerid][41]);
 	   PlayerTextDrawHide(playerid, Tacho[playerid][42]);
 	   PlayerTextDrawHide(playerid, Tacho[playerid][43]);
 	   PlayerTextDrawHide(playerid, Tacho[playerid][44]);
 	   PlayerTextDrawHide(playerid, Tacho[playerid][45]);
 	   PlayerTextDrawHide(playerid, Tacho[playerid][46]);
 	   PlayerTextDrawHide(playerid, Tacho[playerid][47]);
 	   PlayerTextDrawHide(playerid, Tacho[playerid][48]);
 	   PlayerTextDrawHide(playerid, Tacho[playerid][49]);
 	   PlayerTextDrawHide(playerid, Tacho[playerid][50]);
 	   PlayerTextDrawHide(playerid, Tacho[playerid][51]);
 	   PlayerTextDrawHide(playerid, Tacho[playerid][52]);
 	   PlayerTextDrawHide(playerid, Tacho[playerid][53]);
 	   PlayerTextDrawHide(playerid, Tacho[playerid][54]);
 	   PlayerTextDrawHide(playerid, Tacho[playerid][55]);
	   PlayerTextDrawHide(playerid, Sprit[playerid]);
	   PlayerTextDrawHide(playerid, KMH[playerid]);
	   PlayerTextDrawHide(playerid, Kilometerstand[playerid]);
	   PlayerTextDrawHide(playerid, Tachonadel[playerid]);
	   PlayerTextDrawHide(playerid, Spritnadel[playerid]);
	   PlayerTextDrawHide(playerid, Licht[playerid][0]);
	   PlayerTextDrawHide(playerid, Licht[playerid][1]);
	   PlayerTextDrawHide(playerid, Licht[playerid][2]);
	   PlayerTextDrawHide(playerid, Licht[playerid][3]);
	   PlayerTextDrawHide(playerid, Locked[playerid][0]);
	   PlayerTextDrawHide(playerid, Locked[playerid][1]);
	   PlayerTextDrawHide(playerid, Locked[playerid][2]);
	   PlayerTextDrawHide(playerid, Locked[playerid][3]);
	   PlayerTextDrawHide(playerid, Batterie[playerid][0]);
	   PlayerTextDrawHide(playerid, Batterie[playerid][1]);
	   PlayerTextDrawHide(playerid, Batterie[playerid][2]);
	   PlayerTextDrawHide(playerid, Batterie[playerid][3]);
	   PlayerTextDrawHide(playerid, Batterie[playerid][4]);
	   PlayerTextDrawHide(playerid, Batterie[playerid][5]);
	   PlayerTextDrawHide(playerid, AutoHP[playerid][0]);
	   PlayerTextDrawHide(playerid, AutoHP[playerid][1]);
	   PlayerTextDrawHide(playerid, AutoHP[playerid][2]);
	   PlayerTextDrawHide(playerid, AutoHP[playerid][3]);
	   PlayerTextDrawHide(playerid, AutoHP[playerid][4]);
	   PlayerTextDrawHide(playerid, Sprit_Mitte[playerid]);
	   PlayerTextDrawHide(playerid, Tacho_Mitte[playerid]);
	   PlayerTextDrawHide(playerid, Motorleuchte[playerid][0]);
	   PlayerTextDrawHide(playerid, Motorleuchte[playerid][1]);
	   PlayerTextDrawHide(playerid, Motorleuchte[playerid][2]);
	   PlayerTextDrawHide(playerid, Motorleuchte[playerid][3]);
	   PlayerTextDrawHide(playerid, Motorleuchte[playerid][4]);
	   PlayerTextDrawHide(playerid, Motorleuchte[playerid][5]);
	   PlayerTextDrawHide(playerid, Motorleuchte[playerid][6]);
	   PlayerTextDrawHide(playerid, Motorleuchte[playerid][7]);
	   PlayerTextDrawHide(playerid, Motorleuchte[playerid][8]);
	   PlayerTextDrawHide(playerid, BlinkerLinks[playerid]);
	   PlayerTextDrawHide(playerid, BlinkerRechts[playerid]);
	   if(disable)
	   {
	      SetPVarInt(playerid, "TachoHide", 1);
	   }
return 1;
}

forward Tachofarbe(playerid, farbbereich, farbe);
public Tachofarbe(playerid, farbbereich, farbe)
{
   if (farbbereich == 1)
   {
	  PlayerTextDrawColor(playerid, Tacho[playerid][19], farbe);
	  PlayerTextDrawColor(playerid, Tacho[playerid][21], farbe);
	  Speedometer_Show(playerid, 0);
   }
   else if (farbbereich == 2)
   {
	  PlayerTextDrawColor(playerid, Tacho[playerid][20], farbe);
	  PlayerTextDrawColor(playerid, Tacho[playerid][22], farbe);
	  Speedometer_Show(playerid, 0);
   }
   if (farbbereich == 3)
   {
	  PlayerTextDrawColor(playerid, Tacho[playerid][0], farbe);
	  PlayerTextDrawColor(playerid, Tacho[playerid][1], farbe);
	  PlayerTextDrawColor(playerid, Tacho[playerid][2], farbe);
	  PlayerTextDrawColor(playerid, Tacho[playerid][3], farbe);
	  PlayerTextDrawColor(playerid, Tacho[playerid][4], farbe);
	  PlayerTextDrawColor(playerid, Tacho[playerid][5], farbe);
	  PlayerTextDrawColor(playerid, Tacho[playerid][6], farbe);
	  PlayerTextDrawColor(playerid, Tacho[playerid][7], farbe);
	  PlayerTextDrawColor(playerid, Tacho[playerid][8], farbe);
	  PlayerTextDrawColor(playerid, Tacho[playerid][9], farbe);
	  PlayerTextDrawColor(playerid, Tacho[playerid][10], farbe);
	  PlayerTextDrawColor(playerid, Tacho[playerid][11], farbe);
	  PlayerTextDrawColor(playerid, Tacho[playerid][12], farbe);
	  PlayerTextDrawColor(playerid, Tacho[playerid][15], farbe);
	  PlayerTextDrawColor(playerid, Tacho[playerid][16], farbe);
	  PlayerTextDrawColor(playerid, Tacho[playerid][18], farbe);

	  PlayerTextDrawColor(playerid, Tacho[playerid][23], farbe);
	  PlayerTextDrawColor(playerid, Tacho[playerid][24], farbe);
	  PlayerTextDrawColor(playerid, Tacho[playerid][25], farbe);
	  PlayerTextDrawColor(playerid, Tacho[playerid][26], farbe);
	  PlayerTextDrawColor(playerid, Tacho[playerid][27], farbe);
	  PlayerTextDrawColor(playerid, Tacho[playerid][28], farbe);
	  PlayerTextDrawColor(playerid, Tacho[playerid][29], farbe);
	  PlayerTextDrawColor(playerid, Tacho[playerid][30], farbe);
	  PlayerTextDrawColor(playerid, Tacho[playerid][31], farbe);
	  PlayerTextDrawColor(playerid, Tacho[playerid][32], farbe);
	  PlayerTextDrawColor(playerid, Tacho[playerid][33], farbe);
	  PlayerTextDrawColor(playerid, Tacho[playerid][34], farbe);
	  PlayerTextDrawColor(playerid, Tacho[playerid][35], farbe);
	  PlayerTextDrawColor(playerid, Tacho[playerid][36], farbe);
	  PlayerTextDrawColor(playerid, Tacho[playerid][37], farbe);
	  PlayerTextDrawColor(playerid, Tacho[playerid][38], farbe);
	  PlayerTextDrawColor(playerid, Tacho[playerid][39], farbe);
	  PlayerTextDrawColor(playerid, Tacho[playerid][40], farbe);
	  PlayerTextDrawColor(playerid, Tacho[playerid][41], farbe);
	  PlayerTextDrawColor(playerid, Tacho[playerid][42], farbe);
	  PlayerTextDrawColor(playerid, Tacho[playerid][43], farbe);
	  PlayerTextDrawColor(playerid, Tacho[playerid][44], farbe);
	  PlayerTextDrawColor(playerid, Tacho[playerid][45], farbe);
	  PlayerTextDrawColor(playerid, Tacho[playerid][46], farbe);
	  PlayerTextDrawColor(playerid, Tacho[playerid][48], farbe);
	  PlayerTextDrawColor(playerid, KMH[playerid], farbe);
	  PlayerTextDrawColor(playerid, Kilometerstand[playerid], farbe);
	  PlayerTextDrawColor(playerid, Sprit[playerid], farbe);
	  PlayerTextDrawColor(playerid, AutoHP[playerid][0], farbe);
	  Speedometer_Show(playerid, 0);
   }
return 1;
}

stock SendInfoText(playerid, text[])
{
new dkljflsdgk[150];
format(dkljflsdgk, sizeof dkljflsdgk, "~n~~n~~n~~n~~n~~n~~n~~n~~n~~w~%s", text);
GameTextForPlayer(playerid, dkljflsdgk, 4000, 3);
return 1;
}

stock DebugMessage(playerid, string[])
{
if(!IsPlayerAdmin(playerid)) return 0;
return SendClientMessage(playerid, Weis, string);
}

stock IsAMountainBike(vehicleid)
{
   switch(GetVehicleModel(vehicleid))
   {
		case 481,509,510:
		return 1;
   }
   return 0;
}

stock IsAMotorBike(vehicleid)
{
   switch(GetVehicleModel(vehicleid))
   {
		case 581, 462, 521, 463, 522, 461, 448, 468, 586, 471:
		return 1;
   }
   return 0;
}

stock IsAAircraft(vehicleid)
{
   switch(GetVehicleModel(vehicleid))
   {
		case 592, 577, 511, 512, 593, 520, 553, 476, 519, 460, 513, 548, 425, 417, 487, 488, 497, 563, 447, 469:
		return 1;
   }
   return 0;
}

stock IsAPlane(vehicleid)
{
   switch(GetVehicleModel(vehicleid))
   {
		case 592, 577, 511, 512, 593, 520, 553, 476, 519, 460, 513:
		return 1;
   }
   return 0;
}

stock IsAHeli(vehicleid)
{
   switch(GetVehicleModel(vehicleid))
   {
		case 548, 425, 417, 487, 488, 497, 563, 447, 469:
		return 1;
   }
   return 0;
}

stock IsABoat(vehicleid)
{
   switch(GetVehicleModel(vehicleid))
   {
		case 472, 473, 493, 595, 484, 430, 453, 452, 446, 454:
		return 1;
   }
   return 0;
}

stock IsATruck(vehicleid)
{
   switch(GetVehicleModel(vehicleid))
   {
		case 403, 443, 515, 514,  524:
		return 1;
   }
   return 0;
}

enum SAZONE_MAIN { //Betamaster
		SAZONE_NAME[28],
		Float:SAZONE_AREA[6]
};

static const gSAZones[][SAZONE_MAIN] = {  // Majority of names and area coordinates adopted from Mabako's 'Zones Script' v0.2
	//	NAME                            AREA (Xmin,Ymin,Zmin,Xmax,Ymax,Zmax)
	{"The Big Ear",	                {-410.00,1403.30,-3.00,-137.90,1681.20,200.00}},
	{"Aldea Malvada",               {-1372.10,2498.50,0.00,-1277.50,2615.30,200.00}},
	{"Angel Pine",                  {-2324.90,-2584.20,-6.10,-1964.20,-2212.10,200.00}},
	{"Arco del Oeste",              {-901.10,2221.80,0.00,-592.00,2571.90,200.00}},
	{"Avispa Country Club",         {-2646.40,-355.40,0.00,-2270.00,-222.50,200.00}},
	{"Avispa Country Club",         {-2831.80,-430.20,-6.10,-2646.40,-222.50,200.00}},
	{"Avispa Country Club",         {-2361.50,-417.10,0.00,-2270.00,-355.40,200.00}},
	{"Avispa Country Club",         {-2667.80,-302.10,-28.80,-2646.40,-262.30,71.10}},
	{"Avispa Country Club",         {-2470.00,-355.40,0.00,-2270.00,-318.40,46.10}},
	{"Avispa Country Club",         {-2550.00,-355.40,0.00,-2470.00,-318.40,39.70}},
	{"Back o Beyond",               {-1166.90,-2641.10,0.00,-321.70,-1856.00,200.00}},
	{"Battery Point",               {-2741.00,1268.40,-4.50,-2533.00,1490.40,200.00}},
	{"Bayside",                     {-2741.00,2175.10,0.00,-2353.10,2722.70,200.00}},
	{"Bayside Marina",              {-2353.10,2275.70,0.00,-2153.10,2475.70,200.00}},
	{"Beacon Hill",                 {-399.60,-1075.50,-1.40,-319.00,-977.50,198.50}},
	{"Blackfield",                  {964.30,1203.20,-89.00,1197.30,1403.20,110.90}},
	{"Blackfield",                  {964.30,1403.20,-89.00,1197.30,1726.20,110.90}},
	{"Blackfield Chapel",           {1375.60,596.30,-89.00,1558.00,823.20,110.90}},
	{"Blackfield Chapel",           {1325.60,596.30,-89.00,1375.60,795.00,110.90}},
	{"Blackfield Intersection",     {1197.30,1044.60,-89.00,1277.00,1163.30,110.90}},
	{"Blackfield Intersection",     {1166.50,795.00,-89.00,1375.60,1044.60,110.90}},
	{"Blackfield Intersection",     {1277.00,1044.60,-89.00,1315.30,1087.60,110.90}},
	{"Blackfield Intersection",     {1375.60,823.20,-89.00,1457.30,919.40,110.90}},
	{"Blueberry",                   {104.50,-220.10,2.30,349.60,152.20,200.00}},
	{"Blueberry",                   {19.60,-404.10,3.80,349.60,-220.10,200.00}},
	{"Blueberry Acres",             {-319.60,-220.10,0.00,104.50,293.30,200.00}},
	{"Caligula's Palace",           {2087.30,1543.20,-89.00,2437.30,1703.20,110.90}},
	{"Caligula's Palace",           {2137.40,1703.20,-89.00,2437.30,1783.20,110.90}},
	{"Calton Heights",              {-2274.10,744.10,-6.10,-1982.30,1358.90,200.00}},
	{"Chinatown",                   {-2274.10,578.30,-7.60,-2078.60,744.10,200.00}},
	{"City Hall",                   {-2867.80,277.40,-9.10,-2593.40,458.40,200.00}},
	{"Come-A-Lot",                  {2087.30,943.20,-89.00,2623.10,1203.20,110.90}},
	{"Commerce",                    {1323.90,-1842.20,-89.00,1701.90,-1722.20,110.90}},
	{"Commerce",                    {1323.90,-1722.20,-89.00,1440.90,-1577.50,110.90}},
	{"Commerce",                    {1370.80,-1577.50,-89.00,1463.90,-1384.90,110.90}},
	{"Commerce",                    {1463.90,-1577.50,-89.00,1667.90,-1430.80,110.90}},
	{"Commerce",                    {1583.50,-1722.20,-89.00,1758.90,-1577.50,110.90}},
	{"Commerce",                    {1667.90,-1577.50,-89.00,1812.60,-1430.80,110.90}},
	{"Conference Center",           {1046.10,-1804.20,-89.00,1323.90,-1722.20,110.90}},
	{"Conference Center",           {1073.20,-1842.20,-89.00,1323.90,-1804.20,110.90}},
	{"Cranberry Station",           {-2007.80,56.30,0.00,-1922.00,224.70,100.00}},
	{"Creek",                       {2749.90,1937.20,-89.00,2921.60,2669.70,110.90}},
	{"Dillimore",                   {580.70,-674.80,-9.50,861.00,-404.70,200.00}},
	{"Doherty",                     {-2270.00,-324.10,-0.00,-1794.90,-222.50,200.00}},
	{"Doherty",                     {-2173.00,-222.50,-0.00,-1794.90,265.20,200.00}},
	{"Downtown",                    {-1982.30,744.10,-6.10,-1871.70,1274.20,200.00}},
	{"Downtown",                    {-1871.70,1176.40,-4.50,-1620.30,1274.20,200.00}},
	{"Downtown",                    {-1700.00,744.20,-6.10,-1580.00,1176.50,200.00}},
	{"Downtown",                    {-1580.00,744.20,-6.10,-1499.80,1025.90,200.00}},
	{"Downtown",                    {-2078.60,578.30,-7.60,-1499.80,744.20,200.00}},
	{"Downtown",                    {-1993.20,265.20,-9.10,-1794.90,578.30,200.00}},
	{"Downtown Los Santos",         {1463.90,-1430.80,-89.00,1724.70,-1290.80,110.90}},
	{"Downtown Los Santos",         {1724.70,-1430.80,-89.00,1812.60,-1250.90,110.90}},
	{"Downtown Los Santos",         {1463.90,-1290.80,-89.00,1724.70,-1150.80,110.90}},
	{"Downtown Los Santos",         {1370.80,-1384.90,-89.00,1463.90,-1170.80,110.90}},
	{"Downtown Los Santos",         {1724.70,-1250.90,-89.00,1812.60,-1150.80,110.90}},
	{"Downtown Los Santos",         {1370.80,-1170.80,-89.00,1463.90,-1130.80,110.90}},
	{"Downtown Los Santos",         {1378.30,-1130.80,-89.00,1463.90,-1026.30,110.90}},
	{"Downtown Los Santos",         {1391.00,-1026.30,-89.00,1463.90,-926.90,110.90}},
	{"Downtown Los Santos",         {1507.50,-1385.20,110.90,1582.50,-1325.30,335.90}},
	{"East Beach",                  {2632.80,-1852.80,-89.00,2959.30,-1668.10,110.90}},
	{"East Beach",                  {2632.80,-1668.10,-89.00,2747.70,-1393.40,110.90}},
	{"East Beach",                  {2747.70,-1668.10,-89.00,2959.30,-1498.60,110.90}},
	{"East Beach",                  {2747.70,-1498.60,-89.00,2959.30,-1120.00,110.90}},
	{"East Los Santos",             {2421.00,-1628.50,-89.00,2632.80,-1454.30,110.90}},
	{"East Los Santos",             {2222.50,-1628.50,-89.00,2421.00,-1494.00,110.90}},
	{"East Los Santos",             {2266.20,-1494.00,-89.00,2381.60,-1372.00,110.90}},
	{"East Los Santos",             {2381.60,-1494.00,-89.00,2421.00,-1454.30,110.90}},
	{"East Los Santos",             {2281.40,-1372.00,-89.00,2381.60,-1135.00,110.90}},
	{"East Los Santos",             {2381.60,-1454.30,-89.00,2462.10,-1135.00,110.90}},
	{"East Los Santos",             {2462.10,-1454.30,-89.00,2581.70,-1135.00,110.90}},
	{"Easter Basin",                {-1794.90,249.90,-9.10,-1242.90,578.30,200.00}},
	{"Easter Basin",                {-1794.90,-50.00,-0.00,-1499.80,249.90,200.00}},
	{"Easter Bay Airport",          {-1499.80,-50.00,-0.00,-1242.90,249.90,200.00}},
	{"Easter Bay Airport",          {-1794.90,-730.10,-3.00,-1213.90,-50.00,200.00}},
	{"Easter Bay Airport",          {-1213.90,-730.10,0.00,-1132.80,-50.00,200.00}},
	{"Easter Bay Airport",          {-1242.90,-50.00,0.00,-1213.90,578.30,200.00}},
	{"Easter Bay Airport",          {-1213.90,-50.00,-4.50,-947.90,578.30,200.00}},
	{"Easter Bay Airport",          {-1315.40,-405.30,15.40,-1264.40,-209.50,25.40}},
	{"Easter Bay Airport",          {-1354.30,-287.30,15.40,-1315.40,-209.50,25.40}},
	{"Easter Bay Airport",          {-1490.30,-209.50,15.40,-1264.40,-148.30,25.40}},
	{"Easter Bay Chemicals",        {-1132.80,-768.00,0.00,-956.40,-578.10,200.00}},
	{"Easter Bay Chemicals",        {-1132.80,-787.30,0.00,-956.40,-768.00,200.00}},
	{"El Castillo del Diablo",      {-464.50,2217.60,0.00,-208.50,2580.30,200.00}},
	{"El Castillo del Diablo",      {-208.50,2123.00,-7.60,114.00,2337.10,200.00}},
	{"El Castillo del Diablo",      {-208.50,2337.10,0.00,8.40,2487.10,200.00}},
	{"El Corona",                   {1812.60,-2179.20,-89.00,1970.60,-1852.80,110.90}},
	{"El Corona",                   {1692.60,-2179.20,-89.00,1812.60,-1842.20,110.90}},
	{"El Quebrados",                {-1645.20,2498.50,0.00,-1372.10,2777.80,200.00}},
	{"Esplanade East",              {-1620.30,1176.50,-4.50,-1580.00,1274.20,200.00}},
	{"Esplanade East",              {-1580.00,1025.90,-6.10,-1499.80,1274.20,200.00}},
	{"Esplanade East",              {-1499.80,578.30,-79.60,-1339.80,1274.20,20.30}},
	{"Esplanade North",             {-2533.00,1358.90,-4.50,-1996.60,1501.20,200.00}},
	{"Esplanade North",             {-1996.60,1358.90,-4.50,-1524.20,1592.50,200.00}},
	{"Esplanade North",             {-1982.30,1274.20,-4.50,-1524.20,1358.90,200.00}},
	{"Fallen Tree",                 {-792.20,-698.50,-5.30,-452.40,-380.00,200.00}},
	{"Fallow Bridge",               {434.30,366.50,0.00,603.00,555.60,200.00}},
	{"Fern Ridge",                  {508.10,-139.20,0.00,1306.60,119.50,200.00}},
	{"Financial",                   {-1871.70,744.10,-6.10,-1701.30,1176.40,300.00}},
	{"Fisher's Lagoon",             {1916.90,-233.30,-100.00,2131.70,13.80,200.00}},
	{"Flint Intersection",          {-187.70,-1596.70,-89.00,17.00,-1276.60,110.90}},
	{"Flint Range",                 {-594.10,-1648.50,0.00,-187.70,-1276.60,200.00}},
	{"Fort Carson",                 {-376.20,826.30,-3.00,123.70,1220.40,200.00}},
	{"Foster Valley",               {-2270.00,-430.20,-0.00,-2178.60,-324.10,200.00}},
	{"Foster Valley",               {-2178.60,-599.80,-0.00,-1794.90,-324.10,200.00}},
	{"Foster Valley",               {-2178.60,-1115.50,0.00,-1794.90,-599.80,200.00}},
	{"Foster Valley",               {-2178.60,-1250.90,0.00,-1794.90,-1115.50,200.00}},
	{"Frederick Bridge",            {2759.20,296.50,0.00,2774.20,594.70,200.00}},
	{"Gant Bridge",                 {-2741.40,1659.60,-6.10,-2616.40,2175.10,200.00}},
	{"Gant Bridge",                 {-2741.00,1490.40,-6.10,-2616.40,1659.60,200.00}},
	{"Ganton",                      {2222.50,-1852.80,-89.00,2632.80,-1722.30,110.90}},
	{"Ganton",                      {2222.50,-1722.30,-89.00,2632.80,-1628.50,110.90}},
	{"Garcia",                      {-2411.20,-222.50,-0.00,-2173.00,265.20,200.00}},
	{"Garcia",                      {-2395.10,-222.50,-5.30,-2354.00,-204.70,200.00}},
	{"Garver Bridge",               {-1339.80,828.10,-89.00,-1213.90,1057.00,110.90}},
	{"Garver Bridge",               {-1213.90,950.00,-89.00,-1087.90,1178.90,110.90}},
	{"Garver Bridge",               {-1499.80,696.40,-179.60,-1339.80,925.30,20.30}},
	{"Glen Park",                   {1812.60,-1449.60,-89.00,1996.90,-1350.70,110.90}},
	{"Glen Park",                   {1812.60,-1100.80,-89.00,1994.30,-973.30,110.90}},
	{"Glen Park",                   {1812.60,-1350.70,-89.00,2056.80,-1100.80,110.90}},
	{"Green Palms",                 {176.50,1305.40,-3.00,338.60,1520.70,200.00}},
	{"Greenglass College",          {964.30,1044.60,-89.00,1197.30,1203.20,110.90}},
	{"Greenglass College",          {964.30,930.80,-89.00,1166.50,1044.60,110.90}},
	{"Hampton Barns",               {603.00,264.30,0.00,761.90,366.50,200.00}},
	{"Hankypanky Point",            {2576.90,62.10,0.00,2759.20,385.50,200.00}},
	{"Harry Gold Parkway",          {1777.30,863.20,-89.00,1817.30,2342.80,110.90}},
	{"Hashbury",                    {-2593.40,-222.50,-0.00,-2411.20,54.70,200.00}},
	{"Hilltop Farm",                {967.30,-450.30,-3.00,1176.70,-217.90,200.00}},
	{"Hunter Quarry",               {337.20,710.80,-115.20,860.50,1031.70,203.70}},
	{"Idlewood",                    {1812.60,-1852.80,-89.00,1971.60,-1742.30,110.90}},
	{"Idlewood",                    {1812.60,-1742.30,-89.00,1951.60,-1602.30,110.90}},
	{"Idlewood",                    {1951.60,-1742.30,-89.00,2124.60,-1602.30,110.90}},
	{"Idlewood",                    {1812.60,-1602.30,-89.00,2124.60,-1449.60,110.90}},
	{"Idlewood",                    {2124.60,-1742.30,-89.00,2222.50,-1494.00,110.90}},
	{"Idlewood",                    {1971.60,-1852.80,-89.00,2222.50,-1742.30,110.90}},
	{"Jefferson",                   {1996.90,-1449.60,-89.00,2056.80,-1350.70,110.90}},
	{"Jefferson",                   {2124.60,-1494.00,-89.00,2266.20,-1449.60,110.90}},
	{"Jefferson",                   {2056.80,-1372.00,-89.00,2281.40,-1210.70,110.90}},
	{"Jefferson",                   {2056.80,-1210.70,-89.00,2185.30,-1126.30,110.90}},
	{"Jefferson",                   {2185.30,-1210.70,-89.00,2281.40,-1154.50,110.90}},
	{"Jefferson",                   {2056.80,-1449.60,-89.00,2266.20,-1372.00,110.90}},
	{"Julius Thruway East",         {2623.10,943.20,-89.00,2749.90,1055.90,110.90}},
	{"Julius Thruway East",         {2685.10,1055.90,-89.00,2749.90,2626.50,110.90}},
	{"Julius Thruway East",         {2536.40,2442.50,-89.00,2685.10,2542.50,110.90}},
	{"Julius Thruway East",         {2625.10,2202.70,-89.00,2685.10,2442.50,110.90}},
	{"Julius Thruway North",        {2498.20,2542.50,-89.00,2685.10,2626.50,110.90}},
	{"Julius Thruway North",        {2237.40,2542.50,-89.00,2498.20,2663.10,110.90}},
	{"Julius Thruway North",        {2121.40,2508.20,-89.00,2237.40,2663.10,110.90}},
	{"Julius Thruway North",        {1938.80,2508.20,-89.00,2121.40,2624.20,110.90}},
	{"Julius Thruway North",        {1534.50,2433.20,-89.00,1848.40,2583.20,110.90}},
	{"Julius Thruway North",        {1848.40,2478.40,-89.00,1938.80,2553.40,110.90}},
	{"Julius Thruway North",        {1704.50,2342.80,-89.00,1848.40,2433.20,110.90}},
	{"Julius Thruway North",        {1377.30,2433.20,-89.00,1534.50,2507.20,110.90}},
	{"Julius Thruway South",        {1457.30,823.20,-89.00,2377.30,863.20,110.90}},
	{"Julius Thruway South",        {2377.30,788.80,-89.00,2537.30,897.90,110.90}},
	{"Julius Thruway West",         {1197.30,1163.30,-89.00,1236.60,2243.20,110.90}},
	{"Julius Thruway West",         {1236.60,2142.80,-89.00,1297.40,2243.20,110.90}},
	{"Juniper Hill",                {-2533.00,578.30,-7.60,-2274.10,968.30,200.00}},
	{"Juniper Hollow",              {-2533.00,968.30,-6.10,-2274.10,1358.90,200.00}},
	{"K.A.C.C. Military Fuels",     {2498.20,2626.50,-89.00,2749.90,2861.50,110.90}},
	{"Kincaid Bridge",              {-1339.80,599.20,-89.00,-1213.90,828.10,110.90}},
	{"Kincaid Bridge",              {-1213.90,721.10,-89.00,-1087.90,950.00,110.90}},
	{"Kincaid Bridge",              {-1087.90,855.30,-89.00,-961.90,986.20,110.90}},
	{"King's",                      {-2329.30,458.40,-7.60,-1993.20,578.30,200.00}},
	{"King's",                      {-2411.20,265.20,-9.10,-1993.20,373.50,200.00}},
	{"King's",                      {-2253.50,373.50,-9.10,-1993.20,458.40,200.00}},
	{"LVA Freight Depot",           {1457.30,863.20,-89.00,1777.40,1143.20,110.90}},
	{"LVA Freight Depot",           {1375.60,919.40,-89.00,1457.30,1203.20,110.90}},
	{"LVA Freight Depot",           {1277.00,1087.60,-89.00,1375.60,1203.20,110.90}},
	{"LVA Freight Depot",           {1315.30,1044.60,-89.00,1375.60,1087.60,110.90}},
	{"LVA Freight Depot",           {1236.60,1163.40,-89.00,1277.00,1203.20,110.90}},
	{"Las Barrancas",               {-926.10,1398.70,-3.00,-719.20,1634.60,200.00}},
	{"Las Brujas",                  {-365.10,2123.00,-3.00,-208.50,2217.60,200.00}},
	{"Las Colinas",                 {1994.30,-1100.80,-89.00,2056.80,-920.80,110.90}},
	{"Las Colinas",                 {2056.80,-1126.30,-89.00,2126.80,-920.80,110.90}},
	{"Las Colinas",                 {2185.30,-1154.50,-89.00,2281.40,-934.40,110.90}},
	{"Las Colinas",                 {2126.80,-1126.30,-89.00,2185.30,-934.40,110.90}},
	{"Las Colinas",                 {2747.70,-1120.00,-89.00,2959.30,-945.00,110.90}},
	{"Las Colinas",                 {2632.70,-1135.00,-89.00,2747.70,-945.00,110.90}},
	{"Las Colinas",                 {2281.40,-1135.00,-89.00,2632.70,-945.00,110.90}},
	{"Las Payasadas",               {-354.30,2580.30,2.00,-133.60,2816.80,200.00}},
	{"Las Venturas Airport",        {1236.60,1203.20,-89.00,1457.30,1883.10,110.90}},
	{"Las Venturas Airport",        {1457.30,1203.20,-89.00,1777.30,1883.10,110.90}},
	{"Las Venturas Airport",        {1457.30,1143.20,-89.00,1777.40,1203.20,110.90}},
	{"Las Venturas Airport",        {1515.80,1586.40,-12.50,1729.90,1714.50,87.50}},
	{"Last Dime Motel",             {1823.00,596.30,-89.00,1997.20,823.20,110.90}},
	{"Leafy Hollow",                {-1166.90,-1856.00,0.00,-815.60,-1602.00,200.00}},
	{"Liberty City",                {-1000.00,400.00,1300.00,-700.00,600.00,1400.00}},
	{"Lil' Probe Inn",              {-90.20,1286.80,-3.00,153.80,1554.10,200.00}},
	{"Linden Side",                 {2749.90,943.20,-89.00,2923.30,1198.90,110.90}},
	{"Linden Station",              {2749.90,1198.90,-89.00,2923.30,1548.90,110.90}},
	{"Linden Station",              {2811.20,1229.50,-39.50,2861.20,1407.50,60.40}},
	{"Little Mexico",               {1701.90,-1842.20,-89.00,1812.60,-1722.20,110.90}},
	{"Little Mexico",               {1758.90,-1722.20,-89.00,1812.60,-1577.50,110.90}},
	{"Los Flores",                  {2581.70,-1454.30,-89.00,2632.80,-1393.40,110.90}},
	{"Los Flores",                  {2581.70,-1393.40,-89.00,2747.70,-1135.00,110.90}},
	{"Los Santos International",    {1249.60,-2394.30,-89.00,1852.00,-2179.20,110.90}},
	{"Los Santos International",    {1852.00,-2394.30,-89.00,2089.00,-2179.20,110.90}},
	{"Los Santos International",    {1382.70,-2730.80,-89.00,2201.80,-2394.30,110.90}},
	{"Los Santos International",    {1974.60,-2394.30,-39.00,2089.00,-2256.50,60.90}},
	{"Los Santos International",    {1400.90,-2669.20,-39.00,2189.80,-2597.20,60.90}},
	{"Los Santos International",    {2051.60,-2597.20,-39.00,2152.40,-2394.30,60.90}},
	{"Marina",                      {647.70,-1804.20,-89.00,851.40,-1577.50,110.90}},
	{"Marina",                      {647.70,-1577.50,-89.00,807.90,-1416.20,110.90}},
	{"Marina",                      {807.90,-1577.50,-89.00,926.90,-1416.20,110.90}},
	{"Market",                      {787.40,-1416.20,-89.00,1072.60,-1310.20,110.90}},
	{"Market",                      {952.60,-1310.20,-89.00,1072.60,-1130.80,110.90}},
	{"Market",                      {1072.60,-1416.20,-89.00,1370.80,-1130.80,110.90}},
	{"Market",                      {926.90,-1577.50,-89.00,1370.80,-1416.20,110.90}},
	{"Market Station",              {787.40,-1410.90,-34.10,866.00,-1310.20,65.80}},
	{"Martin Bridge",               {-222.10,293.30,0.00,-122.10,476.40,200.00}},
	{"Missionary Hill",             {-2994.40,-811.20,0.00,-2178.60,-430.20,200.00}},
	{"Montgomery",                  {1119.50,119.50,-3.00,1451.40,493.30,200.00}},
	{"Montgomery",                  {1451.40,347.40,-6.10,1582.40,420.80,200.00}},
	{"Montgomery Intersection",     {1546.60,208.10,0.00,1745.80,347.40,200.00}},
	{"Montgomery Intersection",     {1582.40,347.40,0.00,1664.60,401.70,200.00}},
	{"Mulholland",                  {1414.00,-768.00,-89.00,1667.60,-452.40,110.90}},
	{"Mulholland",                  {1281.10,-452.40,-89.00,1641.10,-290.90,110.90}},
	{"Mulholland",                  {1269.10,-768.00,-89.00,1414.00,-452.40,110.90}},
	{"Mulholland",                  {1357.00,-926.90,-89.00,1463.90,-768.00,110.90}},
	{"Mulholland",                  {1318.10,-910.10,-89.00,1357.00,-768.00,110.90}},
	{"Mulholland",                  {1169.10,-910.10,-89.00,1318.10,-768.00,110.90}},
	{"Mulholland",                  {768.60,-954.60,-89.00,952.60,-860.60,110.90}},
	{"Mulholland",                  {687.80,-860.60,-89.00,911.80,-768.00,110.90}},
	{"Mulholland",                  {737.50,-768.00,-89.00,1142.20,-674.80,110.90}},
	{"Mulholland",                  {1096.40,-910.10,-89.00,1169.10,-768.00,110.90}},
	{"Mulholland",                  {952.60,-937.10,-89.00,1096.40,-860.60,110.90}},
	{"Mulholland",                  {911.80,-860.60,-89.00,1096.40,-768.00,110.90}},
	{"Mulholland",                  {861.00,-674.80,-89.00,1156.50,-600.80,110.90}},
	{"Mulholland Intersection",     {1463.90,-1150.80,-89.00,1812.60,-768.00,110.90}},
	{"North Rock",                  {2285.30,-768.00,0.00,2770.50,-269.70,200.00}},
	{"Ocean Docks",                 {2373.70,-2697.00,-89.00,2809.20,-2330.40,110.90}},
	{"Ocean Docks",                 {2201.80,-2418.30,-89.00,2324.00,-2095.00,110.90}},
	{"Ocean Docks",                 {2324.00,-2302.30,-89.00,2703.50,-2145.10,110.90}},
	{"Ocean Docks",                 {2089.00,-2394.30,-89.00,2201.80,-2235.80,110.90}},
	{"Ocean Docks",                 {2201.80,-2730.80,-89.00,2324.00,-2418.30,110.90}},
	{"Ocean Docks",                 {2703.50,-2302.30,-89.00,2959.30,-2126.90,110.90}},
	{"Ocean Docks",                 {2324.00,-2145.10,-89.00,2703.50,-2059.20,110.90}},
	{"Ocean Flats",                 {-2994.40,277.40,-9.10,-2867.80,458.40,200.00}},
	{"Ocean Flats",                 {-2994.40,-222.50,-0.00,-2593.40,277.40,200.00}},
	{"Ocean Flats",                 {-2994.40,-430.20,-0.00,-2831.80,-222.50,200.00}},
	{"Octane Springs",              {338.60,1228.50,0.00,664.30,1655.00,200.00}},
	{"Old Venturas Strip",          {2162.30,2012.10,-89.00,2685.10,2202.70,110.90}},
	{"Palisades",                   {-2994.40,458.40,-6.10,-2741.00,1339.60,200.00}},
	{"Palomino Creek",              {2160.20,-149.00,0.00,2576.90,228.30,200.00}},
	{"Paradiso",                    {-2741.00,793.40,-6.10,-2533.00,1268.40,200.00}},
	{"Pershing Square",             {1440.90,-1722.20,-89.00,1583.50,-1577.50,110.90}},
	{"Pilgrim",                     {2437.30,1383.20,-89.00,2624.40,1783.20,110.90}},
	{"Pilgrim",                     {2624.40,1383.20,-89.00,2685.10,1783.20,110.90}},
	{"Pilson Intersection",         {1098.30,2243.20,-89.00,1377.30,2507.20,110.90}},
	{"Pirates in Men's Pants",      {1817.30,1469.20,-89.00,2027.40,1703.20,110.90}},
	{"Playa del Seville",           {2703.50,-2126.90,-89.00,2959.30,-1852.80,110.90}},
	{"Prickle Pine",                {1534.50,2583.20,-89.00,1848.40,2863.20,110.90}},
	{"Prickle Pine",                {1117.40,2507.20,-89.00,1534.50,2723.20,110.90}},
	{"Prickle Pine",                {1848.40,2553.40,-89.00,1938.80,2863.20,110.90}},
	{"Prickle Pine",                {1938.80,2624.20,-89.00,2121.40,2861.50,110.90}},
	{"Queens",                      {-2533.00,458.40,0.00,-2329.30,578.30,200.00}},
	{"Queens",                      {-2593.40,54.70,0.00,-2411.20,458.40,200.00}},
	{"Queens",                      {-2411.20,373.50,0.00,-2253.50,458.40,200.00}},
	{"Randolph Industrial",  {1558.00,596.30,-89.00,1823.00,823.20,110.90}},
	{"Redsands East",               {1817.30,2011.80,-89.00,2106.70,2202.70,110.90}},
	{"Redsands East",               {1817.30,2202.70,-89.00,2011.90,2342.80,110.90}},
	{"Redsands East",               {1848.40,2342.80,-89.00,2011.90,2478.40,110.90}},
	{"Redsands West",               {1236.60,1883.10,-89.00,1777.30,2142.80,110.90}},
	{"Redsands West",               {1297.40,2142.80,-89.00,1777.30,2243.20,110.90}},
	{"Redsands West",               {1377.30,2243.20,-89.00,1704.50,2433.20,110.90}},
	{"Redsands West",               {1704.50,2243.20,-89.00,1777.30,2342.80,110.90}},
	{"Regular Tom",                 {-405.70,1712.80,-3.00,-276.70,1892.70,200.00}},
	{"Richman",                     {647.50,-1118.20,-89.00,787.40,-954.60,110.90}},
	{"Richman",                     {647.50,-954.60,-89.00,768.60,-860.60,110.90}},
	{"Richman",                     {225.10,-1369.60,-89.00,334.50,-1292.00,110.90}},
	{"Richman",                     {225.10,-1292.00,-89.00,466.20,-1235.00,110.90}},
	{"Richman",                     {72.60,-1404.90,-89.00,225.10,-1235.00,110.90}},
	{"Richman",                     {72.60,-1235.00,-89.00,321.30,-1008.10,110.90}},
	{"Richman",                     {321.30,-1235.00,-89.00,647.50,-1044.00,110.90}},
	{"Richman",                     {321.30,-1044.00,-89.00,647.50,-860.60,110.90}},
	{"Richman",                     {321.30,-860.60,-89.00,687.80,-768.00,110.90}},
	{"Richman",                     {321.30,-768.00,-89.00,700.70,-674.80,110.90}},
	{"Robada Intersection",         {-1119.00,1178.90,-89.00,-862.00,1351.40,110.90}},
	{"Roca Escalante",              {2237.40,2202.70,-89.00,2536.40,2542.50,110.90}},
	{"Roca Escalante",              {2536.40,2202.70,-89.00,2625.10,2442.50,110.90}},
	{"Rockshore East",              {2537.30,676.50,-89.00,2902.30,943.20,110.90}},
	{"Rockshore West",              {1997.20,596.30,-89.00,2377.30,823.20,110.90}},
	{"Rockshore West",              {2377.30,596.30,-89.00,2537.30,788.80,110.90}},
	{"Rodeo",                       {72.60,-1684.60,-89.00,225.10,-1544.10,110.90}},
	{"Rodeo",                       {72.60,-1544.10,-89.00,225.10,-1404.90,110.90}},
	{"Rodeo",                       {225.10,-1684.60,-89.00,312.80,-1501.90,110.90}},
	{"Rodeo",                       {225.10,-1501.90,-89.00,334.50,-1369.60,110.90}},
	{"Rodeo",                       {334.50,-1501.90,-89.00,422.60,-1406.00,110.90}},
	{"Rodeo",                       {312.80,-1684.60,-89.00,422.60,-1501.90,110.90}},
	{"Rodeo",                       {422.60,-1684.60,-89.00,558.00,-1570.20,110.90}},
	{"Rodeo",                       {558.00,-1684.60,-89.00,647.50,-1384.90,110.90}},
	{"Rodeo",                       {466.20,-1570.20,-89.00,558.00,-1385.00,110.90}},
	{"Rodeo",                       {422.60,-1570.20,-89.00,466.20,-1406.00,110.90}},
	{"Rodeo",                       {466.20,-1385.00,-89.00,647.50,-1235.00,110.90}},
	{"Rodeo",                       {334.50,-1406.00,-89.00,466.20,-1292.00,110.90}},
	{"Royal Casino",                {2087.30,1383.20,-89.00,2437.30,1543.20,110.90}},
	{"San Andreas Sound",           {2450.30,385.50,-100.00,2759.20,562.30,200.00}},
	{"Santa Flora",                 {-2741.00,458.40,-7.60,-2533.00,793.40,200.00}},
	{"Santa Maria Beach",           {342.60,-2173.20,-89.00,647.70,-1684.60,110.90}},
	{"Santa Maria Beach",           {72.60,-2173.20,-89.00,342.60,-1684.60,110.90}},
	{"Shady Cabin",                 {-1632.80,-2263.40,-3.00,-1601.30,-2231.70,200.00}},
	{"Shady Creeks",                {-1820.60,-2643.60,-8.00,-1226.70,-1771.60,200.00}},
	{"Shady Creeks",                {-2030.10,-2174.80,-6.10,-1820.60,-1771.60,200.00}},
	{"Sobell Rail Yards",           {2749.90,1548.90,-89.00,2923.30,1937.20,110.90}},
	{"Spinybed",                    {2121.40,2663.10,-89.00,2498.20,2861.50,110.90}},
	{"Starfish Casino",             {2437.30,1783.20,-89.00,2685.10,2012.10,110.90}},
	{"Starfish Casino",             {2437.30,1858.10,-39.00,2495.00,1970.80,60.90}},
	{"Starfish Casino",             {2162.30,1883.20,-89.00,2437.30,2012.10,110.90}},
	{"Temple",                      {1252.30,-1130.80,-89.00,1378.30,-1026.30,110.90}},
	{"Temple",                      {1252.30,-1026.30,-89.00,1391.00,-926.90,110.90}},
	{"Temple",                      {1252.30,-926.90,-89.00,1357.00,-910.10,110.90}},
	{"Temple",                      {952.60,-1130.80,-89.00,1096.40,-937.10,110.90}},
	{"Temple",                      {1096.40,-1130.80,-89.00,1252.30,-1026.30,110.90}},
	{"Temple",                      {1096.40,-1026.30,-89.00,1252.30,-910.10,110.90}},
	{"The Camel's Toe",             {2087.30,1203.20,-89.00,2640.40,1383.20,110.90}},
	{"The Clown's Pocket",          {2162.30,1783.20,-89.00,2437.30,1883.20,110.90}},
	{"The Emerald Isle",            {2011.90,2202.70,-89.00,2237.40,2508.20,110.90}},
	{"The Farm",                    {-1209.60,-1317.10,114.90,-908.10,-787.30,251.90}},
	{"The Four Dragons Casino",     {1817.30,863.20,-89.00,2027.30,1083.20,110.90}},
	{"The High Roller",             {1817.30,1283.20,-89.00,2027.30,1469.20,110.90}},
	{"The Mako Span",               {1664.60,401.70,0.00,1785.10,567.20,200.00}},
	{"The Panopticon",              {-947.90,-304.30,-1.10,-319.60,327.00,200.00}},
	{"The Pink Swan",               {1817.30,1083.20,-89.00,2027.30,1283.20,110.90}},
	{"The Sherman Dam",             {-968.70,1929.40,-3.00,-481.10,2155.20,200.00}},
	{"The Strip",                   {2027.40,863.20,-89.00,2087.30,1703.20,110.90}},
	{"The Strip",                   {2106.70,1863.20,-89.00,2162.30,2202.70,110.90}},
	{"The Strip",                   {2027.40,1783.20,-89.00,2162.30,1863.20,110.90}},
	{"The Strip",                   {2027.40,1703.20,-89.00,2137.40,1783.20,110.90}},
	{"The Visage",                  {1817.30,1863.20,-89.00,2106.70,2011.80,110.90}},
	{"The Visage",                  {1817.30,1703.20,-89.00,2027.40,1863.20,110.90}},
	{"Unity Station",               {1692.60,-1971.80,-20.40,1812.60,-1932.80,79.50}},
	{"Valle Ocultado",              {-936.60,2611.40,2.00,-715.90,2847.90,200.00}},
	{"Verdant Bluffs",              {930.20,-2488.40,-89.00,1249.60,-2006.70,110.90}},
	{"Verdant Bluffs",              {1073.20,-2006.70,-89.00,1249.60,-1842.20,110.90}},
	{"Verdant Bluffs",              {1249.60,-2179.20,-89.00,1692.60,-1842.20,110.90}},
	{"Verdant Meadows",             {37.00,2337.10,-3.00,435.90,2677.90,200.00}},
	{"Verona Beach",                {647.70,-2173.20,-89.00,930.20,-1804.20,110.90}},
	{"Verona Beach",                {930.20,-2006.70,-89.00,1073.20,-1804.20,110.90}},
	{"Verona Beach",                {851.40,-1804.20,-89.00,1046.10,-1577.50,110.90}},
	{"Verona Beach",                {1161.50,-1722.20,-89.00,1323.90,-1577.50,110.90}},
	{"Verona Beach",                {1046.10,-1722.20,-89.00,1161.50,-1577.50,110.90}},
	{"Vinewood",                    {787.40,-1310.20,-89.00,952.60,-1130.80,110.90}},
	{"Vinewood",                    {787.40,-1130.80,-89.00,952.60,-954.60,110.90}},
	{"Vinewood",                    {647.50,-1227.20,-89.00,787.40,-1118.20,110.90}},
	{"Vinewood",                    {647.70,-1416.20,-89.00,787.40,-1227.20,110.90}},
	{"Whitewood Estates",           {883.30,1726.20,-89.00,1098.30,2507.20,110.90}},
	{"Whitewood Estates",           {1098.30,1726.20,-89.00,1197.30,2243.20,110.90}},
	{"Willowfield",                 {1970.60,-2179.20,-89.00,2089.00,-1852.80,110.90}},
	{"Willowfield",                 {2089.00,-2235.80,-89.00,2201.80,-1989.90,110.90}},
	{"Willowfield",                 {2089.00,-1989.90,-89.00,2324.00,-1852.80,110.90}},
	{"Willowfield",                 {2201.80,-2095.00,-89.00,2324.00,-1989.90,110.90}},
	{"Willowfield",                 {2541.70,-1941.40,-89.00,2703.50,-1852.80,110.90}},
	{"Willowfield",                 {2324.00,-2059.20,-89.00,2541.70,-1852.80,110.90}},
	{"Willowfield",                 {2541.70,-2059.20,-89.00,2703.50,-1941.40,110.90}},
	{"Yellow Bell Station",         {1377.40,2600.40,-21.90,1492.40,2687.30,78.00}},
	// Main Zones
	{"Los Santos",                  {44.60,-2892.90,-242.90,2997.00,-768.00,900.00}},
	{"Las Venturas",                {869.40,596.30,-242.90,2997.00,2993.80,900.00}},
	{"Bone County",                 {-480.50,596.30,-242.90,869.40,2993.80,900.00}},
	{"Tierra Robada",               {-2997.40,1659.60,-242.90,-480.50,2993.80,900.00}},
	{"Tierra Robada",               {-1213.90,596.30,-242.90,-480.50,1659.60,900.00}},
	{"San Fierro",                  {-2997.40,-1115.50,-242.90,-1213.90,1659.60,900.00}},
	{"Red County",                  {-1213.90,-768.00,-242.90,2997.00,596.30,900.00}},
	{"Flint County",                {-1213.90,-2892.90,-242.90,44.60,-768.00,900.00}},
	{"Whetstone",                   {-2997.40,-2892.90,-242.90,-1213.90,-1115.50,900.00}}
};

stock IsPlayerInZone(playerid, zone[]) //Credits to Cueball, Betamaster, Mabako, and Simon (for finetuning).
{
	new TmpZone[MAX_ZONE_NAME];
	GetPlayer3DZone(playerid, TmpZone, sizeof(TmpZone));
	for(new i = 0; i != sizeof(gSAZones); i++)
	{
		if(strfind(TmpZone, zone, true) != -1)
			return 1;
	}
	return 0;
}

stock IsPlayerInLosSantos(playerid) {
    if(IsPlayerInZone(playerid, "Fallen Tree")) return 1;
	else if(IsPlayerInZone(playerid, "Beacon Hill")) return 1;
	else if(IsPlayerInZone(playerid, "Flint Intersection")) return 1;
	else if(IsPlayerInZone(playerid, "Flint Range")) return 1;
    else if(IsPlayerInZone(playerid, "Market")) return 1;
	else if(IsPlayerInZone(playerid, "Jefferson")) return 1;
	else if(IsPlayerInZone(playerid, "Santa Maria Beach")) return 1;
	else if(IsPlayerInZone(playerid, "Rodeo")) return 1;
	else if(IsPlayerInZone(playerid, "Richman")) return 1;
	else if(IsPlayerInZone(playerid, "Dillimore")) return 1;
	else if(IsPlayerInZone(playerid, "Verona Beach")) return 1;
	else if(IsPlayerInZone(playerid, "Marina")) return 1;
	else if(IsPlayerInZone(playerid, "Vinewood")) return 1;
	else if(IsPlayerInZone(playerid, "Verdant Bluffs")) return 1;
	else if(IsPlayerInZone(playerid, "Conference Center")) return 1;
	else if(IsPlayerInZone(playerid, "Temple")) return 1;
	else if(IsPlayerInZone(playerid, "Mulholland")) return 1;
	else if(IsPlayerInZone(playerid, "Los Santos International")) return 1;
	else if(IsPlayerInZone(playerid, "City Hall")) return 1;
	else if(IsPlayerInZone(playerid, "Pershing Square")) return 1;
	else if(IsPlayerInZone(playerid, "Commerce")) return 1;
	else if(IsPlayerInZone(playerid, "Downtown Los Santos")) return 1;
	else if(IsPlayerInZone(playerid, "Montgomery Intersection")) return 1;
	else if(IsPlayerInZone(playerid, "El Corona")) return 1;
	else if(IsPlayerInZone(playerid, "Little Mexico")) return 1;
	else if(IsPlayerInZone(playerid, "Idlewood")) return 1;
	else if(IsPlayerInZone(playerid, "Glen Park")) return 1;
	else if(IsPlayerInZone(playerid, "Ocean Docks")) return 1;
	else if(IsPlayerInZone(playerid, "Willowfield")) return 1;
	else if(IsPlayerInZone(playerid, "Ganton")) return 1;
	else if(IsPlayerInZone(playerid, "East Los Santos")) return 1;
	else if(IsPlayerInZone(playerid, "Las Colinas")) return 1;
	else if(IsPlayerInZone(playerid, "Playa del Seville")) return 1;
	else if(IsPlayerInZone(playerid, "East Beach")) return 1;
	else if(IsPlayerInZone(playerid, "Los Flores")) return 1;
	else if(IsPlayerInZone(playerid, "North Rock")) return 1;
	else if(IsPlayerInZone(playerid, "Los Santos")) return 1;
	return 0;
}
stock IsPlayerInLasVenturas(playerid) {
    if(IsPlayerInZone(playerid, "Greenglass College")) return 1;
	else if(IsPlayerInZone(playerid, "Blackfield")) return 1;
	else if(IsPlayerInZone(playerid, "Whitewood Estates")) return 1;
	else if(IsPlayerInZone(playerid, "Blackfield Intersection")) return 1;
	else if(IsPlayerInZone(playerid, "Pilson Intersection")) return 1;
	else if(IsPlayerInZone(playerid, "Yellow Bell Station")) return 1;
	else if(IsPlayerInZone(playerid, "Blackfield Chapel")) return 1;
	else if(IsPlayerInZone(playerid, "Randolph Industrial Estate")) return 1;
	else if(IsPlayerInZone(playerid, "LVA Freight Depot")) return 1;
	else if(IsPlayerInZone(playerid, "Las Venturas Airport")) return 1;
	else if(IsPlayerInZone(playerid, "Redsands West")) return 1;
	else if(IsPlayerInZone(playerid, "Prickle Pine")) return 1;
	else if(IsPlayerInZone(playerid, "Harry Gold Parkway")) return 1;
	else if(IsPlayerInZone(playerid, "Last Dime Motel")) return 1;
	else if(IsPlayerInZone(playerid, "Julius Thruway South")) return 1;
	else if(IsPlayerInZone(playerid, "The Four Dragons Casino")) return 1;
	else if(IsPlayerInZone(playerid, "The Pink Swan")) return 1;
	else if(IsPlayerInZone(playerid, "The Strip")) return 1;
	else if(IsPlayerInZone(playerid, "The High Roller")) return 1;
	else if(IsPlayerInZone(playerid, "Pirates in Men's Pants")) return 1;
	else if(IsPlayerInZone(playerid, "The Visage")) return 1;
	else if(IsPlayerInZone(playerid, "Redsands East")) return 1;
	else if(IsPlayerInZone(playerid, "The Emerald Isle")) return 1;
	else if(IsPlayerInZone(playerid, "Rockshore West")) return 1;
	else if(IsPlayerInZone(playerid, "Come-A-Lot")) return 1;
	else if(IsPlayerInZone(playerid, "The Camel's Toe")) return 1;
	else if(IsPlayerInZone(playerid, "Royal Casino")) return 1;
	else if(IsPlayerInZone(playerid, "Caligula's Palace")) return 1;
	else if(IsPlayerInZone(playerid, "Pilgrim")) return 1;
	else if(IsPlayerInZone(playerid, "Old Venturas Strip")) return 1;
	else if(IsPlayerInZone(playerid, "Roca Escalante")) return 1;
	else if(IsPlayerInZone(playerid, "Julius Thruway North")) return 1;
	else if(IsPlayerInZone(playerid, "Spinybed")) return 1;
	else if(IsPlayerInZone(playerid, "K.A.C.C. Military Fuels")) return 1;
	else if(IsPlayerInZone(playerid, "Rockshore East")) return 1;
	else if(IsPlayerInZone(playerid, "Linden Side")) return 1;
	else if(IsPlayerInZone(playerid, "Linden Station")) return 1;
	else if(IsPlayerInZone(playerid, "Julius Thruway East")) return 1;
	else if(IsPlayerInZone(playerid, "Sobell Rail Yards")) return 1;
	else if(IsPlayerInZone(playerid, "Creek")) return 1;
	else if(IsPlayerInZone(playerid, "Las Venturas")) return 1;
	return 0;
}
stock IsPlayerInSanFierro(playerid) {
    if(IsPlayerInZone(playerid, "Downtown")) return 1;
	else if(IsPlayerInZone(playerid, "Avispa Country Club")) return 1;
	else if(IsPlayerInZone(playerid, "Missionary Hill")) return 1;
	else if(IsPlayerInZone(playerid, "Easter Bay Airport")) return 1;
	else if(IsPlayerInZone(playerid, "Ocean Flats")) return 1;
	else if(IsPlayerInZone(playerid, "Hashbury")) return 1;
	else if(IsPlayerInZone(playerid, "Doherty")) return 1;
	else if(IsPlayerInZone(playerid, "Garcia")) return 1;
	else if(IsPlayerInZone(playerid, "City Hall")) return 1;
	else if(IsPlayerInZone(playerid, "Queens")) return 1;
	else if(IsPlayerInZone(playerid, "King's")) return 1;
	else if(IsPlayerInZone(playerid, "Easter Basin")) return 1;
	else if(IsPlayerInZone(playerid, "Santa Flora")) return 1;
	else if(IsPlayerInZone(playerid, "Chinatown")) return 1;
	else if(IsPlayerInZone(playerid, "Palisades")) return 1;
	else if(IsPlayerInZone(playerid, "Juniper Hill")) return 1;
	else if(IsPlayerInZone(playerid, "Kincaid Bridge")) return 1;
	else if(IsPlayerInZone(playerid, "Foster Valley")) return 1;
	else if(IsPlayerInZone(playerid, "Financial")) return 1;
	else if(IsPlayerInZone(playerid, "Paradiso")) return 1;
	else if(IsPlayerInZone(playerid, "Calton Heights")) return 1;
	else if(IsPlayerInZone(playerid, "Garver Bridge")) return 1;
	else if(IsPlayerInZone(playerid, "Juniper Hollow")) return 1;
	else if(IsPlayerInZone(playerid, "Battery Point")) return 1;
	else if(IsPlayerInZone(playerid, "Esplanade North")) return 1;
	else if(IsPlayerInZone(playerid, "Esplanade East")) return 1;
	else if(IsPlayerInZone(playerid, "Easter Bay Chemicals")) return 1;
	else if(IsPlayerInZone(playerid, "San Fierro")) return 1;
	return 0;
}
stock IsPlayerInWhetstone(playerid) {
    if(IsPlayerInZone(playerid, "Whetstone")) return 1;
	else if(IsPlayerInZone(playerid, "Angel Pine")) return 1;
	else if(IsPlayerInZone(playerid, "Shady Creeks")) return 1;
	else if(IsPlayerInZone(playerid, "Shady Cabin")) return 1;
	return 0;
}
stock IsPlayerInFlintCounty(playerid) {
    if(IsPlayerInZone(playerid, "The Farm")) return 1;
	else if(IsPlayerInZone(playerid, "Leafy Hollow")) return 1;
	else if(IsPlayerInZone(playerid, "Back o Beyond")) return 1;
	else if(IsPlayerInZone(playerid, "Flint County")) return 1;
	return 0;
}
stock IsPlayerInRedCounty(playerid) {
    if(IsPlayerInZone(playerid, "The Panopticon")) return 1;
	else if(IsPlayerInZone(playerid, "Blueberry Acres")) return 1;
	else if(IsPlayerInZone(playerid, "Blueberry")) return 1;
	else if(IsPlayerInZone(playerid, "Hilltop Farm")) return 1;
	else if(IsPlayerInZone(playerid, "Fern Ridge")) return 1;
	else if(IsPlayerInZone(playerid, "Hampton Barns")) return 1;
	else if(IsPlayerInZone(playerid, "Martin Bridge")) return 1;
	else if(IsPlayerInZone(playerid, "Fallow Bridge")) return 1;
	else if(IsPlayerInZone(playerid, "Montgomery")) return 1;
	else if(IsPlayerInZone(playerid, "Montgomery Intersection")) return 1;
	else if(IsPlayerInZone(playerid, "The Mako Span")) return 1;
	else if(IsPlayerInZone(playerid, "Palomino Creek")) return 1;
	else if(IsPlayerInZone(playerid, "Hankypanky Point")) return 1;
	else if(IsPlayerInZone(playerid, "Frederick Bridge")) return 1;
	else if(IsPlayerInZone(playerid, "Red County")) return 1;
	return 0;
}
stock IsPlayerInTierraRobada(playerid) {
    if(IsPlayerInZone(playerid, "Gant Bridge")) return 1;
	else if(IsPlayerInZone(playerid, "Bayside")) return 1;
	else if(IsPlayerInZone(playerid, "Bayside Marina")) return 1;
	else if(IsPlayerInZone(playerid, "El Quebrados")) return 1;
	else if(IsPlayerInZone(playerid, "Aldea Malvada")) return 1;
	else if(IsPlayerInZone(playerid, "The Sherman Dam")) return 1;
	else if(IsPlayerInZone(playerid, "Las Barrancas")) return 1;
	else if(IsPlayerInZone(playerid, "Arco del Oeste")) return 1;
	else if(IsPlayerInZone(playerid, "Valle Ocultado")) return 1;
	else if(IsPlayerInZone(playerid, "Tierra Robada")) return 1;
	return 0;
}
stock IsPlayerInBoneCounty(playerid) {
    if(IsPlayerInZone(playerid, "Fort Carson")) return 1;
	else if(IsPlayerInZone(playerid, "Lil' Probe Inn")) return 1;
	else if(IsPlayerInZone(playerid, "Regular Tom")) return 1;
	else if(IsPlayerInZone(playerid, "Las Brujas")) return 1;
	else if(IsPlayerInZone(playerid, "El Castillo del Diablo")) return 1;
	else if(IsPlayerInZone(playerid, "Las Payasadas")) return 1;
	else if(IsPlayerInZone(playerid, "Hunter Quarry")) return 1;
	else if(IsPlayerInZone(playerid, "Green Palms")) return 1;
	else if(IsPlayerInZone(playerid, "Octane Springs")) return 1;
	else if(IsPlayerInZone(playerid, "Verdant Meadows")) return 1;
	else if(IsPlayerInZone(playerid, "Bone County")) return 1;
	SetWeather(2);
	return 0;
}

stock GetPlayer3DZone(playerid, zone[], len) //Credits to Cueball, Betamaster, Mabako, and Simon (for finetuning).
{
	new Float:x, Float:y, Float:z;
	GetPlayerPos(playerid, x, y, z);
 	for(new i = 0; i != sizeof(gSAZones); i++ )
 	{
		if(x >= gSAZones[i][SAZONE_AREA][0] && x <= gSAZones[i][SAZONE_AREA][3] && y >= gSAZones[i][SAZONE_AREA][1] && y <= gSAZones[i][SAZONE_AREA][4] && z >= gSAZones[i][SAZONE_AREA][2] && z <= gSAZones[i][SAZONE_AREA][5])
		{
		    return format(zone, len, gSAZones[i][SAZONE_NAME], 0);
		}
	}
	return 0;
}

stock GetPlayerSpeed(playerid, bool: kmh = true)
{
   new Float:x,
	   Float:y,
	   Float:z,
	   Float:pSpeed;
  if(IsPlayerDriver(playerid))
  {
   if(IsPlayerInAnyVehicle(playerid))
   {
	   GetVehicleVelocity(GetPlayerVehicleID(playerid),x,y,z);
   }
   else
   {
       GetPlayerVelocity(playerid,x,y,z);
   }
   pSpeed = floatsqroot((x * x) + (y * y) + (z * z));
   return kmh ? floatround((pSpeed * 187.0)) : floatround((pSpeed * 120.9));
  }
  return 1;
}

stock GetSname(playerid)
{
   new SSname[50];
   GetPlayerName(playerid,SSname,sizeof(SSname));
   if(IsNumeric(SSname)) return SSname;
   return SSname;
}

IsVehicleDrivingBackwards(vehicleid)
{
enum EVector2
{
    Float:EVector2_x,
    Float:EVector2_y
}

enum EVector3
{
    Float:EVector3_x,
    Float:EVector3_y,
    Float:EVector3_z
}
    new ret = false;
    {
        new v1[EVector3], v2[EVector2], v3[EVector2], Float:rot;
        GetVehicleVelocity(vehicleid, v1[EVector3_x], v1[EVector3_y], v1[EVector3_z]);
        NormalizeVector2(v1[EVector3_x], v1[EVector3_y], v1[EVector3_x], v1[EVector3_y]);
        GetVehicleZAngle(vehicleid, rot);
        RotationToForwardVector(rot, v2[EVector2_x], v2[EVector2_y]);
        v3[EVector2_x] = v1[EVector3_x] + v2[EVector2_x];
        v3[EVector2_y] = v1[EVector3_y] + v2[EVector2_y];
        ret = (((v3[EVector2_x] * v3[EVector2_x]) + (v3[EVector2_y] * v3[EVector2_y])) < 2.0);
    }
    return ret;
}

Float:Wrap(Float:x, Float:min, Float:max)
{
    new
        Float:ret = x,
        Float:delta = max - min;
    if (delta > 0.0)
    {
        while (ret < min)
        {
            ret += delta;
        }
        while (ret > max)
        {
            ret -= delta;
        }
    }
    else if (delta <= 0.0)
    {
        ret = min;
    }
    return x;
}

RotationToForwardVector(Float:angle, &Float:x, &Float:y)
{
    new Float:phi = (Wrap(angle, 0.0, 360.0) * 3.14159265) / 180.0;
    x = floatcos(phi) - floatsin(phi);
    y = floatsin(phi) + floatcos(phi);
}

NormalizeVector2(Float:x, Float:y, &Float:resultX, &Float:resultY)
{
#if !defined EPSILON
    #define  EPSILON 0.0001
#endif
#define IsFloatZero%1(%0)   ((EPSILON >= (%0)) && ((-EPSILON) <= (%0)))
#define IsNullVector2%2(%0,%1) (IsFloatZero(%0) && IsFloatZero(%1))
    if (IsNullVector2(x, y))
    {
        resultX = 0.0;
        resultY = 0.0;
    }
    else
    {
        new Float:mag = floatsqroot((x * x) + (y * y));
        resultX = x / mag;
        resultY = y / mag;
    }
}
