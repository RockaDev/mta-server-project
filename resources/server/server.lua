
local vehTimers = { }; 
setTimer( 
    function ( ) 
        for _, vehicle in ipairs ( getElementsByType ( "vehicle" ) ) do 
            if getElementHealth(vehicle) < 260 then 
                setElementHealth( vehicle, 250 );
                if not vehTimers[ vehicle ] then
                    setVehicleDamageProof( vehicle, true)
                    vehTimers[ vehicle ] = setTimer( blowVehicle, 300000, 1, vehicle);
                end 
            elseif vehTimers[ vehicle ] and isTimer( vehTimers[ vehicle ] ) then
                setVehicleDamageProof( vehicle, false)
                killTimer( vehTimers[ vehicle ] );
                vehTimers[ vehicle ] = nil;
            end 
        end 
    end,1000, 0 
)

function listPlayers()
    for _,player in ipairs(getElementsByType("player")) do 
        outputChatBox(_ .. " " .. getPlayerName(player))
    end
end
addCommandHandler("allplayers",listPlayers)

------------------TELEPORTS-------------------------

function teleportationMG()
    setElementPosition(client,1369.4052734375, 272.091796875, 19.42813873291)
end
addEvent("MontgomeryTP",true)
addEventHandler("MontgomeryTP",getRootElement(),teleportationMG)

function teleportationBB()
    setElementPosition(client,327.9677734375, -65.3466796875, 1.4466429948807)
end
addEvent("BlueberryTP",true)
addEventHandler("BlueberryTP",getRootElement(),teleportationBB)

function teleportationPal()
    setElementPosition(client,2284.5, 33.623046875, 26.484375)
end
addEvent("PalominoTP",true)
addEventHandler("PalominoTP",getRootElement(),teleportationPal)

function teleportationSpawn()
    setElementPosition(client,0,0,5)
end
addEvent("SpawnTP",true)
addEventHandler("SpawnTP",getRootElement(),teleportationSpawn)


function vhandling ( theVehicle )
    if getElementModel(theVehicle) == 477 then -------------- vehicle Id
        setVehicleHandling(theVehicle, "mass", 1800.0)
        setVehicleHandling(theVehicle, "turnMass", 1800.0)
        setVehicleHandling(theVehicle, "dragCoeff", 1.0 )
        setVehicleHandling(theVehicle, "centerOfMass", { 0.0,0.08,-0.09 } )
        setVehicleHandling(theVehicle, "percentSubmerged", 103)
        setVehicleHandling(theVehicle, "tractionMultiplier", 1.0)
        setVehicleHandling(theVehicle, "tractionLoss", 0.7)
        setVehicleHandling(theVehicle, "tractionBias", 0.50)
        setVehicleHandling(theVehicle, "numberOfGears", 4)
        setVehicleHandling(theVehicle, "maxVelocity", 210.0)
        setVehicleHandling(theVehicle, "engineAcceleration", 23.0 )
        setVehicleHandling(theVehicle, "engineInertia", 5.0)
        setVehicleHandling(theVehicle, "driveType", "rwd")
        setVehicleHandling(theVehicle, "engineType", "petrol")
        setVehicleHandling(theVehicle, "brakeDeceleration", 25.0)
        setVehicleHandling(theVehicle, "brakeBias", 0.60)
        -----abs----
        setVehicleHandling(theVehicle, "steeringLock",  35.0 )
        setVehicleHandling(theVehicle, "suspensionForceLevel", 0.85)
        setVehicleHandling(theVehicle, "suspensionDamping", 0.15 )
        setVehicleHandling(theVehicle, "suspensionHighSpeedDamping", 0.0)
        setVehicleHandling(theVehicle, "suspensionUpperLimit", 0.15 )
        setVehicleHandling(theVehicle, "suspensionLowerLimit", -0.16)
        setVehicleHandling(theVehicle, "suspensionFrontRearBias", 0.5 )
        setVehicleHandling(theVehicle, "suspensionAntiDiveMultiplier", 0.0)
        setVehicleHandling(theVehicle, "seatOffsetDistance", 0.0)
        setVehicleHandling(theVehicle, "collisionDamageMultiplier", 0.00)
        --setVehicleHandling(theVehicle, "monetary",  10000) This one is disabled for now
        setVehicleHandling(theVehicle, "modelFlags", 1002000)
        setVehicleHandling(theVehicle, "handlingFlags", 1000002)
        --setVehicleHandling(theVehicle, "headLight", 3) This one is disabled for now
        --setVehicleHandling(theVehicle, "tailLight", 2) This one is disabled for now
        --setVehicleHandling(theVehicle, "animGroup", 4) This one is disabled for now
    end
    if getElementModel(theVehicle) == 559 then -------------- vehicle Id
        setVehicleHandling(theVehicle, "mass", 1600.0)
        setVehicleHandling(theVehicle, "turnMass", 1600.0)
        setVehicleHandling(theVehicle, "dragCoeff", 0.5 )
        setVehicleHandling(theVehicle, "centerOfMass", { 0.0,0.08,-0.09 } )
        setVehicleHandling(theVehicle, "percentSubmerged", 70)

        setVehicleHandling(theVehicle, "tractionBias", 0.50)
        setVehicleHandling(theVehicle, "numberOfGears", 1)
        setVehicleHandling(theVehicle, "maxVelocity", 270.0)
        setVehicleHandling(theVehicle, "engineAcceleration", 40.0 )
        setVehicleHandling(theVehicle, "engineInertia", 5.0)
        setVehicleHandling(theVehicle, "driveType", "rwd")
        setVehicleHandling(theVehicle, "engineType", "petrol")
        setVehicleHandling(theVehicle, "brakeDeceleration", 25.0)
        setVehicleHandling(theVehicle, "brakeBias", 0.60)
        -----abs----
        setVehicleHandling(theVehicle, "steeringLock",  35.0 )
        setVehicleHandling(theVehicle, "suspensionForceLevel", 0.85)
        setVehicleHandling(theVehicle, "suspensionDamping", 0.15 )
        setVehicleHandling(theVehicle, "suspensionHighSpeedDamping", 0.0)
        setVehicleHandling(theVehicle, "suspensionUpperLimit", 0.15 )
        setVehicleHandling(theVehicle, "suspensionLowerLimit", -0.16)
        setVehicleHandling(theVehicle, "suspensionFrontRearBias", 0.5 )
        setVehicleHandling(theVehicle, "suspensionAntiDiveMultiplier", 0.0)
        setVehicleHandling(theVehicle, "seatOffsetDistance", 0.0)
        setVehicleHandling(theVehicle, "collisionDamageMultiplier", 0.00)
        --setVehicleHandling(theVehicle, "monetary",  10000) This one is disabled for now
        setVehicleHandling(theVehicle, "modelFlags", 1002000)
        setVehicleHandling(theVehicle, "handlingFlags", 1000002)
        --setVehicleHandling(theVehicle, "headLight", 3) This one is disabled for now
        --setVehicleHandling(theVehicle, "tailLight", 2) This one is disabled for now
        --setVehicleHandling(theVehicle, "animGroup", 4) This one is disabled for now
    end
    if getElementModel(theVehicle) == 547 then -------------- vehicle Id
        setVehicleHandling(theVehicle, "mass", 1800.0)
        setVehicleHandling(theVehicle, "turnMass", 1800.0)
        setVehicleHandling(theVehicle, "dragCoeff", 4.0 )
        setVehicleHandling(theVehicle, "centerOfMass", { 0.0,0.08,-0.09 } )
        setVehicleHandling(theVehicle, "percentSubmerged", 103)
        setVehicleHandling(theVehicle, "tractionMultiplier", 1.5)
        setVehicleHandling(theVehicle, "tractionLoss", 0.8)
        setVehicleHandling(theVehicle, "tractionBias", 0.45)
        setVehicleHandling(theVehicle, "numberOfGears", 3)
        setVehicleHandling(theVehicle, "maxVelocity", 300.0)
        setVehicleHandling(theVehicle, "engineAcceleration", 60.0 )
        setVehicleHandling(theVehicle, "engineInertia", 5.0)
        setVehicleHandling(theVehicle, "driveType", "rwd")
        setVehicleHandling(theVehicle, "engineType", "petrol")
        setVehicleHandling(theVehicle, "brakeDeceleration", 20.0)
        setVehicleHandling(theVehicle, "brakeBias", 0.60)
        -----abs----
        setVehicleHandling(theVehicle, "steeringLock",  35.0 )
        setVehicleHandling(theVehicle, "suspensionForceLevel", 0.85)
        setVehicleHandling(theVehicle, "suspensionDamping", 0.15 )
        setVehicleHandling(theVehicle, "suspensionHighSpeedDamping", 0.0)
        setVehicleHandling(theVehicle, "suspensionUpperLimit", 0.15 )
        setVehicleHandling(theVehicle, "suspensionLowerLimit", -0.16)
        setVehicleHandling(theVehicle, "suspensionFrontRearBias", 0.5 )
        setVehicleHandling(theVehicle, "suspensionAntiDiveMultiplier", 0.0)
        setVehicleHandling(theVehicle, "seatOffsetDistance", 0.0)
        setVehicleHandling(theVehicle, "collisionDamageMultiplier", 0.00)
        --setVehicleHandling(theVehicle, "monetary",  10000) This one is disabled for now
        setVehicleHandling(theVehicle, "modelFlags", 1002000)
        setVehicleHandling(theVehicle, "handlingFlags", 1000002)
        --setVehicleHandling(theVehicle, "headLight", 3) This one is disabled for now
        --setVehicleHandling(theVehicle, "tailLight", 2) This one is disabled for now
        --setVehicleHandling(theVehicle, "animGroup", 4) This one is disabled for now
    end
end
addEventHandler ( "onPlayerVehicleEnter", getRootElement(), vhandling )