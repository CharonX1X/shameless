local server = websockets:connect(
    8020
)

local network = game_client.network
local character_interface = game_client.character_interface
local my_worker = event:new()
local LocalPlayer = game.Players.LocalPlayer.Name
local body = syn.request({Url = "http://localhost:7963/GetAccounts?Password=redasredas"})
local accounts = string.split(body.Body, ",")

for i = 1, #accounts do 
    for _,v in pairs(game.Players:GetPlayers()) do
        if not v.Name == accounts[i] then
            cheat.notify("[Follower]: Hopping "..accounts[i].." to server.", 5, true, false)
        end
    end
end

my_worker:add("friend", function(player)
    if not table.find(cheat.friends, player) then
        cheat.notify("[Follower]: " ..player.. " added to follower network.", 5, true, false)
        table.insert(cheat.friends, player)
        websockets:send(server, "friend|" ..game.Players.LocalPlayer.Name)
    end
end)

local alive = false
local t = tick()
my_worker:add("commands", function(cmd)
    if cmd == "spawn" then
        character_interface.spawn()
        SaveManager:Load("rage")
        cheat.scripts:Run("spammer.lua")
        alive = true
        t = tick()
    end
end)

game.RunService.RenderStepped:Connect(function()
    if alive and not game_client.LocalPlayer.isAlive() and t + 1 < tick() then
        character_interface.spawn()
        t = tick()
    end
end)

websockets:send(server, "friend|" ..LocalPlayer)

cheat.notify("[Follower]: Connected to follower network as tasker.", 5, true, false)

server.OnMessage:Connect(function(msg)
    local tablemsg = string.split(msg, "|")
    table.foreach(tablemsg, print)
    if tablemsg[2] == LocalPlayer then return; end
    my_worker:call(tablemsg[1], tablemsg[2])
end)

server.OnClose:Connect(function()
    cheat.notify("[Follower]: Web-Socket server closed!", 5, true, false)
end)