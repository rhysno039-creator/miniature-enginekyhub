-- =====================================================================
-- KYZEN HUB - FIXED & OPTIMIZED EXCLUSIVE SCRIPT
-- =====================================================================

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local CoreGui = game:GetService("CoreGui")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local Lighting = game:GetService("Lighting")

-- Hapus UI lama jika ada
if CoreGui:FindFirstChild("KyzenHubExclusive") then
    CoreGui.KyzenHubExclusive:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "KyzenHubExclusive"
ScreenGui.Parent = CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false

-- Ambil Thumbnail Avatar Roblox Player Asli dengan Aman
local success, thumbImage = pcall(function()
    return Players:GetUserThumbnailAsync(LocalPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size150x150)
end)
local avatarImage = success and thumbImage or "rbxassetid://10884221528"

-- Main Frame (Jendela Utama)
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 18, 24)
MainFrame.BorderColor3 = Color3.fromRGB(40, 45, 60)
MainFrame.BorderSizePixel = 1
MainFrame.Position = UDim2.new(0.5, -275, 0.5, -175)
MainFrame.Size = UDim2.new(0, 550, 0, 350)
MainFrame.Active = true
MainFrame.Draggable = true

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 8)
UICorner.Parent = MainFrame

-- Top Bar
local TopBar = Instance.new("Frame")
TopBar.Name = "TopBar"
TopBar.Parent = MainFrame
TopBar.BackgroundColor3 = Color3.fromRGB(20, 24, 33)
TopBar.BorderSizePixel = 0
TopBar.Size = UDim2.new(1, 0, 0, 35)

local TopCorner = Instance.new("UICorner")
TopCorner.CornerRadius = UDim.new(0, 8)
TopCorner.Parent = TopBar

-- Avatar Header Atas
local HeaderAvatar = Instance.new("ImageLabel")
HeaderAvatar.Parent = TopBar
HeaderAvatar.BackgroundTransparency = 1
HeaderAvatar.Position = UDim2.new(0, 8, 0, 7)
HeaderAvatar.Size = UDim2.new(0, 22, 0, 22)
HeaderAvatar.Image = avatarImage

local HeaderAvatarCorner = Instance.new("UICorner")
HeaderAvatarCorner.CornerRadius = UDim.new(1, 0)
HeaderAvatarCorner.Parent = HeaderAvatar

-- Title Hub di Header
local TitleLabel = Instance.new("TextLabel")
TitleLabel.Parent = TopBar
TitleLabel.BackgroundTransparency = 1
TitleLabel.Position = UDim2.new(0, 36, 0, 0)
TitleLabel.Size = UDim2.new(0, 400, 1, 0)
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.Text = LocalPlayer.Name .. " | Kyzen Hub | Delta Ready"
TitleLabel.TextColor3 = Color3.fromRGB(200, 210, 230)
TitleLabel.TextSize = 10
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left

-- Tombol Kontrol Kanan Atas (Close)
local CloseButton = Instance.new("TextButton")
CloseButton.Parent = TopBar
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
CloseButton.BackgroundTransparency = 0.5
CloseButton.Position = UDim2.new(1, -28, 0, 6)
CloseButton.Size = UDim2.new(0, 22, 0, 22)
CloseButton.Font = Enum.Font.GothamBold
CloseButton.Text = "×"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextSize = 14
CloseButton.ZIndex = 5

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 4)
CloseCorner.Parent = CloseButton

CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Tombol Maximize
local MaximizeButton = Instance.new("TextButton")
MaximizeButton.Parent = TopBar
MaximizeButton.BackgroundColor3 = Color3.fromRGB(60, 120, 255)
MaximizeButton.BackgroundTransparency = 0.5
MaximizeButton.Position = UDim2.new(1, -54, 0, 6)
MaximizeButton.Size = UDim2.new(0, 22, 0, 22)
MaximizeButton.Font = Enum.Font.GothamBold
MaximizeButton.Text = "□"
MaximizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MaximizeButton.TextSize = 10
MaximizeButton.ZIndex = 5

local MaxCorner = Instance.new("UICorner")
MaxCorner.CornerRadius = UDim.new(0, 4)
MaxCorner.Parent = MaximizeButton

local isMaximized = false
MaximizeButton.MouseButton1Click:Connect(function()
    isMaximized = not isMaximized
    if isMaximized then
        MainFrame.Size = UDim2.new(0, 750, 0, 500)
    else
        MainFrame.Size = UDim2.new(0, 550, 0, 350)
    end
end)

-- Tombol Minimize
local MinimizeButton = Instance.new("TextButton")
MinimizeButton.Parent = TopBar
MinimizeButton.BackgroundColor3 = Color3.fromRGB(220, 180, 40)
MinimizeButton.BackgroundTransparency = 0.5
MinimizeButton.Position = UDim2.new(1, -80, 0, 6)
MinimizeButton.Size = UDim2.new(0, 22, 0, 22)
MinimizeButton.Font = Enum.Font.GothamBold
MinimizeButton.Text = "-"
MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeButton.TextSize = 12
MinimizeButton.ZIndex = 5

local MinCorner = Instance.new("UICorner")
MinCorner.CornerRadius = UDim.new(0, 4)
MinCorner.Parent = MinimizeButton

local isMinimized = false
MinimizeButton.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized
    MainFrame.Visible = not isMinimized
end)

-- Footer Profile Kiri Bawah
local UserFooter = Instance.new("Frame")
UserFooter.Parent = MainFrame
UserFooter.BackgroundColor3 = Color3.fromRGB(20, 24, 33)
UserFooter.BorderSizePixel = 0
UserFooter.Position = UDim2.new(0, 8, 1, -35)
UserFooter.Size = UDim2.new(0, 135, 0, 28)

local UserFooterCorner = Instance.new("UICorner")
UserFooterCorner.CornerRadius = UDim.new(0, 6)
UserFooterCorner.Parent = UserFooter

local FooterAvatar = Instance.new("ImageLabel")
FooterAvatar.Parent = UserFooter
FooterAvatar.BackgroundTransparency = 1
FooterAvatar.Position = UDim2.new(0, 4, 0, 4)
FooterAvatar.Size = UDim2.new(0, 20, 0, 20)
FooterAvatar.Image = avatarImage

local FooterAvatarCorner = Instance.new("UICorner")
FooterAvatarCorner.CornerRadius = UDim.new(1, 0)
FooterAvatarCorner.Parent = FooterAvatar

local UserLabel = Instance.new("TextLabel")
UserLabel.Parent = UserFooter
UserLabel.BackgroundTransparency = 1
UserLabel.Position = UDim2.new(0, 28, 0, 0)
UserLabel.Size = UDim2.new(1, -30, 1, 0)
UserLabel.Font = Enum.Font.GothamBold
UserLabel.Text = "Welcome, " .. LocalPlayer.Name
UserLabel.TextColor3 = Color3.fromRGB(210, 220, 240)
UserLabel.TextSize = 9
UserLabel.TextXAlignment = Enum.TextXAlignment.Left
UserLabel.TextTruncate = Enum.TextTruncate.AtEnd

-- Sidebar Menu Kiri
local Sidebar = Instance.new("ScrollingFrame")
Sidebar.Parent = MainFrame
Sidebar.BackgroundColor3 = Color3.fromRGB(18, 22, 30)
Sidebar.BorderSizePixel = 0
Sidebar.Position = UDim2.new(0, 8, 0, 42)
Sidebar.Size = UDim2.new(0, 135, 1, -85)
Sidebar.CanvasSize = UDim2.new(0, 0, 0, 350)
Sidebar.ScrollBarThickness = 1

local UIListSidebar = Instance.new("UIListLayout")
UIListSidebar.Parent = Sidebar
UIListSidebar.SortOrder = Enum.SortOrder.LayoutOrder
UIListSidebar.Padding = UDim.new(0, 3)

-- Content Area Kanan
local ContentArea = Instance.new("ScrollingFrame")
ContentArea.Parent = MainFrame
ContentArea.BackgroundColor3 = Color3.fromRGB(18, 22, 30)
ContentArea.BorderSizePixel = 0
ContentArea.Position = UDim2.new(0, 147, 0, 42)
ContentArea.Size = UDim2.new(1, -155, 1, -50)
ContentArea.CanvasSize = UDim2.new(0, 0, 0, 600)
ContentArea.ScrollBarThickness = 3

local UIListContent = Instance.new("UIListLayout")
UIListContent.Parent = ContentArea
UIListContent.SortOrder = Enum.SortOrder.LayoutOrder
UIListContent.Padding = UDim.new(0, 5)

local function clearContent()
    for _, child in ipairs(ContentArea:GetChildren()) do
        if child:IsA("Frame") then
            child:Destroy()
        end
    end
end

-- Helper Komponen UI Kyzen
local function addToggleItem(title, callback)
    local Frame = Instance.new("Frame")
    Frame.Parent = ContentArea
    Frame.BackgroundColor3 = Color3.fromRGB(24, 29, 39)
    Frame.Size = UDim2.new(1, -8, 0, 34)
    
    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 4)
    Corner.Parent = Frame
    
    local Text = Instance.new("TextLabel")
    Text.Parent = Frame
    Text.BackgroundTransparency = 1
    Text.Position = UDim2.new(0, 10, 0, 0)
    Text.Size = UDim2.new(1, -60, 1, 0)
    Text.Font = Enum.Font.GothamMedium
    Text.Text = title
    Text.TextColor3 = Color3.fromRGB(210, 220, 235)
    Text.TextSize = 10
    Text.TextXAlignment = Enum.TextXAlignment.Left
    
    local ToggleBtn = Instance.new("TextButton")
    ToggleBtn.Parent = Frame
    ToggleBtn.BackgroundColor3 = Color3.fromRGB(40, 48, 65)
    ToggleBtn.Position = UDim2.new(1, -45, 0.5, -10)
    ToggleBtn.Size = UDim2.new(0, 36, 0, 20)
    ToggleBtn.Font = Enum.Font.GothamBold
    ToggleBtn.Text = "OFF"
    ToggleBtn.TextColor3 = Color3.fromRGB(180, 190, 210)
    ToggleBtn.TextSize = 9
    
    local TCorner = Instance.new("UICorner")
    TCorner.CornerRadius = UDim.new(1, 0)
    TCorner.Parent = ToggleBtn
    
    local state = false
    ToggleBtn.MouseButton1Click:Connect(function()
        state = not state
        ToggleBtn.Text = state and "ON" or "OFF"
        ToggleBtn.BackgroundColor3 = state and Color3.fromRGB(60, 180, 90) or Color3.fromRGB(40, 48, 65)
        if callback then callback(state) end
    end)
end

local function addSliderInputItem(title, defaultVal, maxLimit, callback)
    local Frame = Instance.new("Frame")
    Frame.Parent = ContentArea
    Frame.BackgroundColor3 = Color3.fromRGB(24, 29, 39)
    Frame.Size = UDim2.new(1, -8, 0, 52)
    
    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 4)
    Corner.Parent = Frame
    
    local Text = Instance.new("TextLabel")
    Text.Parent = Frame
    Text.BackgroundTransparency = 1
    Text.Position = UDim2.new(0, 10, 0, 4)
    Text.Size = UDim2.new(1, -20, 0, 20)
    Text.Font = Enum.Font.GothamMedium
    Text.Text = title .. " (Val: " .. tostring(defaultVal) .. ")"
    Text.TextColor3 = Color3.fromRGB(210, 220, 235)
    Text.TextSize = 10
    Text.TextXAlignment = Enum.TextXAlignment.Left
    
    local TextBox = Instance.new("TextBox")
    TextBox.Parent = Frame
    TextBox.BackgroundColor3 = Color3.fromRGB(35, 42, 58)
    TextBox.Position = UDim2.new(1, -75, 0, 26)
    TextBox.Size = UDim2.new(0, 65, 0, 22)
    TextBox.Font = Enum.Font.Gotham
    TextBox.Text = tostring(defaultVal)
    TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextBox.TextSize = 10
    
    local TB daqui = Instance.new("UICorner")
    TB daqui.CornerRadius = UDim.new(0, 4)
    TB daqui.Parent = TextBox
    
    TextBox.FocusLost:Connect(function()
        local num = tonumber(TextBox.Text)
        if num then
            Text.Text = title .. " (Val: " .. tostring(num) .. ")"
            if callback then callback(num) end
        end
    end)
end

-- ================= MENU & FITUR KHUSUS KYZEN =================
local function loadKyzenCategory(catName)
    clearContent()
    
    if catName == "Movement" then
        addSliderInputItem("Fly Speed", 16, 500, function(v) end)
        addToggleItem("Fly", function(state) end)
        addSliderInputItem("WalkSpeed", 16, 500, function(v)
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                LocalPlayer.Character.Humanoid.WalkSpeed = v
            end
        end)
        addSliderInputItem("Tp Walk", 16, 500, function(v) end)
        addSliderInputItem("Moon Walk", 16, 500, function(v) end)
        addSliderInputItem("Spider Climb Speed", 16, 50, function(v) end)
        addSliderInputItem("Jump Power", 50, 500, function(v)
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
                LocalPlayer.Character.Humanoid.JumpPower = v
            end
        end)
        addToggleItem("Inf Jump", function(state) end)
        addToggleItem("No Clip", function(state) end)
        addToggleItem("Shift Lock Force", function(state) end)
        addToggleItem("No Slow", function(state) end)
        addToggleItem("Bunny Hop", function(state) end)

    elseif catName == "Visual / ESP" then
        addToggleItem("Player ESP", function(state) end)
        addToggleItem("Skeleton ESP", function(state) end)
        addToggleItem("Item / Egg / NPC ESP", function(state) end)
        addToggleItem("Tracers", function(state) end)
        addSliderInputItem("Hitbox Expander", 5, 50, function(v) end)
        addToggleItem("FullBright", function(state) end)
        addToggleItem("X-Ray", function(state) end)
        addSliderInputItem("FOV Changer", 70, 120, function(v)
            workspace.CurrentCamera.FieldOfView = v
        end)
        addToggleItem("Freecam", function(state) end)

    elseif catName == "World / Grafik" then
        addSliderInputItem("Brightness Slider", 1, 20, function(v)
            Lighting.Brightness = v
        end)
        addToggleItem("Anti Lag / FPS Boost", function(state) end)
        addToggleItem("Ghost Other Player", function(state) end)
        addToggleItem("Invisible Self", function(state) end)
        addToggleItem("Ghost Mode", function(state) end)

    elseif catName == "System / Server" then
        addToggleItem("Anti AFK", function(state) end)
        addToggleItem("Anti Kick", function(state) end)
        addToggleItem("Anti Rejoin", function(state) end)
        addToggleItem("Copy Avatar", function(state) end)
        addToggleItem("Save Settingan", function(state) end)
        addToggleItem("Playtime Counter", function(state) end)
        addToggleItem("Ping / FPS Live", function(state) end)

    elseif catName == "Teleport" then
        addToggleItem("List Player", function(state) end)
        addToggleItem("Refresh List Player", function(state) end)
        addToggleItem("Teleport to Player", function(state) end)
        addToggleItem("Save And Teleport (Slot 1-5)", function(state) end)
        addToggleItem("Save And Run (Slot 1-5)", function(state) end)

    elseif catName == "UI Ky Hub" then
        addToggleItem("UI Transparansi Slider", function(state)
            MainFrame.BackgroundTransparency = state and 0.2 or 0
        end)
        addToggleItem("Disable Background Image", function(state) end)
        addToggleItem("Animated Window", function(state) end)
        
        -- Tombol Teks Promosi Aman (Tanpa fungsi setclipboard yang bikin error)
        local PromoBtn = Instance.new("TextButton")
        PromoBtn.Parent = ContentArea
        PromoBtn.BackgroundColor3 = Color3.fromRGB(60, 90, 160)
        PromoBtn.Size = UDim2.new(1, -8, 0, 32)
        PromoBtn.Font = Enum.Font.GothamBold
        PromoBtn.Text = "TikTok: javanese7283"
        PromoBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        PromoBtn.TextSize = 10

    elseif catName == "Extra Features" then
        addToggleItem("Hand Cursor Helper", function(state) end)
        addToggleItem("Spectate Player", function(state) end)
        addToggleItem("Zoom Unlock", function(state) end)
        addToggleItem("Chams", function(state) end)
        addToggleItem("Dash", function(state) end)
        addToggleItem("Wall Hack", function(state) end)
    end
    
    ContentArea.CanvasSize = UDim2.new(0, 0, 0, (#ContentArea:GetChildren() * 42))
end

-- Daftar Menu Laci Kiri
local function createSidebarButton(name, order)
    local Btn = Instance.new("TextButton")
    Btn.Parent = Sidebar
    Btn.BackgroundColor3 = Color3.fromRGB(22, 27, 36)
    Btn.Size = UDim2.new(1, -6, 0, 28)
    Btn.Font = Enum.Font.GothamMedium
    Btn.Text = "  " .. name
    Btn.TextColor3 = Color3.fromRGB(180, 190, 210)
    Btn.TextSize = 10
    Btn.TextXAlignment = Enum.TextXAlignment.Left
    Btn.LayoutOrder = order
    
    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 4)
    Corner.Parent = Btn
    
    Btn.MouseButton1Click:Connect(function()
        loadKyzenCategory(name)
    end)
end

createSidebarButton("Movement", 1)
createSidebarButton("Visual / ESP", 2)
createSidebarButton("World / Grafik", 3)
createSidebarButton("System / Server", 4)
createSidebarButton("Teleport", 5)
createSidebarButton("UI Ky Hub", 6)
createSidebarButton("Extra Features", 7)

-- Default Buka Kategori Pertama
loadKyzenCategory("Movement")
