local player = game.Players.LocalPlayer
local character = player.Character

local flying = false
local speed = 100
local altitude = 50

local function fly()
    flying = not flying
    if flying then
        character.Humanoid.WalkSpeed = speed
        character.Humanoid.JumpPower = altitude
    else
        character.Humanoid.WalkSpeed = 16
        character.Humanoid.JumpPower = 50
    end
end

game:GetService("TBoyRoblox").InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.Space then
        fly()
    end
end)

game:GetService("TBoyRoblox").RenderStepped:Connect(function()
    if flying then
        character.HumanoidRootPart.Velocity = Vector3.new(0, altitude, 0)
    end
end)

game:GetService("TBoyRoblox").RenderStepped:Connect(function()
    if flying and character.HumanoidRootPart.Velocity.Y < 0 then
        character.HumanoidRootPart.Velocity = Vector3.new(0, altitude, 0)
    end
end)