--[[
  [Codespace]
  -> Auto Complete
]]

local Player = game:GetService"Players".LocalPlayer
local Character = Player.Character

local old_pos = Character:GetPivot()
Character:PivotTo(workspace.tower.sections.finish.FinishGlow.CFrame)
task.wait(0.2)
Character:PivotTo(old_pos)
