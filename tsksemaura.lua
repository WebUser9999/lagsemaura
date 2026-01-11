--// LAG SEM AURA | VISUAL ONLY | ON/OFF

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local player = Players.LocalPlayer

-- GUI
local gui = Instance.new("ScreenGui")
gui.Name = "LagSemAuraUI"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

-- FRAME PRINCIPAL
local Main = Instance.new("Frame")
Main.Size = UDim2.new(0, 260, 0, 150)
Main.Position = UDim2.new(0.1, 0, 0.4, 0)
Main.BackgroundColor3 = Color3.fromRGB(40, 45, 150) -- Azul
Main.BorderSizePixel = 0
Main.Parent = gui

local corner = Instance.new("UICorner", Main)
corner.CornerRadius = UDim.new(0, 16)

-- BORDA BRILHO (simples)
local Stroke = Instance.new("UIStroke", Main)
Stroke.Thickness = 2
Stroke.Color = Color3.fromRGB(0, 255, 200)
Stroke.Transparency = 0.2

-- ================= DRAG =================
do
    local dragging = false
    local dragStart, startPos

    Main.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = Main.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    UIS.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement
        or input.UserInputType == Enum.UserInputType.Touch) then
            local delta = input.Position - dragStart
            Main.Position = UDim2.new(
                startPos.X.Scale,
                startPos.X.Offset + delta.X,
                startPos.Y.Scale,
                startPos.Y.Offset + delta.Y
            )
        end
    end)
end
-- ========================================

-- TÍTULO
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 36)
Title.BackgroundTransparency = 1
Title.Text = "Lag Sem Aura"
Title.Font = Enum.Font.GothamBold
Title.TextSize = 20
Title.TextColor3 = Color3.fromRGB(255,255,255)
Title.Parent = Main

-- SUBTÍTULO
local Sub = Instance.new("TextLabel")
Sub.Size = UDim2.new(1, 0, 0, 18)
Sub.Position = UDim2.new(0, 0, 0, 34)
Sub.BackgroundTransparency = 1
Sub.Text = "by ServerSadzz"
Sub.Font = Enum.Font.Gotham
Sub.TextSize = 12
Sub.TextColor3 = Color3.fromRGB(200,200,200)
Sub.Parent = Main

-- BOTÃO ON/OFF
local Toggle = Instance.new("TextButton")
Toggle.Size = UDim2.new(1, -30, 0, 50)
Toggle.Position = UDim2.new(0, 15, 0, 80)
Toggle.BackgroundColor3 = Color3.fromRGB(60, 70, 180)
Toggle.Text = "Lag OFF"
Toggle.Font = Enum.Font.GothamBold
Toggle.TextSize = 18
Toggle.TextColor3 = Color3.fromRGB(255,255,255)
Toggle.AutoButtonColor = false
Toggle.Parent = Main

local tCorner = Instance.new("UICorner", Toggle)
tCorner.CornerRadius = UDim.new(0, 14)

-- TOGGLE VISUAL
local enabled = false
Toggle.MouseButton1Click:Connect(function()
    enabled = not enabled
    if enabled then
        Toggle.Text = "Lag ON 😈"
        Toggle.BackgroundColor3 = Color3.fromRGB(0, 180, 120)
    else
        Toggle.Text = "Lag OFF"
        Toggle.BackgroundColor3 = Color3.fromRGB(60, 70, 180)
    end
end)
