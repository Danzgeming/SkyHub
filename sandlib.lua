local SandLib = {}

-- Fungsi untuk membuat Window
function SandLib:MakeWindow(config)
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = config.Name or "Sand Hub"
    ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

    local MainFrame = Instance.new("Frame")
    MainFrame.Size = UDim2.new(0, 400, 0, 300)
    MainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
    MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    MainFrame.Parent = ScreenGui

    local Title = Instance.new("TextLabel")
    Title.Size = UDim2.new(1, 0, 0, 30)
    Title.Text = config.Name or "Sand Hub"
    Title.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.Font = Enum.Font.SourceSansBold
    Title.TextSize = 20
    Title.Parent = MainFrame

    local TabsContainer = Instance.new("Frame")
    TabsContainer.Size = UDim2.new(0, 100, 1, -30)
    TabsContainer.Position = UDim2.new(0, 0, 0, 30)
    TabsContainer.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    TabsContainer.Parent = MainFrame

    local ContentFrame = Instance.new("Frame")
    ContentFrame.Size = UDim2.new(1, -100, 1, -30)
    ContentFrame.Position = UDim2.new(0, 100, 0, 30)
    ContentFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    ContentFrame.Parent = MainFrame

    local window = {
        MainFrame = MainFrame,
        TabsContainer = TabsContainer,
        ContentFrame = ContentFrame,
        Tabs = {}
    }

    function window:MakeTab(tabConfig)
        local TabButton = Instance.new("TextButton")
        TabButton.Size = UDim2.new(1, 0, 0, 30)
        TabButton.Text = tabConfig.Name or "Tab"
        TabButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        TabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
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
            end
            TabFrame.Visible = true
        end)

        local tab = {
            Frame = TabFrame
        }

        function tab:AddButton(buttonConfig)
            local Button = Instance.new("TextButton")
            Button.Size = UDim2.new(0.9, 0, 0, 40)
            Button.Position = UDim2.new(0.05, 0, 0, #self.Frame:GetChildren() * 45)
            Button.Text = buttonConfig.Name or "Button"
            Button.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
            Button.TextColor3 = Color3.fromRGB(255, 255, 255)
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
