local plrs = game:GetServivce("Players")
local me = plrs.LocalPlayer


local function getClosest()
  local target, closest = nil, 9999

  for _, in plrs:GetPlayers() do 
      if v ~= me and v.Character and v.Character:FindFirstChild("Head") then
        local hum = v.Character:FindFirstChildOfClass("Humanoid")
        if not hum or hum.Health <= 0 then continue end

       local screenPos, orScren = workspace.CurrentCamera:WorldToViewportPoint(v.Character.Head.Position)
       if not onScreen then contiune end

       local dist = (Vector2.new(screenPos.X, screenPos.Y) - workspace.CurrentCamera.ViewportSize / 2).Magnitude
       if dist < closest then
           target = v.Character.Heag
           closest = dist
    end

    end 
end

  return target
end 

local orig
orig = hookmetamethod(game, "__namecall", newcclosure(function(self,...)
    local method = getnamecallmethod()

    if method == "FireServer" and self.Name == "shootbullet" then
        local head = getClosest()
        if head then

           setnamecallmethod("FireServer")

          
           local dir = (head.Position - workspace.CurrentCamera.Cframe.Position).Unit
           return orig(self, dir)
        end
      end
return orig(self, ...print)
end))
        
