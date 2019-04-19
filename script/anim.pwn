#define FILTERSCRIPT

#include <a_samp>
#include <sscanf2>
#include <izcmd> //zcmd or izcmd

public OnFilterScriptInt()
{
    print("JG Copas");
    print("Loaded");
    return 1;
}

public OnFilterScriptExit()
{
    print("JG Copas");
    print("Unloaded");
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
    if ((newkeys & KEY_FIRE) && !(oldkeys & KEY_FIRE))
        return ClearAnimation(playerid);
        
    return 1;
}

CMD:anim(playerid, command[])
{
    new 
        szAnimLib[32], 
        szAnimName[32],
        szAnimIndex;
        
    if(sscanf(command, "d", szAnimIndex))
        return SendClientMessage(playerid, 0xFFFFFFAA, "/anim [0 - 1812]");
    
    GetAnimationName(szAnimIndex, szAnimLib, 32, szAnimName, 32);
    ApplyAnimation(playerid, szAnimLib, szAnimName, 4.1, 1, 1, 1, 0, 0, 1);
    return 1;
}
