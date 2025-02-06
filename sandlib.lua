local SandLib = {}

-- Fungsi untuk membuat Window
function SandLib:MakeWindow(config)
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = config.Name or "Sand Hub"
    ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

    local MainFrame = Instance.new("Frame")
    MainFrame.Size = UDim2.new(0, 450, 0, 350)
    MainFrame.Position = UDim2.new(0.5, -225, 0.5, -175)
    MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    MainFrame.BorderSizePixel = 0
    MainFrame.Active = true
    MainFrame.Draggable = true
    MainFrame.Parent = ScreenGui

    -- Header / Title Bar
    local Title = Instance.new("TextLabel")
    Title.Size = UDim2.new(1, -40, 0, 35)
    Title.Position = UDim2.new(0, 0, 0, 0)
    Title.Text = config.Name or "Sand Hub"
    Title.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.Font = Enum.Font.SourceSansBold
    Title.TextSize = 20
    Title.Parent = MainFrame

    -- Tombol Close (X)
    local CloseButton = Instance.new("TextButton")
    CloseButton.Size = UDim2.new(0, 35, 0, 35)
    CloseButton.Position = UDim2.new(1, -35, 0, 0)
    CloseButton.Text = "X"
    CloseButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
    CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    CloseButton.Font = Enum.Font.SourceSansBold
    CloseButton.TextSize = 20
    CloseButton.Parent = MainFrame

    CloseButton.MouseButton1Click:Connect(function()
        ScreenGui:Destroy()
    end)

    -- Container untuk Tabs
    local TabsContainer = Instance.new("Frame")
    TabsContainer.Size = UDim2.new(0, 120, 1, -35)
    TabsContainer.Position = UDim2.new(0, 0, 0, 35)
    TabsContainer.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    TabsContainer.Parent = MainFrame

    -- Container untuk isi Tab
    local ContentFrame = Instance.new("Frame")
    ContentFrame.Size = UDim2.new(1, -120, 1, -35)
    ContentFrame.Position = UDim2.new(0, 120, 0, 35)
    ContentFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    ContentFrame.Parent = MainFrame

    local window = {
        MainFrame = MainFrame,
        TabsContainer = TabsContainer,
        ContentFrame = ContentFrame,
        Tabs = {}
    }

    -- Fungsi untuk membuat Tab
    function window:MakeTab(tabConfig)
        local TabButton = Instance.new("TextButton")
        TabButton.Size = UDim2.new(1, 0, 0, 40)
        TabButton.Text = tabConfig.Name or "Tab"
        TabButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        TabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        TabButton.Font = Enum.Font.SourceSansBold
        TabButton.TextSize = 18
        TabButton.Parent = TabsContainer

        -- Tab Konten
        local TabFrame = Instance.new("Frame")
        TabFrame.Size = UDim2.new(1, 0, 1, 0)
        TabFrame.BackgroundTransparency = 1
        TabFrame.Visible = false
        TabFrame.Parent = ContentFrame

        table.insert(self.Tabs, {Button = TabButton, Frame = TabFrame})

        TabButton.MouseButton1Click:Connect(function()
            for _, tab in pairs(self.Tabs) do
                tab.Frame.Visible = false
            end
            TabFrame.Visible = true
        end)

        local tab = {
            Frame = TabFrame
        }

        -- Fungsi untuk menambahkan tombol dalam Tab
        function tab:AddButton(buttonConfig)
            local Button = Instance.new("TextButton")
            Button.Size = UDim2.new(0.9, 0, 0, 50)
            Button.Position = UDim2.new(0.05, 0, 0, #self.Frame:GetChildren() * 55)
            Button.Text = buttonConfig.Name or "Button"
            Button.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
            Button.TextColor3 = Color3.fromRGB(255, 255, 255)
            Button.Font = Enum.Font.SourceSansBold
            Button.TextSize = 18
            Button.Parent = self.Frame

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
