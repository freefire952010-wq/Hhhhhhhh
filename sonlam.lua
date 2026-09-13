-- Sơn Lâm Hub - MM2 Key System with Custom TikTok Link
local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local Workspace = game:GetService("Workspace")
local CoreGui = game:GetService("CoreGui")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Camera = Workspace.CurrentCamera

local CorrectKey = "Free-asdfghjkl"
local TikTokLink = "https://www.tiktok.com/@9th5_._?_r=1&_t=ZS-99gcUvnY0B8"

_G.ESPInnocent, _G.ESPSheriff, _G.ESPMurderer = false, false, false
_G.AimbotSheriff, _G.AimbotMurderer = false, false
_G.Noclip, _G.Flying, _G.FlySpeed = false, false, 60

local ScreenGui = Instance.new("ScreenGui", CoreGui)
ScreenGui.Name, ScreenGui.ResetOnSpawn = "SonLamMM2FinalGui", false

local function Create(class, parent, props)
    local obj = Instance.new(class, parent)
    for k, v in pairs(props) do obj[k] = v end
    return obj
end

local function AddCorner(parent, radius)
    return Create("UICorner", parent, {CornerRadius = radius or UDim.new(0, 6)})
end

local KeySystemFrame = Create("Frame", ScreenGui, {BackgroundColor3 = Color3.fromRGB(15, 15, 15), BorderSizePixel = 0, Position = UDim2.new(0.5, -130, 0.5, -85), Size = UDim2.new(0, 260, 0, 170), Draggable = true, Active = true})
AddCorner(KeySystemFrame)
Create("UIStroke", KeySystemFrame, {Color = Color3.fromRGB(0, 255, 127), Thickness = 1.5})

Create("TextLabel", KeySystemFrame, {BackgroundTransparency = 1, Position = UDim2.new(0, 10, 0, 12), Size = UDim2.new(1, -20, 0, 25), Font = Enum.Font.GothamBold, Text = "SƠN LÂM HUB - XÁC THỰC", TextColor3 = Color3.fromRGB(0, 255, 127), TextSize = 13, TextXAlignment = Enum.TextXAlignment.Center})
Create("TextLabel", KeySystemFrame, {BackgroundTransparency = 1, Position = UDim2.new(0, 15, 0, 45), Size = UDim2.new(1, -30, 0, 20), Font = Enum.Font.GothamSemibold, Text = "Vui lòng nhập Key để sử dụng:", TextColor3 = Color3.fromRGB(200, 200, 200), TextSize = 11, TextXAlignment = Enum.TextXAlignment.Left})

local KeyTextBox = Create("TextBox", KeySystemFrame, {BackgroundColor3 = Color3.fromRGB(25, 25, 25), BorderSizePixel = 0, Position = UDim2.new(0, 15, 0, 70), Size = UDim2.new(1, -30, 0, 36), Font = Enum.Font.GothamBold, PlaceholderText = "Nhập key vào đây...", Text = "", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 12, ClearTextOnFocus = false})
AddCorner(KeyTextBox, UDim.new(0, 5))
Create("UIStroke", KeyTextBox, {Color = Color3.fromRGB(50, 50, 50), Thickness = 1})

local SubmitBtn = Create("TextButton", KeySystemFrame, {BackgroundColor3 = Color3.fromRGB(0, 200, 100), BorderSizePixel = 0, Position = UDim2.new(0, 15, 0, 118), Size = UDim2.new(0.47, -5, 0, 36), Font = Enum.Font.GothamBold, Text = "ĐĂNG NHẬP", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 12})
AddCorner(SubmitBtn, UDim.new(0, 5))

local GetKeyBtn = Create("TextButton", KeySystemFrame, {BackgroundColor3 = Color3.fromRGB(40, 40, 40), BorderSizePixel = 0, Position = UDim2.new(0.53, 5, 0, 118), Size = UDim2.new(0.47, -5, 0, 36), Font = Enum.Font.GothamBold, Text = "LẤY KEY", TextColor3 = Color3.fromRGB(200, 200, 200), TextSize = 12})
AddCorner(GetKeyBtn, UDim.new(0, 5))

-- Vòng FOV thu nhỏ vừa vặn (Bán kính 80, Đường kính 160)
local AimCircle = Create("Frame", ScreenGui, {AnchorPoint = Vector2.new(0.5, 0.5), BackgroundTransparency = 1, Position = UDim2.new(0.5, 0, 0.5, 0), Size = UDim2.new(0, 160, 0, 160), Visible = false})
AddCorner(AimCircle, UDim.new(1, 0))
Create("UIStroke", AimCircle, {Color = Color3.fromRGB(0, 255, 127), Thickness = 1.5})

local ShootButton = Create("TextButton", ScreenGui, {BackgroundColor3 = Color3.fromRGB(200, 50, 50), Position = UDim2.new(0.8, 0, 0.6, 0), Size = UDim2.new(0, 60, 0, 60), Font = Enum.Font.GothamBold, Text = "BẮN", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 14, Draggable = true, Active = true, Visible = false})
AddCorner(ShootButton, UDim.new(1, 0))

local MiniButton = Create("TextButton", ScreenGui, {BackgroundColor3 = Color3.fromRGB(20, 20, 20), BorderColor3 = Color3.fromRGB(0, 255, 127), Position = UDim2.new(0, 15, 0.3, 0), Size = UDim2.new(0, 42, 0, 42), Font = Enum.Font.GothamBold, Text = "HUB", TextColor3 = Color3.fromRGB(0, 255, 127), TextSize = 12, Draggable = true, Active = true, Visible = false})
AddCorner(MiniButton, UDim.new(1, 0))

local MainFrame = Create("Frame", ScreenGui, {BackgroundColor3 = Color3.fromRGB(15, 15, 15), BorderSizePixel = 0, Position = UDim2.new(0, 65, 0.3, 0), Size = UDim2.new(0, 220, 0, 180), Draggable = true, Active = true, Visible = false})
AddCorner(MainFrame)
Create("TextLabel", MainFrame, {BackgroundTransparency = 1, Position = UDim2.new(0, 10, 0, 8), Size = UDim2.new(1, -20, 0, 22), Font = Enum.Font.GothamBold, Text = "SƠN LÂM HUB - MM2", TextColor3 = Color3.fromRGB(0, 255, 127), TextSize = 12})

local CatContainer = Create("ScrollingFrame", MainFrame, {BackgroundTransparency = 1, Position = UDim2.new(0, 10, 0, 35), Size = UDim2.new(1, -20, 1, -45), CanvasSize = UDim2.new(0, 0, 0, 160), ScrollBarThickness = 3, AutomaticCanvasSize = Enum.AutomaticSize.Y})
Create("UIListLayout", CatContainer, {SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 8)})

local SubMenu = Create("Frame", MainFrame, {BackgroundColor3 = Color3.fromRGB(22, 22, 22), BorderSizePixel = 0, Position = UDim2.new(1, 5, 0, 0), Size = UDim2.new(0, 210, 0, 180), Visible = false})
AddCorner(SubMenu)
local SubTitle = Create("TextLabel", SubMenu, {BackgroundTransparency = 1, Position = UDim2.new(0, 10, 0, 8), Size = UDim2.new(1, -20, 0, 22), Font = Enum.Font.GothamBold, Text = "CHI TIẾT", TextColor3 = Color3.fromRGB(0, 255, 127), TextSize = 12})
local SubList = Create("ScrollingFrame", SubMenu, {BackgroundTransparency = 1, Position = UDim2.new(0, 8, 0, 35), Size = UDim2.new(1, -16, 1, -42), CanvasSize = UDim2.new(0, 0, 0, 0), ScrollBarThickness = 3, AutomaticCanvasSize = Enum.AutomaticSize.Y})
Create("UIListLayout", SubList, {SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 6)})

local SubSubMenu = Create("Frame", MainFrame, {BackgroundColor3 = Color3.fromRGB(28, 28, 28), BorderSizePixel = 0, Position = UDim2.new(2, 10, 0, 0), Size = UDim2.new(0, 210, 0, 180), Visible = false})
AddCorner(SubSubMenu)
local SubSubTitle = Create("TextLabel", SubSubMenu, {BackgroundTransparency = 1, Position = UDim2.new(0, 10, 0, 8), Size = UDim2.new(1, -20, 0, 22), Font = Enum.Font.GothamBold, Text = "CHỌN NGƯỜI CHƠI", TextColor3 = Color3.fromRGB(0, 255, 127), TextSize = 12})
local SubSubList = Create("ScrollingFrame", SubSubMenu, {BackgroundTransparency = 1, Position = UDim2.new(0, 8, 0, 35), Size = UDim2.new(1, -16, 1, -42), CanvasSize = UDim2.new(0, 0, 0, 0), ScrollBarThickness = 3, AutomaticCanvasSize = Enum.AutomaticSize.Y})
Create("UIListLayout", SubSubList, {SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 6)})

SubmitBtn.MouseButton1Click:Connect(function()
    if KeyTextBox.Text == CorrectKey then
        KeySystemFrame.Visible = false
        MainFrame.Visible = true
        MiniButton.Visible = true
    else
        KeyTextBox.Text = ""
        KeyTextBox.PlaceholderText = "Sai Key! Nhập lại..."
    end
end)

GetKeyBtn.MouseButton1Click:Connect(function()
    setclipboard(TikTokLink)
    GetKeyBtn.Text = "Đã chép Link TikTok!"
    task.wait(1.5)
    GetKeyBtn.Text = "LẤY KEY"
end)

local function CreateMainBtn(text, order)
    local btn = Create("TextButton", CatContainer, {LayoutOrder = order, BackgroundColor3 = Color3.fromRGB(25, 25, 25), BorderSizePixel = 0, Size = UDim2.new(1, 0, 0, 34), Font = Enum.Font.GothamBold, Text = "  " .. text .. " ➔", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 12, TextXAlignment = Enum.TextXAlignment.Left})
    AddCorner(btn, UDim.new(0, 5))
    return btn
end

local BtnESP = CreateMainBtn("Cài Đặt Định Vị (ESP)", 1)
local BtnAim = CreateMainBtn("Cài Đặt AimBot / Sát Hại", 2)
local BtnTele = CreateMainBtn("Chức Năng Dịch Chuyển (Tele)", 3)
local BtnMisc = CreateMainBtn("Chức Năng Khác (Fly / Noclip)", 4)

local function ClearSub()
    SubSubMenu.Visible = false
    for _, v in pairs(SubList:GetChildren()) do if v:IsA("GuiObject") then v:Destroy() end end
end

local function CreateSubBtn(text, state, callback)
    local btn = Create("TextButton", SubList, {BackgroundColor3 = state and Color3.fromRGB(20, 40, 25) or Color3.fromRGB(28, 28, 28), BorderSizePixel = 0, Size = UDim2.new(1, 0, 0, 34), Font = Enum.Font.GothamSemibold, Text = "  " .. text .. (state and " [ ON ]" or " [ OFF ]"), TextColor3 = state and Color3.fromRGB(0, 255, 127) or Color3.fromRGB(200, 200, 200), TextSize = 11, TextXAlignment = Enum.TextXAlignment.Left})
    AddCorner(btn, UDim.new(0, 5))
    btn.MouseButton1Click:Connect(function()
        local newState = callback()
        btn.Text = "  " .. text .. (newState and " [ ON ]" or " [ OFF ]")
        btn.TextColor3 = newState and Color3.fromRGB(0, 255, 127) or Color3.fromRGB(200, 200, 200)
        btn.BackgroundColor3 = newState and Color3.fromRGB(20, 40, 25) or Color3.fromRGB(28, 28, 28)
    end)
    return btn
end

BtnESP.MouseButton1Click:Connect(function()
    SubMenu.Visible, SubTitle.Text = true, "CHỌN MỤC ĐỊNH VỊ (ESP)"
    ClearSub()
    CreateSubBtn("Người Thường", _G.ESPInnocent, function() _G.ESPInnocent = not _G.ESPInnocent return _G.ESPInnocent end)
    CreateSubBtn("Cảnh Sát & Người Hùng (Xanh)", _G.ESPSheriff, function() _G.ESPSheriff = not _G.ESPSheriff return _G.ESPSheriff end)
    CreateSubBtn("Kẻ Giết Người", _G.ESPMurderer, function() _G.ESPMurderer = not _G.ESPMurderer return _G.ESPMurderer end)
end)

BtnAim.MouseButton1Click:Connect(function()
    SubMenu.Visible, SubTitle.Text = true, "CHỌN MỤC AIMBOT"
    ClearSub()
    CreateSubBtn("Cảnh Sát / Người Hùng (Aim Bắn)", _G.AimbotSheriff, function()
        _G.AimbotSheriff = not _G.AimbotSheriff
        ShootButton.Visible, AimCircle.Visible = _G.AimbotSheriff, _G.AimbotSheriff
        return _G.AimbotSheriff
    end)
    CreateSubBtn("Kẻ Giết Người (Auto Bay Giết)", _G.AimbotMurderer, function() _G.AimbotMurderer = not _G.AimbotMurderer return _G.AimbotMurderer end)
end)

BtnTele.MouseButton1Click:Connect(function()
    SubMenu.Visible, SubTitle.Text = true, "DỊCH CHUYỂN (TELEPORT)"
    ClearSub()
    local teleBtn = Create("TextButton", SubList, {BackgroundColor3 = Color3.fromRGB(28, 28, 28), BorderSizePixel = 0, Size = UDim2.new(1, 0, 0, 34), Font = Enum.Font.GothamSemibold, Text = "  Tele Tới Người Chơi ➔", TextColor3 = Color3.fromRGB(220, 220, 220), TextSize = 11, TextXAlignment = Enum.TextXAlignment.Left})
    AddCorner(teleBtn, UDim.new(0, 5))
    teleBtn.MouseButton1Click:Connect(function()
        SubSubMenu.Visible = true
        for _, v in pairs(SubSubList:GetChildren()) do if v:IsA("TextButton") then v:Destroy() end end
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= LP then
                local pBtn = Create("TextButton", SubSubList, {BackgroundColor3 = Color3.fromRGB(35, 35, 35), BorderSizePixel = 0, Size = UDim2.new(1, 0, 0, 32), Font = Enum.Font.GothamSemibold, Text = "  " .. p.Name, TextColor3 = Color3.fromRGB(220, 220, 220), TextSize = 11, TextXAlignment = Enum.TextXAlignment.Left})
                AddCorner(pBtn, UDim.new(0, 5))
                pBtn.MouseButton1Click:Connect(function()
                    pcall(function()
                        if p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                            LP.Character.HumanoidRootPart.CFrame = p.Character.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0)
                        end
                    end)
                end)
            end
        end
    end)
end)

local bodyVelocity, bodyGyro
BtnMisc.MouseButton1Click:Connect(function()
    SubMenu.Visible, SubTitle.Text = true, "CHỨC NĂNG KHÁC"
    ClearSub()
    CreateSubBtn("Đi Xuyên Tường (Noclip)", _G.Noclip, function() _G.Noclip = not _G.Noclip return _G.Noclip end)
    CreateSubBtn("Bay (Fly)", _G.Flying, function()
        _G.Flying = not _G.Flying
        local char = LP.Character
        if char then
            local hrp, hum = char:FindFirstChild("HumanoidRootPart"), char:FindFirstChildOfClass("Humanoid")
            if _G.Flying and hrp and hum then
                bodyGyro = Create("BodyGyro", hrp, {P = 9e4, MaxTorque = Vector3.new(9e9, 9e9, 9e9), CFrame = hrp.CFrame})
                bodyVelocity = Create("BodyVelocity", hrp, {Velocity = Vector3.new(0, 0, 0), MaxForce = Vector3.new(9e9, 9e9, 9e9)})
                hum.PlatformStand = true
            else
                if bodyGyro then bodyGyro:Destroy() end
                if bodyVelocity then bodyVelocity:Destroy() end
                if hum then hum.PlatformStand = false end
            end
        end
        return _G.Flying
    end)

    local speedFrame = Create("Frame", SubList, {BackgroundColor3 = Color3.fromRGB(25, 25, 25), BorderSizePixel = 0, Size = UDim2.new(1, 0, 0, 34)})
    AddCorner(speedFrame, UDim.new(0, 5))
    Create("TextLabel", speedFrame, {BackgroundTransparency = 1, Position = UDim2.new(0, 8, 0, 0), Size = UDim2.new(0.6, 0, 1, 0), Font = Enum.Font.GothamSemibold, Text = "  Tốc độ Bay:", TextColor3 = Color3.fromRGB(200, 200, 200), TextSize = 11, TextXAlignment = Enum.TextXAlignment.Left})
    local speedBox = Create("TextBox", speedFrame, {BackgroundColor3 = Color3.fromRGB(35, 35, 35), BorderSizePixel = 0, Position = UDim2.new(0.65, 0, 0.15, 0), Size = UDim2.new(0.3, 0, 0.7, 0), Font = Enum.Font.GothamBold, Text = tostring(_G.FlySpeed), TextColor3 = Color3.fromRGB(0, 255, 127), TextSize = 11})
    AddCorner(speedBox, UDim.new(0, 4))
    speedBox.FocusLost:Connect(function()
        _G.FlySpeed = tonumber(speedBox.Text) or _G.FlySpeed
        speedBox.Text = tostring(_G.FlySpeed)
    end)
end)

MiniButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
    if not MainFrame.Visible then SubMenu.Visible, SubSubMenu.Visible = false, false end
end)

local function GetRole(p)
    if not p.Character then return nil, nil end
    if p.Character:FindFirstChild("Knife") or p.Backpack:FindFirstChild("Knife") then return Color3.fromRGB(255, 0, 0), "Murderer" end
    if p.Character:FindFirstChild("Gun") or p.Backpack:FindFirstChild("Gun") then return Color3.fromRGB(0, 0, 255), "Sheriff" end
    return Color3.fromRGB(0, 255, 0), "Innocent"
end

-- Hàm tìm kiếm Murderer chuẩn xác trong bán kính FOV 80 pixels (Ghim vào NGƯỜI / Thân nhân vật)
local function GetClosestMurdererInFOV()
    local targetPart = nil
    local shortestDist = 80
    local screenCenter = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)

    for _, p in pairs(Players:GetPlayers()) do
        if p ~= LP and p.Character then
            local _, role = GetRole(p)
            local hasKnife = p.Character:FindFirstChild("Knife") or (p.Backpack and p.Backpack:FindFirstChild("Knife"))
            local hum = p.Character:FindFirstChild("Humanoid")
            local bodyPart = p.Character:FindFirstChild("HumanoidRootPart") or p.Character:FindFirstChild("Torso") or p.Character:FindFirstChild("UpperTorso")

            if (role == "Murderer" or hasKnife) and hum and hum.Health > 0 and bodyPart then
                local screenPos, onScreen = Camera:WorldToViewportPoint(bodyPart.Position)
                if onScreen then
                    local dist = (Vector2.new(screenPos.X, screenPos.Y) - screenCenter).Magnitude
                    if dist < shortestDist then
                        shortestDist = dist
                        targetPart = bodyPart
                    end
                end
            end
        end
    end
    return targetPart
end

RunService.RenderStepped:Connect(function()
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= LP and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
            local hrp = p.Character.HumanoidRootPart
            local hl = hrp:FindFirstChild("CleanMM2ESP")
            local col, role = GetRole(p)
            local show = (role == "Innocent" and _G.ESPInnocent) or (role == "Sheriff" and _G.ESPSheriff) or (role == "Murderer" and _G.ESPMurderer)
            if show then
                if not hl then
                    hl = Create("Highlight", hrp, {Name = "CleanMM2ESP", Adornee = p.Character, DepthMode = Enum.HighlightDepthMode.AlwaysOnTop})
                end
                hl.FillColor = col
            elseif hl then hl:Destroy() end
        end
    end

    if _G.Noclip and LP.Character then
        for _, part in pairs(LP.Character:GetDescendants()) do if part:IsA("BasePart") then part.CanCollide = false end end
    end

    if _G.Flying then
        pcall(function()
            local char = LP.Character
            local hrp, hum = char and char:FindFirstChild("HumanoidRootPart"), char and char:FindFirstChildOfClass("Humanoid")
            if hrp and hum and bodyGyro and bodyVelocity then
                bodyGyro.CFrame = Camera.CFrame
                local moveDir = hum.MoveDirection
                if moveDir.Magnitude > 0 then
                    local camCF = Camera.CFrame
                    local localMove = camCF:VectorToObjectSpace(moveDir)
                    local flyDir = (camCF.LookVector * -localMove.Z) + (camCF.RightVector * localMove.X)
                    bodyVelocity.Velocity = (flyDir.Magnitude > 0 and flyDir.Unit or Vector3.new()) * _G.FlySpeed
                else
                    bodyVelocity.Velocity = Vector3.new(0, 0, 0)
                end
            end
        end)
    end

    -- GHIM THẲNG VÀO NGƯỜI MUDER KHI Ở TRONG VÒNG FOV
    if _G.AimbotSheriff then
        pcall(function()
            local targetPart = GetClosestMurdererInFOV()
            if targetPart then
                local predictedPos = targetPart.Position + (targetPart.AssemblyLinearVelocity * 0.04)
                local targetCFrame = CFrame.new(Camera.CFrame.Position, predictedPos)
                Camera.CFrame = Camera.CFrame:Lerp(targetCFrame, 0.4)
            end
        end)
    end
end)

-- NÚT BẮN: Khắc phục triệt để lỗi kẹt phím / kẹt nút di chuyển sau khi bắn
ShootButton.MouseButton1Click:Connect(function()
    if _G.AimbotSheriff then
        pcall(function()
            local char = LP.Character
            local hum = char and char:FindFirstChildOfClass("Humanoid")
            local gun = (char and char:FindFirstChild("Gun")) or (LP.Backpack and LP.Backpack:FindFirstChild("Gun"))
            
            if gun then
                if gun.Parent ~= char then
                    gun.Parent = char
                    task.wait(0.02)
                end
                
                gun:Activate()
                
                local vim = game:GetService("VirtualInputManager")
                if vim then
                    vim:SendMouseButtonEvent(0, 0, 0, true, game, 0)
                    task.wait(0.02)
                    vim:SendMouseButtonEvent(0, 0, 0, false, game, 0)
                end
                
                -- Ép buộc làm mới lại bộ điều khiển di chuyển để mở khóa ngay lập tức các nút di chuyển
                task.delay(0.04, function()
                    if hum then
                        hum.PlatformStand = false
                        hum.Sit = false
                        hum:ChangeState(Enum.HumanoidStateType.Running)
                    end
                    local playerGui = LP:FindFirstChildOfClass("PlayerGui")
                    if playerGui then
                        local touchGui = playerGui:FindFirstChild("TouchGui")
                        if touchGui then touchGui.Enabled = false task.wait(0.02) touchGui.Enabled = true end
                    end
                end)
            end
        end)
    end
end)

task.spawn(function()
    while true do
        task.wait(0.2)
        if _G.AimbotMurderer then
            pcall(function()
                local hrp = LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
  
