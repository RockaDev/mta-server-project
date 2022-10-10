
function healer(thePlayer,cmd)
    if ((getElementData(thePlayer, "adminRole") or 0) < 2) then
        outputChatBox("Nemáš oprávnění!", thePlayer, 255, 0, 0)
    else
        setElementHealth(thePlayer,100)
        outputChatBox("You got healed.",thePlayer)
    end
end
addCommandHandler("healer",healer)

function whoami(thePlayer,cmd)
    if ((getElementData(thePlayer, "adminRole") or 0) < 2) then
        outputChatBox("Nemáš oprávnění!", thePlayer, 255, 0, 0)
    else
        outputChatBox(getPlayerName(thePlayer),thePlayer,0,255,0,true)
    end
end
addCommandHandler("whoami",whoami)

function getplayerpos(thePlayer,cmd)
    if ((getElementData(thePlayer, "adminRole") or 0) < 2) then
        outputChatBox("Nemáš oprávnění!", thePlayer, 255, 0, 0)
    else
        local getpos = getElementPosition(thePlayer)
        outputChatBox(getpos,thePlayer)
    end
end
addCommandHandler("position",getplayerpos)

function vehiclefix(thePlayer,cmd)
    if ((getElementData(thePlayer, "adminRole") or 0) < 2) then
        outputChatBox("Nemáš oprávnění!", thePlayer, 255, 0, 0)
    else
        if ( isPedInVehicle ( thePlayer ) ) then 
            local theVehicle = getPedOccupiedVehicle ( thePlayer) 
            local succes = fixVehicle ( theVehicle ) 
            if ( succes ) then 
                outputChatBox (" Vehicle fixed. ", thePlayer,0,255,0,true,false) 
            else 
                outputChatBox ( "Failed to fix your vehicle.", thePlayer) 
            end 
        else 
            outputChatBox ( "You must be in a vehicle!", thePlayer,255,0,0,true,false) 
        end 
    end 
end
addCommandHandler("fixcar",vehiclefix)

function teleportPlayerToPos(thePlayer,cmd,x,y,z)
    if ((getElementData(thePlayer, "adminRole") or 0) < 2) then
        outputChatBox("Nemáš oprávnění!", thePlayer, 255, 0, 0)
    else
        setElementPosition(thePlayer,x,y,z)
    end
end
addCommandHandler("tp",teleportPlayerToPos)

    function carspawner(thePlayer,cmd,ID)
        local ID = tonumber(ID)
        if ((getElementData(thePlayer, "adminRole") or 0) < 2) then
            outputChatBox("Nemáš oprávnění!", thePlayer, 255, 0, 0)
        else
            x,y,z = getElementPosition(thePlayer) 
            local veh = createVehicle(ID,x,y,z) 
            warpPedIntoVehicle(thePlayer,veh) 
        end
    end
    addCommandHandler("auto",carspawner)

    addCommandHandler("setmyspeed",
    function (thePlayer, cmd, arg1)
      local veh = getPedOccupiedVehicle(thePlayer)
      if (veh) then
        setElementSpeed(veh, "km/h", tonumber(arg1))
      else
        outputChatBox("You have to sit in vehicle", thePlayer)
      end
    end
    )



    function consoleGive ( thePlayer, commandName, weaponID, ammo )
        local status = giveWeapon ( thePlayer, weaponID, ammo, true )   -- attempt to give the weapon, forcing it as selected weapon
        if ( not status ) then                                          -- if it was unsuccessful
            outputConsole ( "Failed to give weapon.", thePlayer )   -- tell the player
        end
    end
    addCommandHandler ( "give", consoleGive )
