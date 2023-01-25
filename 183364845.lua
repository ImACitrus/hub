--[[
  [Codespace]
  -> Auto Complete
  -> Server hopp
]]

for _, ui in next, game.CoreGui:GetChildren() do
    if ui.Name == "ui" then
        ui:Remove()
    end
end

_G.Game_Name = "Speed run 4"

local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/ImACitrus/vapeLib/main/.lua"))()
local win = lib:Window(_G.Game_Name or "Baseplate", Color3.fromRGB(Color3.fromRGB(0,191,255)), Enum.KeyCode.F)

local Player = game:GetService"Players".LocalPlayer
local Character = Player.Character

local main = win:Tab("Main")

main:Button("Complete Obby", function()
    for i = 1, 30 do
        for _, item in next, workspace:GetChildren() do
           if item.Name == tostring(i) and item:IsA("Model") then
               Character:PivotTo(item.Speed.CFrame * CFrame.new(0, 5, 0))
               task.wait(0.5)
               Character:PivotTo(item.GatePad.CFrame) 
           end
        end
       task.wait(1) 
    end
end)

main:Button("Server Hop", function()
    game:GetService"TeleportService":Teleport(game.PlaceId)
end)
