local ArrayList = {}
local ArrayGui = Instance.new("ScreenGui",game:GetService("CoreGui"))
local Frame = Instance.new("Frame",ArrayGui)
local Layout = Instance.new("UIListLayout",Frame)
ArrayGui.Enabled = shared["CometConfigs"].Enabled
ArrayGui.ResetOnSpawn = false
Frame.Size = UDim2.new(0.2,0,1,0)
Frame.Position = UDim2.new(0.87,0,0,0)
Frame.BackgroundTransparency = 1
Frame.BorderSizePixel = 0

spawn(function()
    repeat
        task.wait(1)
        ArrayGui.Enabled = shared["CometConfigs"].Enabled
    until not ArrayGui
end)

function ArrayList.Add(Name,Suffix)
    local newname
    if Suffix then
        newname = Name.." <font color='rgb(75,75,75)'>"..Suffix.."</font>"
    else
        newname = Name
    end
    local label = Instance.new("TextLabel")
    label.TextScaled = true
    label.RichText = true
    label.Size = UDim2.new(0,217,0,30)
    label.BackgroundTransparency = 1
    label.Text = newname
    label.TextColor3 = shared["CometConfigs"].Color
    label.TextStrokeTransparency = shared["CometConfigs"].StrokeTransparency
    label.Name = Name
    label.Parent = Frame
    spawn(function()
        repeat
            task.wait()
            label.TextStrokeTransparency = shared["CometConfigs"].StrokeTransparency
            label.TextColor3 = shared["CometConfigs"].Color
        until not label
    end)
end

function ArrayList.Remove(Name)
    if Frame:FindFirstChild(Name) then
        Frame:FindFirstChild(Name):Destroy()
    end
end

function ArrayList.SetDrag(value)
    Frame.Draggable = value
    Frame.Selectable = value
    Frame.Active = value
end

return ArrayList
