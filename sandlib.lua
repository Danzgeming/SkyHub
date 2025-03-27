local UI = {}

function UI:CreateFrame(parent, size, position, transparency, color)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(size.X, 0, size.Y, 0)
    frame.Position = UDim2.new(position.X, 0, position.Y, 0)
    frame.BackgroundTransparency = transparency or 0
    frame.BackgroundColor3 = color or Color3.fromRGB(25, 25, 25)
    frame.BorderSizePixel = 0
    frame.Parent = parent

    -- Tambahkan UIStroke agar ada efek glowing
    local stroke = Instance.new("UIStroke", frame)
    stroke.Thickness = 2
    stroke.Color = Color3.fromRGB(100, 100, 255)
    stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

    return frame
end

function UI:CreateButton(parent, size, position, text)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(size.X, 0, size.Y, 0)
    button.Position = UDim2.new(position.X, 0, position.Y, 0)
    button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    button.Text = text or "Click Me"
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Font = Enum.Font.GothamBold
    button.TextSize = 18
    button.AutoButtonColor = false
    button.Parent = parent

    -- Tambahkan animasi hover
    button.MouseEnter:Connect(function()
        game:GetService("TweenService"):Create(
            button,
            TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {BackgroundColor3 = Color3.fromRGB(80, 80, 255)}
        ):Play()
    end)

    button.MouseLeave:Connect(function()
        game:GetService("TweenService"):Create(
            button,
            TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {BackgroundColor3 = Color3.fromRGB(50, 50, 50)}
        ):Play()
    end)

    return button
end

function UI:CreateTextLabel(parent, size, position, text)
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(size.X, 0, size.Y, 0)
    label.Position = UDim2.new(position.X, 0, position.Y, 0)
    label.BackgroundTransparency = 1
    label.Text = text or "Modern UI"
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.Font = Enum.Font.GothamBold
    label.TextSize = 22
    label.Parent = parent

    -- Tambahkan efek gradient pada teks
    local gradient = Instance.new("UIGradient", label)
    gradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 255, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 255))
    }

    return label
end

return UI
