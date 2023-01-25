local tower = workspace.tower
local sections = tower.sections

local Player = game:GetService"Players".LocalPlayer
local Character = Player.Character

for _, v in next, sections:GetChildren() do
    if v.Name == "finish" then
        if v:FindFirstChild("Finish") then
            Character:PivotTo(v.Finish.CFrame)
        end
    else
        if v:FindFirstChild("center") then
            Character:PivotTo(v.center.CFrame)
        end
    end
end
