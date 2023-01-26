_G.SETTINGS = {
    Farm = _G.Farm or false,
    Sell = _G.AutoSell or false
}

local Players = game:GetService"Players"
local Player = Players.LocalPlayer

local Character = Player.Character

local harvest = {}
harvest[1] = {}

while _G.SETTINGS.Farm and task.wait() do
    Character:PivotTo(CFrame.new(124, 46, -174))
    for _, v in next, workspace:GetChildren() do
       if v:IsA("Model") and v:FindFirstChildWhichIsA("Vector3Value", true) then
           if #harvest[1] >= 6 then -- Anti - cheat detection ( kicks you if too many wheat is collected at once. )
               game:GetService("ReplicatedStorage").RemoteEvents.Harvest:FireServer(unpack(harvest))
               table.clear(harvest[1])
           end
           harvest[1][#harvest[1] + 1] = v:FindFirstChildWhichIsA("Vector3Value", true)
       end
    end
    if _G.SETTINGS.Sell then
        Character:PivotTo(CFrame.new(99, 46, -430))
    end
end
