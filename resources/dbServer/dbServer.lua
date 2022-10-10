local host = "localhost"
local username = "root"
local password = ""
local db = "rockamtaserver"
local connection = dbConnect("mysql", "dbname=" .. db .. ";host=" .. host, username, password)


addEventHandler("onPlayerChat",root,
function(msg)
    local playerName = getPlayerName(source)
    local serial = getPlayerSerial(source)
    local message = msg
    local chatQuery = dbQuery(connection,"INSERT INTO chatlog(playerName,serial,message) VALUES (?, ?, ?)", playerName, serial, message)
    dbFree ( chatQuery ) 
end
)

function accToDB(player_username,player_password,player_password_confirm)
    local player_password_hashed = hash("sha512",player_password)
    local player_password_confirm_hashed = hash("sha512",player_password_confirm)
    local checkAccountIfExists = dbQuery(connection,"SELECT * FROM `accounts` WHERE player_username=?",player_username)
    local resultExistingAcc = dbPoll(checkAccountIfExists,-1)
    if #resultExistingAcc > 0 then
        outputChatBox("Account already exists!",client,255,0,0,true)
    else
        dbQuery(connection,"INSERT INTO accounts(player_username,player_password,player_password_confirm,role) VALUES (?, ?, ?, ?)", player_username, player_password_hashed, player_password_confirm_hashed, 1)
        outputChatBox("Úspešne si sa zaregistroval. Môžeš sa prihlásiť.",client,0,255,0,true)
    end
end
addEvent("AddAccountToDB",true)
addEventHandler("AddAccountToDB",getRootElement(),accToDB)

function triggeredClientEventLogin(login_username, login_password)
    local login_password_hashed = hash("sha512",login_password)
    local login_username = string.match(login_username,login_username)
    local checkacc = dbQuery(connection, "SELECT * FROM `accounts` WHERE player_username=? AND player_password=?",login_username, login_password_hashed)
    local result = dbPoll(checkacc, -1)
    dbFree ( checkacc ) 
    if #result > 0 then
        if login_username == string.match(login_username,result[1].player_username) then
            local row = result[1]
            local getmyname = login_username
            setElementData(client, "adminRole", tonumber(row.role))
            setElementData(client,"playerUsername",tostring(row.player_username))
            triggerClientEvent(client, "TurnOffGUI", client)
            triggerClientEvent(client, "TurnOnMinimap", client)
            spawnPlayer(client, 0, 0, 5)
            fadeCamera(client, true)
            setCameraTarget(client, client)
            outputChatBox("Logged in as " .. getmyname .. "!", client, 0, 255, 0)
        else
            outputChatBox("Wrong username or password!", client, 255, 0, 0)
        end
    else
        outputChatBox("Wrong username or password!", client, 255, 0, 0)
    end
    
end
addEvent("triggeredLogin", true)
addEventHandler("triggeredLogin", getRootElement(), triggeredClientEventLogin)



