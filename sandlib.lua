local SandLib = {}

function SandLib:MakeWindow(config)
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = config.Name or "Sand Hub"
    ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

    local MainFrame = Instance.new("Frame")
    MainFrame.Size = UDim2.new(0, 500, 0, 400)
    MainFrame.Position = UDim2.new(0.5, -250, 0.5, -200)
    MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
    MainFrame.BorderSizePixel = 0
    MainFrame.Active = true
    MainFrame.Draggable = true
    MainFrame.Parent = ScreenGui

    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 10)
    UICorner.Parent = MainFrame

    -- Header Bar
    local Title = Instance.new("TextLabel")
    Title.Size = UDim2.new(1, -40, 0, 40)
    Title.Position = UDim2.new(0, 0, 0, 0)
    Title.Text = config.Name or "Sand Hub"
    Title.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.Font = Enum.Font.GothamBold
    Title.TextSize = 22
    Title.Parent = MainFrame

    local CloseButton = Instance.new("TextButton")
    CloseButton.Size = UDim2.new(0, 40, 0, 40)
    CloseButton.Position = UDim2.new(1, -40, 0, 0)
    CloseButton.Text = "X"
    CloseButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
    CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    CloseButton.Font = Enum.Font.GothamBold
    CloseButton.TextSize = 22
    CloseButton.Parent = MainFrame

    local UICornerClose = Instance.new("UICorner")
    UICornerClose.CornerRadius = UDim.new(0, 10)
    UICornerClose.Parent = CloseButton

    CloseButton.MouseEnter:Connect(function()
        CloseButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
    end)
    CloseButton.MouseLeave:Connect(function()
        CloseButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
    end)

    CloseButton.MouseButton1Click:Connect(function()
        ScreenGui:Destroy()
    end)

    local TabsContainer = Instance.new("Frame")
    TabsContainer.Size = UDim2.new(0, 130, 1, -40)
    TabsContainer.Position = UDim2.new(0, 0, 0, 40)
    TabsContainer.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
    TabsContainer.Parent = MainFrame

    local ContentFrame = Instance.new("Frame")
    ContentFrame.Size = UDim2.new(1, -130, 1, -40)
    ContentFrame.Position = UDim2.new(0, 130, 0, 40)
    ContentFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
    ContentFrame.Parent = MainFrame

    local window = {
        MainFrame = MainFrame,
        TabsContainer = TabsContainer,
        ContentFrame = ContentFrame,
        Tabs = {}
    }

    function window:MakeTab(tabConfig)
        local TabButton = Instance.new("TextButton")
        TabButton.Size = UDim2.new(1, 0, 0, 45)
        TabButton.Text = tabConfig.Name or "Tab"
        TabButton.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
        TabButton.TextColor3 = Color3.fromRGB(200, 200, 255)
        TabButton.Font = Enum.Font.GothamBold
        TabButton.TextSize = 18
        TabButton.Parent = TabsContainer

        local TabFrame = Instance.new("Frame")
        TabFrame.Size = UDim2.new(1, 0, 1, 0)
        TabFrame.BackgroundTransparency = 1
        TabFrame.Visible = false
        TabFrame.Parent = ContentFrame

        table.insert(self.Tabs, {Button = TabButton, Frame = TabFrame})

        TabButton.MouseButton1Click:Connect(function()
            for _, tab in pairs(self.Tabs) do
                tab.Frame.Visible = false
                tab.Button.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
            end
            TabFrame.Visible = true
            TabButton.BackgroundColor3 = Color3.fromRGB(80, 80, 120)
        end)

        local tab = {
            Frame = TabFrame
        }

        function tab:AddButton(buttonConfig)
            local Button = Instance.new("TextButton")
            Button.Size = UDim2.new(0.9, 0, 0, 50)
            Button.Position = UDim2.new(0.05, 0, 0, #self.Frame:GetChildren() * 55)
            Button.Text = buttonConfig.Name or "Button"
            Button.BackgroundColor3 = Color3.fromRGB(90, 90, 120)
            Button.TextColor3 = Color3.fromRGB(255, 255, 255)
            Button.Font = Enum.Font.GothamBold
            Button.TextSize = 18
            Button.Parent = self.Frame

            Button.MouseEnter:Connect(function()
                Button.BackgroundColor3 = Color3.fromRGB(120, 120, 150)
            end)
            Button.MouseLeave:Connect(function()
                Button.BackgroundColor3 = Color3.fromRGB(90, 90, 120)
            end)

            Button.MouseButton1Click:Connect(function()
                if buttonConfig.Callback then
                    buttonConfig.Callback()
                end
            end)
        end

        return tab
    end

    return window
end

return SandLib
