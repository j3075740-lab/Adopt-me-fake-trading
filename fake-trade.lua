-- Joey's Fake Trade Simulator v2 (Custom Username + Both Sides)
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.ResetOnSpawn = false
ScreenGui.DisplayOrder = 999
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

local Main = Instance.new("Frame")
Main.Size = UDim2.new(0, 380, 0, 520)
Main.Position = UDim2.new(0.5, -190, 0.5, -260)
Main.BackgroundColor3 = Color3.fromRGB(18, 18, 25)
Main.BorderSizePixel = 0
Main.Parent = ScreenGui

local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0, 14)
Corner.Parent = Main

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 50)
Title.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
Title.Text = "TRADE CONTROL"
Title.TextColor3 = Color3.new(1,1,1)
Title.TextScaled = true
Title.Font = Enum.Font.GothamBold
Title.Parent = Main

-- Other Player Username
local UsernameBox = Instance.new("TextBox")
UsernameBox.Size = UDim2.new(0.85, 0, 0, 40)
UsernameBox.Position = UDim2.new(0.075, 0, 0.13, 0)
UsernameBox.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
UsernameBox.Text = "OtherPlayer123"
UsernameBox.TextColor3 = Color3.new(1,1,1)
UsernameBox.TextScaled = true
UsernameBox.Font = Enum.Font.Gotham
UsernameBox.Parent = Main

local SetBtn = Instance.new("TextButton")
SetBtn.Size = UDim2.new(0.4, 0, 0, 35)
SetBtn.Position = UDim2.new(0.55, 0, 0.13, 0)
SetBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
SetBtn.Text = "Set Username"
SetBtn.TextColor3 = Color3.new(1,1,1)
SetBtn.TextScaled = true
SetBtn.Font = Enum.Font.Gotham
SetBtn.Parent = Main

-- Start Trade
local StartBtn = Instance.new("TextButton")
StartBtn.Size = UDim2.new(0.9, 0, 0, 55)
StartBtn.Position = UDim2.new(0.05, 0, 0.23, 0)
StartBtn.BackgroundColor3 = Color3.fromRGB(80, 200, 80)
StartBtn.Text = "START TRADE (5)"
StartBtn.TextColor3 = Color3.new(1,1,1)
StartBtn.TextScaled = true
StartBtn.Font = Enum.Font.GothamBold
StartBtn.Parent = Main

-- Add Pet
local AddBtn = Instance.new("TextButton")
AddBtn.Size = UDim2.new(0.43, 0, 0, 50)
AddBtn.Position = UDim2.new(0.05, 0, 0.38, 0)
AddBtn.BackgroundColor3 = Color3.fromRGB(255, 140, 0)
AddBtn.Text = "ADD PET"
AddBtn.TextColor3 = Color3.new(1,1,1)
AddBtn.TextScaled = true
AddBtn.Font = Enum.Font.GothamBold
AddBtn.Parent = Main

-- Remove Pet
local RemoveBtn = Instance.new("TextButton")
RemoveBtn.Size = UDim2.new(0.43, 0, 0, 50)
RemoveBtn.Position = UDim2.new(0.52, 0, 0.38, 0)
RemoveBtn.BackgroundColor3 = Color3.fromRGB(200, 40, 40)
RemoveBtn.Text = "REMOVE PET"
RemoveBtn.TextColor3 = Color3.new(1,1,1)
RemoveBtn.TextScaled = true
RemoveBtn.Font = Enum.Font.GothamBold
RemoveBtn.Parent = Main

-- Draggable
local dragging = false
local dragStart
local startPos

Title.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = Main.Position
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        Main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)

-- Set username function
SetBtn.MouseButton1Click:Connect(function()
    print("Other player username set to: " .. UsernameBox.Text)
end)

print("✅ Joey's Fake Trade Simulator loaded - control both sides")
