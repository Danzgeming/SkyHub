local UI_Library = {}

function UI_Library:CreateFrame(parent, size, position, bgColor)
    local frame = Instance.new("Frame")
    frame.Size = size or UDim2.new(0.3, 0, 0.3, 0)
    frame.Position = position or UDim2.new(0.35, 0, 0.35, 0)
    frame.BackgroundColor3 = bgColor or Color3.fromRGB(30, 30, 30)
    frame.BackgroundTransparency = 0.2
    frame.BorderSizePixel = 0
    frame.Parent = parent

    local uiCorner = Instance.new("UICorner", frame)
    uiCorner.CornerRadius = UDim.new(0, 10)

    return frame
end

function UI_Library:CreateButton(parent, text, callback)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0.8, 0, 0.2, 0)
    button.Position = UDim2.new(0.1, 0, 0.6, 0)
    button.BackgroundColor3 = Color3.fromRGB(50, 150, 250)
    button.Text = text or "Click Me"
    button.Font = Enum.Font.GothamBold
    button.TextSize = 16
    button.Parent = parent

    local uiCorner = Instance.new("UICorner", button)
    uiCorner.CornerRadius = UDim.new(0, 8)

    button.MouseButton1Click:Connect(function()
        if callback then
            callback()
        end
    end)

    return button
end

function UI_Library:CreateNotif(text, duration)
    local screenGui = Instance.new("ScreenGui", game.Players.LocalPlayer.PlayerGui)
    local frame = self:CreateFrame(screenGui, UDim2.new(0.3, 0, 0.1, 0), UDim2.new(0.35, 0, 0.1, 0), Color3.fromRGB(0, 0, 0))
    
    local label = Instance.new("TextLabel", frame)
    label.Size = UDim2.new(1, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.Text = text or "Notification"
    label.Font = Enum.Font.Gotham
    label.TextSize = 16
    label.TextColor3 = Color3.fromRGB(255, 255, 255)

    game:GetService("TweenService"):Create(
        frame,
        TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),
        {Position = UDim2.new(0.35, 0, 0.05, 0)}
    ):Play()

    task.wait(duration or 2)

    game:GetService("TweenService"):Create(
        frame,
        TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),
        {Position = UDim2.new(0.35, 0, -0.2, 0)}
    ):Play()

    task.wait(0.5)
    screenGui:Destroy()
end

return UI_Library
