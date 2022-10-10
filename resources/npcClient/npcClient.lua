function clickPed(button, state, absoluteX, absoluteY, worldX, worldY, worldZ, clickedElement) 
    if (clickedElement) and (getElementType(clickedElement) == "ped" ) then 
                local x, y, z = getElementPosition(getLocalPlayer()) 
                local wx, wy, wz = getElementPosition(clickedElement) 
                local jij = getLocalPlayer() 
                 
                if (getDistanceBetweenPoints3D(x, y, z, wx, wy, wz)<=2) and (button == "right") and (state == "down" ) then
                             
                            local ped = getElementData(clickedElement, "name") 
                            if (ped=="John") then
                                outputChatBox("John: Ahoj, čo si praješ?")
                                GUIEditor = {
                                    button = {},
                                    window = {},
                                    label = {}
                                }
                                        showCursor(true)
                                        mainWindow = guiCreateWindow(449, 195, 487, 386, "Choose a car", false)
                                        guiWindowSetSizable(GUIEditor.window[1], false)
                                
                                        Skyline = guiCreateButton(71, 59, 150, 68, "Skyline R34 GTR", false, mainWindow)
                                        addEventHandler("onClientGUIClick", Skyline, skylineSpawn, false)
                                        FastLamboSpawner = guiCreateButton(265, 60, 146, 67, "Fast-Lambo", false, mainWindow)
                                        addEventHandler("onClientGUIClick", FastLamboSpawner, LamboSpawn, false)
                                        Nothing = guiCreateButton(168, 229, 146, 69, "Nothing", false, mainWindow)
                                        addEventHandler("onClientGUIClick", Nothing, NothingQuit, false)
                                        GUIEditor.label[1] = guiCreateLabel(227, 27, 102, 22, "John", false, mainWindow)
                                        GUIEditor.label[2] = guiCreateLabel(162, 4, 161, 13, "", false, mainWindow)
                            elseif (ped=="Ledek") then
                                outputChatBox("Ledek: Ahoj, čo si praješ?")
                            end 
                end 
    else 
    return 
    end 
    end 
    addEventHandler("onClientClick", getRootElement(), clickPed, true)

    function NothingQuit()
        guiSetVisible(mainWindow,false)
        showCursor(false)
    end



    function skylineSpawn()
        outputChatBox ("Vybral si si vozidlo Skyline R34 GTR.",0,255,0,true) 
        triggerServerEvent("SkylineGTR",localPlayer)
    end

    function LamboSpawn()
        outputChatBox ("Vybral si si vozidlo Fast-Lambo.",0,255,0,true) 
        triggerServerEvent("FastLambo",localPlayer)
    end



