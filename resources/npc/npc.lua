peds = { 
    {115, "John", 1, 1, 3, 180},
    {111, "Ledek", 3, 3, 3, 180} 
    } 
      
for k,v in ipairs(peds) do 
    ped = createPed(v[1], v[3], v[4], v[5]) 
    setElementRotation(ped, 0, 0, v[6]) 
    setElementData(ped, "name", v[2], true)
end

function skylineChosen()
    skylineR34 = createVehicle(562,4,4,3) 
end
addEvent("SkylineGTR",true)
addEventHandler("SkylineGTR",getRootElement(),skylineChosen)

function fastLambo()
    fastlambospawn = createVehicle(411,-4,-4,3) 
end
addEvent("FastLambo",true)
addEventHandler("FastLambo",getRootElement(),fastLambo)

