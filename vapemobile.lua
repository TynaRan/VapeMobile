local v1 = {
    Configuration = {
        ThemeColor = Color3.fromRGB(44, 120, 224),
        ToggleKey = Enum.KeyCode.RightControl,
        MobileTogglePosition = UDim2.new(0, 10, 0.5, -25),
        WindowTitlePosition = UDim2.new(0.03, 0, 0.05, 0)
    },
    UI = {},
    RainbowColorValue = 0,
    HueSelectionPosition = 0
}

local v2 = game:GetService("UserInputService")
local v3 = game:GetService("TweenService")
local v4 = game:GetService("RunService")
local v5 = game:GetService("Players").LocalPlayer
local v6 = v5:GetMouse()

local v7 = Instance.new("ScreenGui")
v7.Name = "v7"
v7.Parent = game.CoreGui
v7.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local v8 = Instance.new("TextButton")
v8.Name = "MobileToggle"
v8.Parent = v7
v8.Size = UDim2.new(0, 50, 0, 50)
v8.Position = v1.Configuration.MobileTogglePosition
v8.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
v8.BackgroundTransparency = 0.5
v8.TextColor3 = Color3.fromRGB(255, 255, 255)
v8.Text = "≡"
v8.Font = Enum.Font.GothamBold
v8.TextSize = 24
v8.BorderSizePixel = 0

local v9 = Instance.new("Frame")
v9.Name = "MainUI"
v9.Parent = v7
v9.AnchorPoint = Vector2.new(0.5, 0.5)
v9.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
v9.BorderSizePixel = 0
v9.Position = UDim2.new(0.5, 0, 0.5, 0)
v9.Size = UDim2.new(0, 0, 0, 0)
v9.ClipsDescendants = true
v9.Visible = false

local v10 = Instance.new("TextLabel")
v10.Name = "Title"
v10.Parent = v9
v10.BackgroundTransparency = 1
v10.Position = v1.Configuration.WindowTitlePosition
v10.Size = UDim2.new(0, 200, 0, 30)
v10.Font = Enum.Font.GothamBold
v10.Text = ""
v10.TextColor3 = Color3.fromRGB(200, 200, 200)
v10.TextSize = 14
v10.TextXAlignment = Enum.TextXAlignment.Left

local v11 = Instance.new("Frame")
v11.Name = "DragFrame"
v11.Parent = v9
v11.BackgroundTransparency = 1
v11.Size = UDim2.new(1, 0, 0, 40)

local function v12(v13, v14)
    local v15, v16, v17, v18
    local function v19(v20)
        local v21 = v20.Position - v17
        v14.Position = UDim2.new(v18.X.Scale, v18.X.Offset + v21.X, v18.Y.Scale, v18.Y.Offset + v21.Y)
    end
    v13.InputBegan:Connect(function(v22)
        if v22.UserInputType == Enum.UserInputType.MouseButton1 or v22.UserInputType == Enum.UserInputType.Touch then
            v15 = true
            v17 = v22.Position
            v18 = v14.Position
        end
    end)
    v13.InputChanged:Connect(function(v23)
        if v23.UserInputType == Enum.UserInputType.MouseMovement or v23.UserInputType == Enum.UserInputType.Touch then
            v16 = v23
        end
    end)
    v2.InputChanged:Connect(function(v24)
        if v24 == v16 and v15 then v19(v24) end
    end)
    v2.InputEnded:Connect(function(v25)
        if v25.UserInputType == Enum.UserInputType.MouseButton1 or v25.UserInputType == Enum.UserInputType.Touch then
            v15 = false
        end
    end)
end

v12(v11, v9)

local v26 = false
v8.MouseButton1Click:Connect(function()
    v26 = not v26
    if v26 then
        v9.Visible = true
        v9:TweenSize(UDim2.new(0, 550, 0, 350), "Out", "Quart", 0.3, true)
    else
        v9:TweenSize(UDim2.new(0, 0, 0, 0), "Out", "Quart", 0.3, true)
        wait(0.3)
        v9.Visible = false
    end
end)

v2.InputBegan:Connect(function(v27)
    if v27.KeyCode == v1.Configuration.ToggleKey then
        v26 = not v26
        if v26 then
            v9.Visible = true
            v9:TweenSize(UDim2.new(0, 550, 0, 350), "Out", "Quart", 0.3, true)
        else
            v9:TweenSize(UDim2.new(0, 0, 0, 0), "Out", "Quart", 0.3, true)
            wait(0.3)
            v9.Visible = false
        end
    end
end)

function v1:Window(v28, v29, v30)
    v1.Configuration.ThemeColor = v29 or v1.Configuration.ThemeColor
    v1.Configuration.ToggleKey = v30 or v1.Configuration.ToggleKey
    v10.Text = v28
    
    local v31 = Instance.new("Folder")
    v31.Name = "TabFolder"
    v31.Parent = v9
    
    local v32 = Instance.new("Frame")
    v32.Name = "TabHold"
    v32.Parent = v9
    v32.BackgroundTransparency = 1
    v32.Position = UDim2.new(0.03, 0, 0.15, 0)
    v32.Size = UDim2.new(0, 100, 0, 300)
    
    local v33 = Instance.new("UIListLayout")
    v33.Name = "TabHoldLayout"
    v33.Parent = v32
    v33.SortOrder = Enum.SortOrder.LayoutOrder
    v33.Padding = UDim.new(0, 10)
    
    local v34 = false
    local v35 = {}
    
    function v35:Tab(v36)
        local v37 = Instance.new("TextButton")
        v37.Name = "TabBtn"
        v37.Parent = v32
        v37.BackgroundTransparency = 1
        v37.Size = UDim2.new(0, 100, 0, 25)
        v37.Text = ""
        
        local v38 = Instance.new("TextLabel")
        v38.Name = "TabTitle"
        v38.Parent = v37
        v38.BackgroundTransparency = 1
        v38.Size = UDim2.new(1, 0, 1, 0)
        v38.Font = Enum.Font.Gotham
        v38.Text = v36
        v38.TextColor3 = Color3.fromRGB(150, 150, 150)
        v38.TextSize = 14
        v38.TextXAlignment = Enum.TextXAlignment.Left
        
        local v39 = Instance.new("Frame")
        v39.Name = "TabBtnIndicator"
        v39.Parent = v37
        v39.BackgroundColor3 = v1.Configuration.ThemeColor
        v39.BorderSizePixel = 0
        v39.Position = UDim2.new(0, 0, 1, 0)
        v39.Size = UDim2.new(0, 0, 0, 2)
        
        local v40 = Instance.new("UICorner")
        v40.Name = "TabBtnIndicatorCorner"
        v40.Parent = v39
        
        local v41 = Instance.new("ScrollingFrame")
        v41.Name = "TabContent"
        v41.Parent = v31
        v41.BackgroundTransparency = 1
        v41.BorderSizePixel = 0
        v41.Position = UDim2.new(0.25, 0, 0.15, 0)
        v41.Size = UDim2.new(0, 400, 0, 300)
        v41.CanvasSize = UDim2.new(0, 0, 0, 0)
        v41.ScrollBarThickness = 3
        v41.Visible = false
        
        local v42 = Instance.new("UIListLayout")
        v42.Name = "TabContentLayout"
        v42.Parent = v41
        v42.SortOrder = Enum.SortOrder.LayoutOrder
        v42.Padding = UDim.new(0, 10)
        
        if not v34 then
            v34 = true
            v39.Size = UDim2.new(0, 15, 0, 2)
            v38.TextColor3 = Color3.fromRGB(255, 255, 255)
            v41.Visible = true
        end
        
        v37.MouseButton1Click:Connect(function()
            for _, v43 in pairs(v31:GetChildren()) do
                if v43:IsA("ScrollingFrame") then
                    v43.Visible = false
                end
            end
            v41.Visible = true
            
            for _, v44 in pairs(v32:GetChildren()) do
                if v44:IsA("TextButton") then
                    v3:Create(v44.TabBtnIndicator, TweenInfo.new(0.2), {Size = UDim2.new(0, 0, 0, 2)}):Play()
                    v3:Create(v44.TabTitle, TweenInfo.new(0.3), {TextColor3 = Color3.fromRGB(150, 150, 150)}):Play()
                end
            end
            
            v3:Create(v39, TweenInfo.new(0.2), {Size = UDim2.new(0, 15, 0, 2)}):Play()
            v3:Create(v38, TweenInfo.new(0.3), {TextColor3 = Color3.fromRGB(255, 255, 255)}):Play()
        end)
        
        local v45 = {}
        
        function v45:Button(v46, v47)
            local v48 = Instance.new("TextButton")
            v48.Name = "UIButton"
            v48.Parent = v41
            v48.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            v48.Size = UDim2.new(0, 380, 0, 40)
            v48.AutoButtonColor = false
            v48.Text = ""
            
            local v49 = Instance.new("UICorner")
            v49.Name = "ButtonCorner"
            v49.Parent = v48
            v49.CornerRadius = UDim.new(0, 5)
            
            local v50 = Instance.new("TextLabel")
            v50.Name = "ButtonLabel"
            v50.Parent = v48
            v50.BackgroundTransparency = 1
            v50.Position = UDim2.new(0.03, 0, 0, 0)
            v50.Size = UDim2.new(0.97, 0, 1, 0)
            v50.Font = Enum.Font.Gotham
            v50.Text = v46
            v50.TextColor3 = Color3.fromRGB(255, 255, 255)
            v50.TextSize = 14
            v50.TextXAlignment = Enum.TextXAlignment.Left
            
            v48.MouseEnter:Connect(function()
                v3:Create(v48, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(50, 50, 50)}):Play()
            end)
            
            v48.MouseLeave:Connect(function()
                v3:Create(v48, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(40, 40, 40)}):Play()
            end)
            
            v48.MouseButton1Click:Connect(function()
                pcall(v47)
            end)
            
            v41.CanvasSize = UDim2.new(0, 0, 0, v42.AbsoluteContentSize.Y)
            
            return v48
            function v45:Checkbox(v46, v47, v48)
                local v49 = Instance.new("TextButton")
                v49.Name = "Checkbox"
                v49.Parent = v41
                v49.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    v49.Size = UDim2.new(0, 380, 0, 40)
    v49.AutoButtonColor = false
    v49.Text = ""

    local v50 = Instance.new("UICorner")
    v50.Name = "CheckboxCorner"
    v50.Parent = v49
    v50.CornerRadius = UDim.new(0, 5)

    local v51 = Instance.new("TextLabel")
    v51.Name = "CheckboxLabel"
    v51.Parent = v49
    v51.BackgroundTransparency = 1
    v51.Position = UDim2.new(0.03, 0, 0, 0)
    v51.Size = UDim2.new(0.7, 0, 1, 0)
    v51.Font = Enum.Font.Gotham
    v51.Text = v46
    v51.TextColor3 = Color3.fromRGB(255, 255, 255)
    v51.TextSize = 14   
    v51.TextXAlignment = Enum.TextXAlignment.Left

    local v52 = Instance.new("Frame")  
    v52.Name = "CheckboxFrame"
    v52.Parent = v49
    v52.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    v52.Position = UDim2.new(0.85, 0, 0.25, 0)
    v52.Size = UDim2.new(0, 40, 0, 20)

    local v53 = Instance.new("UICorner")
    v53.Name = "CheckboxFrameCorner"
    v53.Parent = v52
    v53.CornerRadius = UDim.new(1, 0)

    local v54 = Instance.new("Frame")
    v54.Name = "CheckboxToggle"
    v54.Parent = v52
    v54.BackgroundColor3 = Color3.fromRGB(120, 120, 120)
    v54.Position = UDim2.new(0.1, 0, 0.1, 0)
    v54.Size = UDim2.new(0, 16, 0, 16)

    local v55 = Instance.new("UICorner")
    v55.Name = "CheckboxToggleCorner"
    v55.Parent = v54
    v55.CornerRadius = UDim.new(1, 0)

    local v56 = v47 or false

    local function v57(v58)
        v56 = v58
        if v58 then
            v3:Create(v54, TweenInfo.new(0.2), {
                Position = UDim2.new(0.55, 0, 0.1, 0),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            }):Play()
        else
            v3:Create(v54, TweenInfo.new(0.2), {
                Position = UDim2.new(0.1, 0, 0.1, 0),
                BackgroundColor3 = Color3.fromRGB(120, 120, 120)
            }):Play()
        end
        if v48 then pcall(v48, v56) end
    end

    v49.MouseEnter:Connect(function()
        v3:Create(v49, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(50, 50, 50)}):Play()
    end)

    v49.MouseLeave:Connect(function()
        v3:Create(v49, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(40, 40, 40)}):Play()
    end)

    v49.MouseButton1Click:Connect(function()
        v57(not v56)
    end)

    v57(v56)

    v41.CanvasSize = UDim2.new(0, 0, 0, v42.AbsoluteContentSize.Y)

                local v59 = {}
                function v59:Set(v60)
                     v57(v60)
                end
                function v59:Get()
                    return v56
                end
                return v59
            end
        end
        
        return v45
    end
    
    return v35
end

return v1
