-- =====================================================================
-- KYZEN HUB v2 - MOVEMENT MENU (Rayfield)
-- =====================================================================

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local LocalPlayer = Players.LocalPlayer
local Camera = Workspace.CurrentCamera

local Window = Rayfield:CreateWindow({
   Name = "KYZEN HUB v2 | Movement Menu",
   LoadingTitle = "KYZEN HUB",
   LoadingSubtitle = "Movement Module",
   ConfigurationSaving = { Enabled = false }
})

local MoveTab = Window:CreateTab("Movement", 4483345998)
MoveTab:CreateSection("Complete Movement Controls (ON/OFF & Custom Input)")

-- 1. CFrame Fly
getgenv().FlyEnabled = false
getgenv().FlySpeed = 50
local flyConnection

MoveTab:CreateToggle({
   Name = "CFrame Fly [ON/OFF]",
   CurrentValue = false,
   Flag = "FlyToggle",
   Callback = function(Value)
      getgenv().FlyEnabled = Value
      if Value then
         local bodyGyro = Instance.new("BodyGyro")
         local bodyVelocity = Instance.new("BodyVelocity")
         bodyGyro.P = 9e4
         bodyGyro.maxTorque = Vector3.new(9e9, 9e9, 9e9)
         
         flyConnection = RunService.RenderStepped:Connect(function()
            if not getgenv().FlyEnabled then 
               bodyGyro:Destroy()
               bodyVelocity:Destroy()
               if flyConnection then flyConnection:Disconnect() end
               return 
            end
            
            local char = LocalPlayer.Character
            if char and char:FindFirstChild("HumanoidRootPart") and char:FindFirstChild("Humanoid") then
               local hrp = char.HumanoidRootPart
               bodyGyro.CFrame = Camera.CFrame
               bodyVelocity.velocity = Vector3.new(0, 0, 0)
               
               local moveDir = char.Humanoid.MoveDirection
               hrp.CFrame = hrp.CFrame + (Camera.CFrame.LookVector * moveDir.Z * (getgenv().FlySpeed / 10)) + (Camera.CFrame.RightVector * moveDir.X * (getgenv().FlySpeed / 10))
            end
         end)
      end
   end,
})

MoveTab:CreateInput({
   Name = "CFrame Fly Speed (Ketik Angka / No Limit)",
   PlaceholderText = "Contoh: 50, 100, 500...",
   RemoveTextAfterFocusLost = false,
   Callback = function(Text)
      local num = tonumber(Text)
      if num then getgenv().FlySpeed = num end
   end,
})

-- 2. Walk Speed
getgenv().WalkSpeedEnabled = false
getgenv().CustomWalkSpeed = 50

MoveTab:CreateToggle({
   Name = "Walk Speed Boost [ON/OFF]",
   CurrentValue = false,
   Flag = "SpeedToggle",
   Callback = function(Value)
      getgenv().WalkSpeedEnabled = Value
      if not Value and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
         LocalPlayer.Character.Humanoid.WalkSpeed = 16
      end
   end,
})

MoveTab:CreateInput({
   Name = "Walk Speed (Ketik Angka / No Limit)",
   PlaceholderText = "Ketik angka speed...",
   RemoveTextAfterFocusLost = false,
   Callback = function(Text)
      local num = tonumber(Text)
      if num then
         getgenv().CustomWalkSpeed = num
         if getgenv().WalkSpeedEnabled and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid.WalkSpeed = num
         end
      end
   end,
})

-- 3. TP Walk
getgenv().TPWalkEnabled = false
getgenv().TPWalkSpeed = 20

RunService.RenderStepped:Connect(function()
   if getgenv().TPWalkEnabled and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and LocalPlayer.Character:FindFirstChild("Humanoid") then
      local humanoid = LocalPlayer.Character.Humanoid
      local hrp = LocalPlayer.Character.HumanoidRootPart
      if humanoid.MoveDirection.Magnitude > 0 then
         hrp.CFrame = hrp.CFrame + (humanoid.MoveDirection * (getgenv().TPWalkSpeed / 50))
      end
   end
end)

MoveTab:CreateToggle({
   Name = "TP Walk [ON/OFF]",
   CurrentValue = false,
   Flag = "TPWalkToggle",
   Callback = function(Value)
      getgenv().TPWalkEnabled = Value
   end,
})

MoveTab:CreateInput({
   Name = "TP Walk Speed (Ketik Angka / No Limit)",
   PlaceholderText = "Ketik angka TP speed...",
   RemoveTextAfterFocusLost = false,
   Callback = function(Text)
      local num = tonumber(Text)
      if num then getgenv().TPWalkSpeed = num end
   end,
})

-- 4. Moon Walk
getgenv().MoonWalkEnabled = false
getgenv().MoonWalkGravity = 30

MoveTab:CreateToggle({
   Name = "Moon Walk [ON/OFF]",
   CurrentValue = false,
   Flag = "MoonWalkToggle",
   Callback = function(Value)
      getgenv().MoonWalkEnabled = Value
      if Value then
         Workspace.Gravity = getgenv().MoonWalkGravity
      else
         Workspace.Gravity = 196.2
      end
   end,
})

MoveTab:CreateInput({
   Name = "Moon Walk Gravity (Ketik Angka / Semakin kecil makin melayang)",
   PlaceholderText = "Contoh: 30, 10, 5...",
   RemoveTextAfterFocusLost = false,
   Callback = function(Text)
      local num = tonumber(Text)
      if num then
         getgenv().MoonWalkGravity = num
         if getgenv().MoonWalkEnabled then
            Workspace.Gravity = num
         end
      end
   end,
})

-- 5. Spider Climb
getgenv().SpiderEnabled = false
RunService.Stepped:Connect(function()
   if getgenv().SpiderEnabled and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
      local hrp = LocalPlayer.Character.HumanoidRootPart
      local ray = Ray.new(hrp.Position, hrp.CFrame.LookVector * 2)
      local hit = Workspace:FindPartOnRay(ray, LocalPlayer.Character)
      if hit then
         hrp.Velocity = Vector3.new(hrp.Velocity.X, 50, hrp.Velocity.Z)
      end
   end
end)

MoveTab:CreateToggle({
   Name = "Spider Climb [ON/OFF]",
   CurrentValue = false,
   Flag = "SpiderToggle",
   Callback = function(Value)
      getgenv().SpiderEnabled = Value
   end,
})

-- 6. Jump Power & Inf Jump
getgenv().JumpPowerEnabled = false

MoveTab:CreateToggle({
   Name = "Custom Jump Power [ON/OFF]",
   CurrentValue = false,
   Flag = "JumpToggle",
   Callback = function(Value)
      getgenv().JumpPowerEnabled = Value
   end,
})

MoveTab:CreateInput({
   Name = "Jump Power Value (Ketik Angka / No Limit)",
   PlaceholderText = "Contoh: 100, 300...",
   RemoveTextAfterFocusLost = false,
   Callback = function(Text)
      local num = tonumber(Text)
      if num and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
         LocalPlayer.Character.Humanoid.JumpPower = num
         LocalPlayer.Character.Humanoid.UseJumpPower = true
      end
   end,
})

getgenv().InfJumpEnabled = false
UserInputService.JumpRequest:Connect(function()
   if getgenv().InfJumpEnabled and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
      LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
   end
end)

MoveTab:CreateToggle({
   Name = "Inf Jump [ON/OFF]",
   CurrentValue = false,
   Flag = "InfJumpToggle",
   Callback = function(Value)
      getgenv().InfJumpEnabled = Value
   end,
})

-- 7. No Clip
getgenv().NoClipEnabled = false
RunService.Stepped:Connect(function()
   if getgenv().NoClipEnabled and LocalPlayer.Character then
      for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
         if part:IsA("BasePart") then
            part.CanCollide = false
         end
      end
   end
end)

MoveTab:CreateToggle({
   Name = "No Clip [ON/OFF]",
   CurrentValue = false,
   Flag = "NoClipToggle",
   Callback = function(Value)
      getgenv().NoClipEnabled = Value
   end,
})

-- 8. Shift Lock Force
getgenv().ShiftLockForced = false
RunService.RenderStepped:Connect(function()
   if getgenv().ShiftLockForced then
      LocalPlayer.DevEnableMouseLock = true
   end
end)

MoveTab:CreateToggle({
   Name = "Shift Lock Force [ON/OFF]",
   CurrentValue = false,
   Flag = "ShiftLockToggle",
   Callback = function(Value)
      getgenv().ShiftLockForced = Value
   end,
})

-- 9. No Slow
getgenv().NoSlowEnabled = false
RunService.Stepped:Connect(function()
   if getgenv().NoSlowEnabled and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
      LocalPlayer.Character.Humanoid.WalkSpeed = getgenv().WalkSpeedEnabled and getgenv().CustomWalkSpeed or 16
   end
end)

MoveTab:CreateToggle({
   Name = "No Slow [ON/OFF]",
   CurrentValue = false,
   Flag = "NoSlowToggle",
   Callback = function(Value)
      getgenv().NoSlowEnabled = Value
   end,
})

-- 10. Bunny Hop
getgenv().BunnyHopEnabled = false
RunService.RenderStepped:Connect(function()
   if getgenv().BunnyHopEnabled and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
      local humanoid = LocalPlayer.Character.Humanoid
      if humanoid.FloorMaterial ~= Enum.Material.Air then
         humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
      end
   end
end)

MoveTab:CreateToggle({
   Name = "Bunny Hop [ON/OFF]",
   CurrentValue = false,
   Flag = "BunnyHopToggle",
   Callback = function(Value)
      getgenv().BunnyHopEnabled = Value
   end,
})

Rayfield:Notify({
   Title = "Menu Movement Siap!",
   Content = "Semua fitur movement sudah diperbaiki dengan sistem On/Off dan Input angka.",
   Duration = 5,
})
