local UI = {}

local TweenService = game:GetService("TweenService")

-- Buat Window Utama
function UI:MakeWindow(config)
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = config.Name or "CustomUI"
    screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0.3, 0, 0.4, 0)
    frame.Position = UDim2.new(0.35, 0, 0.3, 0)
    frame.BackgroundTransparency = 0.2
    frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    frame.BorderSizePixel = 0
    frame.Parent = screenGui

    -- Tambahkan Efek Glow
    local stroke = Instance.new("UIStroke", frame)
    stroke.Thickness = 3
    stroke.Color = Color3.fromRGB(100, 100, 255)
    stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

    return frame
end

-- Buat Tab Baru
function UI:MakeTab(config)
    local tab = Instance.new("Frame")
    tab.Size = UDim2.new(1, 0, 0.1, 0)
    tab.BackgroundTransparency = 1
    tab.Parent = config.Parent

    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1, 0, 1, 0)
    textLabel.Text = config.Name or "Tab"
    textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    textLabel.Font = Enum.Font.GothamBold
    textLabel.TextSize = 20
    textLabel.BackgroundTransparency = 1
    textLabel.Parent = tab

    return tab
end

-- Buat Tombol
function UI:AddButton(config)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0.8, 0, 0.2, 0)
    button.Position = UDim2.new(0.1, 0, 0.3, 0)
    button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    button.Text = config.Name or "Button"
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Font = Enum.Font.GothamBold
    button.TextSize = 18
    button.Parent = config.Parent

    -- Animasi Hover
    button.MouseEnter:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(80, 80, 255)}):Play()
    end)

    button.MouseLeave:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(50, 50, 50)}):Play()
    end)

    button.MouseButton1Click:Connect(function()
        if config.Callback then
            config.Callback()
        end
    end)

    return button
end

return UI
