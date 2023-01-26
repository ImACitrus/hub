_G.SETTINGS = {
    Farm = _G.Farm or false,
    Sell = _G.AutoSell or false
}

local Players = game:GetService"Players"
local Player = Players.LocalPlayer

local Character = Player.Character

function fireServer(event, ...)
    event:FireServer(unpack({...}))
    return {
        andThen = function(callback)
            callback()
        end
    }
end

local harvest = {}
harvest[1] = {}

while _G.SETTINGS.Farm and task.wait() do
    for _, v in next, workspace:GetChildren() do
        if v:IsA"Model" and v:FindFirstChild("Vector3Value", true) then
            while #harvest[1] >= 6 do
                fireServer(game:GetService"ReplicatedStorage".RemoteEvents.Harvest, harvest).andThen(function()
                    table.clear(harvest)
                end)
                task.wait(10)
            end
            harvest[1][#harvest[1] + 1] = v:FindFirstChildWhichIsA("Vector3Value", true)
        end
    end
    if _G.SETTINGS.Sell then
        local old_cframe = Character:GetPivot()
        Character:PivotTo(CFrame.new(99, 46, -430))
        task.delay(0.5, function()
            Character:PivotTo(old_cframe)
        end)
    end
end