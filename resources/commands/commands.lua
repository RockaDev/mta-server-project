function auto (thePlayer, commandName, ID) 
    x,y,z = getElementPosition(thePlayer) 
    veh = createVehicle(ID,x,y,z) 
    warpPedIntoVehicle(thePlayer,veh) 
    end 
    addCommandHandler("auto",auto )

function repair(thePlayer,commandName, ID)
    repairVehicle(ID)
    end
    addCommandHandler("repair",repair)

function tp(thePlayer,commandName,x,y,z)
    setElementPosition(thePlayer,x,y,z)
end
addCommandHandler("tp",tp)

function tpme(thePlayer,commandName,place)
    local BlueberryAcress = "BBA"
    if (place) == BlueberryAcress then 
        setElementPosition(thePlayer,0,0,5) 
    end
end
addCommandHandler("place",tpme)

function repairVehicle ( thePlayer, commandName)
    if ( isPedInVehicle ( thePlayer ) ) then 
        local theVehicle = getPedOccupiedVehicle ( thePlayer) 
        local succes = fixVehicle ( theVehicle ) 
        if ( succes ) then 
            outputChatBox (" Vehicle fixed. ", thePlayer,0,255,0,true) 
        else 
            outputChatBox ( "Failed to fix your vehicle.", thePlayer) 
        end 
    else 
        outputChatBox ( "You must be in a vehicle!", thePlayer,255,0,0,true) 
    end 
end 
addCommandHandler ( "fixcar", repairVehicle) 

function getposition(thePlayer,commandName)
    local getpos = getElementPosition(thePlayer)
    outputChatBox(getpos,thePlayer)
end
addCommandHandler("position",getposition)


function heal(thePlayer,commandName)
    setElementHealth(thePlayer,100)
    outputChatBox("You got healed.",thePlayer)
end
addCommandHandler("heal",heal)

function spawnPlayer(thePlayer,commandName)
    spawnPlayer(thePlayer,0,0,5)
    fadeCamera(thePlayer, true, 5)
    setCameraTarget(thePlayer,thePlayer)
    outputChatBox("You got revived.",thePlayer)
end
addCommandHandler("revive",spawnPlayer)


