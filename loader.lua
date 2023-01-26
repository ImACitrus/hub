-- Content --
local results = game:GetService"HttpService":JSONDecode( game:HttpGet("https://raw.githubusercontent.com/ImACitrus/hub/main/games.json") )

-- Information --
_G.INFORMATION = {
    Name = "Uknown",
    Id = 0,
    IsSupported = false
}

-- Gather Information --
for name, id in next, results.games do
    if id == game.PlaceId then
        rawset(_G.INFORMATION, "Name", name)
        rawset(_G.INFORMATION, "Id", id)
        rawset(_G.INFORMATION, "IsSupported", true)
    end
end

-- Init --
if _G.INFORMATION.IsSupported then
    loadstring(game:HttpGet(("https://raw.githubusercontent.com/ImACitrus/hub/main/%s.lua"):format(tostring(_G.INFORMATION.Id))))()
end

--[[
DEBUG:
-- Console --
warn(("Place: %s\nPlaceId: %s\nSupported: %s\n"):format(_G.INFORMATION.Name, _G.INFORMATION.Id, tostring(_G.INFORMATION.IsSupported)))
]]
