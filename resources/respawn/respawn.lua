function guivis(thePlayer)
	if (isPedDead(thePlayer)) then
		--guiSetVisible(mainpanel, false)
	else
		--mainpanel = guiCreateWindow(0.4,0.4,0.2,0.2, "Respawn", true)
		--respButton = guiCreateButton(0.05,0.7,0.8,0.4,"Respawn",true,mainpanel)
		--addEventHandler("onClientGUIClick", respButton, respawnPlayer, false)
		--guiSetVisible(mainpanel, true)
		--respawnPlayer()
	end
end
addEventHandler("onClientPlayerWasted", root,
	function ()
		guivis()
	end
)
function respawnPlayer()
	outputChatBox ("Bol si respawnnutý.",255,153,204,true) 
	triggerServerEvent("rspevent",localPlayer)
	guiSetVisible(mainpanel, false)
end
addEvent("respawnNow",true)
addEventHandler("respawnNow",resourceRoot,respawnPlayer)
