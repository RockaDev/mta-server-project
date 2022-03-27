function createLoginWindow()
	local X = 0.375
	local Y = 0.375
	local Width = 0.25
	local Height = 0.5
	wdwLogin = guiCreateWindow(X, Y-0.1, Width, Height, "Please Log In", true)
    local tabPanel = guiCreateTabPanel ( 0, 0.08, 1, 1, true, wdwLogin )
    local tabLogin = guiCreateTab("Login",tabPanel)
    local tabRegister = guiCreateTab("Register",tabPanel)
	
	X = 0.0825
	Y = 0.2

	Width = 0.25
	Height = 0.25

	guiCreateLabel(X, Y, Width, Height, "Username", true, tabLogin)

    guiCreateLabel(X, Y, Width, Height, "Username", true, tabRegister)

	Y = 0.5
	guiCreateLabel(X, Y, Width, Height, "Password", true, tabLogin)

    guiCreateLabel(X, Y+0.05, Width, Height, "Confirm pass.", true, tabRegister)
    guiCreateLabel(X, Y-0.10, Width, Height, "Password", true, tabRegister)
	

	X = 0.415
	Y = 0.2
	Width = 0.5
	Height = 0.15
	edtUser = guiCreateEdit(X, Y, Width, Height, "", true, tabLogin)
    edtUserReg = guiCreateEdit(X, Y, Width, Height, "", true, tabRegister)
	Y = 0.5
	edtPass = guiCreateEdit(X, Y, Width, Height, "", true, tabLogin)
    edtUserReg = guiCreateEdit(X, Y, Width, 0.17, "", true, tabRegister)
    edtUserConfirm = guiCreateEdit(X, 0.38, Width, 0.09, "", true, tabRegister)

	guiEditSetMaxLength(edtUser, 50)
	guiEditSetMaxLength(edtPass, 50)
	
	X = 0.415
	Y = 0.7
	Width = 0.25
	Height = 0.2
	btnLogin = guiCreateButton(X, Y, Width, Height, "Log In", true, tabLogin)
    btnReg = guiCreateButton(X, Y, Width, Height, "Register", true, tabRegister)
    addEventHandler("onClientGUIClick", btnLogin, clientSubmitLogin, false)
	guiSetVisible(wdwLogin, false)

end

addEventHandler("onClientResourceStart", getResourceRootElement(), 
	function ()
		createLoginWindow()
	end
)
addEventHandler("onPlayerJoin",root,function ()
    createLoginWindow()
end)

addEventHandler("onClientResourceStart", getResourceRootElement(), 
	function ()
		createLoginWindow()

                outputChatBox("Welcome to My MTA:SA Server, please log in.")

	        if (wdwLogin ~= nil) then
			guiSetVisible(wdwLogin, true)
		else
			outputChatBox("An unexpected error has occurred. Please reconnect.")
	        end 

	        showCursor(true)
	        guiSetInputEnabled(true)
	end
)



function clientSubmitLogin(button,state)
	if button == "left" and state == "up" then
		local username = guiGetText(edtUser)
		local password = guiGetText(edtPass)

		if username and username ~= "" and password and password ~= "" then
			triggerServerEvent("submitLogin", getRootElement(), username, password)

			guiSetInputEnabled(false)
			guiSetVisible(wdwLogin, false)
			showCursor(false)

		else

			outputChatBox("Please enter a username and password.")
		end
	end
end

function loginHandler(username,password)
	-- check that the username and password are correct
	if username == "user" and password == "apple" then
		-- the player has successfully logged in, so spawn them
		if (client) then
			spawnPlayer(client, 1959.55, -1714.46, 10)
			fadeCamera(client, true)
                        setCameraTarget(client, client)
			outputChatBox("Welcome to My Server.", client)
		end
	else
		-- if the username or password are not correct, output a message to the player
		outputChatBox("Invalid username and password. Please re-connect and try again.",client)
        end			
end

addEvent("submitLogin",true)
addEventHandler("submitLogin",root,loginHandler)