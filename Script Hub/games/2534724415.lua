local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/ImACitrus/vapeLib/main/.lua"))()
local win = lib:Window("ER:LC", Color3.fromRGB(0,191,255), Enum.KeyCode.LeftAlt)

_G.FV = false
_G.WalkSpeed = 16
_G.JumpPower = 50

_G.ClockTime = 14
_G.ForceClockTime = false

local Players = game:GetService"Players"
local Player = Players.LocalPlayer

local Character = Player.Character
local Humanoid = Character.Humanoid

local Client = win:Tab("Client")
local World = win:Tab("World")

Client:Slider("WalkSpeed", 16, 23, 16, function(value)
    _G.WalkSpeed = value
    Humanoid.WalkSpeed = value
end)

Client:Slider("JumpPower", 50, 500, 50, function(value)
    _G.JumpPower = value
    Humanoid.JumpPower = value
end)

Client:Toggle("Force Values", false, function(value)
    _G.FV = value
    while _G.FV and task.wait() do
        if not _G.FV then
            Humanoid.WalkSpeed = 16
            Humanoid.JumpPower = 50
        end
        Humanoid.WalkSpeed = _G.WalkSpeed
        Humanoid.JumpPower = _G.JumpPower
    end
end)

World:Toggle("Always day", false, function(value)
    _G.ForceClockTime = value
    while _G.ForceClockTime and task.wait() do
        game.Lighting.Clocktime = _G.ClockTime
    end
end)

lib.PARENT_OBJECT()
