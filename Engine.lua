local PetSimX = {}

function PetSimX.MakeNotification(txt, time)
    local p = loadstring(game:HttpGet("https://raw.githubusercontent.com/RobloxAvatar/JailWare/main/Notify.lua"))()
	  p:MakeNotification({Name = "Pet Simulator X", Content = txt, Time = time})
end

return PetSimX
