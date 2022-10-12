task.wait(0.5)
shared["CometConfigs"] = {
    StrokeTransparency = 0.75,
    Color = Color3.fromRGB(255,65,65),
    Enabled = false
}
local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Ham-135/CometV2/main/GuiLibrary.lua"))()
local getasset = getsynasset or getcustomasset
local ScreenGuitwo = game:GetService("CoreGui").RektskyNotificationGui
local lplr = game:GetService("Players").LocalPlayer
local cam = game:GetService("Workspace").CurrentCamera
function runcode(func)
    func()
end
lib:CreateWindow()
local Tabs = {
    ["Combat"] = lib:CreateTab("Combat",Color3.fromRGB(252,80,68),"combat"),
    ["Blatant"] = lib:CreateTab("Blatant",Color3.fromRGB(255,148,36),"movement"),
    ["Render"] = lib:CreateTab("Render",Color3.fromRGB(59,170,222),"render"),
    ["Utility"] = lib:CreateTab("Utility",Color3.fromRGB(83,214,110),"player"),
    ["World"] = lib:CreateTab("World",Color3.fromRGB(52,28,228),"world"),
    ["Exploits"] = lib:CreateTab("Exploits",Color3.fromRGB(157,39,41),"exploit")
}

runcode(function()
    local clone
    local char
    local Enabled = false
    local Disabler = Tabs["Exploits"]:CreateToggle({
        ["Name"] = "Disabler",
        ["Callback"] = function(Callback)
            Enabled = Callback
            if Enabled then
                char = lplr.Character
                char.Archivable = true
                clone = char:Clone()
                clone.Parent = game:GetService("Workspace")
                cam.CameraSubject = clone:FindFirstChild("Humanoid")
                char.Parent = nil
                clone:FindFirstChild("Animate").Disabled = true
                task.wait()
                clone:FindFirstChild("Animate").Disabled = false
            else
                clone:Destroy()
                char.Parent = game:GetService("Workspace")
                lplr.Character = char
                cam.CameraSubject = char:FindFirstChild("Humanoid")
            end
        end
    })
end)
