GUIEditor = {
    progressbar = {},
    edit = {},
    button = {},
    window = {},
    label = {},
    staticimage = {}
}
addEventHandler("onClientResourceStart", resourceRoot,
    function()
        toggleControl("chatbox", false) 
        local x, y = guiGetScreenSize () 
        local guiWidth, guiHeight = 500, 400 
          
        local centerX, centerY = (x / 2) - (guiWidth / 2), (y / 2) - (guiHeight / 2)         
        showCursor(true)
        LoginPanelWindow = guiCreateWindow(centerX, centerY, 654, 457, "Login Panel - Rocka's Test Sever", false)
        guiWindowSetSizable(LoginPanelWindow, false)
        GUIEditor.label[1] = guiCreateLabel(52, 47, 58, 18, "Username", false, LoginPanelWindow)
        loginUsername = guiCreateEdit(124, 46, 114, 19, "", false, LoginPanelWindow)
        GUIEditor.label[2] = guiCreateLabel(52, 85, 53, 15, "Password", false, LoginPanelWindow)
        loginPassword = guiCreateEdit(124, 80, 114, 20, "", false, LoginPanelWindow)
        GUIEditor.label[3] = guiCreateLabel(394, 46, 58, 18, "Username", false, LoginPanelWindow)
        RegisterUsername = guiCreateEdit(483, 45, 114, 19, "", false, LoginPanelWindow)
        GUIEditor.label[4] = guiCreateLabel(394, 85, 53, 15, "Password", false, LoginPanelWindow)
        RegisterPassword = guiCreateEdit(483, 85, 114, 20, "", false, LoginPanelWindow)
        GUIEditor.label[5] = guiCreateLabel(374, 128, 99, 15, "Confirm Password", false, LoginPanelWindow)
        RegisterPasswordConfirm = guiCreateEdit(483, 123, 114, 20, "", false, LoginPanelWindow)
        btnreg = guiCreateButton(484, 181, 113, 43, "Register", false, LoginPanelWindow)
        addEventHandler("onClientGUIClick", btnreg, RegisterAcc, false)
        guiSetProperty(GUIEditor.button[1], "NormalTextColour", "FF89FD00")
        btnlog = guiCreateButton(124, 139, 113, 43, "Login", false, LoginPanelWindow)
        addEventHandler("onClientGUIClick", btnlog, LoginEvent, false)
        guiSetProperty(GUIEditor.button[2], "NormalTextColour", "FFFEFB00")
        GUIEditor.label[6] = guiCreateLabel(289, 3, 95, 15, "", false, LoginPanelWindow)
        GUIEditor.staticimage[1] = guiCreateStaticImage(10, 230, 227, 210, "logo.png", false, LoginPanelWindow)
        progbar = guiCreateProgressBar(296, 417, 297, 20, false, LoginPanelWindow)
        labelOnPanel = guiCreateLabel(257, 351, 362, 56, "Rocka's Test Server", false, LoginPanelWindow)
        guiEditSetMasked ( loginPassword, true )
        guiEditSetMasked ( RegisterPassword, true )
        guiEditSetMasked ( RegisterPasswordConfirm, true )
        guiLabelSetColor ( GUIEditor.label[1], 0,255,111)
        guiLabelSetColor ( GUIEditor.label[2], 0,255,111)
        guiLabelSetColor ( GUIEditor.label[3], 255,213,0)
        guiLabelSetColor ( GUIEditor.label[4], 255,213,0)
        guiLabelSetColor ( GUIEditor.label[5], 255,213,0)
        guiSetFont(labelOnPanel, "sa-header")
        guiLabelSetColor ( labelOnPanel, 153,153,255)
        guiLabelSetColor(GUIEditor.label[7], 6, 220, 246)    
        guiProgressBarSetProgress(progbar, 100)
    end
)


function LoginEvent()
    local login_username = guiGetText(loginUsername)
    local login_password = guiGetText(loginPassword)
    triggerServerEvent("triggeredLogin",localPlayer,login_username,login_password)
end

function RegisterAcc()
    local player_username = guiGetText(RegisterUsername)
    local player_password = guiGetText(RegisterPassword)
    local player_password_confirm = guiGetText(RegisterPasswordConfirm)
    if player_password == player_password_confirm then
        if #player_username < 6 then
            outputChatBox("Meno musí obsahovať viac ako 6 znakov!",255,0,0,true)
        elseif #player_password < 8 then
            outputChatBox("Heslo musí obsahovať viac ako 8 znakov!",255,0,0,true)
        else
            triggerServerEvent("AddAccountToDB",localPlayer,player_username,player_password,player_password_confirm)
        end

    else
        outputChatBox("Heslá sa nerovnajú!",255,0,0,true)
end
end

local dxWidth,dxHeight = guiGetScreenSize()

function background()
    local bgChange = dxDrawImage(0,0, dxWidth, dxHeight, "bg.jpg", 0, 0, 0, tocolor(255, 255, 255, 255), false)
end
addEventHandler("onClientRender",root,background)

function LoginSuccess()
    guiSetVisible(LoginPanelWindow,false)
    showCursor(false)
    toggleControl("chatbox", true) 
    removeEventHandler("onClientRender", root, background)
end
addEvent("TurnOffGUI",true)
addEventHandler("TurnOffGUI",getRootElement(),LoginSuccess)

