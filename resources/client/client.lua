bindKey ("m", "down",
    function()
        showCursor(not isCursorShowing())

end)

bindKey("b", "down", "chatbox", "LocalOOC")

addCommandHandler ("fly",  
    function () 
        if not flyEnabled then 
            setWorldSpecialPropertyEnabled ( "aircars", true ) 
            flyEnabled = true 
        else 
            setWorldSpecialPropertyEnabled ( "aircars", false ) 
            flyEnabled = false 
        end 
    end 
)
