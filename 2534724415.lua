--[[

    [Codespace]
    -> Auto day
    -> fov
    -> teleport key (gameplay only)
]]

-- Settings --
_G.SETTINGS = {
    lighting = {day=false},
    camera = {fov=90},
    teleport_key = Enum.KeyCode.LeftControl
}

-- Services --
local Players = game:GetService"Players"

-- User Config --
local Player = Players.LocalPlayer
local PlayerScripts = Player.PlayerScripts

-- User 3D --
local Character = Player.Character
local Humanoid = Character.Humanoid

-- User Utility --
local Mouse = Player:GetMouse()
local camera = workspace.CurrentCamera

-- Folders --
local Vehicles = workspace.Vehicles

-- functions --
local vehicle = function()
   for _, object in next, Vehicles:GetDescendants() do
      if object.Name == "Owner" and object:IsA("StringValue") and object.Value == Player.Name then
         return object.Parent.Parent
      end
   end
end

local vehicles = function()
   local vehicles = {}
   for _, object in next, Vehicles:GetDescendants() do
      if object.Name == "Owner" and object:IsA("StringValue") and object.Value ~= Player.Name then
         vehicles[#vehicles + 1] = object.Parent.Parent
      end
   end
   return vehicles
end

-- conditions --
if game:GetService("Workspace"):FindFirstChild("SnowPart") then
    game:GetService("Workspace"):FindFirstChild("SnowPart"):Remove()
end

-- UserInputs --
game:GetService"UserInputService".WindowFocused:Connect(function()
    game:GetService"UserInputService".InputBegan:Connect(function(input)
        if input.KeyCode == _G.SETTINGS.teleport_key then
            if Humanoid.Sit then
                if vehicle().DriverSeat.Occupant ~= nil then
                    vehicle():PivotTo( Mouse.Hit * CFrame.new(0, 5, 0) )
                end
            else
                Character:PivotTo( Mouse.Hit * CFrame.new(0, 5, 0) )
            end
        end
    end)
end)

-- Auto day --
task.spawn(function()
    while _G.SETTINGS.lighting.day and task.wait() do
       game.Lighting.ClockTime = 10
       game.Lighting.Brightness = 0
    end
end)

-- Field of view --
camera.FieldOfView = _G.SETTINGS.camera.fov
