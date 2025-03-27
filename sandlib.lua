local SandLib = {}

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Fungsi buat Window UI
function SandLib:MakeWindow(config)
    local screenGui = Instance.new("ScreenGui", LocalPlayer:FindFirstChild("PlayerGui") or LocalPlayer:WaitForChild("PlayerGui"))

    local window = Instance.new("Frame")
    window.Size = UDim2.new(0.3, 0, 0.4, 0)
    window.Position = UDim2.new(0.35, 0, 0.3, 0)
    window.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    window.BackgroundTransparency = 0.2
    window.Parent = screenGui

    local uiCorner = Instance.new("UICorner", window)
    uiCorner.CornerRadius = UDim.new(0, 10)

    local titleLabel = Instance.new("TextLabel", window)
    titleLabel.Size = UDim2.new(1, 0, 0.15, 0)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = config.Name or "SandLib UI"
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.TextSize = 20
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.Parent = window

    return window
end

-- Fungsi buat Tab
function SandLib:MakeTab(config)
    local tab = Instance.new("Frame")
    tab.Size = UDim2.new(1, 0, 0.85, 0)
    tab.BackgroundTransparency = 1
    tab.Parent = config.Parent

    return tab
end

-- Fungsi buat Tombol
function SandLib:AddButton(config)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0.8, 0, 0.15, 0)
    button.Position = UDim2.new(0.1, 0, 0, 0)
    button.BackgroundColor3 = Color3.fromRGB(50, 150, 250)
    button.Text = config.Name or "Click"
    button.Font = Enum.Font.GothamBold
    button.TextSize = 16
    button.Parent = config.Parent

    local uiCorner = Instance.new("UICorner", button)
    uiCorner.CornerRadius = UDim.new(0, 8)

    button.MouseButton1Click:Connect(function()
        if config.Callback then
            config.Callback()
        end
    end)

    return button
end

-- Fungsi buat Slider
function SandLib:AddSlider(config)
    local sliderFrame = Instance.new("Frame")
    sliderFrame.Size = UDim2.new(0.8, 0, 0.1, 0)
    sliderFrame.Position = UDim2.new(0.1, 0, 0, 0)
    sliderFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    sliderFrame.Parent = config.Parent

    local slider = Instance.new("TextButton")
    slider.Size = UDim2.new(0, 20, 1, 0)
    slider.BackgroundColor3 = Color3.fromRGB(50, 150, 250)
    slider.Parent = sliderFrame

    slider.MouseButton1Down:Connect(function()
        local mouse = LocalPlayer:GetMouse()
        local min = sliderFrame.AbsolutePosition.X
        local max = min + sliderFrame.AbsoluteSize.X

        while game:GetService("UserInputService"):IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
            local percent = math.clamp((mouse.X - min) / (max - min), 0, 1)
            slider.Size = UDim2.new(percent, 0, 1, 0)

            if config.Callback then
                config.Callback(math.floor(percent * (config.Max or 100)))
            end
            wait()
        end
    end)

    return slider
end

-- Fungsi buat Toggle
function SandLib:AddToggle(config)
    local toggleButton = Instance.new("TextButton")
    toggleButton.Size = UDim2.new(0.8, 0, 0.1, 0)
    toggleButton.Position = UDim2.new(0.1, 0, 0, 0)
    toggleButton.BackgroundColor3 = Color3.fromRGB(150, 50, 50)
    toggleButton.Text = "OFF"
    toggleButton.Parent = config.Parent

    local uiCorner = Instance.new("UICorner", toggleButton)
    uiCorner.CornerRadius = UDim.new(0, 8)

    local state = false
    toggleButton.MouseButton1Click:Connect(function()
        state = not state
        toggleButton.BackgroundColor3 = state and Color3.fromRGB(50, 150, 250) or Color3.fromRGB(150, 50, 50)
        toggleButton.Text = state and "ON" or "OFF"

        if config.Callback then
            config.Callback(state)
        end
    end)

    return toggleButton
end

return SandLib
