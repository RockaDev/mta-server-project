function parseDo(thePlayer,cmd,...)
    local thePlayer = getPlayerName(thePlayer)
    local message = table.concat({...}," ")
    outputChatBox("☆ " .. message .. " " .. "(( " .. thePlayer .. " ))",root,249,132,239,true)


end
addCommandHandler("do",parseDo)

function clearChat(thePlayer,cmd)
    for i=1,15 do 
        outputChatBox(" ",root)
    end
end
addCommandHandler("cls",clearChat)

function LocalOOC(thePlayer,cmd,...)
    local thePlayer = getPlayerName(thePlayer)
    local message = table.concat({...}," ")
    outputChatBox("OOC || " .. " (( " .. thePlayer..": " .. message .. " )) ",root,192,192,192,true)


end
addCommandHandler("LocalOOC",LocalOOC)
