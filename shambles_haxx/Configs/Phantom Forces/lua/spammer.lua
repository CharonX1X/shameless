local emojis = {
    "😎😎😎😎😎😎😎😎😎😎",
    "🤣🤣🤣🤣🤣🤣🤣🤣🤣🤣",
    "👀👀👀👀👀👀👀👀👀👀",
    "🙄🙄🙄🙄🙄🙄🙄🙄🙄🙄",
    "🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥",
    "😅😅😅😅😅😅😅😅😅😅",
    "😂😂😂😂😂😂😂😂😂😂",
    "😹😹😹😹😹😹😹😹😹😹",
    "😛😛😛😛😛😛😛😛😛😛",
    "🤩🤩🤩🤩🤩🤩🤩🤩🤩🤩",
    "🌈🌈🌈🌈🌈🌈🌈🌈🌈🌈",
    "😎😎😎😎😎😎😎😎😎😎",
    "🤠🤠🤠🤠🤠🤠🤠🤠🤠🤠",
    "😔😔😔😔😔😔😔😔😔😔",
    "🤡🤡🤡🤡🤡🤡🤡🤡🤡🤡",
    "💤💤💤💤💤💤💤💤💤💤",
    "🚶‍♂️🚶‍♀️🚶‍♂️🚶‍‍🚶‍♀️🚶‍♂️🚶‍♀️🚶‍♂️🚶🚶‍♀️🚶‍♂️🚶🚶‍♀️🚶‍♂️🚶‍",
    "🙀🙀🙀🙀🙀🙀🙀🙀🙀🙀",
    "😂😂😂😂😂😂😂😂😂😂",
    "📈📈📈📈📈📈📈📈📈📈",
    "🤏🤏🤏🤏🤏🤏🤏🤏🤏🤏",
}
    
local symbols = {
    "~~~~~~~~~~",
    "!!!!!!!!!!",
    "@@@@@@@@@@",
    "##########",
    "$$$$$$$$$$",
    "%%%%%%%%%%",
    "^^^^^^^^^^",
    "&&&&&&&&&&",
    "**********",
    "((((((((((",
    "))))))))))",
    "__________",
    "++++++++++",
    "{{{{{{{{{{",
    "}}}}}}}}}}",
    "||||||||||",
    "::::::::::",
    '""""""""""',
    "<<<<<<<<<<",
    ">>>>>>>>>>",
    "??????????",
    "..........",
    ",,,,,,,,,,",
    "//////////",
    "''''''''''",
}

local phrases = {
    "how many bites are in a d-word?",
    "i think your bad.",
    "*TOT*",
    "d(-_-)b",
    "keep crying :C",
    "how much is a gigabyte?",
    "i have 10tb of cp (club pengiun)",
    "hi hi hi hi hi hi",
    "AAAAAAAAAAAAAAAAAAAA",
    "SET UPVALUES (CONSTANT)",
    "brb taking a nap",
    "gonna go take a walk",
    "low orbit ion cannon booting up",
    "im a firing my laza!",
    "GAMING CHAIR",
    "can't hear you over these kill sounds",
    "i'm just built different yo",
    "OFF THE CHART ",
    "KICK HIM",
    "SORRY I HURT YOUR ROBLOX EGO",
    "FULCRUM COME IN YUUHH YODIE GANG",
    "Shall we? cheers my friends.",
    "Cheers my friends.",
    "Let's take a blinker, shall we?",
    "Shall we go to penjamin city?",
    "PLUG PLUG P-P-PLUG.",
    "Im completely obliterated",
    "i am a person.",	
    "cl_junkcode 1",
    "moment - Vierre Cloud",
    "IT BASICALLY WIPES EVERY LOBBY",
    "I WILL- STAND ON THIS",
    "THERE IS NO CHEAT THAT CAN COMPETE WITH EXODUS",
    "THAT LIKE-LIKE KILLS IT",
    "LIKE IM TELLING YOU BRO",
    "I-I GOT VOTEKICKED FROM AN AECH VEE AECH LOBBY",
    "FROM AN AECH VEE AECH LOBBY.",
}

local stringsub_table = {
    [1] = 4,
    [2] = 8,
    [3] = 12,
    [4] = 16,
    [5] = 20,
    [6] = 24,
    [7] = 28,
    [8] = 32,
    [9] = 36,
    [10] = 40
}

task.spawn(function()
    while task.wait(3) do
        if game_client.LocalPlayer.isAlive() then
            local lol = ""
            
            lol = string.sub(emojis[math.random(1, #emojis)]:gsub('\"', ''), 1, stringsub_table[math.random(1, 10)]) .. string.sub(symbols[math.random(1, #symbols)], 1, math.random(1, 10)) .. phrases[math.random(1, #phrases)] .. string.sub(symbols[math.random(1, #symbols)], 1, math.random(1, 10)) .. string.sub(emojis[math.random(1, #emojis)]:gsub('\"', ''), 1, stringsub_table[math.random(1, 10)]) .. phrases[math.random(1, #phrases)] .. string.sub(symbols[math.random(1, #symbols)], 1, math.random(1, 10)) .. string.sub(emojis[math.random(1, #emojis)]:gsub('\"', ''), 1, stringsub_table[math.random(1, 10)]) .. phrases[math.random(1, #phrases)] .. string.sub(symbols[math.random(1, #symbols)], 1, math.random(1, 10)) .. string.sub(emojis[math.random(1, #emojis)]:gsub('\"', ''), 1, stringsub_table[math.random(1, 10)]) .. phrases[math.random(1, #phrases)] .. string.sub(symbols[math.random(1, #symbols)], 1, math.random(1, 10)) .. string.sub(emojis[math.random(1, #emojis)]:gsub('\"', ''), 1, stringsub_table[math.random(1, 10)]) .. phrases[math.random(1, #phrases)] .. string.sub(symbols[math.random(1, #symbols)], 1, math.random(1, 10)) .. string.sub(emojis[math.random(1, #emojis)]:gsub('\"', ''), 1, stringsub_table[math.random(1, 10)])
            
            game_client.network.send(nil, "chatted", lol) 
        end
    end
end)