local engine = loadstring(game:HttpGet("https://raw.githubusercontent.com/RobloxAvatar/Pet-Simulator-X/main/Engine.lua"))()

engine.MakeNotification("Pet Simulator X, Please hatch any egg!", 3)

wait(3)

local remote
local ready
local eggtype

local gmt = getrawmetatable(game)
setreadonly(gmt, false)
local oldNamecall = gmt.__namecall

gmt.__namecall = newcclosure(function(self, ...)
    local Args = {...}
    if tostring(self) == "RemoteFunction" and string.find(Args[1], "Egg") then
        remote = self
        ready = true
        eggtype = Args[1]
    end
    return oldNamecall(self, ...)
end)
setreadonly(gmt, true)

repeat wait() until ready == true

ready = false

_G.AutoOpenEgg = false

local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/RobloxAvatar/uiLibary/main/Uilib.lua')))()

local w = library:CreateWindow("Pet Simulator X")
local MainTab = w:CreateFolder("Main")

MainTab:Toggle("Auto Open Egg", function(bool)
    _G.AutoOpenEgg = bool
    if bool then
        for i,v in pairs(getgc(true)) do
            if (typeof(v) == 'table' and rawget(v, 'OpenEgg')) then
                v.OpenEgg = function()
                    return
                end
            end
        end
    end
end)

local count = 0

spawn(function()
    while task.wait(60) do
        if _G.AutoOpenEgg then
            engine.MakeNotification("Pet Simulator X, the script has opened the egg " .. count .. " times!", 5)
        end
    end
end)

spawn(function()
    while task.wait(3.5) do
        if _G.AutoOpenEgg then
            remote:InvokeServer(eggtype, false ,false)
            count = count + 1
        end
    end
end)
