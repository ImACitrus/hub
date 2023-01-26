--[[
  [Codespace]
  -> Auto Complete
]]

local Player = game:GetService"Players".LocalPlayer
local Character = Player.Character

for i = Player.leaderstats.Stage.Value, #workspace.Checkpoints:GetChildren() do
    Character:PivotTo(workspace.Checkpoints:GetChildren()[i]:GetPivot() * CFrame.new(0, 5, 0))
    task.wait(0.5)
end