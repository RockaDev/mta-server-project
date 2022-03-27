
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
