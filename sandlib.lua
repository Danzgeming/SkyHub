local SandLib = {}

function SandLib:MakeWindow(config)
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = config.Name or "Sand Hub"
    ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

    local MainFrame = Instance.new("Frame")
    MainFrame.Size = UDim2.new(0, 600, 0, 400)
    MainFrame.Position = UDim2.new(0.5, -300, 0.5, -200)
    MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
    MainFrame.BorderSizePixel = 0
    MainFrame.Active = true
    MainFrame.Draggable = true
    MainFrame.Parent = ScreenGui

    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 10)
    UICorner.Parent = MainFrame

    -- Header Bar (Nama Hub di kiri)
    local TitleFrame = Instance.new("Frame")
    TitleFrame.Size = UDim2.new(0, 200, 0, 40)
    TitleFrame.Position = UDim2.new(0, 0, 0, 0)
    TitleFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
    TitleFrame.BorderSizePixel = 0
    TitleFrame.Parent = MainFrame

    local Title = Instance.new("TextLabel")
    Title.Size = UDim2.new(1, -40, 1, 0)
    Title.Text = config.Name or "Sand Hub"
    Title.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.Font = Enum.Font.GothamBold
    Title.TextSize = 22
    Title.Parent = TitleFrame

    -- Profile Section (Using the profile setup from the original script)
    local ProfileFrame = Instance.new("Frame")
    ProfileFrame.Size = UDim2.new(0, 200, 0, 100)
    ProfileFrame.Position = UDim2.new(0, 0, 0, 40)
    ProfileFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
    ProfileFrame.Parent = MainFrame

    local ProfilePicture = Instance.new("ImageLabel")
    ProfilePicture.Size = UDim2.new(0, 50, 0, 50)
    ProfilePicture.Position = UDim2.new(0, 10, 0, 10)
    ProfilePicture.Image = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. game.Players.LocalPlayer.UserId .. "&width=150&height=150&format=png"
    ProfilePicture.BackgroundTransparency = 1
    ProfilePicture.Parent = ProfileFrame

    local UsernameLabel = Instance.new("TextLabel")
    UsernameLabel.Size = UDim2.new(0, 150, 0, 50)
    UsernameLabel.Position = UDim2.new(0, 70, 0, 10)
    UsernameLabel.Text = game.Players.LocalPlayer.Name
    UsernameLabel.BackgroundTransparency = 1
    UsernameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    UsernameLabel.Font = Enum.Font.GothamBold
    UsernameLabel.TextSize = 18
    UsernameLabel.Parent = ProfileFrame

    -- Close and Minimize Buttons (As in original script)
    local CloseButton = Instance.new("TextButton")
    CloseButton.Size = UDim2.new(0, 40, 0, 40)
    CloseButton.Position = UDim2.new(1, -40, 0, 0)
    CloseButton.Text = "X"
    CloseButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
    CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    CloseButton.Font = Enum.Font.GothamBold
    CloseButton.TextSize = 22
    CloseButton.Parent = MainFrame

    local MinimizeButton = Instance.new("TextButton")
    MinimizeButton.Size = UDim2.new(0, 40, 0, 40)
    MinimizeButton.Position = UDim2.new(1, -80, 0, 0)
    MinimizeButton.Text = "-"
    MinimizeButton.BackgroundColor3 = Color3.fromRGB(50, 150, 50)
    MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    MinimizeButton.Font = Enum.Font.GothamBold
    MinimizeButton.TextSize = 22
    MinimizeButton.Parent = MainFrame

    -- Close Button Effect
    CloseButton.MouseEnter:Connect(function()
        CloseButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
    end)
    CloseButton.MouseLeave:Connect(function()
        CloseButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
    end)

    -- Minimize Button Effect
    MinimizeButton.MouseEnter:Connect(function()
        MinimizeButton.BackgroundColor3 = Color3.fromRGB(100, 200, 100)
    end)
    MinimizeButton.MouseLeave:Connect(function()
        MinimizeButton.BackgroundColor3 = Color3.fromRGB(50, 150, 50)
    end)

    -- Close Button Action
    CloseButton.MouseButton1Click:Connect(function()
        ScreenGui:Destroy()
    end)

    -- Minimize Button Action
    MinimizeButton.MouseButton1Click:Connect(function()
        MainFrame.Visible = false
    end)

    -- Tabs Container (As in original script)
    local TabsContainer = Instance.new("Frame")
    TabsContainer.Size = UDim2.new(0, 200, 1, -140)
    TabsContainer.Position = UDim2.new(0, 0, 0, 140)
    TabsContainer.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
    TabsContainer.Parent = MainFrame

    -- Content Area (For Tab Contents)
    local ContentFrame = Instance.new("Frame")
    ContentFrame.Size = UDim2.new(1, -200, 1, -140)
    ContentFrame.Position = UDim2.new(0, 200, 0, 140)
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
        TabButton.Size = UDim2.new(1, 0, 0, 50)
        TabButton.Text = tabConfig.Name or "Tab"
        TabButton.BackgroundTransparency = 1
        TabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
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
                tab.Button.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
            end
            TabFrame.Visible = true
            TabButton.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
        end)

        local tab = {
            Frame = TabFrame
        }

        function tab:AddButton(buttonConfig)
            local Button = Instance.new("TextButton")
            Button.Size = UDim2.new(0.9, 0, 0, 40)
            Button.Position = UDim2.new(0.05, 0, 0, #self.Frame:GetChildren() * 50)
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
