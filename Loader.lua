repeat task.wait() until game:IsLoaded()
function betterisfile(path)
    local suc, res = pcall(function() return readfile(path) end)
    return suc and res ~= nil
end
shared["betterisfile"] = betterisfile
local placeid = game.PlaceId
if placeid == 6872274481 or placeid == 8560631822 or placeid == 8444591321 then
    if betterisfile("CometV2/Modules/Bedwars.lua") then
        loadstring(readfile("CometV2/Modules/Bedwars.lua"))()
    else
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Ham-135/CometV2/main/Modules/Bedwars.lua"))()
    end
elseif placeid == 6872265039 then
    if betterisfile("CometV2/Modules/6872265039.lua") then
        loadstring(readfile("CometV2/Modules/6872265039.lua"))()
    else
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Ham-135/CometV2/main/Modules/6872265039.lua"))()
    end
else
    if betterisfile("CometV2/Modules/Universal.lua") then
        loadstring(readfile("CometV2/Modules/Universal.lua"))()
    else
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Ham-135/CometV2/main/Modules/Universal.lua"))()
    end
end

task.delay(1, function()
    game:GetService("StarterGui"):SetCore("ChatWindowPosition", UDim2.new(0,0,0.73,0))
    game:GetService("StarterGui"):SetCore("ChatMakeSystemMessage",{
        Text = "Comet V2 Loaded!",
        Color = Color3.fromRGB(255,65,65),
        Font = Enum.Font.SourceSansBold,
    })
end)
