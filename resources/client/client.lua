addEventHandler("onClientResourceStart",root,
function()
    setPlayerHudComponentVisible ("all", true )
end
)

bindKey ("m", "down",
    function()
        showCursor(not isCursorShowing())

end)

bindKey("b", "down", "chatbox", "LocalOOC")

function engine()
	local vehicle = getPedOccupiedVehicle(localPlayer)
	if isElement(vehicle) and getPedOccupiedVehicleSeat(localPlayer) == 0 then
        local playername = getPlayerName(getLocalPlayer())
		local state = getVehicleEngineState(vehicle)
		if not state then
			startTimer = 
			setTimer(
				function()
					if isElement(vehicle) and getPedOccupiedVehicleSeat(localPlayer) == 0 then
						setVehicleEngineState(vehicle, true)
                        outputChatBox(playername .. " naštartoval motor.",255,102,178,true)
					end
				end
			, 0, 1)
		else
			setVehicleEngineState(vehicle, false)
            outputChatBox(playername .. " vypol motor.",255,102,178,true)
		end
	end
end
addCommandHandler("engine", engine)
bindKey("j", "down", engine ) 



------------------TELEPORTS-------------------------
function spawnerCreate()
    if ((getElementData(getLocalPlayer(),"adminRole") or 0) < 2) then
        outputChatBox("Nemáš oprávnění!", 255, 0, 0,true)
    else
        if (hlavniOkno) then 
            if (isElement(hlavniOkno)) then 
                destroyElement(hlavniOkno)
            end 
            hlavniOkno = nil
        else
            local screenW, screenH = guiGetScreenSize()
            hlavniOkno = guiCreateWindow((screenW - 489) / 2, (screenH - 294) / 2, 489, 294, "Teleporter", false)
            guiWindowSetSizable(hlavniOkno, false)

            buttonMontgomery = guiCreateButton(20, 49, 198, 72, "Montgomery", false, hlavniOkno)

                addEventHandler("onClientGUIClick", buttonMontgomery, setPlayerPositionMontgomery, false) 

            guiSetProperty(buttonMontgomery, "NormalTextColour", "FFAAAAAA")
            buttonBlueberry = guiCreateButton(268, 52, 191, 69, "Blueberry", false, hlavniOkno)

                addEventHandler("onClientGUIClick", buttonBlueberry, setPlayerPositionBlueberry, false)

            guiSetProperty(buttonBlueberry, "NormalTextColour", "FFAAAAAA")
            buttonPalomino = guiCreateButton(26, 163, 192, 74, "Palomino Creek", false, hlavniOkno)

                addEventHandler("onClientGUIClick", buttonPalomino, setPlayerPositionPalomino, false)

            guiSetProperty(buttonPalomino, "NormalTextColour", "FFAAAAAA")
            buttonSpawn = guiCreateButton(274, 169, 185, 68, "Spawn", false, hlavniOkno)

                addEventHandler("onClientGUIClick", buttonSpawn, setPlayerPositionSpawn, false)

            guiSetProperty(buttonSpawn, "NormalTextColour", "FFAAAAAA")
    end 
    end
end
addCommandHandler("spawner",spawnerCreate)


function setPlayerPositionMontgomery()
    outputChatBox ("Bol si teleportovaný do Montgomery.",0,255,0,true) 
    triggerServerEvent("MontgomeryTP",localPlayer)
end
function setPlayerPositionBlueberry()
    outputChatBox ("Bol si teleportovaný do Blueberry.",0,255,0,true) 
    triggerServerEvent("BlueberryTP",localPlayer)
end
function setPlayerPositionPalomino()
    outputChatBox ("Bol si teleportovaný do Palomino.",0,255,0,true) 
    triggerServerEvent("PalominoTP",localPlayer)
end
function setPlayerPositionSpawn()
    outputChatBox ("Bol si teleportovaný na Spawn.",0,255,0,true) 
    triggerServerEvent("SpawnTP",localPlayer)
end

--function cancelPedDamage ( attacker )
	--cancelEvent()
--end
--addEventHandler ( "onClientPedDamage", getRootElement(), cancelPedDamage )


----------------------ACTIVE STAFF----------------------------


GUIEditor = {
    gridlist = {}
}

function allPlayerList()
        local playerList = guiCreateGridList(494, 117, 403, 475, false)
        local column = guiGridListAddColumn(playerList, "Player", 0.9)
        if ( column ) then
            for id, player in ipairs(getElementsByType("player")) do
                local row = guiGridListAddRow(playerList)
                guiGridListSetItemText(playerList, 0, 1, getPlayerName ( player ), false, false)
                guiGridListSetItemColor(playerList, 0, 1, 240, 254, 5, 255)
                guiSetAlpha(playerList, 0.77)
            end
        end
        function hideAllPlayerList()
            guiSetVisible(playerList,false)
        end
        bindKey("tab","up",hideAllPlayerList)
    end
    bindKey("tab","down",allPlayerList)

