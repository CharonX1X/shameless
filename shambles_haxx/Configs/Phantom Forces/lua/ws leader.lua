local server = websockets:connect(
    8020
)

local network = game_client.network
local character_interface = game_client.character_interface
local my_worker = event:new()
local LocalPlayer = game.Players.LocalPlayer.Name

my_worker:add("friend", function(player)
    if not table.find(cheat.friends, player) then
        cheat.notify("[Follower]: " ..player.. " added to follower network.", 5, "move", true)
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

local send = game_client.network.send

game_client.network.send = function(self, command, ...)
    local args = { ... }

    if command == "chatted" then
        if args[1] == ".bzzap" then
            websockets:send(server, "commands|spawn")
            return;
        end
    end

    return send(self, command, table.unpack(args))
end

websockets:send(server, "friend|" ..LocalPlayer)

cheat.notify("[Follower]: Connected to follower network as leader.", 5, "move", true)

server.OnMessage:Connect(function(msg)
    local tablemsg = string.split(msg, "|")
    table.foreach(tablemsg, print)
    if tablemsg[2] == LocalPlayer then return; end
    my_worker:call(tablemsg[1], tablemsg[2])
end)

server.OnClose:Connect(function()
    cheat.notify("[Follower]: Web-Socket server closed!", 5, "move", true)
end)