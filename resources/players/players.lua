function SetRoleAndSkin(thePlayer)
	local user_name = getElementData(source,"playerUsername")
		if ((getElementData(source, "adminRole") or 0) < 2) then
			setPlayerName(source,user_name)
			outputChatBox("Prihlásený ako " .. user_name .. "! [Role: Default]",source)
		else
			outputChatBox("Prihlásený ako " .. user_name .. "! [Role: Admin]",source)
			setElementModel(source, 1)
			setPlayerName(source,user_name)
		end
end
addEventHandler("onPlayerSpawn",root,SetRoleAndSkin)

function skinChanger(thePlayer,cmd,id)
    if ((getElementData(thePlayer, "adminRole") or 0) < 2) then
    else
		setElementModel(thePlayer, id)
    end
end
addCommandHandler("newskin",skinChanger)

function rsp()
	spawnPlayer(client,0,0,5)
	fadeCamera(client, true)
	setCameraTarget(client, client)
end
addEvent("rspevent",true)
addEventHandler("rspevent",getRootElement(),rsp)

addEventHandler( "onPlayerWasted", root,
	function()
		setTimer( spawnPlayer, 2000, 1, source, 0, 0, 3 )
	end
)
