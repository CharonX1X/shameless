for _,v in pairs(getactors()) do
    if tostring(v) == "lol" then         
        syn.run_on_actor(v, [[
            if isactor(v) then
                loadstring(readfile("shambles haxx/loader/loader - development.lua"))()
            end
        ]])
    end
end