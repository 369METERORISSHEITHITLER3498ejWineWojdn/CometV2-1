local ArrayLib = {}
local ui = Instance.new("ScreenGui")
if syn then syn.protect_gui(ui) end
ui.ResetOnSpawn = false
ui.Enabled = shared["CometConfigs"].Enabled
ui.Parent = game:GetService("CoreGui")
local frm = Instance.new("Frame")
frm.Size = UDim2.new(0.1,0,0.9451,0)
frm.Position = UDim2.new(0.8998,0,0.0549,0)
frm.BackgroundTransparency = 1
frm.BorderSizePixel = 0
frm.Parent = ui
layout = Instance.new("UIListLayout",frm)
local mark = Instance.new("TextLabel")
mark.Position = UDim2.new(0.8998)
mark.Size = UDim2.new(0,167,0,50)
mark.BackgroundTransparency = 1
mark.Text = "Comet V2"
mark.TextColor3 = Color3.fromHSV(tick()%5/5,1,1)
mark.TextScaled = true
mark.Parent = ui

spawn(function()
    repeat
        task.wait(1)
        ui.Enabled = shared["CometConfigs"].Enabled
    until not ui
end)
spawn(function()
    repeat
        task.wait()
        mark.TextColor3 = Color3.fromHSV(tick()%5/5,1,1)
        mark.TextStrokeTransparency = shared["CometConfigs"].StrokeTransparency
        mark.Visible = shared["CometConfigs"].Watermark
    until not mark or not ui or not frm
end)

function ArrayLib.Add(Name,Suffix)
    local newname
    if Suffix then
        newname = Name.." - "..Suffix
    else
        newname = Name
    end
    local label = Instance.new("TextLabel")
    label.Name = Name
    label.Text = newname
    label.Size = UDim2.new(0,183,0,25)
    label.BackgroundTransparency = 1
    label.TextScaled = true
    label.TextStrokeTransparency = shared["CometConfigs"].StrokeTransparency
    label.TextColor3 = Color3.fromHSV(tick()%5/5,1,1)
    label.Parent = frm
    spawn(function()
        repeat
            task.wait()
            label.TextStrokeTransparency = shared["CometConfigs"].StrokeTransparency
            label.TextColor3 = Color3.fromHSV(tick()%5/5,1,1)
        until not label
    end)
end

function ArrayLib.Remove(Name)
    if frm:FindFirstChild(Name) then
        frm:FindFirstChild(Name):Destroy()
    end
end

function ArrayLib.SetDrag(val) end

return ArrayLib
