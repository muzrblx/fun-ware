local Library = {}
local LibName = tostring(math.random(200000,500000))..tostring(math.random(200000,500000))..tostring(math.random(200000,500000))

function Library:Toggle()
    if game:GetService("CoreGui"):FindFirstChild(LibName).Enabled then 
        game:GetService("CoreGui"):FindFirstChild(LibName).Enabled = false
    else 
        game:GetService("CoreGui"):FindFirstChild(LibName).Enabled = true
    end
end 

function Library:Destroy()
    game:GetService("CoreGui"):FindFirstChild(LibName):Destroy()
end

function Library:Drag(obj)
    local UserInputService = game:GetService("UserInputService")
    
    local gui = obj
    
    local dragging
    local dragInput
    local dragStart
    local startPos
    
    local function update(input)
        local delta = input.Position - dragStart
        gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
    
    gui.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = gui.Position
    
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    
    gui.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            update(input)
        end
    end)
end

function Library:Create(HubName,GameName)
    local HubName = HubName or "UI Library"
    local GameName = GameName or "By Mapple#3045"
    local ScreenGui = Instance.new("ScreenGui")
    local Main = Instance.new("Frame")
    local MainCorner = Instance.new("UICorner")
    local Sidebar = Instance.new("Frame")
    local SidebarCorner = Instance.new("UICorner")
    local HubNameLabel = Instance.new("TextLabel")
    local GameNameLabel = Instance.new("TextLabel")
    local Line = Instance.new("Frame")
    local ActualSide = Instance.new("Frame")
    local SideListLayout = Instance.new("UIListLayout")
    local TabHolder = Instance.new("Frame")
    local TabHolderCorner = Instance.new("UICorner")
    local TabFolder = Instance.new("Folder")

    ScreenGui.Parent = game:GetService("CoreGui")
    ScreenGui.Name = LibName
    ScreenGui.ResetOnSpawn = false

    Main.Name = "Main"
    Main.Parent = ScreenGui
    Main.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    Main.Position = UDim2.new(0.245501295, 0, 0.247914195, 0)
    Main.Size = UDim2.new(0, 580, 0, 370)

    MainCorner.CornerRadius = UDim.new(0, 12)
    MainCorner.Name = "MainCorner"
    MainCorner.Parent = Main

    Sidebar.Name = "Sidebar"
    Sidebar.Parent = Main
    Sidebar.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    Sidebar.Position = UDim2.new(0.0155172413, 0, 0.024324324, 0)
    Sidebar.Size = UDim2.new(0, 135, 0, 352)

    SidebarCorner.CornerRadius = UDim.new(0, 12)
    SidebarCorner.Name = "SidebarCorner"
    SidebarCorner.Parent = Sidebar

    HubNameLabel.Name = "HubNameLabel"
    HubNameLabel.Parent = Sidebar
    HubNameLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    HubNameLabel.BackgroundTransparency = 1.000
    HubNameLabel.BorderSizePixel = 0
    HubNameLabel.Size = UDim2.new(0, 135, 0, 25)
    HubNameLabel.Font = Enum.Font.Gotham
    HubNameLabel.Text = HubName
    HubNameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    HubNameLabel.TextSize = 16.000

    GameNameLabel.Name = "GameNameLabel"
    GameNameLabel.Parent = Sidebar
    GameNameLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    GameNameLabel.BackgroundTransparency = 1.000
    GameNameLabel.BorderSizePixel = 0
    GameNameLabel.Position = UDim2.new(0, 0, 0.0710227191, 0)
    GameNameLabel.Size = UDim2.new(0, 135, 0, 25)
    GameNameLabel.Font = Enum.Font.Gotham
    GameNameLabel.Text = GameName
    GameNameLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
    GameNameLabel.TextSize = 14.000

    Line.Name = "Line"
    Line.Parent = Sidebar
    Line.BackgroundColor3 = Color3.fromRGB(75, 75, 75)
    Line.BorderSizePixel = 0
    Line.Position = UDim2.new(0.0370370373, 0, 0.142045453, 0)
    Line.Size = UDim2.new(0, 124, 0, 2)

    ActualSide.Name = "ActualSide"
    ActualSide.Parent = Sidebar
    ActualSide.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    ActualSide.BorderSizePixel = 0
    ActualSide.Position = UDim2.new(0, 0, 0.16761364, 0)
    ActualSide.Size = UDim2.new(0, 135, 0, 284)

    SideListLayout.Name = "SideListLayout"
    SideListLayout.Parent = ActualSide
    SideListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    SideListLayout.SortOrder = Enum.SortOrder.LayoutOrder

    TabHolder.Name = "TabHolder"
    TabHolder.Parent = Main
    TabHolder.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    TabHolder.Position = UDim2.new(0.263793111, 0, 0.024324324, 0)
    TabHolder.Size = UDim2.new(0, 418, 0, 352)

    TabHolderCorner.CornerRadius = UDim.new(0, 12)
    TabHolderCorner.Name = "TabHolderCorner"
    TabHolderCorner.Parent = TabHolder

    TabFolder.Name = "TabFolder"
    TabFolder.Parent = TabHolder

    Library:Drag(Main)

    local Tabs = {}

    function Tabs:Tab(Name,Vis)
        local Name = Name or "Tab"
        local Tab = Instance.new("ScrollingFrame")
        local TabListLayout = Instance.new("UIListLayout")
        local TabButton = Instance.new("TextButton")

        function Size()
            Tab.CanvasSize = UDim2.new(0, 0, 0, TabListLayout.AbsoluteContentSize.Y)
        end

        Tab.Name = tostring(Name).."_Tab"
        Tab.Parent = TabFolder
        Tab.Active = true
        Tab.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
        Tab.BorderSizePixel = 0
        Tab.Position = UDim2.new(0.0215311013, 0, 0, 0)
        Tab.Size = UDim2.new(0, 400, 0, 352)
        Tab.ScrollBarThickness = 0
        Tab.Visible = Vis

        TabListLayout.Name = "TabListLayout"
        TabListLayout.Parent = Tab
        TabListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
        TabListLayout.SortOrder = Enum.SortOrder.LayoutOrder
        TabListLayout.Padding = UDim.new(0, 5)

        TabButton.Name = "TabButton"
        TabButton.Parent = ActualSide
        TabButton.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
        TabButton.BorderSizePixel = 0
        TabButton.Position = UDim2.new(0.00370370364, 0, 0, 0)
        TabButton.Size = UDim2.new(0, 135, 0, 35)
        TabButton.Font = Enum.Font.Gotham
        TabButton.Text = Name
        TabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        TabButton.TextSize = 14.000

        Size()
        Tab.ChildAdded:Connect(Size)
        Tab.ChildRemoved:Connect(Size)

        if Vis then 
            TabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        else 
            TabButton.TextColor3 = Color3.fromRGB(180, 180, 180)
        end

        TabButton.MouseButton1Down:Connect(function()
            Size()
            for i,v in pairs(ActualSide:GetChildren()) do 
                if v:IsA("TextButton") then 
                    v.TextColor3 = Color3.fromRGB(180,180,180)
                end
            end

            for i,v in pairs(TabFolder:GetChildren()) do
                v.Visible = false
            end

            Tab.Visible = true
            game:GetService("TweenService"):Create(TabButton, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                TextColor3 = Color3.fromRGB(255, 255, 255)
            }):Play()
        end)

        local Elements = {}

        function Elements:Label(Name)
            local Name = Name or "Label"
            local LabelFunction = {}
            local LabelFrame = Instance.new("Frame")
            local LabelFrameCorner = Instance.new("UICorner")
            local Label = Instance.new("TextLabel")

            LabelFrame.Name = tostring(Name).."_Label"
            LabelFrame.Parent = Tab
            LabelFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
            LabelFrame.Position = UDim2.new(0.0450000018, 0, 0, 0)
            LabelFrame.Size = UDim2.new(0, 400, 0, 35)
            
            LabelFrameCorner.Name = "LabelFrameCorner"
            LabelFrameCorner.Parent = LabelFrame
            
            Label.Name = "Label"
            Label.Parent = LabelFrame
            Label.Text = Name
            Label.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
            Label.BackgroundTransparency = 1.000
            Label.BorderSizePixel = 0
            Label.Size = UDim2.new(0, 400, 0, 35)
            Label.Font = Enum.Font.Gotham
            Label.TextColor3 = Color3.fromRGB(255, 255, 255)
            Label.TextSize = 16.000

            Label.MouseEnter:Connect(function()
                game:GetService("TweenService"):Create(LabelFrame, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                    BackgroundColor3 = Color3.fromRGB(63, 64, 65)
                }):Play()
            end)
            Label.MouseLeave:Connect(function()
                game:GetService("TweenService"):Create(LabelFrame, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                    BackgroundColor3 = Color3.fromRGB(45, 45, 45)
                }):Play()
            end)

            function LabelFunction:UpdateLabel(Name)
                Label.Text = Name
                LabelFrame.Name = tostring(Name).."_Label"
            end
            return LabelFunction
        end

        function Elements:Button(Name,Callback)
            local Name = Name or "Button"
            local ButtonFunction = {}
            local Callback = Callback or function () end
            local ButtonFrame = Instance.new("Frame")
            local ButtonFrameCorner = Instance.new("UICorner")
            local Button = Instance.new("TextButton")
            local ButtonCorner = Instance.new("UICorner")
            local ButtonPadding = Instance.new("UIPadding")

            ButtonFrame.Name = tostring(Name).."_Button"
            ButtonFrame.Parent = Tab
            ButtonFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
            ButtonFrame.Position = UDim2.new(0.0450000018, 0, 0, 0)
            ButtonFrame.Size = UDim2.new(0, 400, 0, 35)

            ButtonFrameCorner.Name = "ButtonFrameCorner"
            ButtonFrameCorner.Parent = ButtonFrame

            Button.Name = "Button"
            Button.Text = Name
            Button.Parent = ButtonFrame
            Button.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
            Button.BorderSizePixel = 0
            Button.Size = UDim2.new(0, 400, 0, 35)
            Button.Font = Enum.Font.Gotham
            Button.TextColor3 = Color3.fromRGB(255, 255, 255)
            Button.TextSize = 16.000
            Button.TextXAlignment = Enum.TextXAlignment.Left

            ButtonCorner.Name = "ButtonCorner"
            ButtonCorner.Parent = Button

            ButtonPadding.Name = "ButtonPadding"
            ButtonPadding.Parent = Button
            ButtonPadding.PaddingLeft = UDim.new(0, 10)

            Button.MouseButton1Down:Connect(function()
                game:GetService("TweenService"):Create(Button, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                    BackgroundColor3 = Color3.fromRGB(63, 64, 65)
                }):Play()
                wait(0.1)
                game:GetService("TweenService"):Create(Button, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                    BackgroundColor3 = Color3.fromRGB(45,45,45)
                }):Play()
                pcall(Callback)
            end)

            Button.MouseEnter:Connect(function()
                game:GetService("TweenService"):Create(Button, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                    BackgroundColor3 = Color3.fromRGB(63, 64, 65)
                }):Play()
            end)
            Button.MouseLeave:Connect(function()
                game:GetService("TweenService"):Create(Button, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                    BackgroundColor3 = Color3.fromRGB(45,45,45)
                }):Play()
            end)

            function ButtonFunction:UpdateButton(Name)
                Button.Text = Name
                ButtonFrame.Name = tostring(Name).."_Button"
            end
            return ButtonFunction
        end

        function Elements:Toggle(Name,Callback)
            local Name = Name or "Toggle"
            local Callback = Callback or function() end
            local ToggleEnabled = false
            local ToggleFrame = Instance.new("Frame")
            local ToggleFrameCorner = Instance.new("UICorner")
            local ToggleTitle = Instance.new("TextLabel")
            local ToggleTitlePadding = Instance.new("UIPadding")
            local ToggleF = Instance.new("Frame")
            local ToggleFCorner = Instance.new("UICorner")
            local ToggleCircle = Instance.new("ImageLabel")
            local ToggleButton = Instance.new("TextButton")

            ToggleFrame.Name = tostring(Name).."_Toggle"
            ToggleFrame.Parent = Tab
            ToggleFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
            ToggleFrame.Position = UDim2.new(0.0450000018, 0, 0, 0)
            ToggleFrame.Size = UDim2.new(0, 400, 0, 35)

            ToggleFrameCorner.Name = "ToggleFrameCorner"
            ToggleFrameCorner.Parent = ToggleFrame

            ToggleTitle.Name = "ToggleTitle"
            ToggleTitle.Parent = ToggleFrame
            ToggleTitle.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
            ToggleTitle.BackgroundTransparency = 1.000
            ToggleTitle.BorderSizePixel = 0
            ToggleTitle.Size = UDim2.new(0, 328, 0, 35)
            ToggleTitle.Font = Enum.Font.Gotham
            ToggleTitle.Text = Name
            ToggleTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
            ToggleTitle.TextSize = 16.000
            ToggleTitle.TextXAlignment = Enum.TextXAlignment.Left

            ToggleTitlePadding.Name = "ToggleTitlePadding"
            ToggleTitlePadding.Parent = ToggleTitle
            ToggleTitlePadding.PaddingLeft = UDim.new(0, 10)

            ToggleF.Name = "ToggleF"
            ToggleF.Parent = ToggleFrame
            ToggleF.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
            ToggleF.BorderSizePixel = 0
            ToggleF.Position = UDim2.new(0.86500001, 0, 0.171428576, 0)
            ToggleF.Size = UDim2.new(0, 45, 0, 23)

            ToggleFCorner.CornerRadius = UDim.new(0, 25)
            ToggleFCorner.Name = "ToggleFCorner"
            ToggleFCorner.Parent = ToggleF

            ToggleCircle.Name = "ToggleCircle"
            ToggleCircle.Parent = ToggleF
            ToggleCircle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ToggleCircle.BackgroundTransparency = 1.000
            ToggleCircle.Position = UDim2.new(0.0666666701, 0, 0.130434781, 0)
            ToggleCircle.Size = UDim2.new(0, 17, 0, 17)
            ToggleCircle.Image = "rbxassetid://3570695787"
            ToggleCircle.ScaleType = Enum.ScaleType.Slice
            ToggleCircle.SliceCenter = Rect.new(100, 100, 100, 100)
            ToggleCircle.SliceScale = 0.120

            ToggleButton.Name = "ToggleButton"
            ToggleButton.Parent = ToggleF
            ToggleButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ToggleButton.BackgroundTransparency = 1.000
            ToggleButton.BorderSizePixel = 0
            ToggleButton.Size = UDim2.new(0, 45, 0, 23)
            ToggleButton.Font = Enum.Font.SourceSans
            ToggleButton.Text = ""
            ToggleButton.TextColor3 = Color3.fromRGB(0, 0, 0)
            ToggleButton.TextSize = 14.000

            ToggleButton.MouseButton1Down:Connect(function()
                ToggleEnabled = not ToggleEnabled
                if ToggleEnabled then 
                    game:GetService("TweenService"):Create(ToggleF, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(28, 193, 83)}):Play() 
                    game:GetService("TweenService"):Create(ToggleCircle, TweenInfo.new(0.3), {Position = UDim2.new(0.555555582, 0, 0.130434781, 0)}):Play() 
                else
                    game:GetService("TweenService"):Create(ToggleF, TweenInfo.new(0.3), {BackgroundColor3 = Color3.fromRGB(55, 55, 55)}):Play() 
                    game:GetService("TweenService"):Create(ToggleCircle, TweenInfo.new(0.3), {Position = UDim2.new(0.0666666701, 0, 0.130434781, 0)}):Play() 
                end
                pcall(Callback,ToggleEnabled)
            end)
        end 

        function Elements:Textbox(Name,Default,Callback)
            local Name = Name or "Textbox"
            local Default = Default or "Enter Text"
            local Callback = Callback or function() end
            local TextboxFrame = Instance.new("Frame")
            local TextboxFrameCorner = Instance.new("UICorner")
            local TextboxTitle = Instance.new("TextLabel")
            local TextboxTitlePadding = Instance.new("UIPadding")
            local Textbox = Instance.new("TextBox")
            local TextboxCorner = Instance.new("UICorner")

            TextboxFrame.Name = tostring(Name).."_Textbox"
            TextboxFrame.Parent = Tab
            TextboxFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
            TextboxFrame.Position = UDim2.new(0.0450000018, 0, 0, 0)
            TextboxFrame.Size = UDim2.new(0, 400, 0, 35)

            TextboxFrameCorner.Name = "TextboxFrameCorner"
            TextboxFrameCorner.Parent = TextboxFrame

            TextboxTitle.Name = "TextboxTitle"
            TextboxTitle.Parent = TextboxFrame
            TextboxTitle.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
            TextboxTitle.BackgroundTransparency = 1.000
            TextboxTitle.BorderSizePixel = 0
            TextboxTitle.Size = UDim2.new(0, 232, 0, 35)
            TextboxTitle.Font = Enum.Font.Gotham
            TextboxTitle.Text = Name
            TextboxTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
            TextboxTitle.TextSize = 16.000
            TextboxTitle.TextXAlignment = Enum.TextXAlignment.Left

            TextboxTitlePadding.Name = "TextboxTitlePadding"
            TextboxTitlePadding.Parent = TextboxTitle
            TextboxTitlePadding.PaddingLeft = UDim.new(0, 10)

            Textbox.Name = "Textbox"
            Textbox.Parent = TextboxFrame
            Textbox.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
            Textbox.Position = UDim2.new(0.602500021, 0, 0.171428576, 0)
            Textbox.Size = UDim2.new(0, 150, 0, 23)
            Textbox.Font = Enum.Font.Gotham
            Textbox.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
            Textbox.Text = ""
            Textbox.PlaceholderText = Default
            Textbox.TextColor3 = Color3.fromRGB(255, 255, 255)
            Textbox.TextSize = 14.000

            TextboxCorner.Name = "TextboxCorner"
            TextboxCorner.Parent = Textbox

            Textbox.Focused:Connect(function()
                game:GetService("TweenService"):Create(Textbox, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                    BackgroundColor3 = Color3.fromRGB(63, 64, 65)
                }):Play()
            end)

            Textbox.FocusLost:Connect(function()
                game:GetService("TweenService"):Create(Textbox, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                    BackgroundColor3 = Color3.fromRGB(55, 55, 55)
                }):Play()
                Callback(Textbox.Text)
            end)
        end

        function Elements:Slider(Name,Min,Max,Callback)
            local Name = Name or "Slider"
            local Callback = Callback or function() end
            local Max = Max or 500
            local Min = Min or 16
            local SliderFrame = Instance.new("Frame")
            local SliderFrameCorner = Instance.new("UICorner")
            local SliderTitle = Instance.new("TextLabel")
            local SliderTitlePadding = Instance.new("UIPadding")
            local SliderValue = Instance.new("TextLabel")
            local SliderValuePadding = Instance.new("UIPadding")
            local SliderButton = Instance.new("TextButton")
            local SliderButtonCorner = Instance.new("UICorner")
            local SliderTrail = Instance.new("Frame")
            local SliderTrailCorner = Instance.new("UICorner")

            SliderFrame.Name = tostring(Name).."_Slider"
            SliderFrame.Parent = Tab
            SliderFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
            SliderFrame.Position = UDim2.new(0.0450000018, 0, 0, 0)
            SliderFrame.Size = UDim2.new(0, 400, 0, 50)

            SliderFrameCorner.Name = "SliderFrameCorner"
            SliderFrameCorner.Parent = SliderFrame

            SliderTitle.Name = "SliderTitle"
            SliderTitle.Parent = SliderFrame
            SliderTitle.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
            SliderTitle.BackgroundTransparency = 1.000
            SliderTitle.BorderSizePixel = 0
            SliderTitle.Size = UDim2.new(0, 272, 0, 25)
            SliderTitle.Font = Enum.Font.Gotham
            SliderTitle.Text = Name
            SliderTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
            SliderTitle.TextSize = 16.000
            SliderTitle.TextXAlignment = Enum.TextXAlignment.Left

            SliderTitlePadding.Name = "SliderTitlePadding"
            SliderTitlePadding.Parent = SliderTitle
            SliderTitlePadding.PaddingLeft = UDim.new(0, 10)

            SliderValue.Name = "SliderValue"
            SliderValue.Parent = SliderFrame
            SliderValue.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
            SliderValue.BackgroundTransparency = 1.000
            SliderValue.BorderSizePixel = 0
            SliderValue.Position = UDim2.new(0.805000007, 0, 0, 0)
            SliderValue.Size = UDim2.new(0, 78, 0, 25)
            SliderValue.Font = Enum.Font.Gotham
            SliderValue.Text = ""
            SliderValue.TextTransparency = 1.000
            SliderValue.TextColor3 = Color3.fromRGB(255, 255, 255)
            SliderValue.TextSize = 16.000
            SliderValue.TextXAlignment = Enum.TextXAlignment.Right

            SliderValuePadding.Name = "SliderValuePadding"
            SliderValuePadding.Parent = SliderValue
            SliderValuePadding.PaddingRight = UDim.new(0, 10)

            SliderButton.Name = "SliderButton"
            SliderButton.Parent = SliderFrame
            SliderButton.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
            SliderButton.BorderSizePixel = 0
            SliderButton.Position = UDim2.new(0.0225000009, 0, 0.620000005, 0)
            SliderButton.Size = UDim2.new(0, 382, 0, 10)
            SliderButton.Font = Enum.Font.SourceSans
            SliderButton.Text = ""
            SliderButton.TextColor3 = Color3.fromRGB(0, 0, 0)
            SliderButton.TextSize = 14.000

            SliderButtonCorner.Name = "SliderButtonCorner"
            SliderButtonCorner.Parent = SliderButton

            SliderTrail.Name = "SliderTrail"
            SliderTrail.Parent = SliderButton
            SliderTrail.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
            SliderTrail.Size = UDim2.new(0, 0, 0, 10)
            SliderTrail.BorderSizePixel = 0

            SliderTrailCorner.Name = "SliderTrailCorner"
            SliderTrailCorner.Parent = SliderTrail

            local uis = game:GetService("UserInputService")
            local Value
            local mouse = game:GetService("Players").LocalPlayer:GetMouse();

            SliderButton.MouseButton1Down:Connect(function()
                game:GetService("TweenService"):Create(SliderValue, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                    TextTransparency = 0
                }):Play()
                Value = math.floor((((tonumber(Max) - tonumber(Min)) / 382) * SliderTrail.AbsoluteSize.X) + tonumber(Min)) or 0
                pcall(function()
                    Callback(Value)
                end)
                SliderTrail:TweenSize(UDim2.new(0, math.clamp(mouse.X - SliderTrail.AbsolutePosition.X, 0, 382), 0, 10), "InOut", "Linear", 0.05, true)
                moveconnection = mouse.Move:Connect(function()
                    SliderValue.Text = Value
                    Value = math.floor((((tonumber(Max) - tonumber(Min)) / 382) * SliderTrail.AbsoluteSize.X) + tonumber(Min))
                    pcall(function()
                        Callback(Value)
                    end)
                    SliderTrail:TweenSize(UDim2.new(0, math.clamp(mouse.X - SliderTrail.AbsolutePosition.X, 0, 382), 0, 10), "InOut", "Linear", 0.05, true)
                end)
                releaseconnection = uis.InputEnded:Connect(function(Mouse)
                    if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
                        Value = math.floor((((tonumber(Max) - tonumber(Min)) / 382) * SliderTrail.AbsoluteSize.X) + tonumber(Min))
                        pcall(function()
                            Callback(Value)
                        end)
                        SliderValue.Text = Value
                        game:GetService("TweenService"):Create(SliderValue, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                            TextTransparency = 1
                        }):Play()
                        SliderTrail:TweenSize(UDim2.new(0, math.clamp(mouse.X - SliderTrail.AbsolutePosition.X, 0, 382), 0, 10), "InOut", "Linear", 0.05, true)
                        moveconnection:Disconnect()
                        releaseconnection:Disconnect()
                    end
                end)
            end)
        end

        function Elements:Keybind(Name,xKey,Callback)
            local Name = Name or "Keybind"
            local Callback = Callback or function() end
            local Keyx = xKey.Name
            local KeybindFrame = Instance.new("Frame")
            local KeybindFrameCorner = Instance.new("UICorner")
            local KeybindTitle = Instance.new("TextLabel")
            local KeybindTitlePadding = Instance.new("UIPadding")
            local KeybindButton = Instance.new("TextButton")
            local KeybindButtonCorner = Instance.new("UICorner")

            KeybindFrame.Name = tostring(Name).."_Keybind"
            KeybindFrame.Parent = Tab
            KeybindFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
            KeybindFrame.Position = UDim2.new(0.0450000018, 0, 0, 0)
            KeybindFrame.Size = UDim2.new(0, 400, 0, 35)

            KeybindFrameCorner.Name = "KeybindFrameCorner"
            KeybindFrameCorner.Parent = KeybindFrame

            KeybindTitle.Name = "KeybindTitle"
            KeybindTitle.Parent = KeybindFrame
            KeybindTitle.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
            KeybindTitle.BackgroundTransparency = 1.000
            KeybindTitle.BorderSizePixel = 0
            KeybindTitle.Size = UDim2.new(0, 232, 0, 35)
            KeybindTitle.Font = Enum.Font.Gotham
            KeybindTitle.Text = Name
            KeybindTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
            KeybindTitle.TextSize = 16.000
            KeybindTitle.TextXAlignment = Enum.TextXAlignment.Left

            KeybindTitlePadding.Name = "KeybindTitlePadding"
            KeybindTitlePadding.Parent = KeybindTitle
            KeybindTitlePadding.PaddingLeft = UDim.new(0, 10)

            KeybindButton.Name = "KeybindButton"
            KeybindButton.Parent = KeybindFrame
            KeybindButton.BackgroundColor3 = Color3.fromRGB(55, 55, 55)
            KeybindButton.Position = UDim2.new(0.602999985, 0, 0.171000004, 0)
            KeybindButton.Size = UDim2.new(0, 150, 0, 23)
            KeybindButton.Font = Enum.Font.Gotham
            KeybindButton.Text = tostring(Keyx)
            KeybindButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            KeybindButton.TextSize = 14.000

            KeybindButtonCorner.Name = "KeybindButtonCorner"
            KeybindButtonCorner.Parent = KeybindButton

            KeybindButton.MouseButton1Click:connect(function() 
                game.TweenService:Create(KeybindButton, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                    BackgroundColor3 = Color3.fromRGB(63, 64, 65)
                }):Play()
                KeybindButton.Text = ". . ."
                local v1, v2 = game:GetService('UserInputService').InputBegan:wait();
                if v1.KeyCode.Name ~= "Unknown" then
                    game.TweenService:Create(KeybindButton, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                        BackgroundColor3 = Color3.fromRGB(55, 55, 55)
                    }):Play()
                    KeybindButton.Text = v1.KeyCode.Name
                    Keyx = v1.KeyCode.Name;
                end
            end)
    
            game:GetService("UserInputService").InputBegan:connect(function(a, gp) 
                if not gp then 
                    if a.KeyCode.Name == Keyx then 
                        Callback()
                    end
                end
            end)
        end

        function Elements:Dropdown(Name,List,Callback)
            local Name = Name or "Dropdown"
            local DropdownFunction = {}
            local Callback = Callback or function() end
            local DropSize = 35
            local opened = false 

            local DropdownFrame = Instance.new("Frame")
            local DropdownFrameCorner = Instance.new("UICorner")
            local DropdownTitle = Instance.new("TextLabel")
            local DropdownTitlePadding = Instance.new("UIPadding")
            local DropdownIcon = Instance.new("ImageButton")
            local DropdownButton = Instance.new("TextButton")
            local DropList = Instance.new("Frame")
            local DropListLayout = Instance.new("UIListLayout")

            DropdownFrame.Name = tostring(Name).."_Dropdown"
            DropdownFrame.Parent = Tab
            DropdownFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
            DropdownFrame.Position = UDim2.new(0.0450000018, 0, 0, 0)
            DropdownFrame.Size = UDim2.new(0, 400, 0, 35)
            
            DropdownFrameCorner.Name = "DropdownFrameCorner"
            DropdownFrameCorner.Parent = DropdownFrame
            
            DropdownTitle.Name = "DropdownTitle"
            DropdownTitle.Parent = DropdownFrame
            DropdownTitle.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
            DropdownTitle.BackgroundTransparency = 1.000
            DropdownTitle.BorderSizePixel = 0
            DropdownTitle.Size = UDim2.new(0, 232, 0, 35)
            DropdownTitle.Font = Enum.Font.Gotham
            DropdownTitle.Text = Name
            DropdownTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
            DropdownTitle.TextSize = 16.000
            DropdownTitle.TextXAlignment = Enum.TextXAlignment.Left
            
            DropdownTitlePadding.Name = "DropdownTitlePadding"
            DropdownTitlePadding.Parent = DropdownTitle
            DropdownTitlePadding.PaddingLeft = UDim.new(0, 10)
            
            DropdownIcon.Name = "DropdownIcon"
            DropdownIcon.Parent = DropdownFrame
            DropdownIcon.BackgroundTransparency = 1.000
            DropdownIcon.Position = UDim2.new(0.914999962, 0, 0.128571406, 0)
            DropdownIcon.Size = UDim2.new(0, 25, 0, 25)
            DropdownIcon.ZIndex = 2
            DropdownIcon.Image = "rbxassetid://3926305904"
            DropdownIcon.ImageRectOffset = Vector2.new(604, 684)
            DropdownIcon.ImageRectSize = Vector2.new(36, 36)
            
            DropdownButton.Name = "DropdownButton"
            DropdownButton.Parent = DropdownFrame
            DropdownButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            DropdownButton.BackgroundTransparency = 1.000
            DropdownButton.Size = UDim2.new(0, 400, 0, 35)
            DropdownButton.Font = Enum.Font.SourceSans
            DropdownButton.Text = ""
            DropdownButton.TextColor3 = Color3.fromRGB(0, 0, 0)
            DropdownButton.TextSize = 14.000
            
            DropList.Name = "DropList"
            DropList.Parent = DropdownFrame
            DropList.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            DropList.BackgroundTransparency = 1.000
            DropList.BorderSizePixel = 0
            DropList.Position = UDim2.new(0, 0, 1.14285719, 0)
            DropList.Size = UDim2.new(0, 400, 0, 35)
            DropList.Visible = false

            DropListLayout.Name = "DropListLayout"
            DropListLayout.Parent = DropList
            DropListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
            DropListLayout.SortOrder = Enum.SortOrder.LayoutOrder
            DropListLayout.Padding = UDim.new(0, 3)

            DropListLayout.Changed:Connect(function()
                Tab.CanvasSize = UDim2.new(0, 0, 0, DropListLayout.AbsoluteContentSize.Y + 100)
            end)  

            DropdownButton.MouseEnter:Connect(function()
                game:GetService("TweenService"):Create(DropdownFrame, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                    BackgroundColor3 = Color3.fromRGB(63,64,65)
                }):Play()
            end)
            DropdownButton.MouseLeave:Connect(function()
                game:GetService("TweenService"):Create(DropdownFrame, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                    BackgroundColor3 = Color3.fromRGB(45,45,45)
                }):Play()
            end)

            local function DropElements(x)
                for i,v in pairs(Tab:GetChildren()) do 
                    if v:IsA("Frame") and v ~= DropdownFrame then 
                        v.Visible = x
                    end
                end
            end

            DropdownButton.MouseButton1Down:Connect(function()
                if opened then 
                    Size()
                    opened = false 
                    DropList:TweenSize(UDim2.new(0, 400, 0, 35), "InOut", "Linear", 0.1)
                    game:GetService("TweenService"):Create(DropdownIcon, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                        ImageColor3 = Color3.fromRGB(255,255,255)
                    }):Play()
                    wait(0.1)
                    DropElements(true)
                    DropList.Visible = false
                    Tab.CanvasSize = UDim2.new(0,0,0,TabListLayout.AbsoluteContentSize.Y)
                    Size()
                else 
                    opened = true 
                    DropElements(false)
                    DropList.Visible = true
                    DropList:TweenSize(UDim2.new(0, 400, 0, DropListLayout.AbsoluteContentSize.Y + 100), "InOut", "Linear", 0.1)
                    Tab.CanvasSize = UDim2.new(0,0,0,DropListLayout.AbsoluteContentSize.Y + 100)
                    game:GetService("TweenService"):Create(DropdownIcon, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                        ImageColor3 = Color3.fromRGB(150,150,150)
                    }):Play()
                end 
            end)  

            for i,v in pairs(List) do 
                local OptionButton = Instance.new("TextButton")
                local OptionButtonCorner = Instance.new("UICorner")
                
                OptionButton.Name = tostring(v).."_Option"
                OptionButton.Parent = DropList
                OptionButton.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
                OptionButton.Size = UDim2.new(0, 400, 0, 35)
                OptionButton.Font = Enum.Font.Gotham
                OptionButton.Text = "Option"
                OptionButton.TextColor3 = Color3.fromRGB(255, 255, 255)
                OptionButton.TextSize = 16.000

                OptionButtonCorner.Name = "OptionButtonCorner"
                OptionButtonCorner.Parent = OptionButton

                OptionButton.MouseButton1Down:Connect(function()
                    Callback(v)
                    for a,b in pairs(DropList:GetChildren()) do 
                        if b:IsA("TextButton") then 
                            b.TextColor3 = Color3.fromRGB(180,180,180)
                        end 
                    end
                    game:GetService("TweenService"):Create(OptionButton, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                        TextColor3 = Color3.fromRGB(255,255,255)
                    }):Play()
                    DropList:TweenSize(UDim2.new(0, 400, 0, 35), "InOut", "Linear", 0.1)
                    game:GetService("TweenService"):Create(DropdownIcon, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                        ImageColor3 = Color3.fromRGB(255,255,255)
                    }):Play()
                    wait(0.1)
                    DropList.Visible = false
                    opened = false
                    DropElements(true)
                    Size()
                end)

                OptionButton.MouseEnter:Connect(function()
                    game:GetService("TweenService"):Create(OptionButton, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                        BackgroundColor3 = Color3.fromRGB(63,64,65)
                    }):Play()
                end)
                OptionButton.MouseLeave:Connect(function()
                    game:GetService("TweenService"):Create(OptionButton, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                        BackgroundColor3 = Color3.fromRGB(45,45,45)
                    }):Play()
                end)
            end

            function DropdownFunction:UpdateDropdown(List)
                local List = List or {}
                for i,v in pairs(List) do 
                    local OptionButton = Instance.new("TextButton")
                    local OptionButtonCorner = Instance.new("UICorner")
                    
                    OptionButton.Name = tostring(v).."_Option"
                    OptionButton.Parent = DropList
                    OptionButton.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
                    OptionButton.Size = UDim2.new(0, 400, 0, 35)
                    OptionButton.Font = Enum.Font.Gotham
                    OptionButton.Text = "Option"
                    OptionButton.TextColor3 = Color3.fromRGB(255, 255, 255)
                    OptionButton.TextSize = 16.000
    
                    OptionButtonCorner.Name = "OptionButtonCorner"
                    OptionButtonCorner.Parent = OptionButton
    
                    OptionButton.MouseButton1Down:Connect(function()
                        Callback(v)
                        for a,b in pairs(DropList:GetChildren()) do 
                            if b:IsA("TextButton") then 
                                b.TextColor3 = Color3.fromRGB(180,180,180)
                            end 
                        end
                        game:GetService("TweenService"):Create(OptionButton, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                            TextColor3 = Color3.fromRGB(255,255,255)
                        }):Play()
                        DropList:TweenSize(UDim2.new(0, 400, 0, 35), "InOut", "Linear", 0.1)
                        game:GetService("TweenService"):Create(DropdownIcon, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                            ImageColor3 = Color3.fromRGB(255,255,255)
                        }):Play()
                        wait(0.1)
                        DropList.Visible = false
                        opened = false
                        DropElements(true)
                        Size()
                    end)
    
                    OptionButton.MouseEnter:Connect(function()
                        game:GetService("TweenService"):Create(OptionButton, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                            BackgroundColor3 = Color3.fromRGB(63,64,65)
                        }):Play()
                    end)
                    OptionButton.MouseLeave:Connect(function()
                        game:GetService("TweenService"):Create(OptionButton, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
                            BackgroundColor3 = Color3.fromRGB(45,45,45)
                        }):Play()
                    end)
                end    
            end
            return DropdownFunction
        end
        return Elements
    end
    return Tabs
end
return Library
