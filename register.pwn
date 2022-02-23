#include <a_samp>
#include <Dini>

/*
 Script made by Daniel Andreev
 Script name: Ñèñòåìà çà ðåãèñòðàöèÿ è âõîä
*/

#define DIALOG_LOGIN 0
#define DIALOG_REGISTER 1
#define COLOR_RED 0xFF000FF
#define COLOR_WHITE 0xFFFFFFFF

new bool: isLogged[MAX_PLAYERS] = false;

enum pInfo
{
	pAdmin,
	pVip,
	pPassword[256],
	pCash
}
new PlayerInfo[MAX_PLAYERS][pInfo];

main()
{
		printf("\n· Ñêðèïòúò ñå ïóñíà óñïåøíî.");
		printf("·Made by Daniel Andreev\n\n");
}

stock ResetPlayerVariables(playerid)
{
isLogged[playerid] = false;
PlayerInfo[playerid][pVip]=0;
PlayerInfo[playerid][pCash]=0;
PlayerInfo[playerid][pAdmin]=0;
}

stock GivePlayerCash(playerid, cash)
{
PlayerInfo[playerid][pCash] = cash;
ResetPlayerMoney(playerid);
GivePlayerMoney(playerid,PlayerInfo[playerid][pCash]);
}

LoadAccount(playerid)
{
    new accountFileNickname[256];
    new accountNickname[MAX_PLAYER_NAME];
    GetPlayerName(playerid, accountNickname, 25);
    format(accountFileNickname, 256, "%s.ini", accountNickname);
    PlayerInfo[playerid][pAdmin]= dini_Int(accountFileNickname,"pAdmin");
    PlayerInfo[playerid][pVip]= dini_Int(accountFileNickname,"pVip");
    PlayerInfo[playerid][pCash]= dini_Int(accountFileNickname,"pCash");
    GivePlayerCash(playerid, 0); //Èçïîëçâàì âå÷å ñúçäàäåíà ôóíêöèÿ çà äàâàíå íà ïàðè. Ñëîæèõ 0, ïîíåæå ñàìî äàâà òåêóùèòå ïàðè!
}

public OnGameModeInit()
{
	SetGameModeText("Server With Register System");
	AddPlayerClass(0, 1958.3783, 1343.1572, 15.3746, 269.1425, 0, 0, 0, 0, 0, 0);
	return 1;
}

public OnGameModeExit()
{
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
	SetPlayerPos(playerid, 1958.3783, 1343.1572, 15.3746);
	SetPlayerCameraPos(playerid, 1958.3783, 1343.1572, 15.3746);
	SetPlayerCameraLookAt(playerid, 1958.3783, 1343.1572, 15.3746);
	return 1;
}

public OnPlayerConnect(playerid)
{
	ResetPlayerVariables(playerid);
    new accountFileNickname[256];
    new accountNickname[MAX_PLAYER_NAME];
    GetPlayerName(playerid, accountNickname, 25);
    format(accountFileNickname, 256, "%s.ini", accountNickname);
	if(!dini_Exists(accountFileNickname))
	{
	new string256[256];
	format(string256,256,"{FFFFFF}Äîáðå äîøëè â {FFFF00}Server Name\n\n{FFFFFF}Èìå: {33AA33}%s\n{FFFFFF}Ñòàòóñ: {FF0000}Íå ðåãèñòðèðàí\n\n{FFFFFF}Ìîëÿ, íàïèøåòå ñ êàêâà ïàðîëà èñêàòå äà ðåãèñòðèðàòå ïðîôèëà ñè.",accountNickname);
	ShowPlayerDialog(playerid,DIALOG_REGISTER,DIALOG_STYLE_PASSWORD,"Ðåãèñòðàöèÿ â ñúðâúðà",string256,"Ðåãèñòðèðàé","Èçëåç");
	}
	else
	{
	new string256[256];
	format(string256,256,"{FFFFFF}Äîáðå äîøëè â {FFFF00}Server Name\n\n{FFFFFF}Èìå: {33AA33}%s\n{FFFFFF}Ñòàòóñ: {33AA33}Ðåãèñòðèðàí\n\n{FFFFFF}Ìîëÿ, íàïèøåòå ïàðîëàòà ñ êîÿòî ñòå ðåãèñòðèðàí.",accountNickname);
	ShowPlayerDialog(playerid,DIALOG_LOGIN,DIALOG_STYLE_PASSWORD,"Âõîä â ñúðâúðà",string256,"Âëåç","Èçëåç");
	}
	TogglePlayerSpectating(playerid, true);
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	return 1;
}

public OnPlayerSpawn(playerid)
{
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
	return 1;
}

public OnVehicleSpawn(vehicleid)
{
	return 1;
}

public OnVehicleDeath(vehicleid, killerid)
{
	return 1;
}

public OnPlayerText(playerid, text[])
{
	return 1;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
	return 0;
}

public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	return 1;
}

public OnPlayerExitVehicle(playerid, vehicleid)
{
	return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
	return 1;
}

public OnPlayerEnterCheckpoint(playerid)
{
	return 1;
}

public OnPlayerLeaveCheckpoint(playerid)
{
	return 1;
}

public OnPlayerEnterRaceCheckpoint(playerid)
{
	return 1;
}

public OnPlayerLeaveRaceCheckpoint(playerid)
{
	return 1;
}

public OnRconCommand(cmd[])
{
	return 1;
}

public OnPlayerRequestSpawn(playerid)
{
	return 1;
}

public OnObjectMoved(objectid)
{
	return 1;
}

public OnPlayerObjectMoved(playerid, objectid)
{
	return 1;
}

public OnPlayerPickUpPickup(playerid, pickupid)
{
	return 1;
}

public OnVehicleMod(playerid, vehicleid, componentid)
{
	return 1;
}

public OnVehiclePaintjob(playerid, vehicleid, paintjobid)
{
	return 1;
}

public OnVehicleRespray(playerid, vehicleid, color1, color2)
{
	return 1;
}

public OnPlayerSelectedMenuRow(playerid, row)
{
	return 1;
}

public OnPlayerExitedMenu(playerid)
{
	return 1;
}

public OnPlayerInteriorChange(playerid, newinteriorid, oldinteriorid)
{
	return 1;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	return 1;
}

public OnRconLoginAttempt(ip[], password[], success)
{
	return 1;
}

public OnPlayerUpdate(playerid)
{
	return 1;
}

public OnPlayerStreamIn(playerid, forplayerid)
{
	return 1;
}

public OnPlayerStreamOut(playerid, forplayerid)
{
	return 1;
}

public OnVehicleStreamIn(vehicleid, forplayerid)
{
	return 1;
}

public OnVehicleStreamOut(vehicleid, forplayerid)
{
	return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	//Register panel response
	if(dialogid==DIALOG_REGISTER)
	{
	if(!response){
	SendClientMessage(playerid,COLOR_RED,"Ñúðâúð: Âèå ïîæåëàõòå äà íàïóñíåòå ñúðâúðà.");
	Kick(playerid);
	return 1;
	}
	if(strlen(inputtext)<4 || strlen(inputtext)>20)
    {
    SendClientMessage(playerid,COLOR_WHITE,"Ñúðâúð: Ïàðîëàòà òðÿáâà äà ñúäúðæà ìåæäó 4 è 20 ñèìâîëà");
    new string256[256];
	format(string256,256,"{F0F0F0}Ïðîôèëúò âè âñå îùå íå å ðåãèñòðèðàí.\nÂúâåäåòå ïàðîëàòà ñè îòäîëó");
	ShowPlayerDialog(playerid,DIALOG_REGISTER,DIALOG_STYLE_PASSWORD,"Ðåãèñòðàöèÿ:",string256,"Ðåãèñòðèðàé","Èçëåç");
    return 1;
    }
    new accountFileNickname[256];
    new accountNickname[MAX_PLAYER_NAME];
    new string256[256];
    format(string256,256,"Âèå óñïåøíî ðåãèñòðèðàõòå {33aa33}%s{ffffff}. Äîáðå äîøëè â {33aa33}Server Name",accountNickname);
	SendClientMessage(playerid,COLOR_WHITE,string256);
	SendClientMessage(playerid,COLOR_WHITE,"");
	TogglePlayerSpectating(playerid, false);
	isLogged[playerid]=true;
    GetPlayerName(playerid, accountNickname, 25);
    format(accountFileNickname, 256, "%s.ini", accountNickname);
	dini_Create(accountFileNickname);
    dini_Set(accountFileNickname, "pPassword", inputtext);
    format(PlayerInfo[playerid][pPassword],256,inputtext);
    GivePlayerCash(playerid,250);
	}
	//Login panel response
    if(dialogid==DIALOG_LOGIN)
	{
	if(!response){
	SendClientMessage(playerid,COLOR_RED,"Ñúðâúð: Âèå ïîæåëàõòå äà íàïóñíåòå ñúðâúðà.");
	Kick(playerid);
	return 1;
	}
	if(strlen(inputtext)<4 || strlen(inputtext)>20)
    {
    SendClientMessage(playerid,COLOR_WHITE,"Ñúðâúð: Ïàðîëèòå òóê ñúäúðæàò ìåæäó 4 è 20 ñèìâîëà.");
    new string256[256];
	format(string256,256,"{F0F0F0}Ïðîôèëúò âè å ðåãèñòðèðàí, íî âèå âñå îùå íå ñòå â íåãî.\nÂúâåäåòå ïàðîëàòà ñè îòäîëó çà äà âëåçåòå");
	ShowPlayerDialog(playerid,DIALOG_LOGIN,DIALOG_STYLE_PASSWORD,"Âõîä:",string256,"Âëåç","Èçëåç");
    return 1;
    }
    new accountFileNickname[256];
    new accountNickname[MAX_PLAYER_NAME];
    GetPlayerName(playerid, accountNickname, 25);
    format(accountFileNickname, 256, "%s.ini", accountNickname);
    new password[25];
    format(password, 25, "%s", dini_Get(accountFileNickname, "pPassword"));
    if(strcmp(inputtext, password)==0)
    {
    new string256[256];
    format(string256,256,"Âèå óñïåøíî {33AA33}âëÿçîõòå {ffffff}, êàòî {33AA33}%s",accountNickname);
	SendClientMessage(playerid,COLOR_WHITE,string256);
	LoadAccount(playerid);
	TogglePlayerSpectating(playerid, false);
	isLogged[playerid]=true;
    }
    else
	{
    new string256[256];
	format(string256,256,"Ñúðâúð: Âúâåäåíàòà ïàðîëà å íåâàëèäíà!");
	SendClientMessage(playerid,COLOR_RED,string256);
	format(string256,256,"{F0F0F0}Ïðîôèëúò âè å ðåãèñòðèðàí, íî âèå âñå îùå íå ñòå â íåãî.\nÂúâåäåòå ïàðîëàòà ñè îòäîëó çà äà âëåçåòå");
	ShowPlayerDialog(playerid,DIALOG_LOGIN,DIALOG_STYLE_PASSWORD,"Âõîä:",string256,"Âëåç","Èçëåç");
	}
	}
	return 1;
}

public OnPlayerClickPlayer(playerid, clickedplayerid, source)
{
	return 1;
}
