--[[

    [Codespace]
    -> Auto knife (Synapse X feature)
    -> Tween to target

]]

-- Configurment --
_G.Farm = true

-- external functions --
function click( mouse )
    if not syn then
        return;
    else
        mouse1click(mouse)
    end
end

-- Services --
local Players = game:GetService"Players"
local TweenService = game:GetService"TweenService"

-- User --
local Player = Players.LocalPlayer
local Mouse = Player:GetMouse()

-- 3D Space --
local Character = Player.Character
local Hrp = Character.HumanoidRootPart
local Humanoid = Character.Humanoid

-- 2D Space --
local PlayerGui = Player:WaitForChild("PlayerGui")
local mainUI = PlayerGui:WaitForChild("ScreenGui")

-- 2D - UI Elements --
local UI = mainUI:WaitForChild("UI")
local Target = UI:WaitForChild("Target"):WaitForChild("TargetText")

-- Functions --
task.spawn(function()
    while _G.Farm and task.wait() do
        if not workspace:FindFirstChild(Target.Text) then
            continue
        else
            local tween = TweenService:Create(Hrp, TweenInfo.new(0.5), {
                CFrame = workspace:FindFirstChild(Target.Text).HumanoidRootPart.CFrame
            })
            tween:Play()
            tween.Completed:Wait()
            click(Mouse)
        end
    end
end)
