addEventHandler("onPlayerJoin",root,function ()
    spawnPlayer(source,0,0,5)

    fadeCamera(source,true)
    setCameraTarget(source,source)
end)

addEventHandler( "onPlayerWasted", root,
	function()
		setTimer( spawnPlayer, 9000, 1, source, 0, 0, 3 )
	end
)
