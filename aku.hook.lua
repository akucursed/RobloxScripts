if getgenv()._akusESPCleanup then
    pcall(getgenv()._akusESPCleanup)
end

Config = {
    Global = {
        EnableESP = true,
        TeamCheck = false,
        HealthCheck = true,
        FadeTime = 0.3,
        RaycastParse = true,
        IgnoreNonCollide = false,
        VisibleCheck = {
            Enable = true,
            Mode = "Color",
            RaycastFPS = 15
        }
    },
    Tracers = {
        Enable = false,
        Color = Color3.fromRGB(255, 255, 255),
        HiddenColor = Color3.fromRGB(255, 0, 0),
        OutlineColor = Color3.fromRGB(0, 0, 0),
        HiddenOutlineColor = Color3.fromRGB(0, 0, 0),
        Thickness = 1,
        Outline = true,
        Mode = "Bottom",
        CustomPos = {X = 0, Y = 0}
    },
    Avatar = {
        Enable = true,
        Size = 24,
        Shape = 'Circle',
        Outline = true,
        OutlineColor = Color3.fromRGB(0, 0, 0),
        HiddenOutlineColor = Color3.fromRGB(0, 0, 0),
        Transparency = 0,
        Filled = {
            Enable = true,
            Color = Color3.fromRGB(30, 30, 30),
            Transparency = 0.5
        }
    },
    Box = {
        Enable = true,
        Dynamic = true,
        ShowOutline = true,
        OutlineColor = Color3.fromRGB(0, 0, 0),
        HiddenOutlineColor = Color3.fromRGB(0, 0, 0),
        Type = 'Corners',
        CornersSize = 0.25,
        Font = 'ProggyClean',
        Color = Color3.fromRGB(255, 255, 255),
        HiddenColor = Color3.fromRGB(255, 0, 0),
        Filled = {
            Enable = false,
            HiddenColor = Color3.fromRGB(255, 0, 0),
            Gradient = {
                Enable = false,
                Color = {
                    Start = Color3.fromRGB(255, 255, 255),
                    End = Color3.fromRGB(0, 255, 0)
                },
                Rotation = {
                    Enable = true,
                    Auto = true,
                    Speed = 1,
                    Angle = 0
                },
                Transparency = 0.3
            }
        }
    },
    Skeleton = {
        Enable = true,
        Color = Color3.fromRGB(255, 255, 255),
        HiddenColor = Color3.fromRGB(255, 0, 0),
        OutlineColor = Color3.fromRGB(0, 0, 0),
        HiddenOutlineColor = Color3.fromRGB(0, 0, 0),
        Thickness = 1,
        Outline = true
    },
    HeadDot = {
        Enable = true,
        Color = Color3.fromRGB(255, 255, 255),
        HiddenColor = Color3.fromRGB(255, 0, 0),
        Radius = 4,
        Outline = true,
        OutlineColor = Color3.fromRGB(0, 0, 0),
        HiddenOutlineColor = Color3.fromRGB(0, 0, 0),
        Filled = {
            Enable = true,
            Transparency = 0.5
        }
    },
    Chams = {
        Enable = true,
        Mode = "Glow",
        Color = Color3.fromRGB(255, 255, 255),
        HiddenColor = Color3.fromRGB(255, 0, 0),
        Highlight = {
            FillColor = Color3.fromRGB(255, 0, 0),
            OutlineColor = Color3.fromRGB(255, 255, 255),
            HiddenFillColor = Color3.fromRGB(255, 0, 0),
            HiddenOutlineColor = Color3.fromRGB(255, 255, 255),
            FillTransparency = 0.5,
            OutlineTransparency = 0,
            AlwaysOnTop = true
        },
        Glow = {
            MainColor = Color3.fromRGB(0, 0, 0),
            GlowMultiplier = 3.5,
            Transparency = 1,
            ThruWalls = false,
            GlowThroughWalls = true
        }
    },
    Text = {
        Enable = true,
        Name = {
            Enable = true,
            Type = "DisplayName",
            Color = Color3.fromRGB(255, 255, 255),
            HiddenColor = Color3.fromRGB(255, 0, 0)
        },
        Studs = {
            Enable = true,
            Color = Color3.fromRGB(255, 255, 255),
            HiddenColor = Color3.fromRGB(255, 0, 0)
        },
        Tool = {
            Enable = true,
            Color = Color3.fromRGB(255, 255, 255),
            HiddenColor = Color3.fromRGB(255, 0, 0)
        }
    },
    Bars = {
        Enable = true,
        Health = {
            Enable = true,
            Width = 2,
            HealthBased = true,
            Color1 = Color3.fromRGB(0, 255, 0),
            Color2 = Color3.fromRGB(255, 255, 0),
            Color3 = Color3.fromRGB(255, 0, 0),
            Text = {
                Enable = true,
                HealthBased = true,
                Color = Color3.fromRGB(255, 255, 255)
            }
        }
    },
    OOFArrows = {
        Enable = false,
        Color = Color3.fromRGB(255, 255, 255),
        Radius = 200,
        Name = {
            Enable = true,
            Type = "DisplayName",
            Color = Color3.fromRGB(255, 255, 255)
        },
        Avatar = {
            Enable = true,
            Size = 24,
            Shape = "Circle",
            Outline = true,
            Filled = {
                Enable = true,
                Color = Color3.fromRGB(30, 30, 30),
                Transparency = 0.5
            }
        },
        Distance = {
            Enable = true,
            Color = Color3.fromRGB(255, 255, 255)
        }
    }
}

pcall(function() setfflag("AdornShadingAPI", "true") end)

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local HttpService = game:GetService("HttpService")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local TS = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")

local LocalPlayer = Players.LocalPlayer

local mouse = LocalPlayer:GetMouse()
local savedMouseIcon = nil  -- Store the original mouse icon
local wasMouseHidden = false  -- Track if mouse was hidden before opening menu

-- Initialize mouse state on startup
pcall(function()
    savedMouseIcon = mouse.Icon or ""
    local UIS = game:GetService("UserInputService")
    wasMouseHidden = not UIS.MouseIconEnabled
    
    -- Force cursor visible on startup
    mouse.Icon = ""
    pcall(function() UIS.MouseIconEnabled = true end)
end)

local math_clamp = math.clamp
local math_floor = math.floor
local math_huge = math.huge
local math_max = math.max
local math_min = math.min
local tick_func = tick
local Vector2_new = Vector2.new
local Vector3_new = Vector3.new
local UDim2_new = UDim2.new
local UDim_new = UDim.new
local Color3_new = Color3.new
local Color3_fromRGB = Color3.fromRGB
local ColorSequence_new = ColorSequence.new
local ColorSequenceKeypoint_new = ColorSequenceKeypoint.new

local UDim_1_0 = UDim_new(1, 0)
local UDim_02_0 = UDim_new(0.2, 0)
local UDim_0_0 = UDim_new(0, 0)
local _V2_0_0   = Vector2_new(0, 0)
local _V2_05_1  = Vector2_new(0.5, 1)
local _V2_05_0  = Vector2_new(0.5, 0)
local _V2_1_1   = Vector2_new(1, 1)
local _V2_2_2   = Vector2_new(2, 2)
local _V3_0_1_0 = Vector3_new(0, 1, 0)
local _V3_0_N3_0 = Vector3_new(0, -3, 0)

local RayParams = RaycastParams.new()
RayParams.FilterType = Enum.RaycastFilterType.Exclude
RayParams.IgnoreWater = true

local stretchActive = false
local stretchScale  = 0.65

local function W2VP(cam, worldPos)
    local p, vis = cam:WorldToViewportPoint(worldPos)
    if stretchActive then
        local cy = cam.ViewportSize.Y * 0.5
        p = Vector3_new(p.X, cy + (p.Y - cy) * stretchScale, p.Z)
    end
    return p, vis
end

local BODY_PARTS = {
    ["Head"] = true, ["Torso"] = true, ["Left Arm"] = true, ["Right Arm"] = true, ["Left Leg"] = true, ["Right Leg"] = true,
    ["UpperTorso"] = true, ["LowerTorso"] = true, ["LeftUpperArm"] = true, ["LeftLowerArm"] = true, ["LeftHand"] = true,
    ["RightUpperArm"] = true, ["RightLowerArm"] = true, ["RightHand"] = true, ["LeftUpperLeg"] = true, ["LeftLowerLeg"] = true,
    ["LeftFoot"] = true, ["RightUpperLeg"] = true, ["RightLowerLeg"] = true, ["RightFoot"] = true
}

local akus_assets = ReplicatedStorage:FindFirstChild("akus_assets") or Instance.new("Folder")
akus_assets.Name = "akus_assets"
akus_assets.Parent = ReplicatedStorage

local Overlay = {}
local Fonts = {['ProggyClean'] = nil}

function Overlay.NewFont(Name, Weight, Style, Asset)
    if not isfile(Asset.Id) then 
        writefile(Asset.Id, Asset.Font) 
    end
    
    local FontPath = Name .. '.font'
    local Data = {
        name = Name,
        faces = {
            {
                name = 'Regular',
                weight = Weight,
                style = Style,
                assetId = getcustomasset(Asset.Id)
            }
        }
    }
    
    writefile(FontPath, HttpService:JSONEncode(Data))
    return getcustomasset(FontPath)
end

local function GetFontData(Url, FileName)
    if isfile(FileName) then
        return readfile(FileName)
    end
    local Success, Content = pcall(game.HttpGet, game, Url)
    if Success then
        return crypt.base64.decode(Content)
    end
    return ""
end

Fonts['ProggyClean'] = Font.new(Overlay.NewFont('Clean', 100, 'normal', {
    Id = 'ProggyClean.ttf',
    Font = GetFontData("https://snippet.host/iemouy/raw", "ProggyClean.ttf")
}))

local utility = { funcs = {} }
local cache = {}
local _connections = {}

utility.funcs.make_text = function(p)
    local d = Instance.new("TextLabel")
    d.Parent = p
    d.Size = UDim2_new(0, 0, 0, 0)
    d.BackgroundTransparency = 1
    d.TextColor3 = Color3_fromRGB(255, 255, 255)
    d.TextStrokeTransparency = 0
    d.TextScaled = false
    d.TextSize = 10
    d.TextStrokeColor3 = Color3_fromRGB(0, 0, 0)
    d.FontFace = Fonts[Config.Box.Font]
    return d
end

local _boneBuf = {}
for i = 1, 14 do _boneBuf[i] = {false, false} end
_boneBuf[1].isHead = true

local function getBones(char, isR15, boneOffsets)
    boneOffsets = boneOffsets or {}
    if isR15 then
        local Head = char:FindFirstChild("Head")
        local UpperTorso = char:FindFirstChild("UpperTorso")
        local LowerTorso = char:FindFirstChild("LowerTorso")
        local LUpperArm = char:FindFirstChild("LeftUpperArm")
        local LLowerArm = char:FindFirstChild("LeftLowerArm")
        local LHand = char:FindFirstChild("LeftHand")
        local RUpperArm = char:FindFirstChild("RightUpperArm")
        local RLowerArm = char:FindFirstChild("RightLowerArm")
        local RHand = char:FindFirstChild("RightHand")
        local LUpperLeg = char:FindFirstChild("LeftUpperLeg")
        local LLowerLeg = char:FindFirstChild("LeftLowerLeg")
        local LFoot = char:FindFirstChild("LeftFoot")
        local RUpperLeg = char:FindFirstChild("RightUpperLeg")
        local RLowerLeg = char:FindFirstChild("RightLowerLeg")
        local RFoot = char:FindFirstChild("RightFoot")

        if not (Head and UpperTorso and LowerTorso and LUpperArm and LLowerArm and LHand and RUpperArm and RLowerArm and RHand and LUpperLeg and LLowerLeg and LFoot and RUpperLeg and RLowerLeg and RFoot) then
            return nil
        end

        -- Use pre-cached constant offsets to avoid Vector3_new() allocations every frame.
        -- Falls back to inline computation on first frame before cache is populated.
        local neck = Head.CFrame * (boneOffsets.headNeck or Vector3_new(0, -Head.Size.Y*0.5, 0))
        local headCenter = Head.Position
        local upperSpine = UpperTorso.Position
        local lowerSpine = LowerTorso.Position

        local lShoulder = LUpperArm.CFrame * (boneOffsets.lUpperArm or Vector3_new(0, LUpperArm.Size.Y*0.5, 0))
        local rShoulder = RUpperArm.CFrame * (boneOffsets.rUpperArm or Vector3_new(0, RUpperArm.Size.Y*0.5, 0))
        local lElbow    = LLowerArm.CFrame * (boneOffsets.lLowerArm or Vector3_new(0, LLowerArm.Size.Y*0.5, 0))
        local rElbow    = RLowerArm.CFrame * (boneOffsets.rLowerArm or Vector3_new(0, RLowerArm.Size.Y*0.5, 0))

        local lHip  = LUpperLeg.CFrame * (boneOffsets.lUpperLeg or Vector3_new(0, LUpperLeg.Size.Y*0.5, 0))
        local rHip  = RUpperLeg.CFrame * (boneOffsets.rUpperLeg or Vector3_new(0, RUpperLeg.Size.Y*0.5, 0))
        local lKnee = LLowerLeg.CFrame * (boneOffsets.lLowerLeg or Vector3_new(0, LLowerLeg.Size.Y*0.5, 0))
        local rKnee = RLowerLeg.CFrame * (boneOffsets.rLowerLeg or Vector3_new(0, RLowerLeg.Size.Y*0.5, 0))

        _boneBuf[1][1] = headCenter;   _boneBuf[1][2] = upperSpine
        _boneBuf[2][1] = upperSpine;   _boneBuf[2][2] = lowerSpine
        _boneBuf[3][1] = neck;         _boneBuf[3][2] = lShoulder
        _boneBuf[4][1] = lShoulder;    _boneBuf[4][2] = lElbow
        _boneBuf[5][1] = lElbow;       _boneBuf[5][2] = LHand.Position
        _boneBuf[6][1] = neck;         _boneBuf[6][2] = rShoulder
        _boneBuf[7][1] = rShoulder;    _boneBuf[7][2] = rElbow
        _boneBuf[8][1] = rElbow;       _boneBuf[8][2] = RHand.Position
        _boneBuf[9][1] = lowerSpine;   _boneBuf[9][2] = lHip
        _boneBuf[10][1] = lHip;        _boneBuf[10][2] = lKnee
        _boneBuf[11][1] = lKnee;       _boneBuf[11][2] = LFoot.Position
        _boneBuf[12][1] = lowerSpine;  _boneBuf[12][2] = rHip
        _boneBuf[13][1] = rHip;        _boneBuf[13][2] = rKnee
        _boneBuf[14][1] = rKnee;       _boneBuf[14][2] = RFoot.Position
    else
        local Head = char:FindFirstChild("Head")
        local Torso = char:FindFirstChild("Torso")
        local LArm = char:FindFirstChild("Left Arm")
        local RArm = char:FindFirstChild("Right Arm")
        local LLeg = char:FindFirstChild("Left Leg")
        local RLeg = char:FindFirstChild("Right Leg")

        if not (Head and Torso and LArm and RArm and LLeg and RLeg) then return nil end

        local neck       = Head.CFrame  * (boneOffsets.headNeck      or Vector3_new(0, -Head.Size.Y*0.5, 0))
        local headCenter = Head.Position
        local upperSpine = Torso.CFrame * (boneOffsets.torsoHalfY    or Vector3_new(0,  Torso.Size.Y*0.5, 0))
        local pelvis     = Torso.CFrame * (boneOffsets.torsoNegHalfY or Vector3_new(0, -Torso.Size.Y*0.5, 0))

        local lShoulder  = Torso.CFrame * (boneOffsets.torsoLShoulder or Vector3_new(-Torso.Size.X*0.5 - 0.5, Torso.Size.Y*0.5, 0))
        local rShoulder  = Torso.CFrame * (boneOffsets.torsoRShoulder or Vector3_new( Torso.Size.X*0.5 + 0.5, Torso.Size.Y*0.5, 0))
        local lElbow = LArm.Position
        local rElbow = RArm.Position
        local lHand  = LArm.CFrame * (boneOffsets.lArmHand or Vector3_new(0, -LArm.Size.Y*0.5, 0))
        local rHand  = RArm.CFrame * (boneOffsets.rArmHand or Vector3_new(0, -RArm.Size.Y*0.5, 0))

        local lHip  = Torso.CFrame * (boneOffsets.torsoLHip or Vector3_new(-Torso.Size.X*0.25, -Torso.Size.Y*0.5, 0))
        local rHip  = Torso.CFrame * (boneOffsets.torsoRHip or Vector3_new( Torso.Size.X*0.25, -Torso.Size.Y*0.5, 0))
        local lKnee = LLeg.Position
        local rKnee = RLeg.Position
        local lFoot = LLeg.CFrame * (boneOffsets.lLegFoot or Vector3_new(0, -LLeg.Size.Y*0.5, 0))
        local rFoot = RLeg.CFrame * (boneOffsets.rLegFoot or Vector3_new(0, -RLeg.Size.Y*0.5, 0))

        _boneBuf[1][1] = headCenter;  _boneBuf[1][2] = upperSpine
        _boneBuf[2][1] = upperSpine;  _boneBuf[2][2] = pelvis
        _boneBuf[3][1] = neck;        _boneBuf[3][2] = lShoulder
        _boneBuf[4][1] = lShoulder;   _boneBuf[4][2] = lElbow
        _boneBuf[5][1] = lElbow;      _boneBuf[5][2] = lHand
        _boneBuf[6][1] = neck;        _boneBuf[6][2] = rShoulder
        _boneBuf[7][1] = rShoulder;   _boneBuf[7][2] = rElbow
        _boneBuf[8][1] = rElbow;      _boneBuf[8][2] = rHand
        _boneBuf[9][1] = pelvis;      _boneBuf[9][2] = lHip
        _boneBuf[10][1] = lHip;       _boneBuf[10][2] = lKnee
        _boneBuf[11][1] = lKnee;      _boneBuf[11][2] = lFoot
        _boneBuf[12][1] = pelvis;     _boneBuf[12][2] = rHip
        _boneBuf[13][1] = rHip;       _boneBuf[13][2] = rKnee
        _boneBuf[14][1] = rKnee;      _boneBuf[14][2] = rFoot
    end
    return _boneBuf
end

local function CreateAdornment(Part, Type, Color, Trans, ZIndex, SizeOffset, Extra)
    Extra = Extra or {}
    local Ad
    if Type == "Cylinder" then
        Ad = Instance.new("CylinderHandleAdornment")
        if Extra.IsR6Head then
            Ad.Height = 1 + (Extra.HeightOffset or 0)
            Ad.Radius = 0.5 + (Extra.RadiusOffset or 0)
        else
            Ad.Height = Part.Size.Y + (Extra.HeightOffset or 0)
            Ad.Radius = (Part.Size.X * 0.5) + (Extra.RadiusOffset or 0)
        end
        Ad.CFrame = CFrame.new(Vector3_new(), Vector3_new(0, 1, 0))
    elseif Type == "Box" then
        Ad = Instance.new("BoxHandleAdornment")
        Ad.Size = Part.Size + (SizeOffset or Vector3_new(0, 0, 0))
    end
    Ad.Name = "Chams"
    Ad.AlwaysOnTop = Extra.AlwaysOnTop ~= false
    Ad.ZIndex = ZIndex
    Ad.Adornee = Part
    Ad.Color3 = Color
    Ad.Transparency = Trans or 0
    if Extra.Shading then
        Ad.Shading = Extra.Shading
    end
    Ad.Parent = Part
    return Ad
end

utility.funcs.render = function(player)
    if not player then return end
    if cache[player] and cache[player].Box and cache[player].Box.Full then return end

    cache[player] = cache[player] or {}
    cache[player].Alpha = cache[player].Alpha or 0
    cache[player].LastRaycast = cache[player].LastRaycast or 0
    cache[player].IsVisibleToCamera = cache[player].IsVisibleToCamera or false
    cache[player].Box = cache[player].Box or {}
    cache[player].Bars = cache[player].Bars or {}
    cache[player].Text = cache[player].Text or {}
    cache[player].Avatar = cache[player].Avatar or {}
    cache[player].Skeleton = cache[player].Skeleton or {}
    cache[player].HeadDot = cache[player].HeadDot or {}
    cache[player].Tracer = cache[player].Tracer or {}

    local filledGui = Instance.new('ScreenGui')
    filledGui.Name = "AkusESP_FilledGui_" .. player.Name
    filledGui.IgnoreGuiInset = true
    filledGui.Parent = CoreGui

    cache[player].Box.Full = {
        Square = Drawing.new("Square"),
        Inline = Drawing.new("Square"),
        Outline = Drawing.new("Square"),
        Filled = Instance.new('Frame', filledGui),
        FilledGui = filledGui
    }
    cache[player].Box.Full.Filled.BorderSizePixel = 0
    
    cache[player].Box.Corners = {}
    for i = 1, 8 do
        cache[player].Box.Corners[i] = {
            Main = Drawing.new("Line"),
            Outline = Drawing.new("Line")
        }
    end

    local Studs = Instance.new("ScreenGui")
    Studs.Name = "AkusESP_Studs_" .. player.Name
    Studs.IgnoreGuiInset = true
    Studs.Parent = CoreGui
    
    local Name = Instance.new("ScreenGui")
    Name.Name = "AkusESP_Name_" .. player.Name
    Name.IgnoreGuiInset = true
    Name.Parent = CoreGui
    
    local Tool = Instance.new("ScreenGui")
    Tool.Name = "AkusESP_Tool_" .. player.Name
    Tool.IgnoreGuiInset = true
    Tool.Parent = CoreGui

    local AvatarGui = Instance.new("ScreenGui")
    AvatarGui.Name = "AkusESP_AvatarGui_" .. player.Name
    AvatarGui.IgnoreGuiInset = true
    AvatarGui.Parent = CoreGui

    local AvatarImage = Instance.new("ImageLabel")
    AvatarImage.AnchorPoint = Vector2_new(0.5, 1)
    AvatarImage.Parent = AvatarGui

    local UICorner = Instance.new("UICorner")
    UICorner.Parent = AvatarImage

    local UIStroke = Instance.new("UIStroke")
    UIStroke.Color = Color3_new(0, 0, 0)
    UIStroke.Thickness = 1
    UIStroke.Parent = AvatarImage

    cache[player].Text.Studs = utility.funcs.make_text(Studs)
    cache[player].Text.Tool = utility.funcs.make_text(Tool)
    cache[player].Text.Name = utility.funcs.make_text(Name)
    
    cache[player].Avatar = {
        Gui = AvatarGui,
        Image = AvatarImage,
        Corner = UICorner,
        Stroke = UIStroke
    }

    task.spawn(function()
        local content, isReady = Players:GetUserThumbnailAsync(player.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
        if isReady and cache[player] and typeof(content) == "string" then
            if cache[player].Avatar then
                cache[player].Avatar.Image.Image = content
            end
            if cache[player].OOF and cache[player].OOF.AvatarImage then
                cache[player].OOF.AvatarImage.Image = content
            end
        end
    end)

    local healthGui = Instance.new("ScreenGui")
    healthGui.Name = "AkusESP_HealthBar_" .. player.Name
    healthGui.IgnoreGuiInset = true
    healthGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    healthGui.Parent = CoreGui

    local healthOutline = Instance.new("Frame")
    healthOutline.BackgroundColor3 = Color3_new(0, 0, 0)
    healthOutline.BorderSizePixel = 0
    healthOutline.Name = "Outline"
    healthOutline.Parent = healthGui

    local healthFill = Instance.new("Frame")
    healthFill.BackgroundTransparency = 0
    healthFill.BorderSizePixel = 0
    healthFill.AnchorPoint = Vector2_new(0, 1)
    healthFill.Name = "Fill"
    healthFill.Parent = healthOutline

    local healthGradient = Instance.new("UIGradient", healthFill)
    healthGradient.Color = ColorSequence_new({
        ColorSequenceKeypoint_new(0, Config.Bars.Health.Color1),
        ColorSequenceKeypoint_new(0.5, Config.Bars.Health.Color2),
        ColorSequenceKeypoint_new(1, Config.Bars.Health.Color3)
    })
    healthGradient.Rotation = 90
    
    local healthText = Instance.new("TextLabel")
    healthText.BackgroundTransparency = 1
    healthText.TextColor3 = Color3_fromRGB(255, 255, 255)
    healthText.TextStrokeTransparency = 0
    healthText.TextScaled = false
    healthText.TextSize = 10
    healthText.TextStrokeColor3 = Color3_fromRGB(0, 0, 0)
    healthText.FontFace = Fonts[Config.Box.Font]
    healthText.AnchorPoint = Vector2_new(1, 0.5)
    healthText.Size = UDim2_new(0, 50, 0, 10)
    healthText.TextXAlignment = Enum.TextXAlignment.Right
    healthText.Parent = healthGui

    cache[player].Bars.Health = {
        Gui = healthGui,
        Outline = healthOutline,
        Frame = healthFill,
        Gradient = healthGradient,
        Text = healthText
    }

    for i = 1, 14 do
        cache[player].Skeleton[i] = {
            Main = Drawing.new("Line"),
            Outline = Drawing.new("Line")
        }
    end

    cache[player].HeadDot = {
        Main = Drawing.new("Circle"),
        Outline = Drawing.new("Circle")
    }

    cache[player].Tracer = {
        Main = Drawing.new("Line"),
        Outline = Drawing.new("Line")
    }

    local highlight = Instance.new("Highlight")
    highlight.Name = player.Name .. "_Highlight"
    highlight.Parent = akus_assets
    cache[player].Chams = {
        Highlight = highlight,
        Glow = {}
    }

    local oofGui = Instance.new("ScreenGui")
    oofGui.IgnoreGuiInset = true
    oofGui.DisplayOrder = 998
    oofGui.Name = "AkusESP_OOF_" .. player.Name
    oofGui.Parent = CoreGui

    local oofNameLabel = utility.funcs.make_text(oofGui)
    oofNameLabel.AnchorPoint = Vector2_new(0.5, 0.5)

    local oofDistLabel = utility.funcs.make_text(oofGui)
    oofDistLabel.AnchorPoint = Vector2_new(0.5, 0.5)

    local oofAvatarGui = Instance.new("ScreenGui")
    oofAvatarGui.IgnoreGuiInset = true
    oofAvatarGui.DisplayOrder = 998
    oofAvatarGui.Name = "AkusESP_OOFAvatar_" .. player.Name
    oofAvatarGui.Parent = CoreGui

    local oofAvatarImage = Instance.new("ImageLabel")
    oofAvatarImage.AnchorPoint = Vector2_new(0.5, 0.5)
    oofAvatarImage.BackgroundTransparency = 1
    oofAvatarImage.Parent = oofAvatarGui

    local oofAvatarCorner = Instance.new("UICorner")
    oofAvatarCorner.Parent = oofAvatarImage

    local oofAvatarStroke = Instance.new("UIStroke")
    oofAvatarStroke.Color = Color3_new(0, 0, 0)
    oofAvatarStroke.Thickness = 1
    oofAvatarStroke.Parent = oofAvatarImage

    cache[player].OOF = {
        Arrow        = Drawing.new("Triangle"),
        Gui          = oofGui,
        NameLabel    = oofNameLabel,
        DistLabel    = oofDistLabel,
        AvatarGui    = oofAvatarGui,
        AvatarImage  = oofAvatarImage,
        AvatarCorner = oofAvatarCorner,
        AvatarStroke = oofAvatarStroke,
    }
end

local function SafeDestroy(obj)
    if not obj then return end
    pcall(function()
        if typeof(obj) == "Instance" then
            obj:Destroy()
        else
            obj:Remove()
        end
    end)
end

utility.funcs.clear_esp = function(player)
    if not cache[player] then return end
    local cp = cache[player]

    if cp.Box and cp.Box.Full then
        cp.Box.Full.Square.Visible = false
        cp.Box.Full.Outline.Visible = false
        cp.Box.Full.Inline.Visible = false
        if cp.Box.Full.Filled then cp.Box.Full.Filled.Visible = false end
    end

    if cp.Box and cp.Box.Corners then
        for i = 1, 8 do
            cp.Box.Corners[i].Main.Visible = false
            cp.Box.Corners[i].Outline.Visible = false
        end
    end

    if cp.Text then
        if cp.Text.Studs then cp.Text.Studs.Visible = false end
        if cp.Text.Tool  then cp.Text.Tool.Visible  = false end
        if cp.Text.Name  then cp.Text.Name.Visible  = false end
    end

    if cp.Avatar and cp.Avatar.Image then cp.Avatar.Image.Visible = false end

    if cp.Bars and cp.Bars.Health and cp.Bars.Health.Frame then
        cp.Bars.Health.Frame.Visible   = false
        cp.Bars.Health.Outline.Visible = false
        cp.Bars.Health.Text.Visible    = false
    end

    if cp.Skeleton then
        for i = 1, 14 do
            if cp.Skeleton[i] then
                cp.Skeleton[i].Main.Visible    = false
                cp.Skeleton[i].Outline.Visible = false
            end
        end
    end

    if cp.HeadDot then
        cp.HeadDot.Main.Visible    = false
        cp.HeadDot.Outline.Visible = false
    end

    if cp.Tracer then
        cp.Tracer.Main.Visible    = false
        cp.Tracer.Outline.Visible = false
    end

    if cp.OOF then
        if cp.OOF.Arrow       then cp.OOF.Arrow.Visible       = false end
        if cp.OOF.NameLabel   then cp.OOF.NameLabel.Visible   = false end
        if cp.OOF.DistLabel   then cp.OOF.DistLabel.Visible   = false end
        if cp.OOF.AvatarImage then cp.OOF.AvatarImage.Visible = false end
    end

    if cp.Chams and cp.Chams.Highlight then cp.Chams.Highlight.Adornee = nil end

    if cp.Chams and cp.Chams.Glow then
        for part, ads in pairs(cp.Chams.Glow) do
            SafeDestroy(ads.glow)
            SafeDestroy(ads.body)
        end
        table.clear(cp.Chams.Glow)
    end
end

utility.funcs.destroy_esp = function(player)
    if not cache[player] then return end
    utility.funcs.clear_esp(player)
    local cp = cache[player]

    if cp.Box then
        if cp.Box.Full then
            SafeDestroy(cp.Box.Full.Square)
            SafeDestroy(cp.Box.Full.Inline)
            SafeDestroy(cp.Box.Full.Outline)
            if cp.Box.Full.FilledGui then SafeDestroy(cp.Box.Full.FilledGui) end
        end
        if cp.Box.Corners then
            for i = 1, 8 do
                if cp.Box.Corners[i] then
                    SafeDestroy(cp.Box.Corners[i].Main)
                    SafeDestroy(cp.Box.Corners[i].Outline)
                end
            end
        end
    end

    if cp.Skeleton then
        for i = 1, 14 do
            if cp.Skeleton[i] then
                SafeDestroy(cp.Skeleton[i].Main)
                SafeDestroy(cp.Skeleton[i].Outline)
            end
        end
    end

    if cp.HeadDot then
        SafeDestroy(cp.HeadDot.Main)
        SafeDestroy(cp.HeadDot.Outline)
    end

    if cp.Tracer then
        SafeDestroy(cp.Tracer.Main)
        SafeDestroy(cp.Tracer.Outline)
    end

    if cp.OOF then
        SafeDestroy(cp.OOF.Arrow)
        if cp.OOF.Gui       then SafeDestroy(cp.OOF.Gui)       end
        if cp.OOF.AvatarGui then SafeDestroy(cp.OOF.AvatarGui) end
    end

    if cp.Bars and cp.Bars.Health and cp.Bars.Health.Gui then
        SafeDestroy(cp.Bars.Health.Gui)
    end

    if cp.Text then
        if cp.Text.Studs and cp.Text.Studs.Parent then SafeDestroy(cp.Text.Studs.Parent) end
        if cp.Text.Name  and cp.Text.Name.Parent  then SafeDestroy(cp.Text.Name.Parent)  end
        if cp.Text.Tool  and cp.Text.Tool.Parent  then SafeDestroy(cp.Text.Tool.Parent)  end
    end

    if cp.Avatar and cp.Avatar.Gui then SafeDestroy(cp.Avatar.Gui) end
    if cp.Chams and cp.Chams.Highlight then SafeDestroy(cp.Chams.Highlight) end

    cache[player] = nil
end

local bfRotAngle = 0

local _cornerBuf = {}
for i = 1, 8 do _cornerBuf[i] = Vector3_new(0, 0, 0) end
local _ptsBuf, _outPtsBuf = {}, {}
for i = 1, 8 do
    _ptsBuf[i]    = {Vector2_new(0, 0), Vector2_new(0, 0)}
    _outPtsBuf[i] = {Vector2_new(0, 0), Vector2_new(0, 0)}
end
local _charModelSet     = {}   
local _chamsCurPartsBuf = {}

local function _isCharPart(inst)
    if not inst then return false end
    local p = inst.Parent
    if not p then return false end
    if _charModelSet[p] then return true end
    local pp = p.Parent
    return pp ~= nil and _charModelSet[pp] == true
end

local function doRaycast(org, d)
    local len = d.Magnitude
    if len < 0.001 then return nil end
    local unit = d * (1 / len)
    local traveled = 0

    for _ = 1, 30 do
        local rem = len - traveled
        if rem < 0.01 then break end
        local result = Workspace:Raycast(org, unit * rem, RayParams)
        if not result then break end
        local inst = result.Instance
        local skip = _isCharPart(inst) or
            (Config.Global.IgnoreNonCollide and not inst.CanCollide)
        if not skip then return result end
        local step = result.Distance + 0.02
        org      = org + unit * step
        traveled = traveled + step
    end

    return nil
end

local _espGetCol_useColorMode = false
local _espGetCol_isVis = false
local function _espGetCol(cfg)
    if _espGetCol_useColorMode and not _espGetCol_isVis then
        return cfg.HiddenColor or Color3_new(1,0,0)
    end
    return cfg.Color or Color3_new(1,1,1)
end

utility.funcs.update = function(player, dt)
    if not player or not cache[player] then return end

    local playerCache = cache[player]
    playerCache.Alpha = playerCache.Alpha or 0

    local character = player.Character
    local client_character = LocalPlayer.Character
    local CurrentCamera = Workspace.CurrentCamera

    -- Rebuild per-character caches on respawn (runs once per new character, not per frame).
    -- _charBaseParts: array of BaseParts filtered by BODY_PARTS (shared by dynamic box & glow chams)
    -- _boneOffsets: pre-computed constant Vector3 joint offsets (eliminates Vector3_new in getBones)
    if character and playerCache._lastChar ~= character then
        playerCache._lastChar = character
        local parts = {}
        for _, part in ipairs(character:GetChildren()) do
            if part:IsA("BasePart") and BODY_PARTS[part.Name] then
                parts[#parts + 1] = part
            end
        end
        playerCache._charBaseParts = parts

        local boneOffsets = {}
        local bHead = character:FindFirstChild("Head")
        if bHead then
            boneOffsets.headNeck = Vector3_new(0, -bHead.Size.Y * 0.5, 0)
        end
        local bHum = character:FindFirstChildWhichIsA("Humanoid")
        if bHum and bHum.RigType == Enum.HumanoidRigType.R15 then
            local LUA = character:FindFirstChild("LeftUpperArm")
            local RUA = character:FindFirstChild("RightUpperArm")
            local LLA = character:FindFirstChild("LeftLowerArm")
            local RLA = character:FindFirstChild("RightLowerArm")
            local LUL = character:FindFirstChild("LeftUpperLeg")
            local RUL = character:FindFirstChild("RightUpperLeg")
            local LLL = character:FindFirstChild("LeftLowerLeg")
            local RLL = character:FindFirstChild("RightLowerLeg")
            if LUA then boneOffsets.lUpperArm = Vector3_new(0, LUA.Size.Y * 0.5, 0) end
            if RUA then boneOffsets.rUpperArm = Vector3_new(0, RUA.Size.Y * 0.5, 0) end
            if LLA then boneOffsets.lLowerArm = Vector3_new(0, LLA.Size.Y * 0.5, 0) end
            if RLA then boneOffsets.rLowerArm = Vector3_new(0, RLA.Size.Y * 0.5, 0) end
            if LUL then boneOffsets.lUpperLeg = Vector3_new(0, LUL.Size.Y * 0.5, 0) end
            if RUL then boneOffsets.rUpperLeg = Vector3_new(0, RUL.Size.Y * 0.5, 0) end
            if LLL then boneOffsets.lLowerLeg = Vector3_new(0, LLL.Size.Y * 0.5, 0) end
            if RLL then boneOffsets.rLowerLeg = Vector3_new(0, RLL.Size.Y * 0.5, 0) end
        else
            -- R6 rig
            local Torso = character:FindFirstChild("Torso")
            local LArm  = character:FindFirstChild("Left Arm")
            local RArm  = character:FindFirstChild("Right Arm")
            local LLeg  = character:FindFirstChild("Left Leg")
            local RLeg  = character:FindFirstChild("Right Leg")
            if Torso then
                boneOffsets.torsoHalfY    = Vector3_new(0,  Torso.Size.Y * 0.5, 0)
                boneOffsets.torsoNegHalfY = Vector3_new(0, -Torso.Size.Y * 0.5, 0)
                boneOffsets.torsoLShoulder = Vector3_new(-Torso.Size.X * 0.5 - 0.5,  Torso.Size.Y * 0.5, 0)
                boneOffsets.torsoRShoulder = Vector3_new( Torso.Size.X * 0.5 + 0.5,  Torso.Size.Y * 0.5, 0)
                boneOffsets.torsoLHip      = Vector3_new(-Torso.Size.X * 0.25, -Torso.Size.Y * 0.5, 0)
                boneOffsets.torsoRHip      = Vector3_new( Torso.Size.X * 0.25, -Torso.Size.Y * 0.5, 0)
            end
            if LArm then boneOffsets.lArmHand = Vector3_new(0, -LArm.Size.Y * 0.5, 0) end
            if RArm then boneOffsets.rArmHand = Vector3_new(0, -RArm.Size.Y * 0.5, 0) end
            if LLeg then boneOffsets.lLegFoot = Vector3_new(0, -LLeg.Size.Y * 0.5, 0) end
            if RLeg then boneOffsets.rLegFoot = Vector3_new(0, -RLeg.Size.Y * 0.5, 0) end
        end
        playerCache._boneOffsets = boneOffsets
    end

    local isVisible = true

    if not character or not client_character or not CurrentCamera then 
        isVisible = false 
    end

    local rootPart, humanoid, head
    if isVisible then
        rootPart = character:FindFirstChild("HumanoidRootPart")
        humanoid = character:FindFirstChildWhichIsA("Humanoid")
        head = character:FindFirstChild("Head")

        if not rootPart or not humanoid or not head then 
            isVisible = false 
        end

        if isVisible and Config.Global.HealthCheck and humanoid.Health <= 0 then
            isVisible = false
        end

        if isVisible and Config.Global.TeamCheck and player.Team == LocalPlayer.Team then
            isVisible = false
        end
    end

    -- Cache position reads once per frame: avoids 5 separate rootPart.Position
    -- allocations and merges the two duplicate W2VP calls into one.
    local rootPos, camPos, Pos, onScreen
    if rootPart and CurrentCamera then
        rootPos = rootPart.Position
        camPos  = CurrentCamera.CFrame.Position
        Pos, onScreen = W2VP(CurrentCamera, rootPos)
    end
    local _onScreenForRaycast = onScreen == true

    if isVisible and _onScreenForRaycast and Config.Global.VisibleCheck.Enable and Config.Global.RaycastParse then
        local raycastInterval = 1 / math_max(1, Config.Global.VisibleCheck.RaycastFPS)
        if tick_func() - playerCache.LastRaycast >= raycastInterval then
            playerCache.LastRaycast = tick_func()
            
            local origin = camPos
            local dir = rootPos - origin

            local hit = doRaycast(origin, dir)
            local isTargetVisible = false
            
            if not hit then
                isTargetVisible = true
            elseif head then
                local headDir = head.Position - origin
                local headHit = doRaycast(origin, headDir)
                if not headHit then
                    isTargetVisible = true
                end
            end
            
            playerCache.IsVisibleToCamera = isTargetVisible
        end
        
        if not playerCache.IsVisibleToCamera and Config.Global.VisibleCheck.Mode == "Render" then
            isVisible = false
        end
    else
        if Config.Global.VisibleCheck.Enable and Config.Global.RaycastParse
            and Config.Global.VisibleCheck.Mode == "Render"
            and not playerCache.IsVisibleToCamera then
            isVisible = false
        end
        playerCache.LastRaycast = 0
    end

    if Config.Global.EnableESP and Config.Text.Enable and Config.Text.Name.Enable and humanoid then
        if humanoid.DisplayDistanceType ~= Enum.HumanoidDisplayDistanceType.None then
            humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
        end
    elseif humanoid then
        if humanoid.DisplayDistanceType == Enum.HumanoidDisplayDistanceType.None then
            humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.Viewer
        end
    end

    local targetAlpha = isVisible and 1 or 0
    local step = dt / Config.Global.FadeTime

    if playerCache.Alpha < targetAlpha then
        playerCache.Alpha = math_min(1, playerCache.Alpha + step)
    elseif playerCache.Alpha > targetAlpha then
        playerCache.Alpha = math_max(0, playerCache.Alpha - step)
    end

    local alpha = playerCache.Alpha
    if alpha <= 0 or not Config.Global.EnableESP then
        if not playerCache.ESPHidden then
            utility.funcs.clear_esp(player)
            playerCache.ESPHidden = true
        end
        return
    end

    local distance
    if rootPos then
        distance = (camPos - rootPos).Magnitude
        if not onScreen then
            if not playerCache.ESPHidden then
                utility.funcs.clear_esp(player)
                playerCache.ESPHidden = true
            end

            local oofValid = Config.OOFArrows.Enable and Config.Global.EnableESP and playerCache.OOF ~= nil
            if oofValid and Config.Global.HealthCheck and humanoid and humanoid.Health <= 0 then oofValid = false end
            if oofValid and Config.Global.TeamCheck and player.Team == LocalPlayer.Team then oofValid = false end
            if oofValid and Config.Global.VisibleCheck.Enable and Config.Global.RaycastParse
                and Config.Global.VisibleCheck.Mode == "Render"
                and not playerCache.IsVisibleToCamera then oofValid = false end

            if not oofValid then
                if playerCache.OOF then
                    playerCache.OOF.Arrow.Visible = false
                    if playerCache.OOF.NameLabel   then playerCache.OOF.NameLabel.Visible   = false end
                    if playerCache.OOF.DistLabel   then playerCache.OOF.DistLabel.Visible   = false end
                    if playerCache.OOF.AvatarImage then playerCache.OOF.AvatarImage.Visible = false end
                end
            else
                local viewportSize = CurrentCamera.ViewportSize
                local screenCenter = Vector2_new(viewportSize.X / 2, viewportSize.Y / 2)

                local dir = Vector2_new(Pos.X, Pos.Y) - screenCenter
                if Pos.Z < 0 then dir = -dir end
                local dirLen = dir.Magnitude
                if dirLen < 1 then dirLen = 1 end
                local normDir = dir / dirLen
                local perp    = Vector2_new(-normDir.Y, normDir.X)

                local radius    = Config.OOFArrows.Radius
                local arrowLen  = 14
                local arrowHalf = 7
                local aSize     = Config.OOFArrows.Avatar.Size

                local avCX = math_floor(screenCenter.X + normDir.X * (radius - 50))
                local avCY = math_floor(screenCenter.Y + normDir.Y * (radius - 50))

                local arrowTip  = Vector2_new(
                    screenCenter.X + normDir.X * (radius - 30 + aSize / 2 + 5),
                    screenCenter.Y + normDir.Y * (radius - 30 + aSize / 2 + 5)
                )
                local arrowBase = Vector2_new(arrowTip.X - normDir.X * arrowLen, arrowTip.Y - normDir.Y * arrowLen)
                local bL = arrowBase - perp * arrowHalf
                local bR = arrowBase + perp * arrowHalf

                local oof = playerCache.OOF
                oof.Arrow.Visible      = true
                oof.Arrow.PointA       = arrowTip
                oof.Arrow.PointB       = bL
                oof.Arrow.PointC       = bR
                oof.Arrow.Color        = Config.OOFArrows.Color
                oof.Arrow.Transparency = alpha
                oof.Arrow.Filled       = true

                if Config.OOFArrows.Avatar.Enable then
                    oof.AvatarGui.DisplayOrder = 998
                    oof.AvatarImage.Visible = true
                    oof.AvatarImage.Size = UDim2_new(0, aSize, 0, aSize)
                    oof.AvatarImage.Position = UDim2_new(0, avCX, 0, avCY)
                    oof.AvatarImage.ImageTransparency = 1 - alpha
                    oof.AvatarImage.BackgroundTransparency = Config.OOFArrows.Avatar.Filled.Enable
                        and (1 - alpha * (1 - Config.OOFArrows.Avatar.Filled.Transparency))
                        or 1
                    oof.AvatarImage.BackgroundColor3 = Config.OOFArrows.Avatar.Filled.Color
                    local shape = Config.OOFArrows.Avatar.Shape
                    if shape == "Circle" then
                        oof.AvatarCorner.CornerRadius = UDim_1_0
                    elseif shape == "RoundedSquare" then
                        oof.AvatarCorner.CornerRadius = UDim_02_0
                    else
                        oof.AvatarCorner.CornerRadius = UDim_0_0
                    end
                    oof.AvatarStroke.Enabled = Config.OOFArrows.Avatar.Outline
                    oof.AvatarStroke.Transparency = 1 - alpha
                else
                    oof.AvatarImage.Visible = false
                end

                local textX = avCX
                local textY = avCY + math_floor(aSize / 2) + 4

                if Config.OOFArrows.Name.Enable then
                    oof.Gui.DisplayOrder = 998
                    oof.NameLabel.Visible = true
                    oof.NameLabel.Position = UDim2_new(0, textX, 0, textY)
                    oof.NameLabel.Text = Config.OOFArrows.Name.Type == "Username" and player.Name or player.DisplayName
                    oof.NameLabel.TextColor3 = Config.OOFArrows.Name.Color
                    oof.NameLabel.TextTransparency = 1 - alpha
                    oof.NameLabel.TextStrokeTransparency = 1 - alpha
                    textY = textY + 12
                else
                    oof.NameLabel.Visible = false
                end

                if Config.OOFArrows.Distance.Enable then
                    oof.DistLabel.Visible = true
                    oof.DistLabel.Position = UDim2_new(0, textX, 0, textY)
                    oof.DistLabel.Text = string.format("[%.0fm]", distance * 0.28)
                    oof.DistLabel.TextColor3 = Config.OOFArrows.Distance.Color
                    oof.DistLabel.TextTransparency = 1 - alpha
                    oof.DistLabel.TextStrokeTransparency = 1 - alpha
                else
                    oof.DistLabel.Visible = false
                end
            end
            return
        end
    else
        if not playerCache.ESPHidden then
            utility.funcs.clear_esp(player)
            playerCache.ESPHidden = true
        end
        return
    end

    playerCache.ESPHidden = false
    if playerCache.OOF then
        playerCache.OOF.Arrow.Visible = false
        if playerCache.OOF.NameLabel   then playerCache.OOF.NameLabel.Visible   = false end
        if playerCache.OOF.DistLabel   then playerCache.OOF.DistLabel.Visible   = false end
        if playerCache.OOF.AvatarImage then playerCache.OOF.AvatarImage.Visible = false end
    end

    local zIndex = math_clamp(math_floor(10000 - distance), 1, 99999)
    local size = _V2_0_0
    local position = _V2_0_0

    local needsBoundingBox = Config.Box.Enable or (Config.Bars.Enable and Config.Bars.Health.Enable) or Config.Text.Enable or Config.Avatar.Enable or Config.Tracers.Enable

    if needsBoundingBox then
        -- Only use the expensive 8-corner Dynamic path when the box itself is visible.
        -- For Avatar/Name/Tracer anchoring, the cheap static method is sufficient.
        if Config.Box.Enable and Config.Box.Dynamic then
            local charBaseParts = playerCache._charBaseParts or {}

            local minX, minY = math_huge, math_huge
            local maxX, maxY = -math_huge, -math_huge
            local visibleCorners = false
            
            for pi = 1, #charBaseParts do
                local part = charBaseParts[pi]
                if part.Parent then
                    local cframe = part.CFrame
                    local pSize = part.Size
                    local sx, sy, sz = pSize.X / 2, pSize.Y / 2, pSize.Z / 2
                    
                    _cornerBuf[1] = cframe * Vector3_new( sx,  sy,  sz)
                    _cornerBuf[2] = cframe * Vector3_new(-sx,  sy,  sz)
                    _cornerBuf[3] = cframe * Vector3_new( sx, -sy,  sz)
                    _cornerBuf[4] = cframe * Vector3_new(-sx, -sy,  sz)
                    _cornerBuf[5] = cframe * Vector3_new( sx,  sy, -sz)
                    _cornerBuf[6] = cframe * Vector3_new(-sx,  sy, -sz)
                    _cornerBuf[7] = cframe * Vector3_new( sx, -sy, -sz)
                    _cornerBuf[8] = cframe * Vector3_new(-sx, -sy, -sz)

                    for i = 1, 8 do
                        local pt, on = W2VP(CurrentCamera, _cornerBuf[i])
                        if on then visibleCorners = true end
                        if pt.X < minX then minX = pt.X end
                        if pt.X > maxX then maxX = pt.X end
                        if pt.Y < minY then minY = pt.Y end
                        if pt.Y > maxY then maxY = pt.Y end
                    end
                end
            end
            
            if not visibleCorners then
                utility.funcs.clear_esp(player)
                return
            end
            
            size = Vector2_new(math_floor(maxX - minX), math_floor(maxY - minY))
            position = Vector2_new(math_floor(minX), math_floor(minY))
        else
            local headPos = W2VP(CurrentCamera, rootPos + _V3_0_1_0)
            local legPos  = W2VP(CurrentCamera, rootPos + _V3_0_N3_0)
            local charSizeY = legPos.Y - headPos.Y
            local sw = math_floor(charSizeY * 0.75)
            local sh = math_floor(charSizeY * 1.6)
            if playerCache._staticSW ~= sw or playerCache._staticSH ~= sh
                or playerCache._staticPX ~= math_floor(Pos.X) or playerCache._staticPY ~= math_floor(Pos.Y) then
                playerCache._staticSW = sw; playerCache._staticSH = sh
                playerCache._staticPX = math_floor(Pos.X); playerCache._staticPY = math_floor(Pos.Y)
                playerCache._staticSize = Vector2_new(sw, sh)
                playerCache._staticPos  = Vector2_new(math_floor(Pos.X - sw / 2), math_floor(Pos.Y - sh / 2))
            end
            size     = playerCache._staticSize or Vector2_new(sw, sh)
            position = playerCache._staticPos  or Vector2_new(math_floor(Pos.X - sw / 2), math_floor(Pos.Y - sh / 2))
        end
    end

    local useColorMode = Config.Global.VisibleCheck.Enable and Config.Global.VisibleCheck.Mode == "Color" and Config.Global.RaycastParse
    local isVis = playerCache.IsVisibleToCamera
    _espGetCol_useColorMode = useColorMode
    _espGetCol_isVis = isVis
    local boxColor   = _espGetCol(Config.Box)
    local skelColor = _espGetCol(Config.Skeleton)
    local headColor = _espGetCol(Config.HeadDot)
    local tracerColor = _espGetCol(Config.Tracers)
    local nameColor = _espGetCol(Config.Text.Name)
    local studsColor = _espGetCol(Config.Text.Studs)
    local toolColor = _espGetCol(Config.Text.Tool)
    local chamsGlowCol = (useColorMode and not isVis) and Config.Chams.HiddenColor or Config.Chams.Color
    local hlFillCol = (useColorMode and not isVis) and Config.Chams.Highlight.HiddenFillColor or Config.Chams.Highlight.FillColor
    local hlOutCol = (useColorMode and not isVis) and Config.Chams.Highlight.HiddenOutlineColor or Config.Chams.Highlight.OutlineColor

    if Config.Box.Enable then
        local fullBox = playerCache.Box.Full
        local square = fullBox.Square
        local outline = fullBox.Outline
        local inline = fullBox.Inline

        if Config.Box.Type == "Full" then
            for i = 1, 8 do
                playerCache.Box.Corners[i].Main.Visible = false
                playerCache.Box.Corners[i].Outline.Visible = false
            end
            
            square.Visible = true
            square.Position = position
            square.Size = size
            square.Color = boxColor
            square.Thickness = 1
            square.Filled = false
            square.ZIndex = zIndex
            square.Transparency = alpha

            if Config.Box.ShowOutline then
                outline.Visible = true
                outline.Position = position - _V2_1_1
                outline.Size = size + _V2_2_2
                outline.Color = (useColorMode and not isVis) and Config.Box.HiddenOutlineColor or Config.Box.OutlineColor
                outline.Thickness = 1
                outline.Filled = false
                outline.ZIndex = zIndex - 1
                outline.Transparency = alpha

                inline.Visible = true
                inline.Position = position + _V2_1_1
                inline.Size = size - _V2_2_2
                inline.Color = (useColorMode and not isVis) and Config.Box.HiddenOutlineColor or Config.Box.OutlineColor
                inline.Thickness = 1
                inline.Filled = false
                inline.ZIndex = zIndex - 1
                inline.Transparency = alpha
            else
                outline.Visible = false
                inline.Visible = false
            end

        elseif Config.Box.Type == "Corners" then
            square.Visible = false
            outline.Visible = false
            inline.Visible = false
            local cLength = math_max(math_floor(size.X * (Config.Box.CornersSize or 0.25)), 3)
            local tlx, tly = position.X, position.Y
            local trx, try = position.X + size.X, position.Y
            local blx, bly = position.X, position.Y + size.Y
            local brx, bry = position.X + size.X, position.Y + size.Y

            _ptsBuf[1][1] = Vector2_new(tlx, tly);         _ptsBuf[1][2] = Vector2_new(tlx + cLength, tly)
            _ptsBuf[2][1] = Vector2_new(tlx, tly);         _ptsBuf[2][2] = Vector2_new(tlx, tly + cLength)
            _ptsBuf[3][1] = Vector2_new(trx, try);         _ptsBuf[3][2] = Vector2_new(trx - cLength, try)
            _ptsBuf[4][1] = Vector2_new(trx, try);         _ptsBuf[4][2] = Vector2_new(trx, try + cLength)
            _ptsBuf[5][1] = Vector2_new(blx, bly);         _ptsBuf[5][2] = Vector2_new(blx + cLength, bly)
            _ptsBuf[6][1] = Vector2_new(blx, bly);         _ptsBuf[6][2] = Vector2_new(blx, bly - cLength)
            _ptsBuf[7][1] = Vector2_new(brx, bry);         _ptsBuf[7][2] = Vector2_new(brx - cLength, bry)
            _ptsBuf[8][1] = Vector2_new(brx, bry);         _ptsBuf[8][2] = Vector2_new(brx, bry - cLength)

            _outPtsBuf[1][1] = Vector2_new(tlx - 1, tly);  _outPtsBuf[1][2] = Vector2_new(tlx + cLength + 1, tly)
            _outPtsBuf[2][1] = Vector2_new(tlx, tly - 1);  _outPtsBuf[2][2] = Vector2_new(tlx, tly + cLength + 1)
            _outPtsBuf[3][1] = Vector2_new(trx + 1, try);  _outPtsBuf[3][2] = Vector2_new(trx - cLength - 1, try)
            _outPtsBuf[4][1] = Vector2_new(trx, try - 1);  _outPtsBuf[4][2] = Vector2_new(trx, try + cLength + 1)
            _outPtsBuf[5][1] = Vector2_new(blx - 1, bly);  _outPtsBuf[5][2] = Vector2_new(blx + cLength + 1, bly)
            _outPtsBuf[6][1] = Vector2_new(blx, bly + 1);  _outPtsBuf[6][2] = Vector2_new(blx, bly - cLength - 1)
            _outPtsBuf[7][1] = Vector2_new(brx + 1, bry);  _outPtsBuf[7][2] = Vector2_new(brx - cLength - 1, bry)
            _outPtsBuf[8][1] = Vector2_new(brx, bry + 1);  _outPtsBuf[8][2] = Vector2_new(brx, bry - cLength - 1)

            for i = 1, 8 do
                local cMain = playerCache.Box.Corners[i].Main
                local cOutline = playerCache.Box.Corners[i].Outline

                cMain.Visible = true
                cMain.From = _ptsBuf[i][1]
                cMain.To = _ptsBuf[i][2]
                cMain.Color = boxColor
                cMain.Thickness = 1
                cMain.ZIndex = zIndex
                cMain.Transparency = alpha

                if Config.Box.ShowOutline then
                    cOutline.Visible = true
                    cOutline.From = _outPtsBuf[i][1]
                    cOutline.To = _outPtsBuf[i][2]
                    cOutline.Color = (useColorMode and not isVis) and Config.Box.HiddenOutlineColor or Config.Box.OutlineColor
                    cOutline.Thickness = 3
                    cOutline.ZIndex = zIndex - 1
                    cOutline.Transparency = alpha
                else
                    cOutline.Visible = false
                end
            end
        end
    else
         local fullBox = playerCache.Box.Full
         if fullBox then
             fullBox.Square.Visible = false
             fullBox.Outline.Visible = false
             fullBox.Inline.Visible = false
         end
         for i = 1, 8 do
            playerCache.Box.Corners[i].Main.Visible = false
            playerCache.Box.Corners[i].Outline.Visible = false
        end
    end

    do
        local fillBox = playerCache.Box.Full
        local filled = fillBox and fillBox.Filled
        if Config.Box.Filled.Enable and filled then
            fillBox.FilledGui.DisplayOrder = zIndex - 1
            filled.Position = UDim2_new(0, position.X, 0, position.Y)
            filled.Size = UDim2_new(0, size.X, 0, size.Y)
            filled.BackgroundTransparency = 1 - (alpha * (1 - (Config.Box.Filled.Gradient.Transparency or 0.5)))
            local bfVisColor = (useColorMode and not isVis) and Config.Box.Filled.HiddenColor or Config.Box.Filled.Gradient.Color.Start
            filled.BackgroundColor3 = Config.Box.Filled.Gradient.Enable and Color3_fromRGB(255, 255, 255) or bfVisColor
            filled.Visible = true
            if Config.Box.Filled.Gradient.Enable then
                local gradient = filled:FindFirstChild("Gradient") or Instance.new("UIGradient")
                gradient.Name = "Gradient"
                local bfS = Config.Box.Filled.Gradient.Color.Start
                local bfE = Config.Box.Filled.Gradient.Color.End
                if playerCache._bfC1 ~= bfS or playerCache._bfC2 ~= bfE then
                    playerCache._bfC1, playerCache._bfC2 = bfS, bfE
                    gradient.Color = ColorSequence_new({
                        ColorSequenceKeypoint_new(0, bfS),
                        ColorSequenceKeypoint_new(1, bfE)
                    })
                end
                gradient.Rotation = bfRotAngle
                if not gradient.Parent then gradient.Parent = filled end
            else
                local gradient = filled:FindFirstChild("Gradient")
                if gradient then gradient:Destroy() end
            end
        elseif filled then
            filled.Visible = false
        end
    end

    local bar_height = size.Y
    local bar_width = Config.Bars.Health.Width
    local base_x = position.X
    local y = position.Y

    if Config.Bars.Health.Enable and humanoid then
        local _maxHp = humanoid.MaxHealth
        if not _maxHp or _maxHp <= 0 or _maxHp ~= _maxHp then _maxHp = 100 end
        local rawHealth = humanoid.Health
        if rawHealth ~= rawHealth or rawHealth == math.huge or rawHealth == -math.huge then rawHealth = 0 end
        local targetHealth = math_clamp(rawHealth / _maxHp, 0, 1)
        local lastHealth = playerCache.Bars.Health.LastHealth or targetHealth
        local lerpedHealth = lastHealth + (targetHealth - lastHealth) * 0.2
        playerCache.Bars.Health.LastHealth = lerpedHealth

        local x = base_x - (bar_width + 4)
        local outline = playerCache.Bars.Health.Outline
        local fill = playerCache.Bars.Health.Frame
        local hText = playerCache.Bars.Health.Text

        local healthColor = Config.Bars.Health.Color1
        if Config.Bars.Health.HealthBased then
            if targetHealth > 0.5 then
                healthColor = Config.Bars.Health.Color2:Lerp(Config.Bars.Health.Color1, (targetHealth - 0.5) * 2)
            else
                healthColor = Config.Bars.Health.Color3:Lerp(Config.Bars.Health.Color2, targetHealth * 2)
            end
        end

        if outline and fill then
            playerCache.Bars.Health.Gui.DisplayOrder = zIndex
            outline.Visible = true
            outline.Position = UDim2_new(0, x - 1, 0, y - 1)
            outline.Size = UDim2_new(0, bar_width + 2, 0, bar_height + 2)
            outline.BackgroundTransparency = 1 - (alpha * (1 - 0.2))

            fill.Visible = true
            fill.Position = UDim2_new(0, 1, 1, -1)
            fill.Size = UDim2_new(0, bar_width, 0, math_floor(lerpedHealth * bar_height))
            fill.BackgroundTransparency = 1 - alpha

            if Config.Bars.Health.HealthBased then
                playerCache.Bars.Health.Gradient.Enabled = false
                fill.BackgroundColor3 = healthColor
            else
                playerCache.Bars.Health.Gradient.Enabled = true
                fill.BackgroundColor3 = Color3_new(1, 1, 1)
                local hc1 = Config.Bars.Health.Color1
                local hc2 = Config.Bars.Health.Color2
                local hc3 = Config.Bars.Health.Color3
                if playerCache._hgC1 ~= hc1 or playerCache._hgC2 ~= hc2 or playerCache._hgC3 ~= hc3 then
                    playerCache._hgC1, playerCache._hgC2, playerCache._hgC3 = hc1, hc2, hc3
                    playerCache.Bars.Health.Gradient.Color = ColorSequence_new({
                        ColorSequenceKeypoint_new(0,   hc1),
                        ColorSequenceKeypoint_new(0.5, hc2),
                        ColorSequenceKeypoint_new(1,   hc3)
                    })
                end
            end

            if Config.Bars.Health.Text.Enable then
                hText.Visible = true
                hText.Position = UDim2_new(0, x - 3, 0, y + math_floor((1 - lerpedHealth) * bar_height))
                hText.Text = tostring(math_floor(humanoid.Health))
                hText.TextTransparency = 1 - alpha
                hText.TextStrokeTransparency = 1 - alpha
                if Config.Bars.Health.Text.HealthBased then
                    hText.TextColor3 = healthColor
                else
                    hText.TextColor3 = Config.Bars.Health.Text.Color
                end
            else
                hText.Visible = false
            end
        end
    else
        if playerCache.Bars.Health.Frame then
            playerCache.Bars.Health.Frame.Visible = false
            playerCache.Bars.Health.Outline.Visible = false
            playerCache.Bars.Health.Text.Visible = false
        end
    end

    local headDotPos
    if Config.HeadDot.Enable and head then
        local headPos, onHead = W2VP(CurrentCamera, head.Position)
        local hMain = playerCache.HeadDot.Main
        local hOutline = playerCache.HeadDot.Outline

        if onHead then
            headDotPos = head.Position - Vector3_new(0, head.Size.Y/2, 0)
            local radius = math_clamp((Config.HeadDot.Radius * 50) / distance, 1, 50)
            
            hMain.Visible = true
            hMain.Position = Vector2_new(headPos.X, headPos.Y)
            hMain.Radius = radius
            hMain.Color = headColor
            hMain.Filled = Config.HeadDot.Filled.Enable
            hMain.Transparency = alpha * (Config.HeadDot.Filled.Enable and (1 - Config.HeadDot.Filled.Transparency) or 1)
            hMain.Thickness = 1
            hMain.ZIndex = zIndex

            if Config.HeadDot.Outline then
                hOutline.Visible = true
                hOutline.Position = hMain.Position
                hOutline.Radius = radius + 1
                hOutline.Color = (useColorMode and not isVis) and Config.HeadDot.HiddenOutlineColor or Config.HeadDot.OutlineColor
                hOutline.Filled = false
                hOutline.Thickness = 1
                hOutline.ZIndex = zIndex - 1
                hOutline.Transparency = alpha
            else
                hOutline.Visible = false
            end
        else
            hMain.Visible = false
            hOutline.Visible = false
        end
    else
        playerCache.HeadDot.Main.Visible = false
        playerCache.HeadDot.Outline.Visible = false
    end

    local isR15 = humanoid and (humanoid.RigType == Enum.HumanoidRigType.R15) or false
    if Config.Skeleton.Enable then
        local bones = getBones(character, isR15, playerCache._boneOffsets)
        if bones then
            for i = 1, 14 do
                local sMain = playerCache.Skeleton[i].Main
                local sOutline = playerCache.Skeleton[i].Outline
                local bone = bones[i]

                if bone then
                    local p1Vec = bone[1]
                    local p2Vec = bone[2]
                    
                    if bone.isHead and Config.HeadDot.Enable and headDotPos then
                        p1Vec = headDotPos
                    end

                    local p1, on1 = W2VP(CurrentCamera, p1Vec)
                    local p2, on2 = W2VP(CurrentCamera, p2Vec)

                    if on1 or on2 then
                        sMain.Visible = true
                        sMain.From = Vector2_new(p1.X, p1.Y)
                        sMain.To = Vector2_new(p2.X, p2.Y)
                        sMain.Color = skelColor
                        sMain.Thickness = Config.Skeleton.Thickness
                        sMain.ZIndex = zIndex
                        sMain.Transparency = alpha

                        if Config.Skeleton.Outline then
                            sOutline.Visible = true
                            sOutline.From = sMain.From
                            sOutline.To = sMain.To
                            sOutline.Color = (useColorMode and not isVis) and Config.Skeleton.HiddenOutlineColor or Config.Skeleton.OutlineColor
                            sOutline.Thickness = sMain.Thickness + 2
                            sOutline.ZIndex = zIndex - 1
                            sOutline.Transparency = alpha
                        else
                            sOutline.Visible = false
                        end
                    else
                        sMain.Visible = false
                        sOutline.Visible = false
                    end
                else
                    sMain.Visible = false
                    sOutline.Visible = false
                end
            end
        end
    else
        for i = 1, 14 do
            playerCache.Skeleton[i].Main.Visible = false
            playerCache.Skeleton[i].Outline.Visible = false
        end
    end

    if Config.Tracers.Enable then
        local tMain = playerCache.Tracer.Main
        local tOutline = playerCache.Tracer.Outline
        local viewportSize = CurrentCamera.ViewportSize
        
        local origin = _V2_0_0
        if Config.Tracers.Mode == "Top" then
            origin = Vector2_new(viewportSize.X / 2, 0)
        elseif Config.Tracers.Mode == "Center" then
            origin = Vector2_new(viewportSize.X / 2, viewportSize.Y / 2)
        elseif Config.Tracers.Mode == "Bottom" then
            origin = Vector2_new(viewportSize.X / 2, viewportSize.Y)
        elseif Config.Tracers.Mode == "Mouse" then
            origin = UserInputService:GetMouseLocation()
        elseif Config.Tracers.Mode == "Custom" then
            origin = Vector2_new(Config.Tracers.CustomPos.X, Config.Tracers.CustomPos.Y)
        end

        local screenTarget
        if Config.Tracers.Mode == "Top" or (Config.Tracers.Mode == "Custom" and origin.Y < viewportSize.Y / 2) then
            screenTarget = Vector2_new(position.X + size.X / 2, position.Y)
        elseif Config.Tracers.Mode == "Center" or Config.Tracers.Mode == "Mouse" then
            screenTarget = Vector2_new(position.X + size.X / 2, position.Y + size.Y / 2)
        else
            screenTarget = Vector2_new(position.X + size.X / 2, position.Y + size.Y)
        end

        tMain.Visible = true
        tMain.From = origin
        tMain.To = screenTarget
        tMain.Color = tracerColor
        tMain.Thickness = 1
        tMain.Transparency = alpha
        tMain.ZIndex = zIndex

        if Config.Tracers.Outline then
            tOutline.Visible = true
            tOutline.From = origin
            tOutline.To = screenTarget
            tOutline.Color = (useColorMode and not isVis) and Config.Tracers.HiddenOutlineColor or Config.Tracers.OutlineColor
            tOutline.Thickness = 3
            tOutline.Transparency = alpha
            tOutline.ZIndex = zIndex - 1
        else
            tOutline.Visible = false
        end
    else
        playerCache.Tracer.Main.Visible = false
        playerCache.Tracer.Outline.Visible = false
    end

    if Config.Chams.Enable then
        if Config.Chams.Mode == "Highlight" then
            local highlight = playerCache.Chams.Highlight
            highlight.Adornee = character
            highlight.FillColor = hlFillCol
            highlight.OutlineColor = hlOutCol
            highlight.FillTransparency = 1 - (alpha * (1 - Config.Chams.Highlight.FillTransparency))
            highlight.OutlineTransparency = 1 - (alpha * (1 - Config.Chams.Highlight.OutlineTransparency))
            highlight.DepthMode = Config.Chams.Highlight.AlwaysOnTop and Enum.HighlightDepthMode.AlwaysOnTop or Enum.HighlightDepthMode.Occluded
            
            if playerCache.Chams.Glow then
                for part, ads in pairs(playerCache.Chams.Glow) do
                    SafeDestroy(ads.glow)
                    SafeDestroy(ads.body)
                end
                table.clear(playerCache.Chams.Glow)
            end
        elseif Config.Chams.Mode == "Glow" then
            playerCache.Chams.Highlight.Adornee = nil
            local IsR6 = humanoid.RigType == Enum.HumanoidRigType.R6
            local cfg = Config.Chams.Glow
            local glowCache = playerCache.Chams.Glow

            table.clear(_chamsCurPartsBuf)
            local _cbpGlow = playerCache._charBaseParts
            if _cbpGlow then
                for _gi = 1, #_cbpGlow do
                    _chamsCurPartsBuf[_cbpGlow[_gi]] = true
                end
            end

            for part, ads in pairs(glowCache) do
                if not _chamsCurPartsBuf[part] then
                    SafeDestroy(ads.glow)
                    SafeDestroy(ads.body)
                    glowCache[part] = nil
                end
            end
            local glowColor = Color3_new(
                chamsGlowCol.R * cfg.GlowMultiplier, 
                chamsGlowCol.G * cfg.GlowMultiplier, 
                chamsGlowCol.B * cfg.GlowMultiplier
            )
            local bodyTrans = 1 - (alpha * (1 - cfg.Transparency))
            local glowTrans = 1 - (alpha * 2) 
            local wallSetting = cfg.GlowThroughWalls

            for part in pairs(_chamsCurPartsBuf) do
                if part.Transparency >= 1 then
                    local ads = glowCache[part]
                    if ads then
                        ads.glow.Visible = false
                        ads.body.Visible = false
                    end
                    continue
                end

                local IsHead   = part.Name == "Head" or part.Name == "FakeHead"
                local IsR6Head = IsR6 and IsHead
                local ads = glowCache[part]

                local needsRebuild = not ads or not ads.glow or not ads.glow.Parent or (ads._wall ~= wallSetting)
                if needsRebuild then
                    if ads then
                        SafeDestroy(ads.glow)
                        SafeDestroy(ads.body)
                    end
                    local glowAd = CreateAdornment(part, IsHead and "Cylinder" or "Box",
                        glowColor, glowTrans, IsHead and 10 or 9, Vector3_new(0.03, 0.03, 0.03),
                        { Shading = wallSetting and Enum.AdornShading.XRayShaded or nil, IsR6Head = IsR6Head, AlwaysOnTop = wallSetting })
                    local bodyAd = CreateAdornment(part, IsHead and "Cylinder" or "Box",
                        cfg.MainColor, bodyTrans, 10, Vector3_new(0.02, 0.02, 0.02),
                        { IsR6Head = IsR6Head, AlwaysOnTop = false })
                    glowCache[part] = { glow = glowAd, body = bodyAd, _wall = wallSetting }
                    ads = glowCache[part]
                end

                ads.glow.Visible = true
                ads.body.Visible = true
                ads.glow.Color3 = glowColor
                ads.glow.Transparency = glowTrans
                ads.body.Color3 = cfg.MainColor
                ads.body.Transparency = bodyTrans
            end
        end
    else
        playerCache.Chams.Highlight.Adornee = nil
        if playerCache.Chams and playerCache.Chams.Glow then
            for part, ads in pairs(playerCache.Chams.Glow) do
                SafeDestroy(ads.glow)
                SafeDestroy(ads.body)
            end
            table.clear(playerCache.Chams.Glow)
        end
    end

    local baseX = math_floor(position.X + (size.X / 2))
    local baseY = position.Y
    
    local currentTopOffset = 10
    local currentBottomOffset = 12

    if Config.Text.Enable then
        local nameLabel = playerCache.Text.Name
        local toolLabel = playerCache.Text.Tool
        local studsLabel = playerCache.Text.Studs

        playerCache.Text.Name.Parent.DisplayOrder = zIndex + 1
        playerCache.Text.Studs.Parent.DisplayOrder = zIndex + 1
        playerCache.Text.Tool.Parent.DisplayOrder = zIndex + 1
    
        if Config.Text.Name.Enable then
            nameLabel.Visible = true
            if not playerCache._nameLabelAnchorSet then
                nameLabel.AnchorPoint = _V2_05_1
                playerCache._nameLabelAnchorSet = true
            end
            local namePosY = baseY - currentTopOffset
            if playerCache._nameX ~= baseX or playerCache._nameY ~= namePosY then
                playerCache._nameX = baseX
                playerCache._nameY = namePosY
                nameLabel.Position = UDim2_new(0, baseX, 0, namePosY)
            end
            local nameText = Config.Text.Name.Type == "Username" and player.Name or player.DisplayName
            if nameLabel.Text ~= nameText then nameLabel.Text = nameText end
            nameLabel.TextTransparency = 1 - alpha
            nameLabel.TextStrokeTransparency = 1 - alpha
            nameLabel.TextColor3 = nameColor
            currentTopOffset = currentTopOffset + 14 
        else
            nameLabel.Visible = false
        end
    
        if Config.Text.Studs.Enable then
            studsLabel.Visible = true
            if not playerCache._studsLabelAnchorSet then
                studsLabel.AnchorPoint = _V2_05_0
                playerCache._studsLabelAnchorSet = true
            end
            local studsPosY = baseY + size.Y + currentBottomOffset
            if playerCache._studsX ~= baseX or playerCache._studsY ~= studsPosY then
                playerCache._studsX = baseX
                playerCache._studsY = studsPosY
                studsLabel.Position = UDim2_new(0, baseX, 0, studsPosY)
            end
            local dist = distance * 0.28
            local distFloor = math_floor(dist)
            if playerCache._lastStudsDist ~= distFloor then
                playerCache._lastStudsDist = distFloor
                studsLabel.Text = string.format("[%.0fm]", dist)
            end
            studsLabel.TextTransparency = 1 - alpha
            studsLabel.TextStrokeTransparency = 1 - alpha
            studsLabel.TextColor3 = studsColor
            currentBottomOffset = currentBottomOffset + 14
        else
            studsLabel.Visible = false
        end

        if Config.Text.Tool.Enable then
            toolLabel.Visible = true
            if not playerCache._toolLabelAnchorSet then
                toolLabel.AnchorPoint = _V2_05_0
                playerCache._toolLabelAnchorSet = true
            end
            local toolPosY = baseY + size.Y + currentBottomOffset
            if playerCache._toolX ~= baseX or playerCache._toolY ~= toolPosY then
                playerCache._toolX = baseX
                playerCache._toolY = toolPosY
                toolLabel.Position = UDim2_new(0, baseX, 0, toolPosY)
            end
            local tool = character:FindFirstChildOfClass("Tool")
            local toolName = tool and tool.Name or "none"
            if toolLabel.Text ~= toolName then toolLabel.Text = toolName end
            toolLabel.TextTransparency = 1 - alpha
            toolLabel.TextStrokeTransparency = 1 - alpha
            toolLabel.TextColor3 = toolColor
        else
            toolLabel.Visible = false
        end
    else
        playerCache.Text.Name.Visible = false
        playerCache.Text.Studs.Visible = false
        playerCache.Text.Tool.Visible = false
    end

    if Config.Avatar.Enable and playerCache.Avatar and playerCache.Avatar.Image then
        local avatarImage = playerCache.Avatar.Image
        local corner = playerCache.Avatar.Corner
        local stroke = playerCache.Avatar.Stroke
        local aSize = Config.Avatar.Size

        playerCache.Avatar.Gui.DisplayOrder = zIndex + 1
        avatarImage.Visible = true
        if playerCache._avSize ~= aSize then
            playerCache._avSize = aSize
            avatarImage.Size = UDim2_new(0, aSize, 0, aSize)
        end
        local avPosY = baseY - currentTopOffset
        if playerCache._avX ~= baseX or playerCache._avY ~= avPosY then
            playerCache._avX = baseX
            playerCache._avY = avPosY
            avatarImage.Position = UDim2_new(0, baseX, 0, avPosY)
        end
        
        avatarImage.ImageTransparency = 1 - alpha
        avatarImage.BackgroundTransparency = Config.Avatar.Filled.Enable and (1 - (alpha * (1 - Config.Avatar.Filled.Transparency))) or 1
        avatarImage.BackgroundColor3 = Config.Avatar.Filled.Color

        local shape = Config.Avatar.Shape
        if shape == "Circle" then
            corner.CornerRadius = UDim_1_0
        elseif shape == "RoundedSquare" then
            corner.CornerRadius = UDim_02_0
        else
            corner.CornerRadius = UDim_0_0
        end

        if stroke then
            stroke.Enabled = Config.Avatar.Outline
            stroke.Color = (useColorMode and not isVis) and Config.Avatar.HiddenOutlineColor or Config.Avatar.OutlineColor
            stroke.Transparency = 1 - alpha
        end
    elseif playerCache.Avatar and playerCache.Avatar.Image then
        playerCache.Avatar.Image.Visible = false
    end
end

local plrs = Players:GetPlayers()
for i = 1, #plrs do
    local player = plrs[i]
    if player ~= LocalPlayer then
        utility.funcs.render(player)
    end
end

table.insert(_connections, Players.PlayerAdded:Connect(function(player)
    if player ~= LocalPlayer then
        utility.funcs.render(player)
    end
end))

table.insert(_connections, Players.PlayerRemoving:Connect(function(player)
    if player ~= LocalPlayer then
        utility.funcs.destroy_esp(player)
    end
end))

RunService:BindToRenderStep("OptimizedESP", 201, function(dt)
    -- Nudge the GC every frame so it stays ahead of per-frame allocations.
    -- This prevents the "big freeze + spike" caused by GC running a full cycle
    -- after accumulating seconds of backlogged garbage.
    pcall(collectgarbage, "step", 1)

    table.clear(_charModelSet)
    if LocalPlayer and LocalPlayer.Character then
        _charModelSet[LocalPlayer.Character] = true
    end
    for v, _ in pairs(cache) do
        if v and v.Character then
            _charModelSet[v.Character] = true
        end
    end
    if desyncVizRig and desyncVizRig.model then
        _charModelSet[desyncVizRig.model] = true
    end
    if desyncVizChar then
        _charModelSet[desyncVizChar] = true
    end
    
    for v, _ in pairs(cache) do
        if v and v.Parent then
            if not Config.Global.EnableESP then
                if not (cache[v] and cache[v].ESPHidden) then
                    utility.funcs.clear_esp(v)
                    if cache[v] then cache[v].ESPHidden = true end
                end
            else
                utility.funcs.update(v, dt)
            end
        else
            utility.funcs.destroy_esp(v)
        end
    end
end)

getgenv()._akusESPCleanup = function()
    RunService:UnbindFromRenderStep("OptimizedESP")
    for _, conn in ipairs(_connections) do
        if conn.Disconnect then pcall(function() conn:Disconnect() end) end
    end
    for player, _ in pairs(cache) do
        if utility and utility.funcs and utility.funcs.destroy_esp then
            pcall(utility.funcs.destroy_esp, player)
        end
    end
    pcall(function()
        if akus_assets then akus_assets:Destroy() end
    end)
    for _, v in ipairs(CoreGui:GetChildren()) do
        if string.match(v.Name, "^AkusESP_") then
            pcall(function() v:Destroy() end)
        end
    end
end

DraxUI = {
    AccentColor = Color3.fromRGB(145, 120, 240),
    AccentObjects = {},
    -- Strong table: colData entries persist even if UI elements are temporarily destroyed
    AnimatedColors  = {},
    -- Per-frame pre-computed color cache; keyed by "speed:seed" for RGB deduplication
    AnimColorSeeds  = {},
    -- Weak-key+value registry so GC'd glows are automatically removed
    GlowRegistry   = setmetatable({}, {__mode = "kv"}),
    ColorWidgets  = setmetatable({}, {__mode = "v"}),
    SecondaryColorPickers = {},
    ConfigWidgets = {},  -- strong table: entry closures {get,load,reset} have no other strong ref
    IsLoadingConfig = false,
    Open = true,
    Keybind = Enum.KeyCode.Insert,
    KeybindCapturing = false,
    GlowEnabled = true
}
UIS = game:GetService("UserInputService")
function DraxUI.UpdateSecondaryColorPickers()
    local show = Config.Global.VisibleCheck.Enable and Config.Global.VisibleCheck.Mode == "Color" and Config.Global.RaycastParse
    for _, widget in pairs(DraxUI.ColorWidgets) do
        if widget.HidSq then
            local vis = widget.PickersVisible and show
            widget.HidSq.Visible = vis
            local hidGlow = widget.HidSq:FindFirstChild("Bloom")
            if hidGlow then DraxUI.SetGlowVisibility(hidGlow, vis) end
        end
    end
    if _G.ChamsSettingsWidgets then
        local isG = (Config.Chams.Mode == "Glow")
        if _G.ChamsSettingsWidgets.hfh and _G.ChamsSettingsWidgets.hfh.Frame then
            _G.ChamsSettingsWidgets.hfh.Frame.Visible = (not isG and show)
        end
        if _G.ChamsSettingsWidgets.hoh and _G.ChamsSettingsWidgets.hoh.Frame then
            _G.ChamsSettingsWidgets.hoh.Frame.Visible = (not isG and show)
        end
    end
end

function DraxUI.Create(className, properties, children)
    local inst = Instance.new(className)
    if className == "TextButton" or className == "TextBox" or className == "TextLabel" then
        inst.Text = ""
    end
    for k, v in pairs(properties or {}) do inst[k] = v end
    for _, child in pairs(children or {}) do child.Parent = inst end
    return inst
end
c = DraxUI.Create

function DraxUI.AddGlow(parent, sizeOffset, transparency)
    -- Glow image has 20x20 empty center, position with scale -1
    local innerPadding = 20
    local glowExtent = sizeOffset
    local glow = c("ImageLabel", {
        Name = "Bloom", 
        BackgroundTransparency = 1, 
        Image = "rbxassetid://18245826428",
        ImageColor3 = DraxUI.AccentColor, 
        ImageTransparency = math.max(0, (transparency or 0.9) - 0.3),
        ScaleType = Enum.ScaleType.Slice,
        SliceCenter = Rect.new(21, 21, 79, 79),
        Size = UDim2.new(1, innerPadding + glowExtent*2, 1, innerPadding + glowExtent*2),
        Position = UDim2.new(-1, 0, -1, 0),
        AnchorPoint = Vector2.new(0, 0),
        ZIndex = 200,
        Visible = true  -- Glow is visible by default, caller can override
    })
    glow.Parent = parent
    DraxUI.GlowRegistry[glow] = true  -- register; auto-removed by GC when glow is destroyed
    return glow
end

function DraxUI.RefreshAllGlows()
    -- Iterate the registry instead of scanning the entire UI tree
    local enabled = DraxUI.GlowEnabled
    for glow in pairs(DraxUI.GlowRegistry) do
        if glow.Parent then
            local shouldBe = glow:GetAttribute("_ShouldBeVisible")
            glow.Visible = (shouldBe ~= false) and enabled
        end
    end
end

function DraxUI.SetGlowVisibility(glowElement, shouldBeVisible)
    -- Helper function to set glow visibility with proper state tracking
    if glowElement and glowElement.Name == "Bloom" then
        glowElement:SetAttribute("_ShouldBeVisible", shouldBeVisible)
        glowElement.Visible = shouldBeVisible and DraxUI.GlowEnabled
    end
end

function DraxUI.Tween(obj, info, props)
    if DraxUI.IsLoadingConfig then
        -- Apply properties instantly to avoid a tween storm during config load
        for k, v in next, props do pcall(function() obj[k] = v end) end
        return nil
    end
    local ok, t = pcall(TS.Create, TS, obj, TweenInfo.new(unpack(info)), props)
    if ok and t then t:Play() end
    return ok and t or nil
end
tween = DraxUI.Tween

function DraxUI.MakeDraggable(topbar, window)
    local dragging, dragInput, dragStart, startPos
    topbar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging, dragStart, startPos = true, input.Position, window.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then dragging = false end
            end)
        end
    end)
    topbar.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then dragInput = input end
    end)
    UIS.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - dragStart
            window.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
end

function DraxUI.SetAccent(color)
    DraxUI.AccentColor = color
    local i = 1
    while i <= #DraxUI.AccentObjects do
        local item = DraxUI.AccentObjects[i]
        if item.Obj and item.Obj.Parent then
            if item.IsToggle then
                if item.GetState() then item.Obj[item.Prop] = color end
            else
                item.Obj[item.Prop] = color
            end
            i = i + 1
        else
            table.remove(DraxUI.AccentObjects, i)
        end
    end
end

UIS.InputBegan:Connect(function(input, gpe)
    if not gpe and not DraxUI.KeybindCapturing and input.KeyCode == DraxUI.Keybind then
        DraxUI.Open = not DraxUI.Open
        if DraxUI.ScreenGui then 
            DraxUI.ScreenGui.Enabled = DraxUI.Open
        end
        -- Manage mouse cursor
        if DraxUI.Open then
            -- Opening menu: save current icon and visibility state, then show cursor
            local UIS = game:GetService("UserInputService")
            
            -- Save current state
            savedMouseIcon = mouse.Icon or ""
            wasMouseHidden = not UIS.MouseIconEnabled
            
            -- Force cursor visible with default icon
            mouse.Icon = ""  -- Show default cursor (remove custom image)
            pcall(function() UIS.MouseIconEnabled = true end)
        else
            -- Closing menu: restore saved icon and visibility state
            mouse.Icon = savedMouseIcon or ""
            
            -- Restore visibility state
            if wasMouseHidden then
                pcall(function() game:GetService("UserInputService").MouseIconEnabled = false end)
            end
        end
        -- Note: Click blocker button visibility is now managed by Background system (updateBgVisibility)
    end
end)

RunService.RenderStepped:Connect(function(dt)
    local i = 1
    while i <= #DraxUI.AccentObjects do
        local item = DraxUI.AccentObjects[i]
        if not item or not item.Obj or not item.Obj.Parent then
            table.remove(DraxUI.AccentObjects, i)
        else
            i = i + 1
        end
    end

    local seeds = DraxUI.AnimColorSeeds
    local t = tick()
    for id, anim in pairs(DraxUI.AnimatedColors) do
        if not anim or not anim.Box or not anim.Box.Parent then
            DraxUI.AnimatedColors[id] = nil
            continue
        end
        if anim.Mode ~= "RGB" and anim.Mode ~= "Seq" then continue end
        
        anim.Speed = anim.Speed or 1
        anim.Seed = anim.Seed or 0
        if anim.Mode == "RGB" then
            local key = anim.Speed .. ":" .. anim.Seed
            local col = seeds[key]
            if not col then
                col = Color3.fromHSV((t * anim.Speed * 0.1 + anim.Seed) % 1, 1, 1)
                seeds[key] = col
            end
            anim.Color = col
            if anim.Callback then anim.Callback(col, anim.Alpha) end
            anim.Box.BackgroundColor3 = col
            if not anim._bloom or not anim._bloom.Parent then
                anim._bloom = anim.Box:FindFirstChild("Bloom")
            end
            if anim._bloom then anim._bloom.ImageColor3 = col end
        elseif anim.Mode == "Seq" and anim.Stops and #anim.Stops >= 2 then
            anim.SeqPos = (t * anim.Speed + anim.Seed) % #anim.Stops
            local i0 = math.floor(anim.SeqPos) + 1
            local i1 = (i0 % #anim.Stops) + 1
            local lt = anim.SeqPos - math.floor(anim.SeqPos)
            local col = anim.Stops[i0]:Lerp(anim.Stops[i1], lt)
            anim.Color = col
            if anim.Callback then anim.Callback(col, anim.Alpha) end
            anim.Box.BackgroundColor3 = col
            if not anim._bloom or not anim._bloom.Parent then
                anim._bloom = anim.Box:FindFirstChild("Bloom")
            end
            if anim._bloom then anim._bloom.ImageColor3 = col end
        end
    end
    table.clear(seeds)
end)

function DraxUI.CreateColorPickerPopup(parentBox, colData, baseZ, opts)
    local bZ = baseZ or 300
    local pickerFrame = c("Frame", {
        BackgroundColor3 = Color3.fromRGB(20, 20, 20), Position = UDim2.new(0, parentBox.AbsolutePosition.X - 222, 0, parentBox.AbsolutePosition.Y + 24),
        Size = UDim2.new(0, 240, 0, 280), ZIndex = bZ, Active = true
    }, {c("UICorner", {CornerRadius = UDim.new(0, 6)}), c("UIStroke", {Color = Color3.fromRGB(35, 35, 35), Thickness = 1})})

    if not colData.AnimId then colData.AnimId = tostring(colData) end
    local animId = colData.AnimId
    colData.SeqPos = colData.SeqPos or 0
    colData.Hue = colData.Hue or 0
    colData.Speed = colData.Speed or 1
    DraxUI.AnimatedColors[animId] = colData

    local modeBg = c("Frame", {BackgroundColor3 = Color3.fromRGB(15, 15, 15), Size = UDim2.new(1, -16, 0, 24), Position = UDim2.new(0, 8, 0, 8), ZIndex = bZ+1}, {
        c("UICorner", {CornerRadius = UDim.new(0, 12)}), c("UIStroke", {Color = Color3.fromRGB(35, 35, 35), Thickness = 1})
    })
    modeBg.Parent = pickerFrame

    local modes = (opts and opts.modes) or {"Solid", "Seq", "RGB"}
    local indWidth = (240 - 16) / #modes
    local modeInd = c("Frame", {BackgroundColor3 = Color3.fromRGB(45, 45, 45), Position = UDim2.new(0, 2, 0, 2), Size = UDim2.new(0, indWidth - 4, 1, -4), ZIndex = bZ+2}, {c("UICorner", {CornerRadius = UDim.new(0, 10)})})
    modeInd.Parent = modeBg

    local contentArea = c("Frame", {BackgroundTransparency = 1, Position = UDim2.new(0, 8, 0, 40), Size = UDim2.new(1, -16, 1, -48), ZIndex = bZ+1})
    contentArea.Parent = pickerFrame

    local modeBtns = {}
    -- Track global UIS connections so they can be disconnected when the popup closes
    local popupUISConns = {}
    local function renderMode(mode)
        for _, conn in ipairs(popupUISConns) do conn:Disconnect() end
        table.clear(popupUISConns)
        for _, ch in pairs(contentArea:GetChildren()) do ch:Destroy() end
        colData.Mode = mode
        if mode == "Solid" then
            pickerFrame.Size = UDim2.new(0, 240, 0, 240)
            
            local svMap = c("TextButton", {Text="", AutoButtonColor=false, BackgroundColor3 = Color3.fromHSV(colData.Hue, 1, 1), Size = UDim2.new(0, 196, 0, 150), Position = UDim2.new(0, 0, 0, 0), ZIndex = bZ+2}, {
                c("UICorner", {CornerRadius = UDim.new(0, 4)}), c("UIStroke", {Color = Color3.fromRGB(40,40,40), Thickness = 1})
            })
            local wGrad = c("Frame", {BackgroundColor3 = Color3.fromRGB(255,255,255), Size = UDim2.new(1,0,1,0), ZIndex = bZ+3}, {
                c("UICorner", {CornerRadius = UDim.new(0, 4)}), c("UIGradient", {Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,0), NumberSequenceKeypoint.new(1,1)})})
            })
            local bGrad = c("Frame", {BackgroundColor3 = Color3.fromRGB(0,0,0), Size = UDim2.new(1,0,1,0), ZIndex = bZ+4}, {
                c("UICorner", {CornerRadius = UDim.new(0, 4)}), c("UIGradient", {Rotation = 90, Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0,1), NumberSequenceKeypoint.new(1,0)})})
            })
            wGrad.Parent = svMap; bGrad.Parent = svMap
            
            local svInd = c("Frame", {BackgroundColor3 = Color3.fromRGB(255,255,255), Size = UDim2.new(0,4,0,4), AnchorPoint = Vector2.new(0.5,0.5), ZIndex = bZ+5}, {c("UICorner", {CornerRadius = UDim.new(1,0)}), c("UIStroke", {Color = Color3.fromRGB(0,0,0), Thickness=1})})
            svInd.Parent = svMap; svMap.Parent = contentArea

            local hueMap = c("TextButton", {Text="", AutoButtonColor=false, BackgroundColor3=Color3.fromRGB(255,255,255), Size = UDim2.new(0, 20, 0, 150), Position = UDim2.new(0, 204, 0, 0), ZIndex = bZ+2}, {
                c("UICorner", {CornerRadius = UDim.new(0, 4)}), c("UIStroke", {Color = Color3.fromRGB(40,40,40), Thickness = 1}),
                c("UIGradient", {
                    Rotation = 90, 
                    Color = ColorSequence.new{
                        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
                        ColorSequenceKeypoint.new(0.167, Color3.fromRGB(255, 255, 0)),
                        ColorSequenceKeypoint.new(0.333, Color3.fromRGB(0, 255, 0)),
                        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 255, 255)),
                        ColorSequenceKeypoint.new(0.667, Color3.fromRGB(0, 0, 255)),
                        ColorSequenceKeypoint.new(0.833, Color3.fromRGB(255, 0, 255)),
                        ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 0, 0))
                    }
                })
            })
            local hueInd = c("Frame", {BackgroundColor3 = Color3.fromRGB(255,255,255), Size = UDim2.new(1,2,0,2), AnchorPoint = Vector2.new(0.5,0.5), Position=UDim2.new(0.5,0,colData.Hue,0), ZIndex = bZ+5}, {c("UIStroke", {Color = Color3.fromRGB(0,0,0), Thickness=1})})
            hueInd.Parent = hueMap; hueMap.Parent = contentArea

            local hexTxt = c("TextLabel", {Text="HEX", TextColor3=Color3.fromRGB(150,150,150), Size=UDim2.new(0,40,0,24), Position=UDim2.new(0,0,0,158), BackgroundTransparency=1, Font=Enum.Font.Gotham, TextSize=13, TextXAlignment=Enum.TextXAlignment.Left, ZIndex=bZ+2})
            hexTxt.Parent = contentArea
            local hexBox = c("TextBox", {Text=colData.Color:ToHex(), Size=UDim2.new(1,-50,0,24), Position=UDim2.new(0,50,0,158), BackgroundColor3=Color3.fromRGB(15,15,15), TextColor3=Color3.fromRGB(255,255,255), Font=Enum.Font.Gotham, TextSize=13, ZIndex=bZ+2}, {c("UICorner",{CornerRadius=UDim.new(0,4)}), c("UIStroke",{Color=Color3.fromRGB(35,35,35),Thickness=1})})
            hexBox.Parent = contentArea

            local function updateSV(s, v)
                colData.Sat = s; colData.Val = v; svInd.Position = UDim2.new(s, 0, 1-v, 0)
                colData.Color = Color3.fromHSV(colData.Hue, s, v)
                hexBox.Text = colData.Color:ToHex()
                if colData.Callback then colData.Callback(colData.Color, colData.Alpha) end
                if colData.Box and colData.Box.Parent then colData.Box.BackgroundColor3 = colData.Color end
            end
            
            local function updateHue(h)
                colData.Hue = h; hueInd.Position = UDim2.new(0.5, 0, h, 0)
                svMap.BackgroundColor3 = Color3.fromHSV(h, 1, 1)
                colData.Color = Color3.fromHSV(h, colData.Sat, colData.Val)
                hexBox.Text = colData.Color:ToHex()
                if colData.Callback then colData.Callback(colData.Color, colData.Alpha) end
                if colData.Box and colData.Box.Parent then colData.Box.BackgroundColor3 = colData.Color end
            end

            updateSV(colData.Sat, colData.Val); updateHue(colData.Hue)

            local dSV, dH = false, false
            svMap.InputBegan:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then dSV = true updateSV(math.clamp((i.Position.X - svMap.AbsolutePosition.X)/svMap.AbsoluteSize.X, 0, 1), 1 - math.clamp((i.Position.Y - svMap.AbsolutePosition.Y)/svMap.AbsoluteSize.Y, 0, 1)) end end)
            hueMap.InputBegan:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then dH = true updateHue(math.clamp((i.Position.Y - hueMap.AbsolutePosition.Y)/hueMap.AbsoluteSize.Y, 0, 1)) end end)
            table.insert(popupUISConns, UIS.InputEnded:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then dSV=false dH=false end end))
            table.insert(popupUISConns, UIS.InputChanged:Connect(function(i)
                if i.UserInputType == Enum.UserInputType.MouseMovement then
                    if dSV then updateSV(math.clamp((i.Position.X - svMap.AbsolutePosition.X)/svMap.AbsoluteSize.X, 0, 1), 1 - math.clamp((i.Position.Y - svMap.AbsolutePosition.Y)/svMap.AbsoluteSize.Y, 0, 1)) end
                    if dH then updateHue(math.clamp((i.Position.Y - hueMap.AbsolutePosition.Y)/hueMap.AbsoluteSize.Y, 0, 1)) end
                end
            end))

            hexBox.FocusLost:Connect(function()
                local str = hexBox.Text:gsub("#","")
                if #str >= 6 then
                    local r = tonumber(str:sub(1,2),16) or 255
                    local g = tonumber(str:sub(3,4),16) or 255
                    local b = tonumber(str:sub(5,6),16) or 255
                    local cl = Color3.fromRGB(r,g,b)
                    local h,s,v = cl:ToHSV()
                    updateHue(h); updateSV(s,v)
                end
            end)

        elseif mode == "RGB" or mode == "Seq" then
            pickerFrame.Size = UDim2.new(0, 240, 0, mode == "Seq" and 195 or 140)
            c("TextLabel", {Text = "Speed", TextColor3 = Color3.fromRGB(200,200,200), Size=UDim2.new(0,100,0,14), BackgroundTransparency=1, Font=Enum.Font.Gotham, TextSize=13, TextXAlignment=Enum.TextXAlignment.Left, ZIndex = bZ+2}).Parent = contentArea
            local spdTrack = c("TextButton", {Text="", BackgroundColor3=Color3.fromRGB(30,30,30), Size=UDim2.new(1,0,0,6), Position=UDim2.new(0,0,0,20), ZIndex = bZ+2}, {c("UICorner",{CornerRadius=UDim.new(0,3)})})
            local spdFill = c("Frame", {BackgroundColor3=DraxUI.AccentColor, Size=UDim2.new(colData.Speed/5,0,1,0), ZIndex = bZ+3}, {c("UICorner",{CornerRadius=UDim.new(0,3)})})
            spdFill.Parent = spdTrack; spdTrack.Parent = contentArea
            table.insert(DraxUI.AccentObjects, {Obj = spdFill, Prop = "BackgroundColor3"})

            local dragSpd = false
            spdTrack.InputBegan:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then dragSpd = true colData.Speed = math.clamp((i.Position.X - spdTrack.AbsolutePosition.X)/spdTrack.AbsoluteSize.X, 0, 1) * 5 spdFill.Size = UDim2.new(colData.Speed/5,0,1,0) end end)
            table.insert(popupUISConns, UIS.InputEnded:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then dragSpd = false end end))
            table.insert(popupUISConns, UIS.InputChanged:Connect(function(i) if dragSpd and i.UserInputType == Enum.UserInputType.MouseMovement then colData.Speed = math.clamp((i.Position.X - spdTrack.AbsolutePosition.X)/spdTrack.AbsoluteSize.X, 0, 1) * 5 spdFill.Size = UDim2.new(colData.Speed/5,0,1,0) end end))

            local preview = c("Frame", {BackgroundColor3 = Color3.fromRGB(255, 255, 255), Size=UDim2.new(1,0,0,14), Position=UDim2.new(0,0,0,36), ZIndex = bZ+2}, {c("UICorner",{CornerRadius=UDim.new(0,4)}), c("UIStroke",{Color=Color3.fromRGB(45,45,45),Thickness=1})})
            preview.Parent = contentArea

            if mode == "RGB" then
                c("UIGradient", {Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(255,0,0)), ColorSequenceKeypoint.new(0.167, Color3.fromRGB(255,255,0)), ColorSequenceKeypoint.new(0.333, Color3.fromRGB(0,255,0)), ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0,255,255)), ColorSequenceKeypoint.new(0.667, Color3.fromRGB(0,0,255)), ColorSequenceKeypoint.new(0.833, Color3.fromRGB(255,0,255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255,0,0))}}).Parent = preview
            else
                local seqGrad = c("UIGradient", {})
                seqGrad.Parent = preview
                
                local stopsArea = c("Frame", {BackgroundTransparency=1, Size=UDim2.new(1,0,0,24), Position=UDim2.new(0,0,0,56), ZIndex=bZ+2}, {c("UIListLayout", {FillDirection=Enum.FillDirection.Horizontal, Padding=UDim.new(0,4)})})
                stopsArea.Parent = contentArea

                local function updateSeqGrad()
                    if #colData.Stops < 2 then return end
                    local kp = {}
                    for i, c3 in ipairs(colData.Stops) do table.insert(kp, ColorSequenceKeypoint.new((i-1)/(#colData.Stops-1), c3)) end
                    seqGrad.Color = ColorSequence.new(kp)
                end
                updateSeqGrad()

                local function renderStops()
                    for _, ch in pairs(stopsArea:GetChildren()) do if ch:IsA("TextButton") then ch:Destroy() end end
                    for i, stop in ipairs(colData.Stops) do
                        local btn = c("TextButton", {Text="", BackgroundColor3=stop, Size=UDim2.new(0,20,0,20), ZIndex=bZ+3}, {c("UICorner",{CornerRadius=UDim.new(0,4)}), c("UIStroke",{Color=colData.SelectedStop==i and Color3.fromRGB(200,200,200) or Color3.fromRGB(50,50,50), Thickness=1})})
                        btn.Parent = stopsArea
                        local stopPop, stopCloser = nil, nil
                        btn.MouseButton1Click:Connect(function()
                            -- update selection indicator without destroying buttons
                            colData.SelectedStop = i
                            for _, ch2 in pairs(stopsArea:GetChildren()) do
                                local sk = ch2:FindFirstChildOfClass("UIStroke")
                                if sk then sk.Color = Color3.fromRGB(50,50,50) end
                            end
                            local myStroke = btn:FindFirstChildOfClass("UIStroke")
                            if myStroke then myStroke.Color = Color3.fromRGB(200,200,200) end
                            -- toggle color picker for this stop
                            if stopPop then stopPop:Destroy(); stopPop=nil; if stopCloser then stopCloser:Destroy(); stopCloser=nil end; return end
                            local h,s,v = colData.Stops[i]:ToHSV()
                            local stopColData = {
                                Color=colData.Stops[i], Alpha=1, Hue=h, Sat=s, Val=v, Mode="Solid", Speed=1,
                                Stops={colData.Stops[i], Color3.fromRGB(0,0,0)}, SelectedStop=1, SeqPos=0, Box=btn,
                                Callback=function(c3)
                                    colData.Stops[i] = c3
                                    if btn and btn.Parent then btn.BackgroundColor3 = c3 end
                                    updateSeqGrad()
                                end
                            }
                            stopPop, stopCloser = DraxUI.CreateColorPickerPopup(btn, stopColData, bZ+20, {modes={"Solid","RGB"}})
                            if stopCloser then
                                stopCloser.MouseButton1Click:Connect(function() stopPop=nil; stopCloser=nil end)
                            end
                        end)
                    end
                end
                renderStops()

                local addBtn = c("TextButton", {Text="+ Add", BackgroundColor3=Color3.fromRGB(30,30,30), TextColor3=Color3.fromRGB(200,200,200), Size=UDim2.new(0,50,0,20), Position=UDim2.new(0,0,0,84), ZIndex=bZ+3, Font=Enum.Font.Gotham, TextSize=12}, {c("UICorner",{CornerRadius=UDim.new(0,4)})})
                local remBtn = c("TextButton", {Text="- Rem", BackgroundColor3=Color3.fromRGB(150,40,40), TextColor3=Color3.fromRGB(200,200,200), Size=UDim2.new(0,50,0,20), Position=UDim2.new(0,55,0,84), ZIndex=bZ+3, Font=Enum.Font.Gotham, TextSize=12}, {c("UICorner",{CornerRadius=UDim.new(0,4)})})
                addBtn.Parent = contentArea; remBtn.Parent = contentArea

                addBtn.MouseButton1Click:Connect(function()
                    table.insert(colData.Stops, colData.Stops[colData.SelectedStop] or Color3.fromRGB(255,255,255))
                    colData.SelectedStop = #colData.Stops; updateSeqGrad(); renderStops()
                end)
                remBtn.MouseButton1Click:Connect(function()
                    if #colData.Stops > 2 then
                        table.remove(colData.Stops, colData.SelectedStop)
                        colData.SelectedStop = math.max(1, colData.SelectedStop - 1)
                        updateSeqGrad(); renderStops()
                    end
                end)
            end
            -- Seed slider (phase offset for tick()-based sync)
            colData.Seed = colData.Seed or 0
            local startY = (mode == "RGB") and 58 or 112
            c("TextLabel", {Text="Seed", TextColor3=Color3.fromRGB(200,200,200), Size=UDim2.new(0,80,0,14), Position=UDim2.new(0,0,0,startY), BackgroundTransparency=1, Font=Enum.Font.Gotham, TextSize=13, TextXAlignment=Enum.TextXAlignment.Left, ZIndex=bZ+2}).Parent = contentArea
            local seedValTxt = c("TextLabel", {Text=string.format("%.1f", colData.Seed), TextColor3=Color3.fromRGB(150,150,150), Size=UDim2.new(0,50,0,14), Position=UDim2.new(1,-50,0,startY), BackgroundTransparency=1, Font=Enum.Font.Gotham, TextSize=12, TextXAlignment=Enum.TextXAlignment.Right, ZIndex=bZ+2})
            seedValTxt.Parent = contentArea
            local seedTrack = c("TextButton", {Text="", BackgroundColor3=Color3.fromRGB(30,30,30), Size=UDim2.new(1,0,0,6), Position=UDim2.new(0,0,0,startY+18), ZIndex=bZ+2}, {c("UICorner",{CornerRadius=UDim.new(0,3)})})
            local seedFill = c("Frame", {BackgroundColor3=DraxUI.AccentColor, Size=UDim2.new(colData.Seed/10,0,1,0), ZIndex=bZ+3}, {c("UICorner",{CornerRadius=UDim.new(0,3)})})
            seedFill.Parent = seedTrack; seedTrack.Parent = contentArea
            table.insert(DraxUI.AccentObjects, {Obj=seedFill, Prop="BackgroundColor3"})
            local dragSeed = false
            seedTrack.InputBegan:Connect(function(i)
                if i.UserInputType == Enum.UserInputType.MouseButton1 then
                    dragSeed = true
                    colData.Seed = math.clamp((i.Position.X - seedTrack.AbsolutePosition.X)/seedTrack.AbsoluteSize.X, 0, 1) * 10
                    seedFill.Size = UDim2.new(colData.Seed/10, 0, 1, 0)
                    seedValTxt.Text = string.format("%.1f", colData.Seed)
                end
            end)
            table.insert(popupUISConns, UIS.InputEnded:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then dragSeed = false end end))
            table.insert(popupUISConns, UIS.InputChanged:Connect(function(i)
                if dragSeed and i.UserInputType == Enum.UserInputType.MouseMovement then
                    colData.Seed = math.clamp((i.Position.X - seedTrack.AbsolutePosition.X)/seedTrack.AbsoluteSize.X, 0, 1) * 10
                    seedFill.Size = UDim2.new(colData.Seed/10, 0, 1, 0)
                    seedValTxt.Text = string.format("%.1f", colData.Seed)
                end
            end))
        end
    end

    for i, opt in ipairs(modes) do
        local btn = c("TextButton", {BackgroundTransparency = 1, Position = UDim2.new(0, (i - 1) * indWidth, 0, 0), Size = UDim2.new(0, indWidth, 1, 0), Text = opt, TextColor3 = (colData.Mode == opt) and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(120, 120, 120), TextSize = 13, Font = Enum.Font.GothamMedium, ZIndex = bZ+3})
        btn.MouseButton1Click:Connect(function()
            tween(modeInd, {0.2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out}, {Position = UDim2.new(0, (i - 1) * indWidth + 2, 0, 2)})
            for j, b in ipairs(modeBtns) do tween(b, {0.2}, {TextColor3 = j == i and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(120, 120, 120)}) end
            renderMode(opt)
        end)
        btn.Parent = modeBg; table.insert(modeBtns, btn)
    end

    local startMode = colData.Mode
    local startModeValid = false
    for _, m in ipairs(modes) do if m == startMode then startModeValid = true; break end end
    if not startModeValid then startMode = modes[1] end
    renderMode(startMode)
    for i, m in ipairs(modes) do
        if m == startMode then modeInd.Position = UDim2.new(0, (i-1)*indWidth + 2, 0, 2); break end
    end

    local closer = c("TextButton", {BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0), Position = UDim2.new(0, 0, 0, 0), Text = "", ZIndex = bZ-1})
    closer.Parent = DraxUI.ScreenGui
    closer.MouseButton1Click:Connect(function()
        for _, conn in ipairs(popupUISConns) do conn:Disconnect() end
        table.clear(popupUISConns)
        if pickerFrame then pickerFrame:Destroy() end
        if closer then closer:Destroy() end
        colData._posHook = nil
        -- Do NOT remove from AnimatedColors - keep animation running even with popup closed
    end)

    pickerFrame.Parent = DraxUI.ScreenGui
    return pickerFrame, closer
end

function DraxUI.MakeWidget(frame, secContent)
    local widget = {Disabled = false, Value = nil, Frame = frame, PickersVisible = true}
    
    function widget:SetDisabled(state)
        widget.Disabled = state
        local alpha = state and 0.5 or 1.0
        for _, v in pairs(frame:GetDescendants()) do
            if v:IsA("TextLabel") or v:IsA("TextButton") or v:IsA("TextBox") then
                tween(v, {0.2}, {TextTransparency = 1 - alpha})
            elseif v:IsA("Frame") and v.Name ~= "Bloom" then
                tween(v, {0.2}, {BackgroundTransparency = 1 - alpha})
            elseif v:IsA("ImageLabel") then
                tween(v, {0.2}, {ImageTransparency = (1 - alpha) + 0.5})
            elseif v:IsA("UIStroke") then
                tween(v, {0.2}, {Transparency = 1 - alpha})
            end
        end
    end

    function widget:SetValue(val)
        widget.Value = val
        local box = frame:FindFirstChildWhichIsA("Frame")
        if box then
            tween(box, {0.15}, {BackgroundColor3 = val and DraxUI.AccentColor or Color3.fromRGB(15, 15, 15)})
            local glow = box:FindFirstChild("Bloom")
            if glow then tween(glow, {0.15}, {ImageTransparency = val and 0.4 or 1}) end
        end
    end

    function widget:SetPickersVisible(state)
        widget.PickersVisible = state
        if widget.VisSq then 
            widget.VisSq.Visible = state
            local visSqGlow = widget.VisSq:FindFirstChild("Bloom")
            if visSqGlow then DraxUI.SetGlowVisibility(visSqGlow, state) end
        end
        if widget.HidSq then
            local showHid = Config.Global.VisibleCheck.Enable and Config.Global.VisibleCheck.Mode == "Color" and Config.Global.RaycastParse
            widget.HidSq.Visible = state and showHid
            local hidSqGlow = widget.HidSq:FindFirstChild("Bloom")
            if hidSqGlow then DraxUI.SetGlowVisibility(hidSqGlow, state and showHid) end
        end
    end

    function widget:AddSettings(builder)
        local gear = c("TextButton", {Text="⚙", TextColor3=Color3.fromRGB(120,120,120), BackgroundTransparency=1, Size=UDim2.new(0,14,0,14), AnchorPoint=Vector2.new(1,0), Position=UDim2.new(1, -2, 0, 0), Font=Enum.Font.Gotham, TextSize=14})
        gear.Parent = frame
        
        if widget.VisSq then widget.VisSq.Position = UDim2.new(1, -20, 0, 0) end
        if widget.HidSq then widget.HidSq.Position = UDim2.new(1, -38, 0, 0) end
        if widget.ModeBtn then
            widget.ModeBtn.Position = UDim2.new(1, -20, 0.5, 0)
            if widget._kWrap then widget._kWrap.Position = UDim2.new(1, -40, 0.5, 0) end
            if widget._dWrap then widget._dWrap.Position = UDim2.new(1, -40, 0.5, 0) end
        end
        
        gear.MouseEnter:Connect(function() if not widget.Disabled then tween(gear, {0.2}, {TextColor3 = Color3.fromRGB(255,255,255)}) end end)
        gear.MouseLeave:Connect(function() if not widget.Disabled then tween(gear, {0.2}, {TextColor3 = Color3.fromRGB(120,120,120)}) end end)

        local open, popup = false, nil
        local suppressGearClick, settingsOutConn = false, nil
        local _popupAccentIdx = 0
        local gearPopupConns = {}  -- tracks global UIS connections added by pSec widgets
        local colDataStore = {}
        widget._colDataStore = colDataStore
        gear.MouseButton1Click:Connect(function()
            if widget.Disabled then return end
            if suppressGearClick then suppressGearClick = false; return end
            open = not open
            if open then
                local gAP = gear.AbsolutePosition
                local gAS = gear.AbsoluteSize
                popup = c("Frame", {BackgroundColor3=Color3.fromRGB(20,20,20), Position=UDim2.new(0, gAP.X + gAS.X + 8, 0, gAP.Y), Size=UDim2.new(0,200,0,0), ZIndex=300}, {
                    c("UICorner",{CornerRadius=UDim.new(0,6)}), c("UIStroke",{Color=Color3.fromRGB(35,35,35),Thickness=1})
                })
                local pLayout = c("UIListLayout", {Padding=UDim.new(0,8), SortOrder=Enum.SortOrder.LayoutOrder})
                local pContent = c("Frame", {BackgroundTransparency=1, Size=UDim2.new(1,0,1,0), ZIndex=301}, {pLayout, c("UIPadding", {PaddingTop=UDim.new(0,8), PaddingBottom=UDim.new(0,8), PaddingLeft=UDim.new(0,8), PaddingRight=UDim.new(0,8)})})
                pContent.Parent = popup

                local activeSubPopup = nil
                local pSec = {}
                function pSec:Checkbox(l, d, cbb)
                    local v = d or false
                    local f = c("Frame", {BackgroundTransparency=1, Size=UDim2.new(1,0,0,14), ZIndex=302})
                    local btn = c("TextButton", {BackgroundTransparency=1, Size=UDim2.new(1,0,1,0), Text="", ZIndex=303})
                    btn.Parent = f
                    local box = c("Frame", {BackgroundColor3 = v and DraxUI.AccentColor or Color3.fromRGB(15,15,15), Size=UDim2.new(0,14,0,14), ZIndex=302}, {c("UICorner",{CornerRadius=UDim.new(0,4)}), c("UIStroke",{Color=Color3.fromRGB(35,35,35),Thickness=1})})
                    box.Parent = f
                    -- Create glow for checkbox
                    local g = DraxUI.AddGlow(box, 4, 0.6)
                    g.ZIndex = 400  -- Above popup content (ZIndex 302+) with Global ZIndexBehavior
                    DraxUI.SetGlowVisibility(g, v)
                    local txt = c("TextLabel", {BackgroundTransparency=1, Position=UDim2.new(0,22,0,0), Size=UDim2.new(1,-22,1,0), Text=l, TextColor3=Color3.fromRGB(180,180,180), TextSize=13, Font=Enum.Font.Gotham, TextXAlignment=Enum.TextXAlignment.Left, ZIndex=302})
                    txt.Parent = f
                    table.insert(DraxUI.AccentObjects, {Obj = box, Prop = "BackgroundColor3", IsToggle = true, GetState = function() return v end})
                    table.insert(DraxUI.AccentObjects, {Obj = g, Prop = "ImageColor3"})
                    btn.MouseButton1Click:Connect(function() v = not v; box.BackgroundColor3 = v and DraxUI.AccentColor or Color3.fromRGB(15,15,15); DraxUI.SetGlowVisibility(g, v); cbb(v) end)
                    f.Parent = pContent; cbb(v)
                    return {Frame = f}
                end
                function pSec:CheckboxColor(l, dVal, dColor, dAlpha, cbBox, cbColor, dHidColor, cbHidColor)
                    local v = dVal or false
                    local f = c("Frame", {BackgroundTransparency=1, Size=UDim2.new(1,0,0,14), ZIndex=302})
                    local box = c("Frame", {BackgroundColor3=v and DraxUI.AccentColor or Color3.fromRGB(15,15,15), Size=UDim2.new(0,14,0,14), ZIndex=302}, {c("UICorner",{CornerRadius=UDim.new(0,4)}), c("UIStroke",{Color=Color3.fromRGB(35,35,35),Thickness=1})})
                    box.Parent = f
                    -- Create glow for checkbox
                    local g = DraxUI.AddGlow(box, 4, 0.6)
                    g.ZIndex = 400  -- Above popup content (ZIndex 302+) with Global ZIndexBehavior
                    DraxUI.SetGlowVisibility(g, v)
                    c("TextLabel", {BackgroundTransparency=1, Position=UDim2.new(0,22,0,0), Size=UDim2.new(1,-46,1,0), Text=l, TextColor3=Color3.fromRGB(180,180,180), TextSize=13, Font=Enum.Font.Gotham, TextXAlignment=Enum.TextXAlignment.Left, ZIndex=302}).Parent = f
                    table.insert(DraxUI.AccentObjects, {Obj=box, Prop="BackgroundColor3", IsToggle=true, GetState=function() return v end})
                    table.insert(DraxUI.AccentObjects, {Obj = g, Prop = "ImageColor3"})
                    local tBtn = c("TextButton", {BackgroundTransparency=1, Size=UDim2.new(1, dHidColor and cbHidColor and -36 or -22, 1, 0), Text="", ZIndex=303})
                    tBtn.Parent = f
                    tBtn.MouseButton1Click:Connect(function() v = not v; box.BackgroundColor3 = v and DraxUI.AccentColor or Color3.fromRGB(15,15,15); DraxUI.SetGlowVisibility(g, v); cbBox(v) end)
                    local colData = colDataStore["c:"..l]
                    if not colData then
                        local _h, _s, _v = (dColor or Color3.fromRGB(255,255,255)):ToHSV()
                        colData = {Color=dColor, Alpha=dAlpha or 1, Hue=_h, Sat=_s, Val=_v, Mode="Solid", Speed=1, Stops={dColor, Color3.fromRGB(0,0,0)}, SelectedStop=1, SeqPos=0}
                        colDataStore["c:"..l] = colData
                    end
                    colData.Callback = cbColor
                    local colSq = c("TextButton", {BackgroundColor3=colData.Color, AnchorPoint=Vector2.new(1,0), Position=UDim2.new(1,0,0,0), Size=UDim2.new(0,14,0,14), Text="", AutoButtonColor=false, ZIndex=302}, {c("UICorner",{CornerRadius=UDim.new(0,3)}), c("UIStroke",{Color=Color3.fromRGB(50,50,50),Thickness=1})})
                    colSq.Parent = f
                    colData.Box = colSq
                    -- Add glow to color picker with higher ZIndex to prevent clipping
                    local colGlow = DraxUI.AddGlow(colSq, 4, 0.6)
                    colGlow.ZIndex = 400  -- Above popup content (ZIndex 302+)
                    colGlow.ImageColor3 = colData.Color  -- Sync to picker color
                    DraxUI.SetGlowVisibility(colGlow, true)
                    -- Wrap callback to update glow color when picker color changes
                    local origColCallback = cbColor
                    colData.Callback = function(c, a)
                        if colGlow and colGlow.Parent then colGlow.ImageColor3 = c end
                        if origColCallback then origColCallback(c, a) end
                    end
                    local o, pp, pc = false, nil, nil
                    colSq.MouseButton1Click:Connect(function()
                        o = not o
                        if o then
                            pp, pc = DraxUI.CreateColorPickerPopup(colSq, colData, 450)
                            activeSubPopup = pp
                            pc.MouseButton1Click:Connect(function() o = false; activeSubPopup = nil end)
                        else
                            activeSubPopup = nil
                            if pp then pp:Destroy() end if pc then pc:Destroy() end
                        end
                    end)
                    if dHidColor and cbHidColor then
                        local showHid = Config.Global.VisibleCheck.Enable and Config.Global.RaycastParse and Config.Global.VisibleCheck.Mode == "Color"
                        local hidColData = colDataStore["ch:"..l]
                        if not hidColData then
                            local _h, _s, _v = (dHidColor or Color3.fromRGB(0,0,0)):ToHSV()
                            hidColData = {Color=dHidColor, Alpha=1, Hue=_h, Sat=_s, Val=_v, Mode="Solid", Speed=1, Stops={dHidColor, Color3.fromRGB(0,0,0)}, SelectedStop=1, SeqPos=0}
                            colDataStore["ch:"..l] = hidColData
                        end
                        hidColData.Callback = cbHidColor
                        local hidSq = c("TextButton", {BackgroundColor3=hidColData.Color, AnchorPoint=Vector2.new(1,0), Position=UDim2.new(1,-18,0,0), Size=UDim2.new(0,14,0,14), Text="", AutoButtonColor=false, Visible=showHid, ZIndex=302}, {c("UICorner",{CornerRadius=UDim.new(0,3)}), c("UIStroke",{Color=Color3.fromRGB(50,50,50),Thickness=1})})
                        hidSq.Parent = f
                        hidColData.Box = hidSq
                        -- Add glow to hidden color picker with higher ZIndex to prevent clipping
                        local hidGlow = DraxUI.AddGlow(hidSq, 4, 0.6)
                        hidGlow.ZIndex = 400  -- Above popup content (ZIndex 302+)
                        hidGlow.ImageColor3 = hidColData.Color  -- Sync to picker color
                        DraxUI.SetGlowVisibility(hidGlow, showHid)  -- Hide glow if not visible
                        -- Wrap callback to update glow color when picker color changes
                        local origHidCallback = cbHidColor
                        hidColData.Callback = function(c, a)
                            if hidGlow and hidGlow.Parent then hidGlow.ImageColor3 = c end
                            if origHidCallback then origHidCallback(c, a) end
                        end
                        local oh, opp, opc = false, nil, nil
                        hidSq.MouseButton1Click:Connect(function()
                            oh = not oh
                            if oh then
                                opp, opc = DraxUI.CreateColorPickerPopup(hidSq, hidColData, 450)
                                activeSubPopup = opp
                                opc.MouseButton1Click:Connect(function() oh = false; activeSubPopup = nil end)
                            else
                                activeSubPopup = nil
                                if opp then opp:Destroy() end; if opc then opc:Destroy() end
                            end
                        end)
                    end
                    f.Parent = pContent; cbBox(v)
                    return {Frame=f, HidSq=hidSq}
                end
                function pSec:Slider(l, min, max, def, fmt, cbb)
                    local v = def or min
                    local f = c("Frame", {BackgroundTransparency=1, Size=UDim2.new(1,0,0,30), ZIndex=302})
                    c("TextLabel", {BackgroundTransparency=1, Size=UDim2.new(0.5,0,0,14), Text=l, TextColor3=Color3.fromRGB(200,200,200), TextSize=13, Font=Enum.Font.Gotham, TextXAlignment=Enum.TextXAlignment.Left, ZIndex=302}).Parent = f
                    local valTxt = c("TextLabel", {BackgroundTransparency=1, Position=UDim2.new(0.5,0,0,0), Size=UDim2.new(0.5,-4,0,14), Text=string.format(fmt,v), TextColor3=Color3.fromRGB(100,100,100), TextSize=13, Font=Enum.Font.Gotham, TextXAlignment=Enum.TextXAlignment.Right, ZIndex=302})
                    valTxt.Parent = f
                    local track = c("Frame", {BackgroundColor3=Color3.fromRGB(30,30,30), Position=UDim2.new(0,0,0,20), Size=UDim2.new(1,0,0,6), ZIndex=302}, {c("UICorner",{CornerRadius=UDim.new(0,3)})})
                    track.Parent = f
                    local fill = c("Frame", {BackgroundColor3=DraxUI.AccentColor, Size=UDim2.new(math.clamp((v-min)/(max-min),0,1),0,1,0), ZIndex=303}, {c("UICorner",{CornerRadius=UDim.new(0,3)})})
                    fill.Parent = track
                    table.insert(DraxUI.AccentObjects, {Obj = fill, Prop = "BackgroundColor3"})
                    -- Create glow as child of track (dynamic positioning)
                    local fillGlow = c("ImageLabel", {
                        Name = "Bloom",
                        BackgroundTransparency = 1,
                        Image = "rbxassetid://18245826428",
                        ImageColor3 = DraxUI.AccentColor,
                        ImageTransparency = 0.6,
                        ScaleType = Enum.ScaleType.Slice,
                        SliceCenter = Rect.new(21, 21, 79, 79),
                        Position = UDim2.new(0, -20, 0.5, -20),
                        Size = UDim2.new(0, 40, 0, 40),
                        ZIndex = 400,  -- Above popup content (ZIndex 302+) with Global ZIndexBehavior
                        Visible = false  -- Hide by default until properly initialized
                    })
                    fillGlow.Parent = track
                    table.insert(DraxUI.AccentObjects, {Obj = fillGlow, Prop = "ImageColor3"})
                    DraxUI.GlowRegistry[fillGlow] = true  -- register so RefreshAllGlows can toggle it
                    
                    local btn = c("TextButton", {BackgroundTransparency=1, Position=UDim2.new(0,0,0,15), Size=UDim2.new(1,0,0,15), Text="", ZIndex=304})
                    btn.Parent = f
                    local dragging = false
                    local function up(i) 
                        local pct = math.clamp((i.Position.X - track.AbsolutePosition.X)/track.AbsoluteSize.X,0,1)
                        v = min + pct*(max-min)
                        valTxt.Text = string.format(fmt,v)
                        fill.Size = UDim2.new(pct,0,1,0)
                        -- Update glow position and size
                        local glowWidth = math.max(40, pct * track.AbsoluteSize.X + 40)
                        local glowX = -20
                        fillGlow.Position = UDim2.new(0, glowX, 0.5, -20)
                        fillGlow.Size = UDim2.new(0, glowWidth, 0, 40)
                        DraxUI.SetGlowVisibility(fillGlow, pct > 0)
                        cbb(v)
                    end
                    btn.InputBegan:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then dragging=true; up(i) end end)
                    table.insert(gearPopupConns, UIS.InputEnded:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then dragging=false end end))
                    table.insert(gearPopupConns, UIS.InputChanged:Connect(function(i) if dragging and i.UserInputType == Enum.UserInputType.MouseMovement then up(i) end end))
                    do local c1 = gearPopupConns[#gearPopupConns-1]; local c2 = gearPopupConns[#gearPopupConns]; f.Destroying:Connect(function() c1:Disconnect(); c2:Disconnect() end) end
                    f.Parent = pContent; cbb(v)
                    -- Init glow after parenting so AbsoluteSize is valid
                    task.spawn(function()
                        game:GetService("RunService").Heartbeat:Wait()
                        local initPct = math.clamp((v - min) / (max - min), 0, 1)
                        if track.AbsoluteSize.X > 0 then
                            fillGlow.Position = UDim2.new(0, -20, 0.5, -20)
                            fillGlow.Size = UDim2.new(0, math.max(40, initPct * track.AbsoluteSize.X + 40), 0, 40)
                            DraxUI.SetGlowVisibility(fillGlow, initPct > 0)
                        end
                    end)
                    return {Frame = f, SetValue = function(nv) 
                        nv = math.clamp(nv, min, max)
                        v = nv
                        valTxt.Text = string.format(fmt, nv)
                        local pct = math.clamp((nv - min) / (max - min), 0, 1)
                        fill.Size = UDim2.new(pct, 0, 1, 0)
                        -- Update glow position and size
                        local glowWidth = math.max(40, pct * track.AbsoluteSize.X + 40)
                        local glowX = -20
                        fillGlow.Position = UDim2.new(0, glowX, 0.5, -20)
                        fillGlow.Size = UDim2.new(0, glowWidth, 0, 40)
                        DraxUI.SetGlowVisibility(fillGlow, pct > 0)
                    end}
                end
                function pSec:Droplet(l, opts, didx, cbb)
                    local idx = didx or 1
                    local f = c("Frame", {BackgroundTransparency=1, Size=UDim2.new(1,0,0,24), ZIndex=302})
                    local bw = #opts * 50
                    local bg = c("Frame", {BackgroundColor3=Color3.fromRGB(15,15,15), AnchorPoint=Vector2.new(1,0), Position=UDim2.new(1,0,0,0), Size=UDim2.new(0,bw,1,0), ZIndex=302}, {c("UICorner",{CornerRadius=UDim.new(0,12)}), c("UIStroke",{Color=Color3.fromRGB(35,35,35),Thickness=1})})
                    local iw = bw / #opts
                    local ind = c("Frame", {BackgroundColor3=Color3.fromRGB(45,45,45), Position=UDim2.new(0,(idx-1)*iw+2,0,2), Size=UDim2.new(0,iw-4,1,-4), ZIndex=303}, {c("UICorner",{CornerRadius=UDim.new(0,10)})})
                    ind.Parent = bg
                    local btns = {}
                    for i, o in ipairs(opts) do
                        local b = c("TextButton", {BackgroundTransparency=1, Position=UDim2.new(0,(i-1)*iw,0,0), Size=UDim2.new(0,iw,1,0), Text=o, TextColor3=i==idx and Color3.fromRGB(255,255,255) or Color3.fromRGB(120,120,120), TextSize=12, Font=Enum.Font.GothamMedium, ZIndex=304})
                        b.MouseButton1Click:Connect(function() idx=i; tween(ind,{0.2},{Position=UDim2.new(0,(i-1)*iw+2,0,2)}); for j,bb in ipairs(btns) do tween(bb,{0.2},{TextColor3=j==idx and Color3.fromRGB(255,255,255) or Color3.fromRGB(120,120,120)}) end; cbb(idx) end)
                        b.Parent = bg; table.insert(btns, b)
                    end
                    bg.Parent = f
                    c("TextLabel", {BackgroundTransparency=1, Position=UDim2.new(0,4,0,0), Size=UDim2.new(1,-bw-8,1,0), Text=l, TextColor3=Color3.fromRGB(200,200,200), TextSize=13, Font=Enum.Font.Gotham, TextXAlignment=Enum.TextXAlignment.Left, ZIndex=302}).Parent = f
                    f.Parent = pContent; cbb(idx)
                    return {Frame = f}
                end
                function pSec:CheckboxDroplet(l, opts, dV, didx, cbBox, cbDrop)
                    local v = dV or false
                    local idx = didx or 1
                    local f = c("Frame", {BackgroundTransparency=1, Size=UDim2.new(1,0,0,24), ZIndex=302})
                    
                    -- Checkbox on left
                    local box = c("Frame", {BackgroundColor3 = v and DraxUI.AccentColor or Color3.fromRGB(15,15,15), Position = UDim2.new(0,0,0,5), Size=UDim2.new(0,14,0,14), ZIndex=302}, {
                        c("UICorner",{CornerRadius=UDim.new(0,4)}), c("UIStroke",{Color=Color3.fromRGB(35,35,35),Thickness=1})
                    })
                    box.Parent = f
                    local g = DraxUI.AddGlow(box, 4, 0.6)
                    g.ZIndex = 400
                    DraxUI.SetGlowVisibility(g, v)
                    table.insert(DraxUI.AccentObjects, {Obj=box, Prop="BackgroundColor3", IsToggle=true, GetState=function() return v end})
                    table.insert(DraxUI.AccentObjects, {Obj = g, Prop = "ImageColor3"})
                    
                    -- Label
                    c("TextLabel", {BackgroundTransparency=1, Position=UDim2.new(0,22,0,0), Size=UDim2.new(0.5,-35,1,0), Text=l, TextColor3=Color3.fromRGB(180,180,180), TextSize=13, Font=Enum.Font.Gotham, TextXAlignment=Enum.TextXAlignment.Left, ZIndex=302}).Parent = f
                    
                    -- Checkbox button
                    local cbBtn = c("TextButton", {BackgroundTransparency=1, Size=UDim2.new(0,20,1,0), Text="", ZIndex=303})
                    cbBtn.Parent = f
                    cbBtn.MouseButton1Click:Connect(function()
                        v = not v
                        tween(box,{0.15},{BackgroundColor3=v and DraxUI.AccentColor or Color3.fromRGB(15,15,15)})
                        DraxUI.SetGlowVisibility(g, v)
                        cbBox(v)
                    end)
                    
                    -- Droplet on right
                    local bw = #opts * 50
                    local bg = c("Frame", {BackgroundColor3=Color3.fromRGB(15,15,15), AnchorPoint=Vector2.new(1,0), Position=UDim2.new(1,-4,0,0), Size=UDim2.new(0,bw,1,0), ZIndex=302}, {
                        c("UICorner",{CornerRadius=UDim.new(0,12)}), c("UIStroke",{Color=Color3.fromRGB(35,35,35),Thickness=1})
                    })
                    local iw = bw / #opts
                    local ind = c("Frame", {BackgroundColor3=Color3.fromRGB(45,45,45), Position=UDim2.new(0,(idx-1)*iw+2,0,2), Size=UDim2.new(0,iw-4,1,-4), ZIndex=303}, {c("UICorner",{CornerRadius=UDim.new(0,10)})})
                    ind.Parent = bg
                    
                    local btns = {}
                    for i, o in ipairs(opts) do
                        local b = c("TextButton", {BackgroundTransparency=1, Position=UDim2.new(0,(i-1)*iw,0,0), Size=UDim2.new(0,iw,1,0), Text=o, TextColor3=i==idx and Color3.fromRGB(255,255,255) or Color3.fromRGB(120,120,120), TextSize=12, Font=Enum.Font.GothamMedium, ZIndex=304})
                        b.MouseButton1Click:Connect(function() idx=i; tween(ind,{0.2},{Position=UDim2.new(0,(i-1)*iw+2,0,2)}); for j,bb in ipairs(btns) do tween(bb,{0.2},{TextColor3=j==idx and Color3.fromRGB(255,255,255) or Color3.fromRGB(120,120,120)}) end; cbDrop(idx) end)
                        b.Parent = bg; table.insert(btns, b)
                    end
                    bg.Parent = f
                    
                    f.Parent = pContent; cbBox(v); cbDrop(idx)
                    return {Frame = f}
                end
                function pSec:Dropdown(l, opts, didx, cbb)
                    local idx = didx or 1
                    local f = c("Frame", {BackgroundTransparency=1, Size=UDim2.new(1,0,0,24), ZIndex=302})
                    c("TextLabel", {BackgroundTransparency=1, Position=UDim2.new(0,8,0,0), Size=UDim2.new(0.5,0,1,0), Text=l, TextColor3=Color3.fromRGB(200,200,200), TextSize=13, Font=Enum.Font.Gotham, TextXAlignment=Enum.TextXAlignment.Left, ZIndex=302}).Parent=f
                    local bx = c("TextButton", {BackgroundColor3=Color3.fromRGB(15,15,15), AnchorPoint=Vector2.new(1,0), Position=UDim2.new(1,0,0,0), Size=UDim2.new(0,100,1,0), Text=opts[idx] or "None", TextColor3=Color3.fromRGB(180,180,180), TextSize=13, Font=Enum.Font.Gotham, AutoButtonColor=false, ZIndex=302}, {c("UICorner",{CornerRadius=UDim.new(0,4)}), c("UIStroke",{Color=Color3.fromRGB(35,35,35),Thickness=1})})
                    bx.Parent=f
                    local df, op = nil, false
                    local dfOutConn, suppressBxClick = nil, false
                    bx.MouseButton1Click:Connect(function()
                        if suppressBxClick then suppressBxClick = false; return end
                        op = not op
                        if op then
                            if df then df:Destroy() end
                            
                            local visibleOpts = math.min(#opts, 5)
                            local dfHeight = visibleOpts * 24 + 8
                            local canvasHeight = #opts * 24 + 8
                            
                            df = c("ScrollingFrame", {BackgroundColor3=Color3.fromRGB(20,20,20), Position=UDim2.new(0,bx.AbsolutePosition.X,0,bx.AbsolutePosition.Y+28), Size=UDim2.new(0,bx.AbsoluteSize.X,0,dfHeight), CanvasSize=UDim2.new(0,0,0,canvasHeight), ScrollBarThickness=3, ScrollBarImageColor3=Color3.fromRGB(150,150,150), BorderSizePixel=0, ZIndex=350}, {c("UICorner",{CornerRadius=UDim.new(0,4)}), c("UIStroke",{Color=Color3.fromRGB(35,35,35),Thickness=1}), c("UIListLayout",{Padding=UDim.new(0,0)})})
                            c("UIPadding",{PaddingTop=UDim.new(0,4),PaddingBottom=UDim.new(0,4)}).Parent=df
                            for i, opt in ipairs(opts) do
                                local b = c("TextButton", {BackgroundTransparency=1, Size=UDim2.new(1,0,0,24), Text=opt, TextColor3=i==idx and Color3.fromRGB(255,255,255) or Color3.fromRGB(150,150,150), TextSize=13, Font=Enum.Font.Gotham, ZIndex=351})
                                b.MouseButton1Click:Connect(function() idx=i; bx.Text=opt; op=false; df:Destroy(); df=nil; if dfOutConn then dfOutConn:Disconnect(); dfOutConn=nil end; cbb(idx) end)
                                b.Parent=df
                            end
                            df.Parent=DraxUI.ScreenGui
                            task.defer(function()
                                if not op then return end
                                dfOutConn = UIS.InputBegan:Connect(function(inp)
                                    if inp.UserInputType ~= Enum.UserInputType.MouseButton1 then return end
                                    if not df or not df.Parent then if dfOutConn then dfOutConn:Disconnect(); dfOutConn=nil end; return end
                                    local ap, as = df.AbsolutePosition, df.AbsoluteSize
                                    local mp = inp.Position
                                    if mp.X < ap.X or mp.X > ap.X+as.X or mp.Y < ap.Y or mp.Y > ap.Y+as.Y then
                                        local bap, bas = bx.AbsolutePosition, bx.AbsoluteSize
                                        if mp.X >= bap.X and mp.X <= bap.X+bas.X and mp.Y >= bap.Y and mp.Y <= bap.Y+bas.Y then suppressBxClick = true end
                                        op = false; if df then df:Destroy(); df=nil end
                                        if dfOutConn then dfOutConn:Disconnect(); dfOutConn=nil end
                                    end
                                end)
                            end)
                        else if df then df:Destroy(); df=nil end if dfOutConn then dfOutConn:Disconnect(); dfOutConn=nil end end
                    end)
                    f.Parent=pContent; cbb(idx)
                    return {Frame = f}
                end
                function pSec:ColorPicker(l, dColor, dAlpha, cb, dHidColor, hidCb)
                    local f = c("Frame", {BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, 18), ZIndex=302})
                    c("TextLabel", {BackgroundTransparency = 1, Size = dHidColor and UDim2.new(1,-50,1,0) or UDim2.new(1,-30,1,0), Text = l, TextColor3 = Color3.fromRGB(200, 200, 200), TextSize = 13, Font = Enum.Font.Gotham, TextXAlignment = Enum.TextXAlignment.Left, ZIndex=302}).Parent = f
                    local box = c("TextButton", {BackgroundColor3 = dColor, AnchorPoint = Vector2.new(1, 0), Position = UDim2.new(1, 0, 0, 2), Size = UDim2.new(0, 14, 0, 14), Text = "", AutoButtonColor = false, ZIndex=302}, {
                        c("UICorner", {CornerRadius = UDim.new(0, 4)}), c("UIStroke", {Color = Color3.fromRGB(50, 50, 50), Thickness = 1})
                    })
                    box.Parent = f
                    local colData = colDataStore["p:"..l]
                    if not colData then
                        local _h, _s, _v = (dColor or Color3.fromRGB(255,255,255)):ToHSV()
                        colData = {Color = dColor, Alpha = dAlpha or 1, Hue = _h, Sat = _s, Val = _v, Mode = "Solid", Speed = 1, Stops = {dColor, Color3.fromRGB(0,0,0)}, SelectedStop = 1, SeqPos = 0}
                        colDataStore["p:"..l] = colData
                    end
                    -- Create glow for color picker
                    local boxGlow = DraxUI.AddGlow(box, 3, 0.7)
                    boxGlow.ZIndex = 400  -- Above popup content (ZIndex 302+)
                    boxGlow.ImageColor3 = colData.Color
                    DraxUI.SetGlowVisibility(boxGlow, true)  -- Control glow visibility
                    colData.Box = box
                    local origCb = cb
                    colData.Callback = function(c, a)
                        if box and box.Parent then
                            box.BackgroundColor3 = c
                            boxGlow.ImageColor3 = c
                        end
                        origCb(c, a)
                    end
                    -- Re-register in AnimatedColors if mode was pre-loaded as animated
                    if colData.Mode == "RGB" or colData.Mode == "Seq" then
                        if not colData.AnimId then colData.AnimId = tostring(colData) end
                        DraxUI.AnimatedColors[colData.AnimId] = colData
                    end
                    local o, pp, pc = false, nil, nil
                    box.MouseButton1Click:Connect(function()
                        o = not o
                        if o then 
                            pp, pc = DraxUI.CreateColorPickerPopup(box, colData, 450)
                            activeSubPopup = pp
                            pc.MouseButton1Click:Connect(function() o = false; activeSubPopup = nil end)
                        else 
                            activeSubPopup = nil
                            if pp then pp:Destroy() end
                            if pc then pc:Destroy() end 
                        end
                    end)
                    if dHidColor and hidCb then
                        local showHid = Config.Global.VisibleCheck.Enable and Config.Global.RaycastParse and Config.Global.VisibleCheck.Mode == "Color"
                        local hidColData = colDataStore["ph:"..l]
                        if not hidColData then
                            local _h, _s, _v = (dHidColor or Color3.fromRGB(0,0,0)):ToHSV()
                            hidColData = {Color=dHidColor, Alpha=1, Hue=_h, Sat=_s, Val=_v, Mode="Solid", Speed=1, Stops={dHidColor, Color3.fromRGB(0,0,0)}, SelectedStop=1, SeqPos=0}
                            colDataStore["ph:"..l] = hidColData
                        end
                        local hidSq = c("TextButton", {BackgroundColor3=hidColData.Color, AnchorPoint=Vector2.new(1,0), Position=UDim2.new(1,-18,0,2), Size=UDim2.new(0,14,0,14), Text="", AutoButtonColor=false, Visible=showHid, ZIndex=302}, {c("UICorner",{CornerRadius=UDim.new(0,3)}), c("UIStroke",{Color=Color3.fromRGB(50,50,50),Thickness=1})})
                        hidSq.Parent = f
                        hidColData.Box = hidSq
                        local hidSqGlow = DraxUI.AddGlow(hidSq, 3, 0.7)
                        hidSqGlow.ZIndex = 400  -- Above popup content (ZIndex 302+)
                        hidSqGlow.ImageColor3 = hidColData.Color
                        DraxUI.SetGlowVisibility(hidSqGlow, showHid)  -- Hide glow if not visible
                        local origHidCb = hidCb
                        hidColData.Callback = function(c, a)
                            if hidSq and hidSq.Parent then
                                hidSq.BackgroundColor3 = c
                                hidSqGlow.ImageColor3 = c
                            end
                            origHidCb(c, a)
                        end
                        local oh, opp, opc = false, nil, nil
                        hidSq.MouseButton1Click:Connect(function()
                            oh = not oh
                            if oh then
                                opp, opc = DraxUI.CreateColorPickerPopup(hidSq, hidColData, 450)
                                activeSubPopup = opp
                                opc.MouseButton1Click:Connect(function() oh = false; activeSubPopup = nil end)
                            else
                                activeSubPopup = nil
                                if opp then opp:Destroy() end; if opc then opc:Destroy() end
                            end
                        end)
                    end
                    f.Parent = pContent
                    cb(dColor, dAlpha)
                    return {Frame = f}
                end
                function pSec:TextBox(l, placeholder, def, cb)
                    local f = c("Frame", {BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, 20), ZIndex=302})
                    c("TextLabel", {BackgroundTransparency=1, Size=UDim2.new(0.4,0,1,0), Text=l, TextColor3=Color3.fromRGB(200,200,200), TextSize=12, Font=Enum.Font.Gotham, TextXAlignment=Enum.TextXAlignment.Left, ZIndex=302}).Parent = f
                    local inp = c("TextBox", {BackgroundColor3=Color3.fromRGB(15,15,15), AnchorPoint=Vector2.new(1,0), Position=UDim2.new(1,0,0,3), Size=UDim2.new(0.57,-4,0,16), Text=def or "", PlaceholderText=placeholder or "", TextColor3=Color3.fromRGB(180,180,180), PlaceholderColor3=Color3.fromRGB(60,60,60), TextSize=11, Font=Enum.Font.Gotham, ClearTextOnFocus=false, ZIndex=302}, {
                        c("UICorner",{CornerRadius=UDim.new(0,3)}), c("UIStroke",{Color=Color3.fromRGB(35,35,35),Thickness=1})
                    })
                    inp.Parent = f
                    inp.FocusLost:Connect(function() cb(inp.Text) end)
                    f.Parent = pContent
                    cb(def or "")
                    return {Frame = f}
                end

                _popupAccentIdx = #DraxUI.AccentObjects
                gearPopupConns = {}  -- reset for this popup open
                builder(pSec)
                pLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function() popup.Size = UDim2.new(0,200,0,pLayout.AbsoluteContentSize.Y + 16) end)
                popup.Size = UDim2.new(0,200,0,pLayout.AbsoluteContentSize.Y + 16)

                popup.Parent = DraxUI.ScreenGui
                task.defer(function()
                    if not open then return end
                    settingsOutConn = UIS.InputBegan:Connect(function(inp)
                        if inp.UserInputType ~= Enum.UserInputType.MouseButton1 then return end
                        if not popup or not popup.Parent then if settingsOutConn then settingsOutConn:Disconnect(); settingsOutConn = nil end; return end
                        local ap, as = popup.AbsolutePosition, popup.AbsoluteSize
                        local mp = inp.Position
                        if mp.X < ap.X or mp.X > ap.X+as.X or mp.Y < ap.Y or mp.Y > ap.Y+as.Y then
                            if activeSubPopup and activeSubPopup.Parent then
                                local sap, sas = activeSubPopup.AbsolutePosition, activeSubPopup.AbsoluteSize
                                if mp.X >= sap.X and mp.X <= sap.X+sas.X and mp.Y >= sap.Y and mp.Y <= sap.Y+sas.Y then return end
                            end
                            local gap, gas = gear.AbsolutePosition, gear.AbsoluteSize
                            if mp.X >= gap.X and mp.X <= gap.X+gas.X and mp.Y >= gap.Y and mp.Y <= gap.Y+gas.Y then suppressGearClick = true end
                            open = false; popup:Destroy(); popup = nil
                            for i = #DraxUI.AccentObjects, _popupAccentIdx + 1, -1 do table.remove(DraxUI.AccentObjects, i) end
                            for _, conn in ipairs(gearPopupConns) do conn:Disconnect() end; gearPopupConns = {}
                            if settingsOutConn then settingsOutConn:Disconnect(); settingsOutConn = nil end
                        end
                    end)
                end)
            else
                if popup then popup:Destroy(); popup = nil; for i = #DraxUI.AccentObjects, _popupAccentIdx + 1, -1 do table.remove(DraxUI.AccentObjects, i) end; for _, conn in ipairs(gearPopupConns) do conn:Disconnect() end; gearPopupConns = {} end
                if settingsOutConn then settingsOutConn:Disconnect(); settingsOutConn = nil end
            end
        end)
        return widget
    end

    frame.Parent = secContent
    return widget
end

function DraxUI.RegCfg(key, widget)
    if not key or not widget then return end
    if widget.GetSaveData and widget.LoadSaveData then
        local defData = widget:GetSaveData()  -- snapshot default state at registration
        DraxUI.ConfigWidgets[key] = {
            get      = function() return widget:GetSaveData() end,
            load     = function(v) widget:LoadSaveData(v) end,
            reset    = function() widget:LoadSaveData(defData) end,
            forceOff = function()
                local d = widget:GetSaveData()
                if type(d) == "table" and d.val ~= nil then d.val = false end
                widget:LoadSaveData(d)
            end,
        }
    elseif widget.LoadValue then
        local defVal = widget.Value  -- snapshot default value at registration
        DraxUI.ConfigWidgets[key] = {
            get      = function() return widget.Value end,
            load     = function(v) widget:LoadValue(v) end,
            reset    = function() widget:LoadValue(defVal) end,
            forceOff = function()
                -- booleans go to false; numbers/strings keep their script default
                if type(defVal) == "boolean" then
                    widget:LoadValue(false)
                else
                    widget:LoadValue(defVal)
                end
            end,
        }
    end
end

DraxUI.ActiveNotifications = {}
DraxUI.KeybindEntries = {}  -- {widget} where widget has .Label, .Value, .Key, .Mode
DraxUI.UpdateKeybindList = nil  -- set by keybind list; call to force an immediate rebuild

function DraxUI.Notification(title, text, playSound)
    task.defer(function()
    if not DraxUI.NotifGui then
        local sg = c("ScreenGui", {Name = "DraxUI_Notif", DisplayOrder = 1000, IgnoreGuiInset = true})
        local ok = pcall(function() sg.Parent = CoreGui end)
        if not ok then sg.Parent = LocalPlayer:WaitForChild("PlayerGui") end
        DraxUI.NotifGui = sg
    end

    if playSound ~= false then
        local snd = Instance.new("Sound")
        snd.SoundId = "rbxassetid://121045990444676"
        snd.Volume = 1
        pcall(function() snd.Parent = DraxUI.NotifGui end)
        pcall(function() snd:Play() end)
        pcall(function() game:GetService("Debris"):AddItem(snd, 5) end)
    end

    local f = c("Frame", {BackgroundColor3 = Color3.fromRGB(22, 22, 22), Size = UDim2.new(0, 260, 0, 65), Position = UDim2.new(1, -275, 1, 50), ZIndex = 1000}, {
        c("UICorner", {CornerRadius = UDim.new(0, 6)}), c("UIStroke", {Color = Color3.fromRGB(35, 35, 35), Thickness = 1})
    })
    local acc = c("Frame", {BackgroundColor3 = DraxUI.AccentColor, Size = UDim2.new(0, 3, 1, -16), Position = UDim2.new(0, 8, 0, 8), ZIndex = 1001}, {c("UICorner", {CornerRadius = UDim.new(0, 4)})})
    acc.Parent = f
    -- Add glow to accent stripe (create on acc first, then adjust parent and position for stability)
    local accGlow = DraxUI.AddGlow(acc, 2, 0.5)
    -- Reposition glow to be relative to the notification frame instead of accent stripe
    accGlow.Parent = f  -- Parent to main frame for proper positioning
    -- Adjust glow size to be fixed pixels, not scaled to parent
    accGlow.Size = UDim2.new(0, 43, 0, 89)  -- Fixed size that matches accent stripe glow
    -- Position glow at accent stripe position minus offset for centering
    accGlow.Position = UDim2.new(0, 8 - 20, 0, 8 - 20)  -- Account for glow's -1 scale positioning
    accGlow.ZIndex = 1002  -- Above notification content
    DraxUI.SetGlowVisibility(accGlow, true)  -- Respect glow enabled flag
    table.insert(DraxUI.AccentObjects, {Obj = acc, Prop = "BackgroundColor3"})
    table.insert(DraxUI.AccentObjects, {Obj = accGlow, Prop = "ImageColor3"})

    local tL = c("TextLabel", {BackgroundTransparency = 1, Position = UDim2.new(0, 18, 0, 6), Size = UDim2.new(1, -26, 0, 16), Text = title or "Notification", TextColor3 = Color3.fromRGB(255, 255, 255), TextSize = 13, Font = Enum.Font.GothamBold, TextXAlignment = Enum.TextXAlignment.Left, ZIndex = 1001})
    tL.Parent = f

    local inner = c("Frame", {BackgroundColor3 = Color3.fromRGB(18, 18, 18), Position = UDim2.new(0, 18, 0, 26), Size = UDim2.new(1, -26, 1, -34), ZIndex = 1001}, {
        c("UICorner", {CornerRadius = UDim.new(0, 4)})
    })
    inner.Parent = f
    local dL = c("TextLabel", {BackgroundTransparency = 1, Position = UDim2.new(0, 6, 0, 0), Size = UDim2.new(1, -12, 1, 0), Text = text or "", TextColor3 = Color3.fromRGB(180, 180, 180), TextSize = 12, Font = Enum.Font.Gotham, TextXAlignment = Enum.TextXAlignment.Left, TextYAlignment = Enum.TextYAlignment.Center, TextWrapped = true, ZIndex = 1002})
    dL.Parent = inner

    f.Parent = DraxUI.NotifGui

    local nDat = {Frame = f, Stroke = f:FindFirstChild("UIStroke"), Acc = acc, Inner = inner, Title = tL, Desc = dL}
    table.insert(DraxUI.ActiveNotifications, 1, nDat)

    local function upd()
        for i, v in ipairs(DraxUI.ActiveNotifications) do
            tween(v.Frame, {0.35, Enum.EasingStyle.Quint, Enum.EasingDirection.Out}, {Position = UDim2.new(1, -275, 1, -(i * 65 + (i) * 10))})
        end
    end
    upd()

    task.delay(3, function()
        local found
        for i, v in ipairs(DraxUI.ActiveNotifications) do if v == nDat then found = i break end end
        if found then table.remove(DraxUI.ActiveNotifications, found); upd() end

        tween(f, {0.3}, {BackgroundTransparency = 1})
        if nDat.Stroke then tween(nDat.Stroke, {0.3}, {Transparency = 1}) end
        tween(acc, {0.3}, {BackgroundTransparency = 1})
        tween(accGlow, {0.3}, {ImageTransparency = 1})
        tween(inner, {0.3}, {BackgroundTransparency = 1})
        tween(tL, {0.3}, {TextTransparency = 1})
        tween(dL, {0.3}, {TextTransparency = 1})
        task.wait(0.3); f:Destroy()
    end)
    end)  -- task.defer
end

function DraxUI.new(titleText, subtitleText)
    local gui = c("ScreenGui", {Name = "DraxUI", ResetOnSpawn = false, ZIndexBehavior = Enum.ZIndexBehavior.Global, IgnoreGuiInset = true, DisplayOrder = 9999})
    local success, _ = pcall(function() gui.Parent = CoreGui end)
    if not success then gui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui") end
    DraxUI.ScreenGui = gui
    
    -- Create separate ScreenGui for background click blocker (behind menu, lower DisplayOrder)
    local bgGui = c("ScreenGui", {Name = "DXClickBlocker", ResetOnSpawn = false, ZIndexBehavior = Enum.ZIndexBehavior.Global, IgnoreGuiInset = true, DisplayOrder = 9998})
    local bgSuccess, _ = pcall(function() bgGui.Parent = CoreGui end)
    if not bgSuccess then bgGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui") end
    
    -- Fullscreen invisible button for click blocking (separate ScreenGui, behind menu)
    local cursorUnlockBtn = c("TextButton", {
        Name = "CursorUnlock",
        BackgroundTransparency = 1,
        TextTransparency = 1,
        Size = UDim2.new(1, 0, 1, 0),
        Position = UDim2.new(0, 0, 0, 0),
        Modal = true,
        ZIndex = 1,
        BorderSizePixel = 0,
        AutoButtonColor = false,
        Visible = DraxUI.Open  -- Initialize with current menu state
    })
    cursorUnlockBtn.Parent = bgGui
    cursorUnlockBtn.MouseButton1Click:Connect(function()
        -- Block clicks - do nothing to prevent interaction with game
    end)
    cursorUnlockBtn.MouseButton2Click:Connect(function()
        -- Block right-clicks too
    end)
    DraxUI.CursorUnlockBtn = cursorUnlockBtn
    DraxUI.ClickBlockerGui = bgGui

    local window = c("Frame", {
        Name = "Main", BackgroundColor3 = Color3.fromRGB(28, 28, 28),
        Size = UDim2.new(0, 650, 0, 550), Position = UDim2.new(0.5, -325, 0.5, -275)
    }, {
        c("UICorner", {CornerRadius = UDim.new(0, 8)}),
        c("Frame", {
            Name = "Inner", BackgroundColor3 = Color3.fromRGB(18, 18, 18),
            Size = UDim2.new(1, -20, 1, -55), Position = UDim2.new(0, 10, 0, 45)
        }, {c("UICorner", {CornerRadius = UDim.new(0, 6)})})
    })
    window.Parent = gui

    local topArea = c("Frame", {BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, 45)})
    topArea.Parent = window
    DraxUI.MakeDraggable(topArea, window)

    local titleContainer = c("Frame", {BackgroundTransparency = 1, AutomaticSize = Enum.AutomaticSize.X, Position = UDim2.new(0, 20, 0, 15), Size = UDim2.new(0, 0, 0, 15)}, {
        c("UIListLayout", {FillDirection = Enum.FillDirection.Horizontal, SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 0)})
    })
    titleContainer.Parent = window

    -- Helper function to convert color to hex
    local function colorToHex(color)
        return string.format("%02x%02x%02x", math.floor(color.R * 255), math.floor(color.G * 255), math.floor(color.B * 255))
    end
    
    local title = c("TextLabel", {BackgroundTransparency = 1, Size = UDim2.new(0, 0, 0, 15), Text = titleText, TextColor3 = Color3.fromRGB(150, 150, 150), TextSize = 16, Font = Enum.Font.GothamBold, AutomaticSize = Enum.AutomaticSize.X})
    title.Parent = titleContainer

    local sub = c("TextLabel", {BackgroundTransparency = 1, Size = UDim2.new(0, 0, 0, 15), Text = subtitleText, TextColor3 = DraxUI.AccentColor, TextSize = 16, Font = Enum.Font.GothamBold, AutomaticSize = Enum.AutomaticSize.X})
    sub.Parent = titleContainer
    table.insert(DraxUI.AccentObjects, {Obj = sub, Prop = "TextColor3"})

    local line = c("Frame", {BackgroundColor3 = Color3.fromRGB(70, 70, 70), BorderSizePixel = 0, Position = UDim2.new(0, 20, 0, 16), Size = UDim2.new(0, 1, 0, 14)})
    line.Parent = window
    
    titleContainer:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
        line.Position = UDim2.new(0, 20 + titleContainer.AbsoluteSize.X + 15, 0, 16)
    end)

    local tabContainer = c("Frame", {BackgroundTransparency = 1, Position = UDim2.new(0, 120, 0, 15), Size = UDim2.new(1, -120, 0, 15)}, {
        c("UIListLayout", {FillDirection = Enum.FillDirection.Horizontal, SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 15)})
    })
    tabContainer.Parent = window
    
    titleContainer:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
        local lx = 20 + titleContainer.AbsoluteSize.X + 15
        tabContainer.Position = UDim2.new(0, lx + 15, 0, 15)
        tabContainer.Size = UDim2.new(1, -(lx + 15), 0, 15)
    end)

    local contentContainer = c("Frame", {BackgroundTransparency = 1, Position = UDim2.new(0, 10, 0, 45), Size = UDim2.new(1, -20, 1, -55)})
    contentContainer.Parent = window

    local WindowObj = {Tabs = {}, CurrentTab = nil, TabButtons = {}}

    function WindowObj:Tab(name)
        local tabBtn = c("TextButton", {BackgroundTransparency = 1, Text = name, TextColor3 = Color3.fromRGB(120, 120, 120), TextSize = 14, Font = Enum.Font.GothamMedium, Size = UDim2.new(0, 0, 1, 0), AutomaticSize = Enum.AutomaticSize.X})
        tabBtn.Parent = tabContainer

        local tabContent = c("Frame", {Name = name .. "Content", BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0), Visible = false})
        tabContent.Parent = contentContainer

        local leftList = c("UIListLayout", {SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 6)})
        local leftCol = c("ScrollingFrame", {Name = "Left", BackgroundTransparency = 1, BorderSizePixel = 0, Position = UDim2.new(0, 18, 0, 25), Size = UDim2.new(0, 290, 1, -35), CanvasSize = UDim2.new(0, 0, 0, 0), ScrollBarThickness = 3, ScrollBarImageColor3 = Color3.fromRGB(55,55,55)}, {leftList})
        leftCol.Parent = tabContent
        leftList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            leftCol.CanvasSize = UDim2.new(0, 0, 0, leftList.AbsoluteContentSize.Y + 10)
        end)

        local rightList = c("UIListLayout", {SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 6)})
        local rightCol = c("ScrollingFrame", {Name = "Right", BackgroundTransparency = 1, BorderSizePixel = 0, Position = UDim2.new(0, 323, 0, 25), Size = UDim2.new(0, 290, 1, -35), CanvasSize = UDim2.new(0, 0, 0, 0), ScrollBarThickness = 3, ScrollBarImageColor3 = Color3.fromRGB(55,55,55)}, {rightList})
        rightCol.Parent = tabContent
        rightList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            rightCol.CanvasSize = UDim2.new(0, 0, 0, rightList.AbsoluteContentSize.Y + 10)
        end)

        tabBtn.MouseButton1Click:Connect(function()
            for _, btn in pairs(WindowObj.TabButtons) do tween(btn, {0.2}, {TextColor3 = Color3.fromRGB(120, 120, 120)}) end
            for _, cont in pairs(WindowObj.Tabs) do cont.Visible = false end
            tween(tabBtn, {0.2}, {TextColor3 = Color3.fromRGB(255, 255, 255)})
            tabContent.Visible = true
            WindowObj.CurrentTab = name
        end)

        table.insert(WindowObj.TabButtons, tabBtn)
        WindowObj.Tabs[name] = tabContent
        if not WindowObj.CurrentTab then tabBtn.TextColor3 = Color3.fromRGB(255, 255, 255) tabContent.Visible = true WindowObj.CurrentTab = name end

        local TabObj = {}
        function TabObj:Section(side, secName)
            local targetCol = side == "Left" and leftCol or rightCol
            local sec = c("Frame", {Name = secName, BackgroundColor3 = Color3.fromRGB(22, 22, 22), Size = UDim2.new(1, 0, 0, 0), AutomaticSize = Enum.AutomaticSize.Y}, {
                c("UICorner", {CornerRadius = UDim.new(0, 6)}), c("UIStroke", {Color = Color3.fromRGB(35, 35, 35), Thickness = 1}), c("UIPadding", {PaddingBottom = UDim.new(0, 10)}),
                c("TextLabel", {BackgroundTransparency = 1, Position = UDim2.new(0, 10, 0, 8), Size = UDim2.new(1, -20, 0, 14), Text = secName, TextColor3 = Color3.fromRGB(200, 200, 200), TextSize = 14, Font = Enum.Font.GothamMedium, TextXAlignment = Enum.TextXAlignment.Left})
            })
            sec.Parent = targetCol

            local layout = c("UIListLayout", {SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 8)})
            local secContent = c("Frame", {Name = "Content", BackgroundTransparency = 1, Position = UDim2.new(0, 10, 0, 35), Size = UDim2.new(1, -20, 0, 0), AutomaticSize = Enum.AutomaticSize.Y}, {layout})
            secContent.Parent = sec
            local secBase = secContent  -- immutable ref used by SubSection

            local SecObj = {}

            function SecObj:Checkbox(label, def, cb)
                local frame = c("Frame", {BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, 14)})
                local widget = DraxUI.MakeWidget(frame, secContent)
                widget.Value = def or false

                local btn = c("TextButton", {BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0), Text = ""})
                btn.Parent = frame

                local box = c("Frame", {BackgroundColor3 = widget.Value and DraxUI.AccentColor or Color3.fromRGB(15, 15, 15), Size = UDim2.new(0, 14, 0, 14)}, {
                    c("UICorner", {CornerRadius = UDim.new(0, 4)}), c("UIStroke", {Color = Color3.fromRGB(35, 35, 35), Thickness = 1})
                })
                box.Parent = frame
                
                -- Create glow immediately for all checkboxes
                local g = DraxUI.AddGlow(box, 4, 0.6)
                DraxUI.SetGlowVisibility(g, widget.Value)
                
                table.insert(DraxUI.AccentObjects, {Obj = box, Prop = "BackgroundColor3", IsToggle = true, GetState = function() return widget.Value end})
                table.insert(DraxUI.AccentObjects, {Obj = g, Prop = "ImageColor3"})

                c("TextLabel", {BackgroundTransparency = 1, Position = UDim2.new(0, 22, 0, 0), Size = UDim2.new(1, -22, 1, 0), Text = label, TextColor3 = Color3.fromRGB(180, 180, 180), TextSize = 13, Font = Enum.Font.Gotham, TextXAlignment = Enum.TextXAlignment.Left}).Parent = frame

                btn.MouseButton1Click:Connect(function()
                    if widget.Disabled then return end
                    widget.Value = not widget.Value
                    tween(box, {0.15}, {BackgroundColor3 = widget.Value and DraxUI.AccentColor or Color3.fromRGB(15, 15, 15)})
                    DraxUI.SetGlowVisibility(g, widget.Value)  -- Toggle glow visibility
                    cb(widget.Value)
                end)
                function widget:LoadValue(v)
                    widget.Value = (v == true)
                    tween(box, {0.15}, {BackgroundColor3 = widget.Value and DraxUI.AccentColor or Color3.fromRGB(15, 15, 15)})
                    DraxUI.SetGlowVisibility(g, widget.Value)
                    cb(widget.Value)
                end
                cb(widget.Value)
                return widget
            end

            function SecObj:CheckboxColor(label, defVal, defVisCol, defHidCol, cbBox, cbVis, cbHid)
                local frame = c("Frame", {BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, 14)})
                local widget = DraxUI.MakeWidget(frame, secContent)
                widget.Value = defVal or false

                local _vh, _vs, _vv = (defVisCol or Color3.fromRGB(255,255,255)):ToHSV()
                local visColData = {Color = defVisCol or Color3.fromRGB(255,255,255), Alpha = 1, Hue = _vh, Sat = _vs, Val = _vv, Mode = "Solid", Speed = 1, Stops = {defVisCol or Color3.fromRGB(255,255,255), Color3.fromRGB(0,0,0)}, SelectedStop = 1, SeqPos = 0}
                local _hh, _hs, _hv = (defHidCol or Color3.fromRGB(255,0,0)):ToHSV()
                local hidColData = {Color = defHidCol or Color3.fromRGB(255,0,0), Alpha = 1, Hue = _hh, Sat = _hs, Val = _hv, Mode = "Solid", Speed = 1, Stops = {defHidCol or Color3.fromRGB(255,0,0), Color3.fromRGB(0,0,0)}, SelectedStop = 1, SeqPos = 0}
                
                local box = c("Frame", {BackgroundColor3 = widget.Value and DraxUI.AccentColor or Color3.fromRGB(15, 15, 15), Size = UDim2.new(0, 14, 0, 14)}, {
                    c("UICorner", {CornerRadius = UDim.new(0, 4)}), c("UIStroke", {Color = Color3.fromRGB(35, 35, 35), Thickness = 1})
                })
                box.Parent = frame
                -- Create glow for checkbox immediately
                local g = DraxUI.AddGlow(box, 4, 0.6)
                -- Only show glow if checked AND glow is enabled
                DraxUI.SetGlowVisibility(g, widget.Value)
                table.insert(DraxUI.AccentObjects, {Obj = box, Prop = "BackgroundColor3", IsToggle = true, GetState = function() return widget.Value end})
                table.insert(DraxUI.AccentObjects, {Obj = g, Prop = "ImageColor3"})

                c("TextLabel", {BackgroundTransparency = 1, Position = UDim2.new(0, 22, 0, 0), Size = UDim2.new(1, -60, 1, 0), Text = label, TextColor3 = Color3.fromRGB(180, 180, 180), TextSize = 13, Font = Enum.Font.Gotham, TextXAlignment = Enum.TextXAlignment.Left}).Parent = frame
                local btn = c("TextButton", {BackgroundTransparency = 1, Size = UDim2.new(1, cbHid and -54 or -40, 1, 0), Text = ""})
                btn.Parent = frame

                btn.MouseButton1Click:Connect(function()
                    if widget.Disabled then return end
                    widget.Value = not widget.Value
                    tween(box, {0.15}, {BackgroundColor3 = widget.Value and DraxUI.AccentColor or Color3.fromRGB(15, 15, 15)})
                    DraxUI.SetGlowVisibility(g, widget.Value)  -- Toggle glow visibility
                    cbBox(widget.Value)
                end)

                local visSq = c("TextButton", {BackgroundColor3 = visColData.Color, AnchorPoint = Vector2.new(1, 0), Position = UDim2.new(1, -18, 0, 0), Size = UDim2.new(0, 14, 0, 14), Text = "", AutoButtonColor = false}, {c("UICorner", {CornerRadius = UDim.new(0, 3)}), c("UIStroke", {Color = Color3.fromRGB(50, 50, 50), Thickness = 1})})
                visSq.Parent = frame
                local visSqGlow = DraxUI.AddGlow(visSq, 3, 0.7)
                visSqGlow.ImageColor3 = visColData.Color
                DraxUI.SetGlowVisibility(visSqGlow, true)
                visColData.Box = visSq
                local origCbVis = cbVis
                visColData.Callback = function(c)
                    visSq.BackgroundColor3 = c
                    visSqGlow.ImageColor3 = c  -- Sync glow color
                    origCbVis(c)
                end
                widget.VisSq = visSq

                if cbHid then
                    local hidSq = c("TextButton", {BackgroundColor3 = hidColData.Color, AnchorPoint = Vector2.new(1, 0), Position = UDim2.new(1, -36, 0, 0), Size = UDim2.new(0, 14, 0, 14), Text = "", AutoButtonColor = false, Visible = false}, {c("UICorner", {CornerRadius = UDim.new(0, 3)}), c("UIStroke", {Color = Color3.fromRGB(50, 50, 50), Thickness = 1})})
                    hidSq.Parent = frame
                    local hidSqGlow = DraxUI.AddGlow(hidSq, 3, 0.7)
                    hidSqGlow.ImageColor3 = hidColData.Color
                    DraxUI.SetGlowVisibility(hidSqGlow, false)
                    hidColData.Box = hidSq
                    local origCbHid = cbHid
                    hidColData.Callback = function(c)
                        hidSq.BackgroundColor3 = c
                        hidSqGlow.ImageColor3 = c  -- Sync glow color
                        origCbHid(c)
                    end
                    widget.HidSq = hidSq
                    table.insert(DraxUI.ColorWidgets, widget)
                end

                local openVis, popupVis, closerVis = false, nil, nil
                visSq.MouseButton1Click:Connect(function()
                    if widget.Disabled then return end
                    openVis = not openVis
                    if openVis then popupVis, closerVis = DraxUI.CreateColorPickerPopup(visSq, visColData) closerVis.MouseButton1Click:Connect(function() openVis = false end)
                    else if popupVis then popupVis:Destroy() end if closerVis then closerVis:Destroy() end end
                end)

                if cbHid and widget.HidSq then
                    local openHid, popupHid, closerHid = false, nil, nil
                    widget.HidSq.MouseButton1Click:Connect(function()
                        if widget.Disabled then return end
                        openHid = not openHid
                        if openHid then popupHid, closerHid = DraxUI.CreateColorPickerPopup(widget.HidSq, hidColData) closerHid.MouseButton1Click:Connect(function() openHid = false end)
                        else if popupHid then popupHid:Destroy() end if closerHid then closerHid:Destroy() end end
                    end)
                end

                local function _applyAnimColData(cd, sq, cb2)
                    if typeof(cd.Color) == "Color3" then
                        sq.BackgroundColor3 = cd.Color
                        local bg = sq:FindFirstChild("Bloom"); if bg then bg.ImageColor3 = cd.Color end
                        cb2(cd.Color, cd.Alpha)
                    end
                    if cd.Mode == "RGB" or cd.Mode == "Seq" then
                        if not cd.AnimId then cd.AnimId = tostring(cd) end
                        DraxUI.AnimatedColors[cd.AnimId] = cd
                    else
                        if cd.AnimId then DraxUI.AnimatedColors[cd.AnimId] = nil end
                    end
                end
                function widget:GetSaveData()
                    local visStops = {}; for i, s in ipairs(visColData.Stops or {}) do visStops[i] = s end
                    local hidStops = {}; for i, s in ipairs((hidColData and hidColData.Stops) or {}) do hidStops[i] = s end
                    return {
                        val = widget.Value,
                        visc = visColData.Color, vismode = visColData.Mode, visspd = visColData.Speed,
                        visstops = visStops, vishue = visColData.Hue, visseqpos = visColData.SeqPos, visseed = visColData.Seed,
                        hidc = hidColData and hidColData.Color or nil,
                        hidmode = hidColData and hidColData.Mode or nil, hidspd = hidColData and hidColData.Speed or nil,
                        hidstops = hidStops, hidhue = hidColData and hidColData.Hue or nil, hidseqpos = hidColData and hidColData.SeqPos or nil, hidseed = hidColData and hidColData.Seed or nil,
                    }
                end
                function widget:LoadSaveData(data)
                    if type(data) ~= "table" then return end
                    widget.Value = (data.val == true)
                    tween(box, {0.15}, {BackgroundColor3 = widget.Value and DraxUI.AccentColor or Color3.fromRGB(15, 15, 15)})
                    DraxUI.SetGlowVisibility(g, widget.Value)
                    cbBox(widget.Value)
                    if typeof(data.visc) == "Color3" then
                        local h, s, vv = data.visc:ToHSV()
                        visColData.Color = data.visc; visColData.Hue = h; visColData.Sat = s; visColData.Val = vv
                        if type(data.vismode) == "string" then visColData.Mode = data.vismode end
                        if type(data.visspd) == "number" then visColData.Speed = data.visspd end
                        if type(data.vishue) == "number" then visColData.Hue = data.vishue end
                        if type(data.visseqpos) == "number" then visColData.SeqPos = data.visseqpos end
                        if type(data.visseed) == "number" then visColData.Seed = data.visseed end
                        if type(data.visstops) == "table" then
                            visColData.Stops = {}
                            for i, s in ipairs(data.visstops) do if typeof(s) == "Color3" then visColData.Stops[i] = s end end
                        end
                        _applyAnimColData(visColData, visSq, cbVis)
                    end
                    if cbHid and widget.HidSq and typeof(data.hidc) == "Color3" then
                        local h, s, vv = data.hidc:ToHSV()
                        hidColData.Color = data.hidc; hidColData.Hue = h; hidColData.Sat = s; hidColData.Val = vv
                        if type(data.hidmode) == "string" then hidColData.Mode = data.hidmode end
                        if type(data.hidspd) == "number" then hidColData.Speed = data.hidspd end
                        if type(data.hidhue) == "number" then hidColData.Hue = data.hidhue end
                        if type(data.hidseqpos) == "number" then hidColData.SeqPos = data.hidseqpos end
                        if type(data.hidseed) == "number" then hidColData.Seed = data.hidseed end
                        if type(data.hidstops) == "table" then
                            hidColData.Stops = {}
                            for i, s in ipairs(data.hidstops) do if typeof(s) == "Color3" then hidColData.Stops[i] = s end end
                        end
                        _applyAnimColData(hidColData, widget.HidSq, cbHid)
                    end
                end
                cbBox(widget.Value)
                return widget
            end

            function SecObj:CheckboxDropdown(label, defVal, items, defIdx, cbBox, cbDrop)
                local frame = c("Frame", {BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, 14)})
                local widget = DraxUI.MakeWidget(frame, secContent)
                widget.Value = defVal or false
                widget.DropIdx = defIdx or 1
                local box = c("Frame", {BackgroundColor3 = widget.Value and DraxUI.AccentColor or Color3.fromRGB(15,15,15), Size = UDim2.new(0,14,0,14)}, {
                    c("UICorner",{CornerRadius=UDim.new(0,4)}), c("UIStroke",{Color=Color3.fromRGB(35,35,35),Thickness=1})
                })
                box.Parent = frame
                -- Create glow for checkbox immediately
                local g = DraxUI.AddGlow(box, 4, 0.6)
                DraxUI.SetGlowVisibility(g, widget.Value)
                table.insert(DraxUI.AccentObjects, {Obj=box, Prop="BackgroundColor3", IsToggle=true, GetState=function() return widget.Value end})
                table.insert(DraxUI.AccentObjects, {Obj = g, Prop = "ImageColor3"})
                c("TextLabel", {BackgroundTransparency=1, Position=UDim2.new(0,22,0,0), Size=UDim2.new(1,-138,1,0), Text=label, TextColor3=Color3.fromRGB(180,180,180), TextSize=13, Font=Enum.Font.Gotham, TextXAlignment=Enum.TextXAlignment.Left}).Parent = frame
                local cbBtn = c("TextButton", {BackgroundTransparency=1, Size=UDim2.new(1,-120,1,0), Text=""})
                cbBtn.Parent = frame
                cbBtn.MouseButton1Click:Connect(function()
                    if widget.Disabled then return end
                    widget.Value = not widget.Value
                    tween(box,{0.15},{BackgroundColor3=widget.Value and DraxUI.AccentColor or Color3.fromRGB(15,15,15)})
                    DraxUI.SetGlowVisibility(g, widget.Value)
                    cbBox(widget.Value)
                end)
                local dropBox = c("TextButton", {BackgroundColor3=Color3.fromRGB(15,15,15), AnchorPoint=Vector2.new(1,0), Position=UDim2.new(1,0,0,0), Size=UDim2.new(0,114,1,0), Text=items[widget.DropIdx] or "None", TextColor3=Color3.fromRGB(180,180,180), TextSize=12, Font=Enum.Font.Gotham, AutoButtonColor=false}, {
                    c("UICorner",{CornerRadius=UDim.new(0,4)}), c("UIStroke",{Color=Color3.fromRGB(35,35,35),Thickness=1})
                })
                dropBox.Parent = frame
                local dropFrame, dOpen = nil, false
                local cdDropOutConn, suppressDropBox = nil, false
                dropBox.MouseButton1Click:Connect(function()
                    if widget.Disabled then return end
                    if suppressDropBox then suppressDropBox = false; return end
                    dOpen = not dOpen
                    if dOpen then
                        if dropFrame then dropFrame:Destroy() end
                        
                        local visibleOpts = math.min(#items, 5)
                        local dfHeight = visibleOpts * 24 + 8
                        local canvasHeight = #items * 24 + 8
                        
                        dropFrame = c("ScrollingFrame", {BackgroundColor3=Color3.fromRGB(20,20,20), Position=UDim2.new(0,dropBox.AbsolutePosition.X,0,dropBox.AbsolutePosition.Y+18), Size=UDim2.new(0,dropBox.AbsoluteSize.X,0,dfHeight), CanvasSize=UDim2.new(0,0,0,canvasHeight), ScrollBarThickness=3, ScrollBarImageColor3=Color3.fromRGB(150,150,150), BorderSizePixel=0, ZIndex=100}, {
                            c("UICorner",{CornerRadius=UDim.new(0,4)}), c("UIStroke",{Color=Color3.fromRGB(35,35,35),Thickness=1}), c("UIListLayout",{Padding=UDim.new(0,0)})
                        })
                        c("UIPadding",{PaddingTop=UDim.new(0,4),PaddingBottom=UDim.new(0,4)}).Parent=dropFrame
                        for i, item in ipairs(items) do
                            local btn = c("TextButton", {BackgroundTransparency=1, Size=UDim2.new(1,0,0,24), Text=item, TextColor3=i==widget.DropIdx and Color3.fromRGB(255,255,255) or Color3.fromRGB(150,150,150), TextSize=13, Font=Enum.Font.Gotham, ZIndex=101})
                            btn.MouseButton1Click:Connect(function() widget.DropIdx=i; dropBox.Text=item; dOpen=false; dropFrame:Destroy(); dropFrame=nil; if cdDropOutConn then cdDropOutConn:Disconnect(); cdDropOutConn=nil end; cbDrop(i) end)
                            btn.Parent=dropFrame
                        end
                        dropFrame.Parent=DraxUI.ScreenGui
                        task.defer(function()
                            if not dOpen then return end
                            cdDropOutConn = UIS.InputBegan:Connect(function(inp)
                                if inp.UserInputType ~= Enum.UserInputType.MouseButton1 then return end
                                if not dropFrame or not dropFrame.Parent then if cdDropOutConn then cdDropOutConn:Disconnect(); cdDropOutConn=nil end; return end
                                local ap, as = dropFrame.AbsolutePosition, dropFrame.AbsoluteSize
                                local mp = inp.Position
                                if mp.X < ap.X or mp.X > ap.X+as.X or mp.Y < ap.Y or mp.Y > ap.Y+as.Y then
                                    local dbap, dbas = dropBox.AbsolutePosition, dropBox.AbsoluteSize
                                    if mp.X >= dbap.X and mp.X <= dbap.X+dbas.X and mp.Y >= dbap.Y and mp.Y <= dbap.Y+dbas.Y then suppressDropBox = true end
                                    dOpen = false; if dropFrame then dropFrame:Destroy(); dropFrame=nil end
                                    if cdDropOutConn then cdDropOutConn:Disconnect(); cdDropOutConn=nil end
                                end
                            end)
                        end)
                    else
                        if dropFrame then dropFrame:Destroy(); dropFrame=nil end
                        if cdDropOutConn then cdDropOutConn:Disconnect(); cdDropOutConn=nil end
                    end
                end)
                function widget:GetSaveData()
                    return {val = widget.Value, idx = widget.DropIdx}
                end
                function widget:LoadSaveData(data)
                    if type(data) ~= "table" then return end
                    widget.Value = (data.val == true)
                    tween(box, {0.15}, {BackgroundColor3 = widget.Value and DraxUI.AccentColor or Color3.fromRGB(15, 15, 15)})
                    DraxUI.SetGlowVisibility(g, widget.Value)
                    cbBox(widget.Value)
                    if type(data.idx) == "number" then
                        widget.DropIdx = data.idx
                        dropBox.Text = items[data.idx] or "None"
                        cbDrop(data.idx)
                    end
                end
                cbBox(widget.Value); cbDrop(widget.DropIdx)
                return widget
            end

            function SecObj:CheckboxKeybind(label, defVal, defKey, cbArm, cbFire, defMode, defModes)
                local frame = c("Frame", {BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, 20)})
                local widget = DraxUI.MakeWidget(frame, secContent)
                widget.Value = defVal or false
                widget.Key = defKey
                widget.Mode = defMode or "toggle"
                widget.Label = label
                -- Build effective mode list (filtered by defModes; default = toggle+hold only)
                local _allModeKeys  = {"toggle","hold","press","always"}
                local _allModeNames = {"Toggle","Hold","Press","Always"}
                local effectiveModes = {}
                if defModes then
                    for i, k in ipairs(_allModeKeys) do
                        for _, dm in ipairs(defModes) do if dm == k then table.insert(effectiveModes, i); break end end
                    end
                end
                if #effectiveModes == 0 then effectiveModes = {1, 2} end  -- default: Toggle/Hold
                local modeCount = #effectiveModes
                local dropWidth  = math.max(28, modeCount * 28)
                do  -- validate widget.Mode against effectiveModes
                    local ok = false
                    for _, gi in ipairs(effectiveModes) do if _allModeKeys[gi] == widget.Mode then ok = true; break end end
                    if not ok then widget.Mode = _allModeKeys[effectiveModes[1]] end
                end
                table.insert(DraxUI.KeybindEntries, widget)

                local box = c("Frame", {BackgroundColor3 = widget.Value and DraxUI.AccentColor or Color3.fromRGB(15,15,15), Position = UDim2.new(0,0,0,3), Size = UDim2.new(0,14,0,14)}, {
                    c("UICorner", {CornerRadius = UDim.new(0,4)}), c("UIStroke", {Color = Color3.fromRGB(35,35,35), Thickness = 1})
                })
                box.Parent = frame
                -- Create glow for checkbox
                local g = DraxUI.AddGlow(box, 4, 0.6)
                DraxUI.SetGlowVisibility(g, widget.Value)
                table.insert(DraxUI.AccentObjects, {Obj = box, Prop = "BackgroundColor3", IsToggle = true, GetState = function() return widget.Value end})
                table.insert(DraxUI.AccentObjects, {Obj = g, Prop = "ImageColor3"})
                

                c("TextLabel", {BackgroundTransparency = 1, Position = UDim2.new(0,22,0,0), Size = UDim2.new(1,-100,1,0), Text = label, TextColor3 = Color3.fromRGB(180,180,180), TextSize = 13, Font = Enum.Font.Gotham, TextXAlignment = Enum.TextXAlignment.Left}).Parent = frame

                local cbBtn = c("TextButton", {BackgroundTransparency = 1, Size = UDim2.new(1,-78,1,0), Text = ""})
                cbBtn.Parent = frame

                -- Keybind wrapper (clipped for slide transition)
                local kWrap = c("Frame", {BackgroundTransparency=1, AnchorPoint=Vector2.new(1,0.5), Position=UDim2.new(1,-22,0.5,0), Size=UDim2.new(0,80,0,18), ClipsDescendants=true})
                kWrap.Parent = frame
                widget._kWrap = kWrap
                local kbtn = c("TextButton", {BackgroundColor3=Color3.fromRGB(26,26,26), AnchorPoint=Vector2.new(1,0), Position=UDim2.new(1,0,0,0), Size=UDim2.new(0,80,1,0), Text="key: none", TextColor3=Color3.fromRGB(160,160,160), TextSize=11, Font=Enum.Font.GothamMedium, AutoButtonColor=false}, {
                    c("UICorner",{CornerRadius=UDim.new(0,4)}), c("UIStroke",{Color=Color3.fromRGB(40,40,40),Thickness=1})
                })
                kbtn.Parent = kWrap

                -- Mode (Toggle/Hold) droplet wrapper, starts collapsed
                local dWrap = c("Frame", {BackgroundTransparency=1, AnchorPoint=Vector2.new(1,0.5), Position=UDim2.new(1,-22,0.5,0), Size=UDim2.new(0,0,0,18), ClipsDescendants=true})
                dWrap.Parent = frame
                widget._dWrap = dWrap
                local dBg = c("Frame", {BackgroundColor3=Color3.fromRGB(15,15,15), AnchorPoint=Vector2.new(1,0), Position=UDim2.new(1,0,0,0), Size=UDim2.new(0,dropWidth,1,0)}, {
                    c("UICorner",{CornerRadius=UDim.new(0,12)}), c("UIStroke",{Color=Color3.fromRGB(35,35,35),Thickness=1})
                })
                dBg.Parent = dWrap
                local dInd = c("Frame", {BackgroundColor3=Color3.fromRGB(45,45,45), Position=UDim2.new(0,2,0,2), Size=UDim2.new(1/modeCount,-4,1,-4)}, {c("UICorner",{CornerRadius=UDim.new(0,10)})})
                dInd.Parent = dBg
                local modeBtns = {}
                for li, gi in ipairs(effectiveModes) do
                    local nm   = _allModeNames[gi]
                    local mk   = _allModeKeys[gi]
                    local frac = (li - 1) / modeCount
                    local mb = c("TextButton", {BackgroundTransparency=1, Position=UDim2.new(frac,0,0,0), Size=UDim2.new(1/modeCount,0,1,0), Text=nm, TextColor3=li==1 and Color3.fromRGB(255,255,255) or Color3.fromRGB(120,120,120), TextSize=11, Font=Enum.Font.GothamMedium})
                    mb.MouseButton1Click:Connect(function()
                        widget.Mode = mk
                        tween(dInd,{0.2,Enum.EasingStyle.Quint,Enum.EasingDirection.Out},{Position=UDim2.new(frac,2,0,2)})
                        for j,b in ipairs(modeBtns) do tween(b,{0.15},{TextColor3=j==li and Color3.fromRGB(255,255,255) or Color3.fromRGB(120,120,120)}) end
                        if DraxUI.UpdateKeybindList then DraxUI.UpdateKeybindList() end
                        
                        -- Sync state based on new mode
                        if mk == "always" then
                            cbArm(widget.Value)  -- Always follows checkbox
                        else
                            cbArm(false)  -- Hold/Press/Toggle start disabled
                            widget.ToggleActive = false  -- Reset toggle state
                            widget._heldActive = false  -- Reset held state
                        end
                    end)
                    mb.Parent = dBg; table.insert(modeBtns, mb)
                end
                -- Sync indicator to current widget.Mode
                for li, gi in ipairs(effectiveModes) do
                    if _allModeKeys[gi] == widget.Mode then
                        dInd.Position = UDim2.new((li-1)/modeCount, 2, 0, 2)
                        for j, b in ipairs(modeBtns) do b.TextColor3 = j==li and Color3.fromRGB(255,255,255) or Color3.fromRGB(120,120,120) end
                        break
                    end
                end

                -- Mode "…" toggle button
                local modeBtn = c("TextButton", {BackgroundColor3=Color3.fromRGB(26,26,26), AnchorPoint=Vector2.new(1,0.5), Position=UDim2.new(1,-2,0.5,0), Size=UDim2.new(0,18,0,16), Text="…", TextColor3=Color3.fromRGB(180,180,180), TextSize=12, Font=Enum.Font.GothamBold, AutoButtonColor=false}, {
                    c("UICorner",{CornerRadius=UDim.new(0,4)}), c("UIStroke",{Color=Color3.fromRGB(40,40,40),Thickness=1})
                })
                modeBtn.Parent = frame
                widget.ModeBtn = modeBtn
                if modeCount <= 1 then modeBtn.Visible = false end

                local function setVal(v)
                    widget.Value = v
                    if not v then widget.ToggleActive = false end
                    tween(box,{0.15},{BackgroundColor3=v and DraxUI.AccentColor or Color3.fromRGB(15,15,15)})
                    DraxUI.SetGlowVisibility(g, v)
                end
                widget.Reset = function() setVal(false) end

                cbBtn.MouseButton1Click:Connect(function()
                    if widget.Disabled then return end
                    setVal(not widget.Value)
                    if widget.Mode ~= "toggle" then
                        cbArm(widget.Value)
                    elseif not widget.Value then
                        -- Toggle mode uncheck: reset toggle state and stop effect
                        widget.ToggleActive = false
                        cbArm(false)
                    end
                    if DraxUI.UpdateKeybindList then DraxUI.UpdateKeybindList() end
                end)

                -- Mode open/close
                local modeOpen, tabConn = false, nil
                local modeOutConn, suppressModeBtn = nil, false
                local closeModeDroplet, openModeDroplet
                closeModeDroplet = function()
                    if not modeOpen then return end
                    modeOpen = false
                    if tabConn then tabConn:Disconnect(); tabConn = nil end
                    if modeOutConn then modeOutConn:Disconnect(); modeOutConn = nil end
                    tween(kWrap,{0.15,Enum.EasingStyle.Quint,Enum.EasingDirection.Out},{Size=UDim2.new(0,80,0,18)})
                    tween(dWrap,{0.15,Enum.EasingStyle.Quint,Enum.EasingDirection.Out},{Size=UDim2.new(0,0,0,18)})
                end
                openModeDroplet = function()
                    modeOpen = true
                    tween(kWrap,{0.15,Enum.EasingStyle.Quint,Enum.EasingDirection.Out},{Size=UDim2.new(0,0,0,18)})
                    tween(dWrap,{0.15,Enum.EasingStyle.Quint,Enum.EasingDirection.Out},{Size=UDim2.new(0,dropWidth,0,18)})
                    -- close on tab switch only
                    local tc = frame.Parent and frame.Parent.Parent and frame.Parent.Parent.Parent and frame.Parent.Parent.Parent.Parent
                    if tc then
                        tabConn = tc:GetPropertyChangedSignal("Visible"):Connect(function()
                            if not tc.Visible then closeModeDroplet() end
                        end)
                    end
                    -- close on outside click
                    task.defer(function()
                        if not modeOpen then return end
                        modeOutConn = UIS.InputBegan:Connect(function(inp)
                            if inp.UserInputType ~= Enum.UserInputType.MouseButton1 then return end
                            local bap, bas = dWrap.AbsolutePosition, dWrap.AbsoluteSize
                            local mp = inp.Position
                            if not (mp.X >= bap.X and mp.X <= bap.X+bas.X and mp.Y >= bap.Y and mp.Y <= bap.Y+bas.Y) then
                                local mbap, mbas = modeBtn.AbsolutePosition, modeBtn.AbsoluteSize
                                if mp.X >= mbap.X and mp.X <= mbap.X+mbas.X and mp.Y >= mbap.Y and mp.Y <= mbap.Y+mbas.Y then suppressModeBtn = true end
                                closeModeDroplet()
                            end
                        end)
                    end)
                end
                modeBtn.MouseButton1Click:Connect(function()
                    if widget.Disabled then return end
                    if suppressModeBtn then suppressModeBtn = false; return end
                    if modeOpen then closeModeDroplet() else openModeDroplet() end
                end)

                -- Keybind
                local binding, heldActive = false, false
                local kbtnSuppressClick = false  -- suppress MouseButton1Click that fires after LMB bind
                widget.ToggleActive = false
                widget.MouseButton = nil  -- Enum.UserInputType.MouseButton1/2 when bound to mouse
                widget.GetActive = function()
                    if widget.Mode == "always" then return widget.Value end
                    if widget.Mode == "hold" then return widget._heldActive == true end
                    return widget.ToggleActive
                end
                local function kbtnLabel()
                    if widget.MouseButton == Enum.UserInputType.MouseButton1 then return "key: LMB"
                    elseif widget.MouseButton == Enum.UserInputType.MouseButton2 then return "key: RMB"
                    elseif widget.Key and widget.Key ~= Enum.KeyCode.Unknown then return "key: " .. widget.Key.Name
                    else return "key: none" end
                end
                kbtn.MouseButton1Click:Connect(function()
                    if widget.Disabled then return end
                    if kbtnSuppressClick then kbtnSuppressClick = false; return end
                    binding = true; DraxUI.KeybindCapturing = true; kbtn.Text = "..."
                end)
                UIS.InputBegan:Connect(function(inp, gpe)
                    if binding then
                        binding = false
                        task.defer(function() DraxUI.KeybindCapturing = false end)
                        local k = Enum.KeyCode.Unknown
                        local mb = nil
                        if inp.UserInputType == Enum.UserInputType.Keyboard then
                            k = inp.KeyCode
                            if k == Enum.KeyCode.Escape then k = Enum.KeyCode.Unknown end
                        elseif inp.UserInputType == Enum.UserInputType.MouseButton1 then
                            mb = Enum.UserInputType.MouseButton1
                            kbtnSuppressClick = true  -- the corresponding MouseButton1Click fires after — skip it
                        elseif inp.UserInputType == Enum.UserInputType.MouseButton2 then
                            mb = Enum.UserInputType.MouseButton2
                        end
                        widget.Key = k
                        widget.MouseButton = mb
                        kbtn.Text = kbtnLabel()
                        if DraxUI.UpdateKeybindList then DraxUI.UpdateKeybindList() end
                        return
                    end
                    if gpe then return end
                    -- Check if this input matches bound key or mouse button
                    local triggered = false
                    if widget.MouseButton ~= nil then
                        triggered = (inp.UserInputType == widget.MouseButton)
                    elseif widget.Key and widget.Key ~= Enum.KeyCode.Unknown then
                        triggered = (inp.UserInputType == Enum.UserInputType.Keyboard and inp.KeyCode == widget.Key)
                    end
                    if not triggered then return end
                    if widget.Disabled or not widget.Value then return end
                    if widget.Mode == "always" then return end
                    
                    if widget.Mode == "hold" then
                        if widget._heldActive then return end
                        widget._heldActive = true
                        cbArm(true)
                    elseif widget.Mode == "press" then
                        cbFire()
                    elseif widget.Mode == "toggle" then
                        widget.ToggleActive = not widget.ToggleActive
                        cbFire()
                    end
                    if DraxUI.UpdateKeybindList then DraxUI.UpdateKeybindList() end
                end)
                UIS.InputEnded:Connect(function(inp)
                    local released = false
                    if widget.MouseButton ~= nil then
                        released = (inp.UserInputType == widget.MouseButton)
                    elseif widget.Key and widget.Key ~= Enum.KeyCode.Unknown then
                        released = (inp.UserInputType == Enum.UserInputType.Keyboard and inp.KeyCode == widget.Key)
                    end
                    if not released then return end
                    if widget.Mode == "hold" and widget._heldActive then
                        widget._heldActive = false
                        cbArm(false)
                    else
                        widget._heldActive = false
                    end
                    if DraxUI.UpdateKeybindList then DraxUI.UpdateKeybindList() end
                end)

                function widget:GetSaveData()
                    return {
                        val  = widget.Value,
                        key  = widget.Key and widget.Key.Name or "Unknown",
                        mode = widget.Mode,
                        mb   = widget.MouseButton and widget.MouseButton.Name or nil,
                        toggleActive = widget.ToggleActive or false,
                        heldActive = (widget._heldActive or false),
                    }
                end
                function widget:LoadSaveData(data)
                    if type(data) ~= "table" then return end
                    widget.Key = Enum.KeyCode.Unknown; widget.MouseButton = nil
                    if type(data.mb) == "string" then
                        pcall(function() widget.MouseButton = Enum.UserInputType[data.mb] end)
                    elseif type(data.key) == "string" and data.key ~= "Unknown" then
                        pcall(function() widget.Key = Enum.KeyCode[data.key] end)
                    end
                    kbtn.Text = kbtnLabel()
                    if type(data.mode) == "string" then
                        for li, gi in ipairs(effectiveModes) do
                            if _allModeKeys[gi] == data.mode then
                                widget.Mode = data.mode
                                dInd.Position = UDim2.new((li - 1) / modeCount, 2, 0, 2)
                                for j, b in ipairs(modeBtns) do
                                    b.TextColor3 = j == li and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(120, 120, 120)
                                end
                                break
                            end
                        end
                    end
                    setVal(data.val == true)
                    -- Restore keybind activation state
                    if widget.Mode == "always" then
                        cbArm(widget.Value)
                    elseif widget.Mode == "toggle" then
                        -- Restore toggle activation state (only if armed/checked)
                        widget.ToggleActive = data.val == true and data.toggleActive == true
                        cbArm(widget.ToggleActive)
                    elseif widget.Mode == "hold" then
                        -- Restore held activation state
                        widget._heldActive = data.heldActive == true
                        cbArm(widget._heldActive)
                    else
                        -- "press" and any future mode: checkbox state is the enable gate
                        cbArm(widget.Value)
                    end
                end

                cbArm(widget.Value)
                return widget
            end

            function SecObj:Button(label, cb)
                local frame = c("Frame", {BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, 26)})
                local widget = DraxUI.MakeWidget(frame, secContent)
                local btn = c("TextButton", {BackgroundColor3 = Color3.fromRGB(26, 26, 26), Size = UDim2.new(1, -8, 1, 0), Position = UDim2.new(0, 8, 0, 0), Text = label, TextColor3 = Color3.fromRGB(200, 200, 200), TextSize = 13, Font = Enum.Font.GothamMedium, AutoButtonColor = false}, {
                    c("UICorner", {CornerRadius = UDim.new(0, 6)}), c("UIStroke", {Color = Color3.fromRGB(40, 40, 40), Thickness = 1})
                })
                btn.MouseEnter:Connect(function() if not widget.Disabled then tween(btn, {0.15}, {BackgroundColor3 = Color3.fromRGB(35, 35, 35)}) end end)
                btn.MouseLeave:Connect(function() if not widget.Disabled then tween(btn, {0.15}, {BackgroundColor3 = Color3.fromRGB(26, 26, 26)}) end end)
                btn.MouseButton1Down:Connect(function() if not widget.Disabled then tween(btn, {0.1}, {BackgroundColor3 = Color3.fromRGB(20, 20, 20)}) end end)
                btn.MouseButton1Up:Connect(function() if not widget.Disabled then tween(btn, {0.1}, {BackgroundColor3 = Color3.fromRGB(35, 35, 35)}) end end)
                btn.MouseButton1Click:Connect(function() if not widget.Disabled then cb() end end)
                btn.Parent = frame
                widget._btn = btn
                return widget
            end

            function SecObj:Slider(label, min, max, def, fmt, cb)
                local frame = c("Frame", {BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, 30)})
                local widget = DraxUI.MakeWidget(frame, secContent)
                -- Derive snap step from format string (e.g. "%.1f" → 0.1, "%.0f" → 1)
                local _step; do
                    local dec = (fmt or "%.1f"):match("%%%.(%d+)f")
                    _step = dec and (10 ^ (-tonumber(dec))) or nil
                end
                local function _snap(v)
                    if not _step then return v end
                    return math.clamp(math.floor((v - min) / _step + 0.5) * _step + min, min, max)
                end
                widget.Value = _snap(def or min)

                c("TextLabel", {BackgroundTransparency = 1, Size = UDim2.new(0.5, 0, 0, 14), Text = label, TextColor3 = Color3.fromRGB(200, 200, 200), TextSize = 13, Font = Enum.Font.Gotham, TextXAlignment = Enum.TextXAlignment.Left}).Parent = frame
                -- TextBox so the user can click it and type an exact value
                local valTxt = c("TextBox", {
                    BackgroundTransparency = 1,
                    Position = UDim2.new(0.5, 0, 0, 0),
                    Size = UDim2.new(0.5, -4, 0, 14),
                    Text = string.format(fmt or "%.1f", widget.Value),
                    TextColor3 = Color3.fromRGB(100, 100, 100),
                    TextSize = 13,
                    Font = Enum.Font.Gotham,
                    TextXAlignment = Enum.TextXAlignment.Right,
                    ClearTextOnFocus = false,
                    PlaceholderText = "",
                })
                valTxt.Parent = frame

                local track = c("Frame", {BackgroundColor3 = Color3.fromRGB(30, 30, 30), Position = UDim2.new(0, 0, 0, 20), Size = UDim2.new(1, -4, 0, 6)}, {c("UICorner", {CornerRadius = UDim.new(0, 3)})})
                track.Parent = frame
                local fill = c("Frame", {BackgroundColor3 = DraxUI.AccentColor, Size = UDim2.new(math.clamp((widget.Value - min) / (max - min), 0, 1), 0, 1, 0)}, {c("UICorner", {CornerRadius = UDim.new(0, 3)})})
                fill.Parent = track
                
                -- Create glow as child of track (dynamic positioning)
                local fillGlow = c("ImageLabel", {
                    Name = "Bloom",
                    BackgroundTransparency = 1,
                    Image = "rbxassetid://18245826428",
                    ImageColor3 = DraxUI.AccentColor,
                    ImageTransparency = 0.6,
                    ScaleType = Enum.ScaleType.Slice,
                    SliceCenter = Rect.new(21, 21, 79, 79),
                    Position = UDim2.new(0, -20, 0.5, -20),
                    Size = UDim2.new(0, 40, 0, 40),
                    ZIndex = 200  -- High ZIndex to prevent clipping at section edges
                })
                fillGlow.Parent = track
                table.insert(DraxUI.AccentObjects, {Obj = fillGlow, Prop = "ImageColor3"})
                table.insert(DraxUI.AccentObjects, {Obj = fill, Prop = "BackgroundColor3"})
                DraxUI.GlowRegistry[fillGlow] = true  -- register so RefreshAllGlows can toggle it
                
                -- Defer glow position initialization until after layout
                game:GetService("RunService").RenderStepped:Wait()
                local pct = math.clamp((widget.Value - min) / (max - min), 0, 1)
                if track.AbsoluteSize.X > 0 then
                    local glowWidth = math.max(40, pct * track.AbsoluteSize.X + 40)
                    local glowX = -20
                    fillGlow.Position = UDim2.new(0, glowX, 0.5, -20)
                    fillGlow.Size = UDim2.new(0, glowWidth, 0, 40)
                    -- Set glow visibility with state tracking
                    DraxUI.SetGlowVisibility(fillGlow, pct > 0)
                end

                local btn = c("TextButton", {BackgroundTransparency = 1, Position = UDim2.new(0, 0, 0, 15), Size = UDim2.new(1, 0, 0, 15), Text = ""})
                btn.Parent = frame

                -- _applyTyped lives here so fill/fillGlow/track are already in scope
                local function _applyTyped(txt)
                    local n = tonumber(txt)
                    if n then
                        local v = _snap(math.clamp(n, min, max))
                        widget.Value = v
                        local p = (max == min) and 0 or math.clamp((v - min) / (max - min), 0, 1)
                        fill.Size = UDim2.new(p, 0, 1, 0)
                        local gw = math.max(40, p * track.AbsoluteSize.X + 40)
                        fillGlow.Position = UDim2.new(0, -20, 0.5, -20)
                        fillGlow.Size = UDim2.new(0, gw, 0, 40)
                        DraxUI.SetGlowVisibility(fillGlow, p > 0)
                        cb(v)
                    end
                    valTxt.Text = string.format(fmt or "%.1f", widget.Value)
                end
                valTxt.FocusLost:Connect(function() _applyTyped(valTxt.Text) end)
                valTxt.ReturnPressedFromOnScreenKeyboard:Connect(function() _applyTyped(valTxt.Text) end)

                local dragging = false
                local function update(input)
                    if widget.Disabled then return end
                    local pct = math.clamp((input.Position.X - track.AbsolutePosition.X) / track.AbsoluteSize.X, 0, 1)
                    local raw = _snap(min + pct * (max - min))
                    widget.Value = raw
                    pct = (max == min) and 0 or math.clamp((raw - min) / (max - min), 0, 1)
                    valTxt.Text = string.format(fmt or "%.1f", widget.Value)
                    fill.Size = UDim2.new(pct, 0, 1, 0)
                    -- Update glow position and size to follow fill
                    local glowWidth = math.max(40, pct * track.AbsoluteSize.X + 40)
                    local glowX = -20
                    fillGlow.Position = UDim2.new(0, glowX, 0.5, -20)
                    fillGlow.Size = UDim2.new(0, glowWidth, 0, 40)
                    -- Set glow visibility with state tracking
                    DraxUI.SetGlowVisibility(fillGlow, pct > 0)
                    cb(widget.Value)
                end

                btn.InputBegan:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = true update(input) end end)
                local connEnd = UIS.InputEnded:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end end)
                local connChg = UIS.InputChanged:Connect(function(input) if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then update(input) end end)
                frame.Destroying:Connect(function() connEnd:Disconnect(); connChg:Disconnect() end)
                function widget:LoadValue(v)
                    v = _snap(math.clamp(v, min, max))
                    widget.Value = v
                    valTxt.Text = string.format(fmt or "%.1f", v)
                    local pct = (max == min) and 0 or ((v - min) / (max - min))
                    fill.Size = UDim2.new(pct, 0, 1, 0)
                    -- Update glow position and size
                    local glowWidth = math.max(40, pct * track.AbsoluteSize.X + 40)
                    local glowX = -20
                    fillGlow.Position = UDim2.new(0, glowX, 0.5, -20)
                    fillGlow.Size = UDim2.new(0, glowWidth, 0, 40)
                    -- Set glow visibility with state tracking
                    DraxUI.SetGlowVisibility(fillGlow, pct > 0)
                    cb(v)
                end
                cb(widget.Value)
                return widget
            end

            function SecObj:Dropdown(label, items, defIdx, cb)
                local frame = c("Frame", {BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, 24)})
                local widget = DraxUI.MakeWidget(frame, secContent)
                widget.Value = defIdx or 1

                c("TextLabel", {BackgroundTransparency = 1, Position = UDim2.new(0, 8, 0, 0), Size = UDim2.new(0.5, 0, 1, 0), Text = label, TextColor3 = Color3.fromRGB(200, 200, 200), TextSize = 13, Font = Enum.Font.Gotham, TextXAlignment = Enum.TextXAlignment.Left}).Parent = frame
                local box = c("TextButton", {BackgroundColor3 = Color3.fromRGB(15, 15, 15), AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.new(1, -20, 0.5, 0), Size = UDim2.new(0, 100, 1, 0), Text = items[widget.Value] or "None", TextColor3 = Color3.fromRGB(180, 180, 180), TextSize = 13, Font = Enum.Font.Gotham, AutoButtonColor = false}, {
                    c("UICorner", {CornerRadius = UDim.new(0, 4)}), c("UIStroke", {Color = Color3.fromRGB(35, 35, 35), Thickness = 1})
                })
                box.Parent = frame

                local dropFrame, open = nil, false
                local dropOutConn, suppressBoxClick = nil, false
                box.MouseButton1Click:Connect(function()
                    if widget.Disabled then return end
                    if suppressBoxClick then suppressBoxClick = false; return end
                    open = not open
                    if open then
                        if dropFrame then dropFrame:Destroy() end
                        dropFrame = c("Frame", {BackgroundColor3 = Color3.fromRGB(20, 20, 20), Position = UDim2.new(0, box.AbsolutePosition.X, 0, box.AbsolutePosition.Y + 28), Size = UDim2.new(0, box.AbsoluteSize.X, 0, #items * 24 + 8), ZIndex = 100}, {
                            c("UICorner", {CornerRadius = UDim.new(0, 4)}), c("UIStroke", {Color = Color3.fromRGB(35, 35, 35), Thickness = 1}), c("UIListLayout", {Padding = UDim.new(0, 0)})
                        })
                        c("UIPadding", {PaddingTop = UDim.new(0, 4), PaddingBottom = UDim.new(0, 4)}).Parent = dropFrame

                        for i, item in ipairs(items) do
                            local btn = c("TextButton", {BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, 24), Text = item, TextColor3 = i == widget.Value and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(150, 150, 150), TextSize = 13, Font = Enum.Font.Gotham, ZIndex = 101})
                            btn.MouseEnter:Connect(function() tween(btn, {0.1}, {TextColor3 = Color3.fromRGB(255, 255, 255)}) end)
                            btn.MouseLeave:Connect(function() if i ~= widget.Value then tween(btn, {0.1}, {TextColor3 = Color3.fromRGB(150, 150, 150)}) end end)
                            btn.MouseButton1Click:Connect(function() widget.Value = i box.Text = item open = false dropFrame:Destroy() dropFrame = nil if dropOutConn then dropOutConn:Disconnect(); dropOutConn = nil end cb(widget.Value) end)
                            btn.Parent = dropFrame
                        end
                        dropFrame.Parent = DraxUI.ScreenGui
                        task.defer(function()
                            if not open then return end
                            dropOutConn = UIS.InputBegan:Connect(function(inp)
                                if inp.UserInputType ~= Enum.UserInputType.MouseButton1 then return end
                                if not dropFrame or not dropFrame.Parent then if dropOutConn then dropOutConn:Disconnect(); dropOutConn = nil end; return end
                                local ap, as = dropFrame.AbsolutePosition, dropFrame.AbsoluteSize
                                local mp = inp.Position
                                if mp.X < ap.X or mp.X > ap.X+as.X or mp.Y < ap.Y or mp.Y > ap.Y+as.Y then
                                    local bap, bas = box.AbsolutePosition, box.AbsoluteSize
                                    if mp.X >= bap.X and mp.X <= bap.X+bas.X and mp.Y >= bap.Y and mp.Y <= bap.Y+bas.Y then suppressBoxClick = true end
                                    open = false; if dropFrame then dropFrame:Destroy(); dropFrame = nil end
                                    if dropOutConn then dropOutConn:Disconnect(); dropOutConn = nil end
                                end
                            end)
                        end)
                    else
                        if dropFrame then dropFrame:Destroy() end
                        if dropOutConn then dropOutConn:Disconnect(); dropOutConn = nil end
                    end
                end)
                function widget:LoadValue(idx)
                    widget.Value = math.clamp(math.floor(idx), 1, #items)
                    box.Text = items[widget.Value] or "None"
                    cb(widget.Value)
                end
                cb(widget.Value)
                return widget
            end
            function SecObj:MultiDropdown(label, items, defSelected, cb)
                local frame = c("Frame", {BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, 24)})
                local widget = DraxUI.MakeWidget(frame, secContent)
                widget.Value = defSelected or {}

                c("TextLabel", {BackgroundTransparency = 1, Position = UDim2.new(0, 8, 0, 0), Size = UDim2.new(0.5, 0, 1, 0), Text = label, TextColor3 = Color3.fromRGB(200, 200, 200), TextSize = 13, Font = Enum.Font.Gotham, TextXAlignment = Enum.TextXAlignment.Left}).Parent = frame

                local box = c("TextButton", {BackgroundColor3 = Color3.fromRGB(15, 15, 15), AnchorPoint = Vector2.new(1, 0), Position = UDim2.new(1, -20, 0, 0), Size = UDim2.new(0, 120, 1, 0), Text = "None", TextColor3 = Color3.fromRGB(180, 180, 180), TextSize = 13, Font = Enum.Font.Gotham, AutoButtonColor = false}, {
                    c("UICorner", {CornerRadius = UDim.new(0, 4)}), c("UIStroke", {Color = Color3.fromRGB(35, 35, 35), Thickness = 1})
                })
                box.Parent = frame

                function updateText()
                    local t, c_count = {}, 0
                    for i, v in ipairs(items) do if widget.Value[i] then table.insert(t, v) c_count = c_count + 1 end end
                    box.Text = c_count == 0 and "None" or (c_count > 2 and c_count .. " Selected" or table.concat(t, ", "))
                end
                updateText()

                local dropFrame, open = nil, false
                local mdDropOutConn, mdSuppressBoxClick = nil, false
                box.MouseButton1Click:Connect(function()
                    if widget.Disabled then return end
                    if mdSuppressBoxClick then mdSuppressBoxClick = false; return end
                    open = not open
                    if open then
                        if dropFrame then dropFrame:Destroy() end
                        
                        local visibleOpts = math.min(#items, 5)
                        local dfHeight = visibleOpts * 24 + 8
                        local canvasHeight = #items * 24 + 8
                        
                        dropFrame = c("ScrollingFrame", {BackgroundColor3 = Color3.fromRGB(20, 20, 20), Position = UDim2.new(0, box.AbsolutePosition.X, 0, box.AbsolutePosition.Y + 28), Size = UDim2.new(0, box.AbsoluteSize.X, 0, dfHeight), CanvasSize = UDim2.new(0, 0, 0, canvasHeight), ScrollBarThickness = 3, ScrollBarImageColor3 = Color3.fromRGB(150, 150, 150), BorderSizePixel = 0, ZIndex = 100}, {
                            c("UICorner", {CornerRadius = UDim.new(0, 4)}), c("UIStroke", {Color = Color3.fromRGB(35, 35, 35), Thickness = 1}), c("UIListLayout", {Padding = UDim.new(0, 0)})
                        })
                        c("UIPadding", {PaddingTop = UDim.new(0, 4), PaddingBottom = UDim.new(0, 4)}).Parent = dropFrame

                        for i, item in ipairs(items) do
                            local btn = c("TextButton", {BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, 24), Text = item, TextColor3 = widget.Value[i] and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(150, 150, 150), TextSize = 13, Font = Enum.Font.Gotham, ZIndex = 101})
                            btn.MouseButton1Click:Connect(function() widget.Value[i] = not widget.Value[i]; btn.TextColor3 = widget.Value[i] and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(150, 150, 150); updateText(); cb(widget.Value) end)
                            btn.Parent = dropFrame
                        end
                        dropFrame.Parent = DraxUI.ScreenGui
                        task.defer(function()
                            if not open then return end
                            mdDropOutConn = UIS.InputBegan:Connect(function(inp)
                                if inp.UserInputType ~= Enum.UserInputType.MouseButton1 then return end
                                if not dropFrame or not dropFrame.Parent then if mdDropOutConn then mdDropOutConn:Disconnect(); mdDropOutConn = nil end; return end
                                local ap, as = dropFrame.AbsolutePosition, dropFrame.AbsoluteSize
                                local mp = inp.Position
                                if mp.X < ap.X or mp.X > ap.X+as.X or mp.Y < ap.Y or mp.Y > ap.Y+as.Y then
                                    local bap, bas = box.AbsolutePosition, box.AbsoluteSize
                                    if mp.X >= bap.X and mp.X <= bap.X+bas.X and mp.Y >= bap.Y and mp.Y <= bap.Y+bas.Y then mdSuppressBoxClick = true end
                                    open = false; if dropFrame then dropFrame:Destroy(); dropFrame = nil end
                                    if mdDropOutConn then mdDropOutConn:Disconnect(); mdDropOutConn = nil end
                                end
                            end)
                        end)
                    else
                        if dropFrame then dropFrame:Destroy() end
                        if mdDropOutConn then mdDropOutConn:Disconnect(); mdDropOutConn = nil end
                    end
                end)
                function widget:LoadValue(v)
                    if type(v) ~= "table" then return end
                    for i = 1, #items do widget.Value[i] = (v[i] == true) end
                    updateText()
                    cb(widget.Value)
                end
                cb(widget.Value)
                return widget
            end

            function SecObj:Droplet(label, options, defIdx, cb)
                local frame = c("Frame", {BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, 24)})
                local widget = DraxUI.MakeWidget(frame, secContent)
                widget.Value = defIdx or 1

                local boxWidth = #options * 55
                local bg = c("Frame", {BackgroundColor3 = Color3.fromRGB(15, 15, 15), AnchorPoint = Vector2.new(1, 0), Position = UDim2.new(1, -20, 0, 0), Size = UDim2.new(0, boxWidth, 1, 0)}, {
                    c("UICorner", {CornerRadius = UDim.new(0, 12)}), c("UIStroke", {Color = Color3.fromRGB(35, 35, 35), Thickness = 1})
                })
                local indWidth = boxWidth / #options
                local ind = c("Frame", {BackgroundColor3 = Color3.fromRGB(45, 45, 45), Position = UDim2.new(0, (widget.Value - 1) * indWidth + 2, 0, 2), Size = UDim2.new(0, indWidth - 4, 1, -4)}, {c("UICorner", {CornerRadius = UDim.new(0, 10)})})
                ind.Parent = bg

                local btns = {}
                for i, opt in ipairs(options) do
                    local btn = c("TextButton", {BackgroundTransparency = 1, Position = UDim2.new(0, (i - 1) * indWidth, 0, 0), Size = UDim2.new(0, indWidth, 1, 0), Text = opt, TextColor3 = i == widget.Value and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(120, 120, 120), TextSize = 13, Font = Enum.Font.GothamMedium})
                    btn.MouseButton1Click:Connect(function()
                        if widget.Disabled then return end
                        widget.Value = i
                        tween(ind, {0.2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out}, {Position = UDim2.new(0, (i - 1) * indWidth + 2, 0, 2)})
                        for j, b in ipairs(btns) do tween(b, {0.2}, {TextColor3 = j == widget.Value and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(120, 120, 120)}) end
                        cb(widget.Value)
                    end)
                    btn.Parent = bg; table.insert(btns, btn)
                end
                bg.Parent = frame

                if label and label ~= "" and not string.match(label, "^##") then
                    c("TextLabel", {BackgroundTransparency = 1, Position = UDim2.new(0, 8, 0, 0), Size = UDim2.new(1, -boxWidth - 24, 1, 0), Text = label, TextColor3 = Color3.fromRGB(200, 200, 200), TextSize = 13, Font = Enum.Font.Gotham, TextXAlignment = Enum.TextXAlignment.Left}).Parent = frame
                else
                    bg.AnchorPoint = Vector2.new(0, 0); bg.Position = UDim2.new(0, 0, 0, 0)
                end
                function widget:LoadValue(idx)
                    idx = math.clamp(math.floor(idx), 1, #options)
                    widget.Value = idx
                    tween(ind, {0.2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out}, {Position = UDim2.new(0, (idx-1)*indWidth + 2, 0, 2)})
                    for j, b in ipairs(btns) do tween(b, {0.2}, {TextColor3 = j == idx and Color3.fromRGB(255,255,255) or Color3.fromRGB(120,120,120)}) end
                    cb(idx)
                end
                cb(widget.Value)
                return widget
            end

            function SecObj:CheckboxDroplet(label, options, defVal, defIdx, cbBox, cbDrop)
                local frame = c("Frame", {BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, 24)})
                local widget = DraxUI.MakeWidget(frame, secContent)
                widget.Value = defVal or false
                widget.DropIdx = defIdx or 1
                
                -- Checkbox on left
                local box = c("Frame", {BackgroundColor3 = widget.Value and DraxUI.AccentColor or Color3.fromRGB(15,15,15), Position = UDim2.new(0,0,0,5), Size = UDim2.new(0,14,0,14)}, {
                    c("UICorner",{CornerRadius=UDim.new(0,4)}), c("UIStroke",{Color=Color3.fromRGB(35,35,35),Thickness=1})
                })
                box.Parent = frame
                local g = DraxUI.AddGlow(box, 4, 0.6)
                DraxUI.SetGlowVisibility(g, widget.Value)
                table.insert(DraxUI.AccentObjects, {Obj=box, Prop="BackgroundColor3", IsToggle=true, GetState=function() return widget.Value end})
                table.insert(DraxUI.AccentObjects, {Obj = g, Prop = "ImageColor3"})
                
                -- Label
                c("TextLabel", {BackgroundTransparency=1, Position=UDim2.new(0,22,0,0), Size=UDim2.new(0.5,-35,1,0), Text=label, TextColor3=Color3.fromRGB(180,180,180), TextSize=13, Font=Enum.Font.Gotham, TextXAlignment=Enum.TextXAlignment.Left}).Parent = frame
                
                -- Checkbox button
                local cbBtn = c("TextButton", {BackgroundTransparency=1, Size=UDim2.new(0,20,1,0), Text=""})
                cbBtn.Parent = frame
                cbBtn.MouseButton1Click:Connect(function()
                    if widget.Disabled then return end
                    widget.Value = not widget.Value
                    tween(box,{0.15},{BackgroundColor3=widget.Value and DraxUI.AccentColor or Color3.fromRGB(15,15,15)})
                    DraxUI.SetGlowVisibility(g, widget.Value)
                    cbBox(widget.Value)
                end)
                
                -- Droplet on right
                local boxWidth = #options * 55
                local bg = c("Frame", {BackgroundColor3 = Color3.fromRGB(15, 15, 15), AnchorPoint = Vector2.new(1, 0), Position = UDim2.new(1, -4, 0, 0), Size = UDim2.new(0, boxWidth, 1, 0)}, {
                    c("UICorner", {CornerRadius = UDim.new(0, 12)}), c("UIStroke", {Color = Color3.fromRGB(35, 35, 35), Thickness = 1})
                })
                local indWidth = boxWidth / #options
                local ind = c("Frame", {BackgroundColor3 = Color3.fromRGB(45, 45, 45), Position = UDim2.new(0, (widget.DropIdx - 1) * indWidth + 2, 0, 2), Size = UDim2.new(0, indWidth - 4, 1, -4)}, {c("UICorner", {CornerRadius = UDim.new(0, 10)})})
                ind.Parent = bg
                
                local btns = {}
                for i, opt in ipairs(options) do
                    local btn = c("TextButton", {BackgroundTransparency = 1, Position = UDim2.new(0, (i - 1) * indWidth, 0, 0), Size = UDim2.new(0, indWidth, 1, 0), Text = opt, TextColor3 = i == widget.DropIdx and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(120, 120, 120), TextSize = 13, Font = Enum.Font.GothamMedium})
                    btn.MouseButton1Click:Connect(function()
                        if widget.Disabled then return end
                        widget.DropIdx = i
                        tween(ind, {0.2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out}, {Position = UDim2.new(0, (i - 1) * indWidth + 2, 0, 2)})
                        for j, b in ipairs(btns) do tween(b, {0.2}, {TextColor3 = j == widget.DropIdx and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(120, 120, 120)}) end
                        cbDrop(widget.DropIdx)
                    end)
                    btn.Parent = bg; table.insert(btns, btn)
                end
                bg.Parent = frame
                
                function widget:GetSaveData()
                    return {val = widget.Value, idx = widget.DropIdx}
                end
                function widget:LoadSaveData(data)
                    if type(data) ~= "table" then return end
                    widget.Value = (data.val == true)
                    tween(box, {0.15}, {BackgroundColor3 = widget.Value and DraxUI.AccentColor or Color3.fromRGB(15, 15, 15)})
                    DraxUI.SetGlowVisibility(g, widget.Value)
                    cbBox(widget.Value)
                    if type(data.idx) == "number" then
                        widget.DropIdx = data.idx
                        tween(ind, {0.2, Enum.EasingStyle.Quint, Enum.EasingDirection.Out}, {Position = UDim2.new(0, (data.idx-1)*indWidth + 2, 0, 2)})
                        for j, b in ipairs(btns) do tween(b, {0.2}, {TextColor3 = j == data.idx and Color3.fromRGB(255,255,255) or Color3.fromRGB(120,120,120)}) end
                        cbDrop(data.idx)
                    end
                end
                
                return widget
            end

            function SecObj:ColorPicker(label, defColor, defAlpha, cb)
                local frame = c("Frame", {BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, 14)})
                local widget = DraxUI.MakeWidget(frame, secContent)
                
                local _h, _s, _v = (defColor or Color3.fromRGB(255,255,255)):ToHSV()
                local colData = {Color = defColor or Color3.fromRGB(255,255,255), Alpha = defAlpha or 1, Hue = _h, Sat = _s, Val = _v, Mode = "Solid", Speed = 1, Stops = {defColor or Color3.fromRGB(255,255,255), Color3.fromRGB(0,0,0)}, SelectedStop = 1, SeqPos = 0}
                c("TextLabel", {BackgroundTransparency = 1, Size = UDim2.new(1, -22, 1, 0), Text = label, TextColor3 = Color3.fromRGB(200, 200, 200), TextSize = 13, Font = Enum.Font.Gotham, TextXAlignment = Enum.TextXAlignment.Left}).Parent = frame

                local box = c("TextButton", {BackgroundColor3 = colData.Color, AnchorPoint = Vector2.new(1, 0), Position = UDim2.new(1, -2, 0, 0), Size = UDim2.new(0, 14, 0, 14), Text = "", AutoButtonColor = false}, {
                    c("UICorner", {CornerRadius = UDim.new(0, 4)}), c("UIStroke", {Color = Color3.fromRGB(50, 50, 50), Thickness = 1})
                })
                box.Parent = frame
                -- Create glow for color picker
                local boxGlow = DraxUI.AddGlow(box, 3, 0.7)
                boxGlow.ZIndex = 200  -- Higher than section content to prevent clipping
                boxGlow.ImageColor3 = colData.Color  -- Set initial color
                DraxUI.SetGlowVisibility(boxGlow, true)  -- Track so RefreshAllGlows won't hide it
                -- Note: NOT added to AccentObjects - glow color is synced via callback instead
                local origCb = cb
                colData.Box = box
                colData.Callback = function(c, a)
                    box.BackgroundColor3 = c
                    boxGlow.ImageColor3 = c  -- Sync glow color
                    origCb(c, a)
                end
                widget.VisSq = box

                local open, popup, closer = false, nil, nil
                box.MouseButton1Click:Connect(function()
                    if widget.Disabled then return end
                    open = not open
                    if open then popup, closer = DraxUI.CreateColorPickerPopup(box, colData) closer.MouseButton1Click:Connect(function() open = false end)
                    else if popup then popup:Destroy() end if closer then closer:Destroy() end end
                end)
                function widget:LoadValue(col, alpha)
                    if typeof(col) ~= "Color3" then return end
                    local h, s, vv = col:ToHSV()
                    colData.Color = col; colData.Hue = h; colData.Sat = s; colData.Val = vv
                    colData.Alpha = alpha or colData.Alpha
                    box.BackgroundColor3 = col
                    boxGlow.ImageColor3 = col  -- Sync glow color
                    cb(col, colData.Alpha)
                end
                function widget:GetSaveData()
                    local stopsData = {}
                    for i, s in ipairs(colData.Stops or {}) do stopsData[i] = s end
                    return {col = colData.Color, alpha = colData.Alpha, mode = colData.Mode, speed = colData.Speed, stops = stopsData, hue = colData.Hue, seqpos = colData.SeqPos, seed = colData.Seed}
                end
                function widget:LoadSaveData(data)
                    if type(data) ~= "table" then return end
                    if type(data.mode) == "string" then colData.Mode = data.mode end
                    if type(data.speed) == "number" then colData.Speed = data.speed end
                    if type(data.hue) == "number" then colData.Hue = data.hue end
                    if type(data.seqpos) == "number" then colData.SeqPos = data.seqpos end
                    if type(data.seed) == "number" then colData.Seed = data.seed end
                    if type(data.stops) == "table" then
                        colData.Stops = {}
                        for i, s in ipairs(data.stops) do
                            if typeof(s) == "Color3" then colData.Stops[i] = s end
                        end
                    end
                    if typeof(data.col) == "Color3" then widget:LoadValue(data.col, data.alpha) end
                    if colData.Mode == "RGB" or colData.Mode == "Seq" then
                        if not colData.AnimId then colData.AnimId = tostring(colData) end
                        DraxUI.AnimatedColors[colData.AnimId] = colData
                    end
                end
                cb(colData.Color, colData.Alpha)
                return widget
            end

            function SecObj:Keybind(label, def, cb)
                local frame = c("Frame", {BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, 24)})
                local widget = DraxUI.MakeWidget(frame, secContent)
                widget.Value = def or Enum.KeyCode.Insert

                c("TextLabel", {BackgroundTransparency = 1, Position = UDim2.new(0, 8, 0, 0), Size = UDim2.new(0.5, 0, 1, 0), Text = label, TextColor3 = Color3.fromRGB(200, 200, 200), TextSize = 13, Font = Enum.Font.Gotham, TextXAlignment = Enum.TextXAlignment.Left}).Parent = frame

                local btn = c("TextButton", {BackgroundColor3 = Color3.fromRGB(26, 26, 26), AnchorPoint = Vector2.new(1, 0), Position = UDim2.new(1, -4, 0, 0), Size = UDim2.new(0, 100, 0, 20), Text = "key : " .. widget.Value.Name, TextColor3 = Color3.fromRGB(180, 180, 180), TextSize = 12, Font = Enum.Font.GothamMedium, AutoButtonColor = false}, {
                    c("UICorner", {CornerRadius = UDim.new(0, 4)}), c("UIStroke", {Color = Color3.fromRGB(40, 40, 40), Thickness = 1})
                })
                btn.Parent = frame

                local binding = false
                btn.MouseButton1Click:Connect(function() if widget.Disabled then return end binding = true DraxUI.KeybindCapturing = true btn.Text = "..." end)

                UIS.InputBegan:Connect(function(input, gpe)
                    if not binding then return end
                    if input.UserInputType == Enum.UserInputType.Keyboard then
                        binding = false
                        task.defer(function() DraxUI.KeybindCapturing = false end)
                        local k = input.KeyCode; if k == Enum.KeyCode.Escape then k = Enum.KeyCode.Unknown end
                        widget.Value = k; btn.Text = "key : " .. (k.Name == "Unknown" and "NONE" or k.Name)
                        cb(widget.Value)
                    elseif input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.MouseButton2 then
                        binding = false
                        task.defer(function() DraxUI.KeybindCapturing = false end)
                        widget.Value = Enum.KeyCode.Unknown; btn.Text = "key : NONE"; cb(widget.Value)
                    end
                end)

                function widget:GetSaveData()
                    return (widget.Value and widget.Value.Name) or "Unknown"
                end
                function widget:LoadSaveData(s)
                    if type(s) ~= "string" then return end
                    local ok, k = pcall(function() return Enum.KeyCode[s] end)
                    if not ok or not k then k = Enum.KeyCode.Unknown end
                    widget.Value = k
                    btn.Text = "key : " .. (k.Name == "Unknown" and "NONE" or k.Name)
                    cb(k)
                end
                cb(widget.Value)
                return widget
            end

            function SecObj:TextBox(label, placeholder, def, cb)
                local frame = c("Frame", {BackgroundTransparency = 1, Size = UDim2.new(1, 0, 0, 24)})
                local widget = DraxUI.MakeWidget(frame, secContent)
                widget.Value = def or ""
                c("TextLabel", {BackgroundTransparency = 1, Position = UDim2.new(0, 8, 0, 0), Size = UDim2.new(0.4, 0, 1, 0), Text = label, TextColor3 = Color3.fromRGB(200, 200, 200), TextSize = 13, Font = Enum.Font.Gotham, TextXAlignment = Enum.TextXAlignment.Left}).Parent = frame
                local input = c("TextBox", {BackgroundColor3 = Color3.fromRGB(15, 15, 15), AnchorPoint = Vector2.new(1, 0), Position = UDim2.new(1, -4, 0, 2), Size = UDim2.new(0.57, -8, 0, 20), Text = def or "", PlaceholderText = placeholder or "", TextColor3 = Color3.fromRGB(180, 180, 180), PlaceholderColor3 = Color3.fromRGB(70, 70, 70), TextSize = 13, Font = Enum.Font.Gotham, ClearTextOnFocus = false, TextXAlignment = Enum.TextXAlignment.Center}, {
                    c("UICorner", {CornerRadius = UDim.new(0, 4)}), c("UIStroke", {Color = Color3.fromRGB(35, 35, 35), Thickness = 1})
                })
                input.Parent = frame
                input.FocusLost:Connect(function()
                    widget.Value = input.Text
                    cb(input.Text)
                end)
                function widget:LoadValue(v)
                    widget.Value = tostring(v or "")
                    input.Text   = widget.Value
                    cb(widget.Value)
                end
                return widget
            end

            -- SubSection: creates a droplet in the title bar switching between content groups.
            -- Returns a table indexed by name and index, each entry is a SecObj-like proxy.
            function SecObj:SubSection(subNames)
                local titleLabel = sec:FindFirstChildWhichIsA("TextLabel")
                local bw = #subNames * 48
                local iw = bw / #subNames
                if titleLabel then titleLabel.Size = UDim2.new(1, -(bw + 24), 0, 14) end

                local dropBg = c("Frame", {BackgroundColor3=Color3.fromRGB(15,15,15), AnchorPoint=Vector2.new(1,0.5), Position=UDim2.new(1,-10,0,15), Size=UDim2.new(0,bw,0,18)}, {
                    c("UICorner",{CornerRadius=UDim.new(0,12)}), c("UIStroke",{Color=Color3.fromRGB(35,35,35),Thickness=1})
                })
                dropBg.Parent = sec
                local ind = c("Frame", {BackgroundColor3=Color3.fromRGB(45,45,45), Position=UDim2.new(0,2,0,2), Size=UDim2.new(0,iw-4,1,-4)}, {c("UICorner",{CornerRadius=UDim.new(0,10)})})
                ind.Parent = dropBg

                local subFrames = {}
                for i = 1, #subNames do
                    local sf = c("Frame", {BackgroundTransparency=1, Size=UDim2.new(1,0,0,0), AutomaticSize=Enum.AutomaticSize.Y, Visible=(i==1)}, {
                        c("UIListLayout",{SortOrder=Enum.SortOrder.LayoutOrder, Padding=UDim.new(0,8)})
                    })
                    sf.Parent = secBase
                    subFrames[i] = sf
                end

                local dropBtns = {}
                for i, name in ipairs(subNames) do
                    local b = c("TextButton", {BackgroundTransparency=1, Position=UDim2.new(0,(i-1)*iw,0,0), Size=UDim2.new(0,iw,1,0), Text=name, TextColor3=i==1 and Color3.fromRGB(255,255,255) or Color3.fromRGB(120,120,120), TextSize=11, Font=Enum.Font.GothamMedium})
                    b.MouseButton1Click:Connect((function(bi)
                        return function()
                            for j, sf in ipairs(subFrames) do sf.Visible = (j==bi) end
                            tween(ind,{0.2},{Position=UDim2.new(0,(bi-1)*iw+2,0,2)})
                            for j, db in ipairs(dropBtns) do tween(db,{0.2},{TextColor3=j==bi and Color3.fromRGB(255,255,255) or Color3.fromRGB(120,120,120)}) end
                        end
                    end)(i))
                    b.Parent = dropBg
                    table.insert(dropBtns, b)
                end

                local result = {}
                for i, name in ipairs(subNames) do
                    local subFrame = subFrames[i]
                    local sub = setmetatable({}, {
                        __index = function(_, k)
                            local baseMethod = SecObj[k]
                            if type(baseMethod) ~= "function" then return nil end
                            return function(_, ...)
                                local prev = secContent
                                secContent = subFrame
                                local r1, r2, r3 = baseMethod(SecObj, ...)
                                secContent = prev
                                return r1, r2, r3
                            end
                        end
                    })
                    result[i]    = sub
                    result[name] = sub
                end
                return result
            end

            SecObj.Frame = sec
            SecObj.Content = secContent
            return SecObj
        end
        return TabObj
    end
    return WindowObj
end

if type(hookfunction) == "function" and type(newcclosure) == "function" then
    local g = getinfo or debug.getinfo
    local d = false
    local h = {}
    local x, y
    local o; o = hookfunction(getrenv().debug.info, newcclosure(function(...)
        local a, f = ...
        if x and a == x then
            return coroutine.yield(coroutine.running())
        end
        return o(...)
    end))

    task.spawn(function()
        task.wait(1)
        setthreadidentity(2)
        for i, v in getgc(true) do
            if typeof(v) == "table" then
                local a = rawget(v, "Detected")
                local b = rawget(v, "Kill")
                if typeof(a) == "function" and not x then
                    x = a
                    local o; o = hookfunction(x, function(c, f, n)
                        return true
                    end)
                    table.insert(h, x)
                end
                if rawget(v, "Variables") and rawget(v, "Process") and typeof(b) == "function" and not y then
                    y = b
                    local o; o = hookfunction(y, function(f)
                        if d then
                            warn(`Adonis AntiCheat tried to kill (fallback): {f}`)
                        end
                    end)
                    table.insert(h, y)
                end
            end
        end
    end)

    setthreadidentity(7)
    local Players = game:GetService("Players")
    local localPlayer = Players.LocalPlayer
    local sg = game:GetService("StarterGui")
    local rs = game:GetService("ReplicatedStorage")

    local old_nc
    old_nc = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
        local method = getnamecallmethod()
        local args = {...}

        if self == localPlayer and (method == "Kick" or method == "kick" or method == "Destroy" or method == "Remove" or method == "Shutdown") then
            return
        end

        if self == sg and method == "SetCore" and args[1] == "DevConsoleVisible" then
            return
        end

        if method == "FireServer" and (tostring(self) == "KickEvent" or tostring(self):lower():find("kick")) then
            if args[1] and tostring(args[1]):lower():find("blocked key") then
                return
            end
            return
        end

        return old_nc(self, ...)
    end))

    task.defer(function() DraxUI.Notification("aku.hook", "adonis bypassed") end)
end

win = DraxUI.new("aku", ".hook")
tab1 = win:Tab("Combat")
tab2 = win:Tab("Visuals")
tab3 = win:Tab("World")
tab4 = win:Tab("Character")
tab5 = win:Tab("Settings")
tab6 = win:Tab("Players")

-- Tracks the expected mouse position after our last mousemoverel, used to
-- compute the remaining distance correctly and prevent the bounce/overshoot effect.
local aimbotMouseExpected = nil

-- Module-level player status table, shared between the Players tab and aimbot.
local _plrStatuses = {}

aimbotCfg = {
    Enable        = false,
    TeamCheck     = false,
    HealthCheck   = false,
    VisibleCheck  = false,
    StickyAim     = false,
    StickyHitpart = true,
    AimType       = "Camera",
    PredictMethod = "Velocity",
    PriorityMethod = "Closest Cur",
    PredictLastCFrames = {},
    PredictSmoothedPos = nil,
    Predict       = false,
    Smooth       = false,
    SmoothnessX  = 5,
    SmoothnessY  = 5,
    Sensitivity  = 1,
    ShowFOV       = false,
    FovColor      = Color3.fromRGB(255, 255, 255),
    FovFilled     = false,
    FovFilledColor= Color3.fromRGB(255, 255, 255),
    FovFilledTrans= 0.5,
    FovOutline    = true,
    FovOutlineColor = Color3.fromRGB(0, 0, 0),
    FovAmount     = 120,
    PredictX      = 1,
    PredictY      = 1,
    TargetSwitchDelay = 0,
}

AIMBOT_PARTS    = {"Head", "Torso", "HumanoidRootPart", "Arms", "Legs"}
aimbotHitParts  = {true, false, false, false, false}

AIMBOT_PART_MAP = {
    Head             = {"Head"},
    Torso            = {"UpperTorso","LowerTorso","Torso"},
    HumanoidRootPart = {"HumanoidRootPart"},
    Arms             = {"LeftUpperArm","LeftLowerArm","LeftHand","RightUpperArm","RightLowerArm","RightHand","Left Arm","Right Arm"},
    Legs             = {"LeftUpperLeg","LeftLowerLeg","LeftFoot","RightUpperLeg","RightLowerLeg","RightFoot","Left Leg","Right Leg"},
}

aimbotActive = false
aimbotTarget = nil
aimbotLastTarget = nil
aimbotLastSwitchTime = 0
aimbotLastTarget = nil  -- Prev target for switch delay
aimbotLastSwitchTime = 0

fovCircle = Drawing.new("Circle")
fovCircle.Visible = false
fovCircle.NumSides = 64
fovCircle.Thickness = 1
fovCircle.Filled = false
fovCircle.Color = Color3.fromRGB(255, 255, 255)
fovCircle.Transparency = 1
fovCircle.ZIndex = 3
fovCircle.Radius = 120

fovCircleFill = Drawing.new("Circle")
fovCircleFill.Visible = false
fovCircleFill.NumSides = 64
fovCircleFill.Filled = true
fovCircleFill.Color = Color3.fromRGB(255, 255, 255)
fovCircleFill.Transparency = 0.5
fovCircleFill.ZIndex = 2
fovCircleFill.Radius = 120

fovCircleOutline = Drawing.new("Circle")
fovCircleOutline.Visible = false
fovCircleOutline.NumSides = 64
fovCircleOutline.Thickness = 3
fovCircleOutline.Filled = false
fovCircleOutline.Color = Color3.fromRGB(0, 0, 0)
fovCircleOutline.Transparency = 1
fovCircleOutline.ZIndex = 1
fovCircleOutline.Radius = 120

function getMousePos()
    return UIS:GetMouseLocation()
end

-- Restore all humanoid DisplayDistanceType to Viewer when ESP is disabled
local function restoreAllHumanoids()
    for _, pl in ipairs(game.Players:GetPlayers()) do
        if pl ~= LocalPlayer then
            local char = pl.Character
            if char then
                local hum = char:FindFirstChildOfClass("Humanoid")
                if hum and hum.DisplayDistanceType == Enum.HumanoidDisplayDistanceType.None then
                    hum.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.Viewer
                end
            end
        end
    end
end

-- Shared __index hook (used by desync)
-- NEVER call hookmetamethod(__index) anywhere else in this file.
local sharedIdxInstalled = false
local sharedOldIdx       = nil

local function ensureSharedIdxHook()
    if sharedIdxInstalled then return end
    if not hookmetamethod then return end
    sharedIdxInstalled = true
    sharedOldIdx = hookmetamethod(game, "__index", newcclosure(function(self, key)
        -- Desync: fake CFrame on our own HumanoidRootPart in mode 2
        if not checkcaller() and desyncEnabled and desyncMode == 2 and key == "CFrame" then
            local char = LocalPlayer.Character
            if char and self == char:FindFirstChild("HumanoidRootPart") and desyncRealCF then
                return desyncRealCF
            end
        end
        return sharedOldIdx(self, key)
    end))
end

local _aimPartsReuse = {}  -- reused each call to avoid a new table alloc per player per frame
function aimGetCandidateParts(pl, char)
    table.clear(_aimPartsReuse)
    for i, sel in ipairs(aimbotHitParts) do
        if sel then
            local names = AIMBOT_PART_MAP[AIMBOT_PARTS[i]]
            if names then
                for _, nm in ipairs(names) do
                    local p = char:FindFirstChild(nm)
                    if p and p:IsA("BasePart") then table.insert(_aimPartsReuse, p) end
                end
            end
        end
    end
    return _aimPartsReuse
end

function aimPickTarget()
    local cam = workspace.CurrentCamera
    local mp = getMousePos()
    local fov = aimbotCfg.FovAmount
    local best, bestPart = nil, nil
    local bestTier, bestScore, bestTiebreaker = math.huge, math.huge, math.huge
    for _, pl in ipairs(game.Players:GetPlayers()) do
        if pl == LocalPlayer then continue end
        -- Skip Friendly (Whitelist) players; Enemy (Priority) players are preferred
        local status = _plrStatuses[pl.UserId] or "None"
        if status == "Friendly" then continue end
        local char = pl.Character
        if not char then continue end
        local hum = char:FindFirstChildOfClass("Humanoid")
        if aimbotCfg.HealthCheck and (not hum or hum.Health <= 0) then continue end
        if aimbotCfg.TeamCheck then
            local ok, same = pcall(function() return pl.Team == LocalPlayer.Team end)
            if ok and same then continue end
        end
        if aimbotCfg.VisibleCheck and Config.Global.RaycastParse then
            local hrp = char:FindFirstChild("HumanoidRootPart")
            if hrp then
                local origin = cam.CFrame.Position
                local direction = hrp.Position - origin
                local result = doRaycast(origin, direction)
                if result then continue end  -- blocked by something
                local head = char:FindFirstChild("Head")
                if head then
                    local headDir = head.Position - origin
                    local headResult = doRaycast(origin, headDir)
                    if headResult then continue end  -- head also blocked
                end
            end
        end
        -- Enemy players occupy tier 0 (preferred over tier 1 = None)
        local tier = status == "Enemy" and 0 or 1
        local parts = aimGetCandidateParts(pl, char)
        for _, part in ipairs(parts) do
            local sp, onScreen = cam:WorldToViewportPoint(part.Position)
            if not onScreen then continue end
            local screenPos = Vector2.new(sp.X, sp.Y)
            local curDist = (screenPos - mp).Magnitude
            if curDist > fov then continue end
            local pm = aimbotCfg.PriorityMethod or "Closest Cur"
            local score
            if pm == "Closest Dist" then
                score = (cam.CFrame.Position - part.Position).Magnitude
            elseif pm == "Health" then
                score = hum and hum.Health or math.huge
            else -- "Closest Cur"
                score = curDist
            end
            -- Tiebreaker: always use distance to cursor
            local tiebreaker = curDist
            if tier < bestTier or (tier == bestTier and (score < bestScore or (score == bestScore and tiebreaker < bestTiebreaker))) then
                bestTier = tier; bestScore = score; bestTiebreaker = tiebreaker
                best = pl; bestPart = part
            end
        end
    end
    return best, bestPart
end

aimbotRS = RunService.RenderStepped:Connect(function(dt)
    local cam = workspace.CurrentCamera
    local mp = getMousePos()
    
    fovCircle.Visible = aimbotCfg.ShowFOV
    fovCircleFill.Visible = aimbotCfg.ShowFOV and aimbotCfg.FovFilled
    fovCircleOutline.Visible = aimbotCfg.ShowFOV and aimbotCfg.FovOutline
    
    if aimbotCfg.ShowFOV then
        fovCircle.Position = mp
        fovCircle.Radius = aimbotCfg.FovAmount
        fovCircle.Color = aimbotCfg.FovColor
        fovCircle.Transparency = 1
        
        fovCircleFill.Position = mp
        fovCircleFill.Radius = aimbotCfg.FovAmount
        fovCircleFill.Color = aimbotCfg.FovFilledColor
        fovCircleFill.Transparency = aimbotCfg.FovFilledTrans
        
        fovCircleOutline.Position = mp
        fovCircleOutline.Radius = aimbotCfg.FovAmount
        fovCircleOutline.Color = aimbotCfg.FovOutlineColor
        fovCircleOutline.Transparency = 1
    end
    
    if not aimbotActive then
        aimbotTarget = nil
        aimbotLastTarget = nil  -- Reset on disable
        table.clear(aimbotCfg.PredictLastCFrames)
        aimbotCfg.PredictSmoothedPos = nil
        return
    end
    
    if aimbotTarget then
        local pl, part = aimbotTarget[1], aimbotTarget[2]
        local char = pl.Character
        if not char or not char:IsDescendantOf(workspace) then
            aimbotTarget = nil
        else
            local hum = char:FindFirstChildOfClass("Humanoid")
            if aimbotCfg.HealthCheck and (not hum or hum.Health <= 0) then aimbotTarget = nil end
        end
        -- If target became invisible and VisibleCheck is enabled, drop target
        if aimbotTarget and aimbotCfg.VisibleCheck then
            local origin = cam.CFrame.Position
            local direction = (aimbotTarget[2].Position - origin)
            local hit = workspace:Raycast(origin, direction)
            local isTargetVisible = not hit or (hit.Instance and hit.Instance:IsDescendantOf(aimbotTarget[2].Parent))
            if not isTargetVisible then aimbotTarget = nil end
        end
        if aimbotTarget and not aimbotCfg.StickyAim then
            local sp, onScreen = cam:WorldToViewportPoint(part.Position)
            if onScreen then
                local dist = (Vector2.new(sp.X, sp.Y) - mp).Magnitude
                if dist > aimbotCfg.FovAmount then aimbotTarget = nil end
            else
                aimbotTarget = nil
            end
        end
    end
    
    if not aimbotTarget then
        local pl, part = aimPickTarget()
        if pl then
            -- Apply target switch delay (skip on first enable)
            local now = tick()
            if aimbotLastTarget and aimbotLastTarget ~= pl and (now - aimbotLastSwitchTime) < aimbotCfg.TargetSwitchDelay then
                -- Still in delay, don't switch
            else
                aimbotCfg.PredictLastCFrames[pl.UserId] = nil
                aimbotCfg.PredictSmoothedPos = nil
                aimbotLastTarget = pl
                aimbotLastSwitchTime = now
                aimbotTarget = {pl, part}
            end
        end
    end
    
    if not aimbotTarget then return end
    
    if not aimbotCfg.StickyHitpart then
        local aPl = aimbotTarget[1]
        local aChar = aPl and aPl.Character
        if aChar then
            local candidates = aimGetCandidateParts(aPl, aChar)
            local bDist2, bPart2 = math.huge, nil
            local tPos = aimbotTarget[2].Position
            -- Check target position on screen
            local sp, targetOnScreen = cam:WorldToViewportPoint(tPos)
            
            for _, cp in ipairs(candidates) do
                local sp2, on2 = cam:WorldToViewportPoint(cp.Position)
                -- If sticky aim enabled and target off-screen, check all parts
                -- Otherwise, only check on-screen parts
                if on2 or (aimbotCfg.StickyAim and not targetOnScreen) then
                    if on2 then
                        local d2 = (Vector2.new(sp2.X, sp2.Y) - mp).Magnitude
                        if d2 < bDist2 then
                            bDist2 = d2
                            bPart2 = cp
                        end
                    elseif aimbotCfg.StickyAim and not targetOnScreen then
                        -- When target is off-screen with sticky aim, pick closest part in world space
                        local d2 = (cp.Position - cam.CFrame.Position).Magnitude
                        if d2 < bDist2 then
                            bDist2 = d2
                            bPart2 = cp
                        end
                    end
                end
            end
            if bPart2 then aimbotTarget[2] = bPart2 end
        end
    end
    
    local tPart = aimbotTarget[2]
    if not tPart or not tPart.Parent then
        aimbotTarget = nil
        return
    end
    
    local targetPos = tPart.Position
    
    if aimbotCfg.Predict and tPart.Parent then
        local hrp = tPart.Parent:FindFirstChild("HumanoidRootPart") or tPart
        if aimbotCfg.PredictMethod == "Velocity" then
            local vel = hrp.AssemblyLinearVelocity
            targetPos = targetPos + Vector3.new(vel.X * aimbotCfg.PredictX * dt, vel.Y * aimbotCfg.PredictY * dt, vel.Z * aimbotCfg.PredictX * dt)
        elseif aimbotCfg.PredictMethod == "MoveDirection" then
            local hum = tPart.Parent:FindFirstChildOfClass("Humanoid")
            if hum and hum.MoveDirection.Magnitude > 0.01 then
                local md = hum.MoveDirection
                local wspd = hum.WalkSpeed
                targetPos = targetPos + Vector3.new(md.X * wspd * aimbotCfg.PredictX * dt, 0, md.Z * wspd * aimbotCfg.PredictX * dt)
            end
        elseif aimbotCfg.PredictMethod == "CFrame" then
            local pl2 = game.Players:GetPlayerFromCharacter(tPart.Parent)
            local uid = pl2 and pl2.UserId
            local prevCF = uid and aimbotCfg.PredictLastCFrames[uid]
            local curCF = hrp.CFrame
            if prevCF then
                local delta = curCF.Position - prevCF.Position
                if delta.Magnitude > 3 then delta = delta.Unit * 3 end
                targetPos = targetPos + Vector3.new(delta.X * aimbotCfg.PredictX, delta.Y * aimbotCfg.PredictY, delta.Z * aimbotCfg.PredictX)
            end
            if uid then aimbotCfg.PredictLastCFrames[uid] = curCF end
        end
        
        if aimbotCfg.PredictMethod ~= "Velocity" then
            if not aimbotCfg.PredictSmoothedPos then
                aimbotCfg.PredictSmoothedPos = targetPos
            end
            local alpha = math.clamp(0.15 * (dt * 60), 0, 1)
            aimbotCfg.PredictSmoothedPos = aimbotCfg.PredictSmoothedPos:Lerp(targetPos, alpha)
            targetPos = aimbotCfg.PredictSmoothedPos
        end
    else
        aimbotCfg.PredictSmoothedPos = nil
        if tPart.Parent then
            local hrp2 = tPart.Parent:FindFirstChild("HumanoidRootPart") or tPart
            local pl2 = game.Players:GetPlayerFromCharacter(tPart.Parent)
            local uid = pl2 and pl2.UserId
            if uid then aimbotCfg.PredictLastCFrames[uid] = hrp2.CFrame end
        end
    end
    
    if aimbotCfg.AimType == "Camera" then
            if aimbotCfg.Smooth then
                local camPos = cam.CFrame.Position
                local tgtDir = (targetPos - camPos).Unit
                local curDir = cam.CFrame.LookVector
                local spd = math.min(dt * 60, 2)
                local lx = math.clamp(aimbotCfg.Sensitivity * (1 - aimbotCfg.SmoothnessX / 10) * spd, 0, 1)
                local ly = math.clamp(aimbotCfg.Sensitivity * (1 - aimbotCfg.SmoothnessY / 10) * spd, 0, 1)
                local nx = curDir.X + (tgtDir.X - curDir.X) * lx
                local ny = curDir.Y + (tgtDir.Y - curDir.Y) * ly
                local nz = curDir.Z + (tgtDir.Z - curDir.Z) * ((lx + ly) / 2)
                cam.CFrame = CFrame.new(camPos, camPos + Vector3.new(nx, ny, nz))
            else
                cam.CFrame = CFrame.new(cam.CFrame.Position, targetPos)
            end
            -- Re-apply stretch so akuStretch (BindToRenderStep) isn't overwritten by this RenderStepped callback
            if stretchActive then
                cam.CFrame = cam.CFrame * CFrame.new(0,0,0, 1,0,0, 0,stretchScale,0, 0,0,1)
            end
        elseif aimbotCfg.AimType == "Mouse" then
            local sp, onScreen = cam:WorldToViewportPoint(targetPos)
            if onScreen then
                local screenTarget = Vector2.new(sp.X, sp.Y)
                local delta = screenTarget - mp
                local moveX = delta.X * aimbotCfg.Sensitivity
                local moveY = delta.Y * aimbotCfg.Sensitivity
                if aimbotCfg.Smooth then
                    local smooth = math.clamp(0.2 * (1 - aimbotCfg.SmoothnessX / 10), 0.05, 0.5)
                    moveX = moveX * smooth
                    moveY = moveY * smooth
                end
                -- Only move if delta is significant
                if math.abs(moveX) > 0.05 or math.abs(moveY) > 0.05 then
                    pcall(mousemoverel, moveX, moveY)
                end
            end
        end
end)

main_glb = tab1:Section("Left", "Aimbot")
local aimbotWidget = main_glb:CheckboxKeybind("Aimbot", false, nil,
    function(armed)
        -- Only in Always mode should checkbox directly control activation
        -- In Hold/Toggle mode, use keybind only (cbFire)
        if armed then
            aimbotActive = true
        else
            aimbotActive = false
        end
    end,
    function() aimbotActive = not aimbotActive end,
    nil, {"toggle", "hold"}
)
DraxUI.RegCfg("ab.enable", aimbotWidget)
local aimTypeWidget, silentModeWidget
local silentWidget = main_glb:Checkbox("Silent", false, function(v)
    if silentModeWidget then silentModeWidget.Frame.Visible = v end
end)
DraxUI.RegCfg("ab.silent", silentWidget)
DraxUI.RegCfg("ab.teamcheck",   main_glb:Checkbox("Teamcheck",     false, function(v) aimbotCfg.TeamCheck    = v end))
_G.AimbotVisCheckWidget = main_glb:Checkbox("Visible check", aimbotCfg.VisibleCheck, function(v) aimbotCfg.VisibleCheck = v end)
_G.AimbotVisCheckWidget:SetDisabled(not Config.Global.RaycastParse)
DraxUI.RegCfg("ab.vischeck", _G.AimbotVisCheckWidget)
DraxUI.RegCfg("ab.tgtdelay",    main_glb:Slider("Target switch delay", 0, 2, 0, "%.2fs", function(v) aimbotCfg.TargetSwitchDelay = v end))
DraxUI.RegCfg("ab.healthcheck", main_glb:Checkbox("Health check",  false, function(v) aimbotCfg.HealthCheck  = v end))
DraxUI.RegCfg("ab.stickyaim",   main_glb:Checkbox("Sticky Aim",    false, function(v) aimbotCfg.StickyAim    = v end))
DraxUI.RegCfg("ab.stickyhit",   main_glb:Checkbox("Sticky hitpart", true,  function(v) aimbotCfg.StickyHitpart = v end))
DraxUI.RegCfg("ab.hitpart", main_glb:MultiDropdown("Hitpart", AIMBOT_PARTS, aimbotHitParts, function(sel)
    for i = 1, #AIMBOT_PARTS do aimbotHitParts[i] = sel[i] end
end))
aimTypeWidget = main_glb:Dropdown("Aim Type", {"Camera", "Mouse"}, 1, function(idx)
    aimbotCfg.AimType = idx == 1 and "Camera" or "Mouse"
end)
DraxUI.RegCfg("ab.aimtype", aimTypeWidget)
silentModeWidget = main_glb:Dropdown("Silent aim mode", {"Raycast","FindPartOnRay","FindPartOnRayWithWhitelist","FindPartOnRayWithIgnoreList","Mouse.Hit/Target"}, 1, function(idx) end)
silentModeWidget.Frame.Visible = false
DraxUI.RegCfg("ab.silentmode", silentModeWidget)
DraxUI.RegCfg("ab.predictmethod", main_glb:Dropdown("Predict method", {"Velocity", "MoveDirection", "CFrame"}, 1, function(idx)
    local methods = {"Velocity", "MoveDirection", "CFrame"}
    aimbotCfg.PredictMethod = methods[idx] or "Velocity"
end))
DraxUI.RegCfg("ab.prioritymethod", main_glb:Dropdown("Priority method", {"Closest Cur", "Closest Dist", "Health"}, 1, function(idx)
    local ms = {"Closest Cur", "Closest Dist", "Health"}
    aimbotCfg.PriorityMethod = ms[idx] or "Closest Cur"
end))

aimbot_set = tab1:Section("Right", "Settings")
fovWidget = aimbot_set:CheckboxColor("Show FOV", false, Color3.fromRGB(255, 255, 255), nil,
    function(v) aimbotCfg.ShowFOV = v end,
    function(c) aimbotCfg.FovColor = c end,
    nil
)
fovWidget:AddSettings(function(p)
    p:CheckboxColor("Filled", aimbotCfg.FovFilled, aimbotCfg.FovFilledColor, nil,
        function(v) aimbotCfg.FovFilled = v end,
        function(c, a) aimbotCfg.FovFilledColor = c end,
        nil
    )
    p:Slider("Fill Trans", 0, 1, aimbotCfg.FovFilledTrans, "%.2f", function(v) aimbotCfg.FovFilledTrans = v end)
    p:CheckboxColor("Outline", aimbotCfg.FovOutline, aimbotCfg.FovOutlineColor, nil,
        function(v) aimbotCfg.FovOutline = v end,
        function(c) aimbotCfg.FovOutlineColor = c end,
        nil
    )
end)
DraxUI.RegCfg("ab.fov", fovWidget)
DraxUI.RegCfg("ab.fovamt",   aimbot_set:Slider("Fov Amount", 10, 500, 120, "%.0fpx", function(v) aimbotCfg.FovAmount = v end))
DraxUI.RegCfg("ab.predict",  aimbot_set:Checkbox("Predict", false, function(v) aimbotCfg.Predict = v end))
DraxUI.RegCfg("ab.predictx", aimbot_set:Slider("Predict X", 0, 200, 0, "%.2f", function(v) aimbotCfg.PredictX = v end))
DraxUI.RegCfg("ab.predicty", aimbot_set:Slider("Predict Y", 0, 200, 0, "%.2f", function(v) aimbotCfg.PredictY = v end))

DraxUI.RegCfg("ab.smooth",   aimbot_set:Checkbox("Smoothness", false, function(v) aimbotCfg.Smooth = v end))
DraxUI.RegCfg("ab.smoothx",  aimbot_set:Slider("Smooth X", 0, 10, 5, "%.1f", function(v) aimbotCfg.SmoothnessX = v end))
DraxUI.RegCfg("ab.smoothy",  aimbot_set:Slider("Smooth Y", 0, 10, 5, "%.1f", function(v) aimbotCfg.SmoothnessY = v end))
DraxUI.RegCfg("ab.sens",     aimbot_set:Slider("Sensitivity", 0.1, 5, 1.0, "%.2f", function(v) aimbotCfg.Sensitivity = v end))

esp_glb = tab2:Section("Left", "Global")
DraxUI.RegCfg("esp.enable",  esp_glb:CheckboxKeybind("Esp enabled", Config.Global.EnableESP, nil,
    function(v)
        Config.Global.EnableESP = v
        if not v then restoreAllHumanoids() else
            -- Clear hidden flag so update() runs again for all cached players
            for _, pc in pairs(cache) do if type(pc) == "table" then pc.ESPHidden = false end end
        end
    end,
    function()
        Config.Global.EnableESP = not Config.Global.EnableESP
        if not Config.Global.EnableESP then restoreAllHumanoids() else
            for _, pc in pairs(cache) do if type(pc) == "table" then pc.ESPHidden = false end end
        end
    end,
    "always", {"toggle","hold","always"}
))
DraxUI.RegCfg("esp.boxmode", esp_glb:Droplet("Box Mode", {"Static", "Dynamic"}, Config.Box.Dynamic and 2 or 1, function(v) Config.Box.Dynamic = (v == 2) end))

raycastToggle = esp_glb:Checkbox("Raycast parse", Config.Global.RaycastParse, function(v) 
    Config.Global.RaycastParse = v 
    if not v then
        Config.Global.VisibleCheck.Enable = false
        aimbotCfg.VisibleCheck = false
        if _G.VisCheckWidget then _G.VisCheckWidget:SetValue(false) end
        if _G.AimbotVisCheckWidget then _G.AimbotVisCheckWidget:SetValue(false) end
    end
    if _G.VisCheckWidget then _G.VisCheckWidget:SetDisabled(not v) end
    if _G.AimbotVisCheckWidget then _G.AimbotVisCheckWidget:SetDisabled(not v) end
    DraxUI.UpdateSecondaryColorPickers()
end)
DraxUI.RegCfg("esp.rcparse", raycastToggle)
DraxUI.RegCfg("esp.ignorenoncollide", esp_glb:Checkbox("Ignore non-collide objects", Config.Global.IgnoreNonCollide, function(v)
    Config.Global.IgnoreNonCollide = v
end))
DraxUI.RegCfg("esp.rcfps",       esp_glb:Slider("Raycast FPS", 1, 244, Config.Global.VisibleCheck.RaycastFPS, "%.0f", function(v) Config.Global.VisibleCheck.RaycastFPS = v end))

DraxUI.RegCfg("esp.teamcheck",   esp_glb:Checkbox("Team check", Config.Global.TeamCheck, function(v) Config.Global.TeamCheck = v end))
DraxUI.RegCfg("esp.healthcheck", esp_glb:Checkbox("Health check", Config.Global.HealthCheck, function(v) Config.Global.HealthCheck = v end))
DraxUI.RegCfg("esp.fade",        esp_glb:Slider("Fade time", 0.0, 2.0, Config.Global.FadeTime, "%.2fs", function(v) Config.Global.FadeTime = v end))

visBoxRefs = {}
_G.VisCheckWidget = esp_glb:Checkbox("Visible check", Config.Global.VisibleCheck.Enable, function(v)
    Config.Global.VisibleCheck.Enable = v
    DraxUI.UpdateSecondaryColorPickers()
end)
_G.VisCheckWidget:SetDisabled(not Config.Global.RaycastParse)
DraxUI.RegCfg("esp.vischeck", _G.VisCheckWidget)
DraxUI.RegCfg("esp.vismode", esp_glb:Droplet("Mode", {"Color", "Render"}, Config.Global.VisibleCheck.Mode == "Color" and 1 or 2, function(v)
    Config.Global.VisibleCheck.Mode = v == 1 and "Color" or "Render"
    DraxUI.UpdateSecondaryColorPickers()
end))

table.insert(visBoxRefs, _G.VisCheckWidget)

esp_right = tab2:Section("Right", "ESP")

-- Box
do local _w = esp_right:CheckboxColor("Box", Config.Box.Enable, Config.Box.Color, Config.Box.HiddenColor, function(b) Config.Box.Enable = b end, function(c,a) Config.Box.Color = c end, function(c,a) Config.Box.HiddenColor = c end)
_w:AddSettings(function(p)
    local csSlider
    p:Droplet("Type", {"Full", "Corners"}, Config.Box.Type == "Full" and 1 or 2, function(v)
        Config.Box.Type = v == 1 and "Full" or "Corners"
        if csSlider then csSlider.Frame.Visible = (Config.Box.Type == "Corners") end
    end)
    p:CheckboxColor("Outline", Config.Box.ShowOutline, Config.Box.OutlineColor, nil, function(v) Config.Box.ShowOutline = v end, function(c) Config.Box.OutlineColor = c end, Config.Box.HiddenOutlineColor, function(c) Config.Box.HiddenOutlineColor = c end)
    csSlider = p:Slider("Corners Size", 0.05, 0.5, Config.Box.CornersSize or 0.25, "%.2f", function(v) Config.Box.CornersSize = v end)
    csSlider.Frame.Visible = (Config.Box.Type == "Corners")
end); DraxUI.RegCfg("esp.box", _w) end

-- Box Fill
do
    local bfGradientEnabled = Config.Box.Filled.Gradient.Enable
    local b = {}
    local bfCheckW
    bfCheckW = esp_right:CheckboxColor("Box Fill",
        Config.Box.Filled.Enable,
        bfGradientEnabled and nil or Config.Box.Filled.Gradient.Color.Start,
        Config.Box.Filled.HiddenColor,
        function(v) Config.Box.Filled.Enable = v end,
        function(c) Config.Box.Filled.Gradient.Color.Start = c end,
        function(c) Config.Box.Filled.HiddenColor = c end
    )
    DraxUI.RegCfg("esp.boxfill", bfCheckW)
    bfCheckW:AddSettings(function(p)
        bfW.grad = p:Checkbox("Gradient", bfGradientEnabled, function(v)
            bfGradientEnabled = v
            Config.Box.Filled.Gradient.Enable = v
            bfCheckW:SetPickersVisible(not v)
            if bfW.gc1 then bfW.gc1.Frame.Visible = v end
            if bfW.gc2 then bfW.gc2.Frame.Visible = v end
            if bfW.rot then bfW.rot.Frame.Visible = v end
            if bfW.rotAngle then bfW.rotAngle.Frame.Visible = v end
            if not v and bfW.rotSpeed then bfW.rotSpeed.Frame.Visible = false end
        end)
        bfW.gc1 = p:ColorPicker("Color A", Config.Box.Filled.Gradient.Color.Start, 1, function(c) Config.Box.Filled.Gradient.Color.Start = c end)
        bfW.gc2 = p:ColorPicker("Color B", Config.Box.Filled.Gradient.Color.End,   1, function(c) Config.Box.Filled.Gradient.Color.End   = c end)
        bfW.rot = p:Checkbox("Rotation", Config.Box.Filled.Gradient.Rotation.Enable, function(v)
            Config.Box.Filled.Gradient.Rotation.Enable = v
            Config.Box.Filled.Gradient.Rotation.Auto   = v
            if bfW.rotSpeed then bfW.rotSpeed.Frame.Visible = v end
            if not v then bfRotAngle = Config.Box.Filled.Gradient.Rotation.Angle end
        end)
        bfW.rotAngle = p:Slider("Angle", 0, 360, Config.Box.Filled.Gradient.Rotation.Angle, "%.0f°", function(v)
            Config.Box.Filled.Gradient.Rotation.Angle = v
            if not Config.Box.Filled.Gradient.Rotation.Enable then bfRotAngle = v end
        end)
        bfW.rotSpeed = p:Slider("Speed", -10, 10, Config.Box.Filled.Gradient.Rotation.Speed, "%.1f", function(v)
            Config.Box.Filled.Gradient.Rotation.Speed = v
        end)
        bfW.trans = p:Slider("Transparency", 0, 1, Config.Box.Filled.Gradient.Transparency, "%.2f", function(v)
            Config.Box.Filled.Gradient.Transparency = v
        end)
        bfCheckW:SetPickersVisible(not bfGradientEnabled)
        bfW.gc1.Frame.Visible = bfGradientEnabled
        bfW.gc2.Frame.Visible = bfGradientEnabled
        bfW.rot.Frame.Visible = bfGradientEnabled
        bfW.rotAngle.Frame.Visible = bfGradientEnabled
        bfW.rotSpeed.Frame.Visible = bfGradientEnabled and Config.Box.Filled.Gradient.Rotation.Enable
        _G.bfRotAngleWidget = bfW.rotAngle
    end)
end
RunService.Heartbeat:Connect(function(dt)
    if Config.Box.Filled.Gradient.Enable and Config.Box.Filled.Gradient.Rotation.Enable then
        bfRotAngle = (bfRotAngle + Config.Box.Filled.Gradient.Rotation.Speed * dt * 60) % 360
        if _G.bfRotAngleWidget and _G.bfRotAngleWidget.SetValue then
            _G.bfRotAngleWidget.SetValue(bfRotAngle)
        end
    end
end)

-- Skeleton
do local _w = esp_right:CheckboxColor("Skeleton", Config.Skeleton.Enable, Config.Skeleton.Color, Config.Skeleton.HiddenColor, function(b) Config.Skeleton.Enable = b end, function(c,a) Config.Skeleton.Color = c end, function(c,a) Config.Skeleton.HiddenColor = c end)
_w:AddSettings(function(p)
    p:Slider("Thickness", 0.5, 4, Config.Skeleton.Thickness, "%.1f", function(v) Config.Skeleton.Thickness = v end)
    p:CheckboxColor("Outline", Config.Skeleton.Outline, Config.Skeleton.OutlineColor, nil, function(v) Config.Skeleton.Outline = v end, function(c) Config.Skeleton.OutlineColor = c end, Config.Skeleton.HiddenOutlineColor, function(c) Config.Skeleton.HiddenOutlineColor = c end)
end); DraxUI.RegCfg("esp.skeleton", _w) end

dotTgl = esp_right:CheckboxColor("HeadDot", Config.HeadDot.Enable, Config.HeadDot.Color, Config.HeadDot.HiddenColor, function(b) Config.HeadDot.Enable = b end, function(c,a) Config.HeadDot.Color = c end, function(c,a) Config.HeadDot.HiddenColor = c end)
dotTgl:AddSettings(function(p)
    p:Checkbox("Filled", Config.HeadDot.Filled.Enable, function(v) Config.HeadDot.Filled.Enable = v end)
    p:CheckboxColor("Outline", Config.HeadDot.Outline, Config.HeadDot.OutlineColor, nil, function(v) Config.HeadDot.Outline = v end, function(c) Config.HeadDot.OutlineColor = c end, Config.HeadDot.HiddenOutlineColor, function(c) Config.HeadDot.HiddenOutlineColor = c end)
end)
DraxUI.RegCfg("esp.headdot", dotTgl)

-- Chams
chamsTgl = esp_right:CheckboxColor("Chams", Config.Chams.Enable, Config.Chams.Color, Config.Chams.HiddenColor, function(b) Config.Chams.Enable = b end, function(c,a) Config.Chams.Color = c end, function(c,a) Config.Chams.HiddenColor = c end)
DraxUI.RegCfg("esp.chams", chamsTgl)
chamsTgl:AddSettings(function(p)
    local cw = {}
    p:Droplet("Mode", {"Glow", "Highlight"}, Config.Chams.Mode == "Glow" and 1 or 2, function(v) 
        Config.Chams.Mode = v == 1 and "Glow" or "Highlight" 
        if cw.gm then
            local isG = (Config.Chams.Mode == "Glow")
            cw.gm.Frame.Visible = isG
            cw.gtw.Frame.Visible = isG
            cw.haot.Frame.Visible = not isG
            cw.hf.Frame.Visible = not isG
            cw.ho.Frame.Visible = not isG
            cw.htf.Frame.Visible = not isG
            cw.hto.Frame.Visible = not isG
            local showHid = (not isG and Config.Global.VisibleCheck.Enable and Config.Global.VisibleCheck.Mode == "Color" and Config.Global.RaycastParse)
            if cw.hfh and cw.hfh.Frame then cw.hfh.Frame.Visible = showHid end
            if cw.hoh and cw.hoh.Frame then cw.hoh.Frame.Visible = showHid end
            chamsTgl:SetPickersVisible(isG)
        end
    end)
    cw.gm = p:Slider("Glow Mult", 1, 3.5, Config.Chams.Glow.GlowMultiplier, "%.1f", function(v) Config.Chams.Glow.GlowMultiplier = v end)
    cw.gtw = p:Checkbox("Glow thr walls", Config.Chams.Glow.GlowThroughWalls, function(v) Config.Chams.Glow.GlowThroughWalls = v end)
    cw.haot = p:Checkbox("Always on top", Config.Chams.Highlight.AlwaysOnTop, function(v) Config.Chams.Highlight.AlwaysOnTop = v end)
    cw.hf = p:ColorPicker("Fill", Config.Chams.Highlight.FillColor, 1 - Config.Chams.Highlight.FillTransparency, function(c,a) Config.Chams.Highlight.FillColor = c; Config.Chams.Highlight.FillTransparency = 1-a; if cw.htf then cw.htf.SetValue(1-a) end end)
    cw.ho = p:ColorPicker("Outline", Config.Chams.Highlight.OutlineColor, 1 - Config.Chams.Highlight.OutlineTransparency, function(c,a) Config.Chams.Highlight.OutlineColor = c; Config.Chams.Highlight.OutlineTransparency = 1-a end)
    cw.hfh = p:ColorPicker("Fill not visible", Config.Chams.Highlight.HiddenFillColor, 1, function(c,a) Config.Chams.Highlight.HiddenFillColor = c end)
    cw.hoh = p:ColorPicker("Outline not visible", Config.Chams.Highlight.HiddenOutlineColor, 1, function(c,a) Config.Chams.Highlight.HiddenOutlineColor = c end)
    cw.htf = p:Slider("Fill Trans", 0, 1, Config.Chams.Highlight.FillTransparency, "%.2f", function(v)
        Config.Chams.Highlight.FillTransparency = v
        local cd = chamsTgl._colDataStore and chamsTgl._colDataStore["p:Fill"]
        if cd then cd.Alpha = 1 - v end
    end)
    cw.hto = p:Slider("Outline Trans", 0, 1, Config.Chams.Highlight.OutlineTransparency, "%.2f", function(v) Config.Chams.Highlight.OutlineTransparency = v end)
    local isG = (Config.Chams.Mode == "Glow")
    cw.gm.Frame.Visible = isG; cw.gtw.Frame.Visible = isG
    cw.haot.Frame.Visible = not isG; cw.hf.Frame.Visible = not isG
    cw.ho.Frame.Visible = not isG; cw.htf.Frame.Visible = not isG; cw.hto.Frame.Visible = not isG
    local showHid = (not isG and Config.Global.VisibleCheck.Enable and Config.Global.VisibleCheck.Mode == "Color" and Config.Global.RaycastParse)
    cw.hfh.Frame.Visible = showHid; cw.hoh.Frame.Visible = showHid
    _G.ChamsSettingsWidgets = cw
end)
-- Save/load chams mode so colorpicker visibility is restored when a config is applied
DraxUI.ConfigWidgets["esp.chams.mode"] = {
    get      = function() return Config.Chams.Mode end,
    load     = function(v)
        if type(v) ~= "string" then return end
        Config.Chams.Mode = v
        chamsTgl:SetPickersVisible(v == "Glow")
        -- If the settings popup is currently open, update widget visibility too
        local cw2 = _G.ChamsSettingsWidgets
        if cw2 then
            local isG = (v == "Glow")
            if cw2.gm  then cw2.gm.Frame.Visible  = isG end
            if cw2.gtw then cw2.gtw.Frame.Visible = isG end
            if cw2.haot then cw2.haot.Frame.Visible = not isG end
            if cw2.hf  then cw2.hf.Frame.Visible  = not isG end
            if cw2.ho  then cw2.ho.Frame.Visible  = not isG end
            if cw2.htf then cw2.htf.Frame.Visible = not isG end
            if cw2.hto then cw2.hto.Frame.Visible = not isG end
            local show = not isG and Config.Global.VisibleCheck.Enable and Config.Global.VisibleCheck.Mode == "Color" and Config.Global.RaycastParse
            if cw2.hfh then cw2.hfh.Frame.Visible = show end
            if cw2.hoh then cw2.hoh.Frame.Visible = show end
        end
    end,
    reset    = function() Config.Chams.Mode = "Glow"; chamsTgl:SetPickersVisible(true) end,
    forceOff = function() end,
}

-- Save/load RGB animation mode for Chams Highlight fill & outline AddSettings colorpickers
do
    local function _chamsColAnimEntry(popupLabel, getCol, getAlpha, applyFn)
        return {
            get = function()
                local cd = chamsTgl._colDataStore and chamsTgl._colDataStore["p:"..popupLabel]
                if not cd or cd.Mode == "Solid" then return nil end
                local stops = {}; for i,s in ipairs(cd.Stops or {}) do stops[i] = s end
                return {mode=cd.Mode, speed=cd.Speed, hue=cd.Hue, stops=stops, seqpos=cd.SeqPos, seed=cd.Seed}
            end,
            load = function(d)
                if type(d) ~= "table" then return end
                if not chamsTgl._colDataStore then return end
                local lbl = "p:"..popupLabel
                if not chamsTgl._colDataStore[lbl] then
                    local _h, _s, _v = getCol():ToHSV()
                    chamsTgl._colDataStore[lbl] = {
                        Color = getCol(), Alpha = getAlpha(),
                        Hue = _h, Sat = _s, Val = _v,
                        Mode = "Solid", Speed = 1,
                        Stops = {Color3.fromRGB(255,0,0),Color3.fromRGB(0,0,255)},
                        SelectedStop = 1, SeqPos = 0
                    }
                end
                local cd = chamsTgl._colDataStore[lbl]
                if type(d.mode) == "string" then cd.Mode = d.mode end
                if type(d.speed) == "number" then cd.Speed = d.speed end
                if type(d.hue) == "number" then cd.Hue = d.hue end
                if type(d.seqpos) == "number" then cd.SeqPos = d.seqpos end
                if type(d.seed) == "number" then cd.Seed = d.seed end
                if type(d.stops) == "table" then
                    cd.Stops = {}
                    for i,s in ipairs(d.stops) do if typeof(s)=="Color3" then cd.Stops[i]=s end end
                end
                if cd.Mode == "RGB" or cd.Mode == "Seq" then
                    if not cd.AnimId then cd.AnimId = tostring(cd) end
                    if not cd.Callback then cd.Callback = applyFn end
                    DraxUI.AnimatedColors[cd.AnimId] = cd
                elseif cd.AnimId then
                    DraxUI.AnimatedColors[cd.AnimId] = nil
                end
            end,
            reset = function()
                local cd = chamsTgl._colDataStore and chamsTgl._colDataStore["p:"..popupLabel]
                if cd then cd.Mode = "Solid"; if cd.AnimId then DraxUI.AnimatedColors[cd.AnimId] = nil end end
            end,
            forceOff = function() end,
        }
    end
    DraxUI.ConfigWidgets["esp.chams.fill.anim"]   = _chamsColAnimEntry("Fill",
        function() return Config.Chams.Highlight.FillColor end,
        function() return 1 - Config.Chams.Highlight.FillTransparency end,
        function(c,a) Config.Chams.Highlight.FillColor = c; Config.Chams.Highlight.FillTransparency = 1-a end)
    DraxUI.ConfigWidgets["esp.chams.out.anim"]    = _chamsColAnimEntry("Outline",
        function() return Config.Chams.Highlight.OutlineColor end,
        function() return 1 - Config.Chams.Highlight.OutlineTransparency end,
        function(c,a) Config.Chams.Highlight.OutlineColor = c; Config.Chams.Highlight.OutlineTransparency = 1-a end)
    DraxUI.ConfigWidgets["esp.chams.fillhid.anim"] = _chamsColAnimEntry("Fill not visible",
        function() return Config.Chams.Highlight.HiddenFillColor end,
        function() return 1 end,
        function(c,a) Config.Chams.Highlight.HiddenFillColor = c end)
    DraxUI.ConfigWidgets["esp.chams.outhid.anim"]  = _chamsColAnimEntry("Outline not visible",
        function() return Config.Chams.Highlight.HiddenOutlineColor end,
        function() return 1 end,
        function(c,a) Config.Chams.Highlight.HiddenOutlineColor = c end)
end

-- Avatar
do local _w = esp_right:Checkbox("Avatar", Config.Avatar.Enable, function(v) Config.Avatar.Enable = v end)
DraxUI.RegCfg("esp.avatar", _w)
_w:AddSettings(function(p)
    p:Slider("Size", 10, 60, Config.Avatar.Size, "%.0f", function(v) Config.Avatar.Size = v end)
    p:Dropdown("Shape", {"Circle", "RoundedSquare", "Square"}, Config.Avatar.Shape == "Circle" and 1 or (Config.Avatar.Shape == "RoundedSquare" and 2 or 3), function(v)
        local s = {"Circle", "RoundedSquare", "Square"}; Config.Avatar.Shape = s[v]
    end)
    p:CheckboxColor("Outline", Config.Avatar.Outline, Config.Avatar.OutlineColor, nil, function(v) Config.Avatar.Outline = v end, function(c) Config.Avatar.OutlineColor = c end, Config.Avatar.HiddenOutlineColor, function(c) Config.Avatar.HiddenOutlineColor = c end)
    p:Checkbox("Filled", Config.Avatar.Filled.Enable, function(v) Config.Avatar.Filled.Enable = v end)
    p:ColorPicker("Fill Color", Config.Avatar.Filled.Color, 1 - Config.Avatar.Filled.Transparency, function(c, a) Config.Avatar.Filled.Color = c; Config.Avatar.Filled.Transparency = 1 - a end)
end); end

-- Health Bar
hpTgl = esp_right:Checkbox("Health Bar", Config.Bars.Health.Enable, function(v) Config.Bars.Health.Enable = v end)
DraxUI.RegCfg("esp.healthbar", hpTgl)
hpTgl:AddSettings(function(p)
    p:Checkbox("Health Based", Config.Bars.Health.HealthBased, function(v) Config.Bars.Health.HealthBased = v end)
    p:Checkbox("Show Value", Config.Bars.Health.Text.Enable, function(v) Config.Bars.Health.Text.Enable = v end)
    p:ColorPicker("Color 1", Config.Bars.Health.Color1, 1, function(c,a) Config.Bars.Health.Color1 = c end)
    p:ColorPicker("Color 2", Config.Bars.Health.Color2, 1, function(c,a) Config.Bars.Health.Color2 = c end)
    p:ColorPicker("Color 3", Config.Bars.Health.Color3, 1, function(c,a) Config.Bars.Health.Color3 = c end)
end)

-- Name
do local _w = esp_right:CheckboxColor("Name", Config.Text.Name.Enable, Config.Text.Name.Color, Config.Text.Name.HiddenColor, function(b) Config.Text.Name.Enable = b; if not b then restoreAllHumanoids() end end, function(c) Config.Text.Name.Color = c end, function(c) Config.Text.Name.HiddenColor = c end)
_w:AddSettings(function(p)
    p:Dropdown("Type", {"DisplayName", "Username"}, Config.Text.Name.Type == "DisplayName" and 1 or 2, function(v) Config.Text.Name.Type = v == 1 and "DisplayName" or "Username" end)
end); DraxUI.RegCfg("esp.name", _w) end

-- Distance / Weapon / Tracers / OOF Arrows
DraxUI.RegCfg("esp.dist",   esp_right:CheckboxColor("Distance", Config.Text.Studs.Enable, Config.Text.Studs.Color, Config.Text.Studs.HiddenColor, function(b) Config.Text.Studs.Enable = b end, function(c) Config.Text.Studs.Color = c end, function(c) Config.Text.Studs.HiddenColor = c end))
DraxUI.RegCfg("esp.weapon", esp_right:CheckboxColor("Weapon", Config.Text.Tool.Enable, Config.Text.Tool.Color, Config.Text.Tool.HiddenColor, function(b) Config.Text.Tool.Enable = b end, function(c) Config.Text.Tool.Color = c end, function(c) Config.Text.Tool.HiddenColor = c end))

do local _w = esp_right:CheckboxColor("Tracers", Config.Tracers.Enable, Config.Tracers.Color, Config.Tracers.HiddenColor, function(b) Config.Tracers.Enable = b end, function(c) Config.Tracers.Color = c end, function(c) Config.Tracers.HiddenColor = c end)
_w:AddSettings(function(p)
    p:Dropdown("Mode", {"Top", "Center", "Bottom", "Mouse"}, Config.Tracers.Mode == "Top" and 1 or (Config.Tracers.Mode == "Center" and 2 or (Config.Tracers.Mode == "Bottom" and 3 or 4)), function(v) 
        local m = {"Top", "Center", "Bottom", "Mouse"}; Config.Tracers.Mode = m[v] 
    end)
    p:CheckboxColor("Outline", Config.Tracers.Outline, Config.Tracers.OutlineColor, nil, function(v) Config.Tracers.Outline = v end, function(c) Config.Tracers.OutlineColor = c end, Config.Tracers.HiddenOutlineColor, function(c) Config.Tracers.HiddenOutlineColor = c end)
end); DraxUI.RegCfg("esp.tracers", _w) end

do local _w = esp_right:CheckboxColor("OOF Arrows", Config.OOFArrows.Enable, Config.OOFArrows.Color, nil,
    function(b) Config.OOFArrows.Enable = b end,
    function(c,a) Config.OOFArrows.Color = c end,
    nil)
DraxUI.RegCfg("esp.oofarrows", _w)
_w:AddSettings(function(p)
    p:Slider("Radius", 50, 400, Config.OOFArrows.Radius, "%.0fpx", function(v) Config.OOFArrows.Radius = v end)
    p:Checkbox("Name", Config.OOFArrows.Name.Enable, function(v) Config.OOFArrows.Name.Enable = v end)
    p:ColorPicker("Name Color", Config.OOFArrows.Name.Color, 1, function(c,a) Config.OOFArrows.Name.Color = c end)
    p:Dropdown("Name Type", {"DisplayName", "Username"}, Config.OOFArrows.Name.Type == "DisplayName" and 1 or 2, function(v)
        Config.OOFArrows.Name.Type = v == 1 and "DisplayName" or "Username"
    end)
    p:Checkbox("Avatar", Config.OOFArrows.Avatar.Enable, function(v) Config.OOFArrows.Avatar.Enable = v end)
    p:Slider("Avatar Size", 10, 60, Config.OOFArrows.Avatar.Size, "%.0f", function(v) Config.OOFArrows.Avatar.Size = v end)
    p:Dropdown("Avatar Shape", {"Circle", "RoundedSquare", "Square"}, Config.OOFArrows.Avatar.Shape == "Circle" and 1 or (Config.OOFArrows.Avatar.Shape == "RoundedSquare" and 2 or 3), function(v)
        local s = {"Circle", "RoundedSquare", "Square"}; Config.OOFArrows.Avatar.Shape = s[v]
    end)
    p:Checkbox("Av Outline", Config.OOFArrows.Avatar.Outline, function(v) Config.OOFArrows.Avatar.Outline = v end)
    p:CheckboxColor("Av Filled", Config.OOFArrows.Avatar.Filled.Enable, Config.OOFArrows.Avatar.Filled.Color, 1 - Config.OOFArrows.Avatar.Filled.Transparency,
        function(v) Config.OOFArrows.Avatar.Filled.Enable = v end,
        function(c,a) Config.OOFArrows.Avatar.Filled.Color = c; Config.OOFArrows.Avatar.Filled.Transparency = 1 - a end)
    p:CheckboxColor("Distance", Config.OOFArrows.Distance.Enable, Config.OOFArrows.Distance.Color, 1,
        function(v) Config.OOFArrows.Distance.Enable = v end,
        function(c,a) Config.OOFArrows.Distance.Color = c end)
end)
end

set_ui = tab5:Section("Left", "Theme")
DraxUI.RegCfg("set.accent", set_ui:ColorPicker("Menu accent", DraxUI.AccentColor, 1, function(c, a) DraxUI.SetAccent(c) end))
DraxUI.RegCfg("set.glow", set_ui:Checkbox("Glow", DraxUI.GlowEnabled, function(v) 
    DraxUI.GlowEnabled = v
    -- Refresh all glows with new visibility state
    DraxUI.RefreshAllGlows()
end))
set_bind = tab5:Section("Right", "Menu")
DraxUI.RegCfg("set.keybind", set_bind:Keybind("Menu keybind", DraxUI.Keybind, function(k) DraxUI.Keybind = k end))

do
    local kblCfg = {
        Preserve       = false,
        EnabledColor   = Color3.fromRGB(255, 255, 255),
        DisabledColor  = Color3.fromRGB(120, 120, 120),
        PrefixEnabled  = "[ON]",
        PrefixDisabled = "[OFF]",
    }

    -- Create separate ScreenGui for keybind list (independent of main menu)
    local kblGui = c("ScreenGui", {Name = "KeybindListGui", ResetOnSpawn = false, ZIndexBehavior = Enum.ZIndexBehavior.Global, IgnoreGuiInset = true, DisplayOrder = 9999})
    local success = pcall(function() kblGui.Parent = CoreGui end)
    if not success then kblGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui") end

    -- Outer shell — same style/colour as the main menu window
    local kblFrame = c("Frame", {
        Name                 = "KeybindList",
        BackgroundColor3     = Color3.fromRGB(28, 28, 28),
        AnchorPoint          = Vector2.new(0, 0),
        Position             = UDim2.new(0, 8, 0, 120),
        AutomaticSize        = Enum.AutomaticSize.Y,
        Size                 = UDim2.new(0, 220, 0, 0),
        Visible              = false,
        ZIndex               = 850,
        ClipsDescendants     = false,
    }, {
        c("UICorner",  {CornerRadius = UDim.new(0, 8)}),
        c("UIStroke",  {Color = Color3.fromRGB(40, 40, 40), Thickness = 1}),
        c("UIPadding", {PaddingBottom = UDim.new(0, 8), PaddingLeft = UDim.new(0, 8), PaddingRight = UDim.new(0, 8)}),
        c("UIListLayout", {SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 0)}),
    })
    kblFrame.Parent = kblGui

    -- Title bar (draggable area)
    local kblTitleBar = c("Frame", {
        BackgroundTransparency = 1,
        Size                   = UDim2.new(1, 0, 0, 28),
        ZIndex                 = 851,
        LayoutOrder            = 0,
    }, {
        c("UIPadding", {PaddingLeft = UDim.new(0, 10), PaddingRight = UDim.new(0, 10)}),
    })
    kblTitleBar.Parent = kblFrame
    local kblTitleLbl = c("TextLabel", {
        BackgroundTransparency = 1,
        AutomaticSize          = Enum.AutomaticSize.X,
        Size                   = UDim2.new(0, 0, 1, 0),
        Text                   = "Keybind list",
        TextColor3             = Color3.fromRGB(200, 200, 200),
        TextSize               = 13,
        Font                   = Enum.Font.GothamBold,
        TextXAlignment         = Enum.TextXAlignment.Left,
        ZIndex                 = 852,
    })
    kblTitleLbl.Parent = kblTitleBar

    -- Accent separator line (divider between title and content, with glow)
    local kblSeparator = c("Frame", {
        BackgroundColor3 = DraxUI.AccentColor,
        Size             = UDim2.new(1, 0, 0, 2),
        ZIndex           = 851,
        LayoutOrder      = 1,
        BorderSizePixel  = 0,
    })
    kblSeparator.Parent = kblFrame
    table.insert(DraxUI.AccentObjects, {Obj = kblSeparator, Prop = "BackgroundColor3"})
    local kblSepGlow = DraxUI.AddGlow(kblSeparator, 8, 0.78)
    kblSepGlow.ZIndex = 852
    kblSepGlow.Position = UDim2.new(0, -18, 0, -18)  -- center glow on the 2px separator line
    DraxUI.SetGlowVisibility(kblSepGlow, true)
    table.insert(DraxUI.AccentObjects, {Obj = kblSepGlow, Prop = "ImageColor3"})

    -- Inner content frame (18 18 18 like menu inner)
    local kblInner = c("Frame", {
        BackgroundColor3 = Color3.fromRGB(18, 18, 18),
        AutomaticSize    = Enum.AutomaticSize.Y,
        Size             = UDim2.new(1, 0, 0, 0),
        ZIndex           = 851,
        LayoutOrder      = 2,
    }, {
        c("UICorner",  {CornerRadius = UDim.new(0, 6)}),
        c("UIPadding", {PaddingTop = UDim.new(0, 6), PaddingBottom = UDim.new(0, 6), PaddingLeft = UDim.new(0, 10), PaddingRight = UDim.new(0, 10)}),
        c("UIListLayout", {Padding = UDim.new(0, 3), SortOrder = Enum.SortOrder.LayoutOrder}),
    })
    kblInner.Parent = kblFrame

    -- Drag logic — only while menu is open
    local kblDragging = false
    local kblDragStart, kblStartPos = Vector2.new(), UDim2.new()
    kblTitleBar.InputBegan:Connect(function(inp)
        if inp.UserInputType == Enum.UserInputType.MouseButton1 then
            kblDragging  = true
            kblDragStart = Vector2.new(inp.Position.X, inp.Position.Y)
            kblStartPos  = kblFrame.Position
        end
    end)
    UIS.InputChanged:Connect(function(inp)
        if kblDragging and inp.UserInputType == Enum.UserInputType.MouseMovement then
            if not DraxUI.Open then kblDragging = false; return end
            local d = inp.Position
            kblFrame.Position = UDim2.new(
                kblStartPos.X.Scale, kblStartPos.X.Offset + (d.X - kblDragStart.X),
                kblStartPos.Y.Scale, kblStartPos.Y.Offset + (d.Y - kblDragStart.Y)
            )
        end
    end)
    UIS.InputEnded:Connect(function(inp)
        if inp.UserInputType == Enum.UserInputType.MouseButton1 then kblDragging = false end
    end)

    DraxUI.ConfigWidgets["kbl.pos"] = {
        get  = function()
            local p = kblFrame.Position
            return {xo = p.X.Offset, yo = p.Y.Offset}
        end,
        load = function(d)
            if type(d) ~= "table" then return end
            kblFrame.Position = UDim2.new(0, d.xo or 8, 0, d.yo or 120)
        end,
    }

    local function rebuildKbl()
        -- Ensure this runs in main thread to avoid "current thread cannot access Instance"
        task.defer(function()
            pcall(function()
                -- Clear all children from kblInner
                kblInner:ClearAllChildren()
                
                -- Recreate layout elements that were cleared
                c("UICorner",  {CornerRadius = UDim.new(0, 6)}).Parent = kblInner
                c("UIPadding", {PaddingTop = UDim.new(0, 6), PaddingBottom = UDim.new(0, 6), PaddingLeft = UDim.new(0, 10), PaddingRight = UDim.new(0, 10)}).Parent = kblInner
                c("UIListLayout", {Padding = UDim.new(0, 3), SortOrder = Enum.SortOrder.LayoutOrder}).Parent = kblInner
                
                if not kblFrame.Visible then return end

                local order = 0
                for _, entry in ipairs(DraxUI.KeybindEntries) do
                    if not entry then continue end
                    
                    local isRunning = false
                    if entry.GetActive then
                        pcall(function() isRunning = entry.GetActive() end)
                    end

                    if kblCfg.Preserve then
                        if not entry.Value then continue end
                    else
                        if not isRunning then continue end
                    end

                    local keyName
                    if entry.MouseButton == Enum.UserInputType.MouseButton1 then
                        keyName = "LMB"
                    elseif entry.MouseButton == Enum.UserInputType.MouseButton2 then
                        keyName = "RMB"
                    elseif entry.Key and typeof(entry.Key) == "EnumItem" and entry.Key ~= Enum.KeyCode.Unknown then
                        keyName = entry.Key.Name
                    else
                        keyName = "NONE"
                    end
                    local modeStr = ({toggle="Toggle", hold="Hold", press="Press", always="Always"})[entry.Mode] or "Toggle"
                    local prefix = ""
                    local col    = Color3.fromRGB(255, 255, 255)
                    if kblCfg.Preserve then
                        prefix = (isRunning and kblCfg.PrefixEnabled or kblCfg.PrefixDisabled) .. " "
                        col    = isRunning and kblCfg.EnabledColor or kblCfg.DisabledColor
                    end

                    -- For Always mode, don't show the keybind
                    local txt
                    if entry.Mode == "always" then
                        txt = prefix .. (entry.Label or "?") .. " - [" .. modeStr .. "]"
                    else
                        txt = prefix .. "[" .. keyName .. "] " .. (entry.Label or "?") .. " - [" .. modeStr .. "]"
                    end
                    order = order + 1
                    local lbl = c("TextLabel", {
                        BackgroundTransparency = 1,
                        AutomaticSize          = Enum.AutomaticSize.X,
                        Size                   = UDim2.new(0, 0, 0, 14),
                        Text                   = txt,
                        TextColor3             = col,
                        TextSize               = 11,
                        Font                   = Enum.Font.GothamMedium,
                        TextXAlignment         = Enum.TextXAlignment.Left,
                        ZIndex                 = 853,
                        LayoutOrder            = order,
                    })
                    lbl.Parent = kblInner
                end
            end)
        end)
    end
    DraxUI.UpdateKeybindList = rebuildKbl
    -- Safety-net periodic refresh (force-update handles real-time changes)
    task.spawn(function()
        while true do
            task.wait(1)
            rebuildKbl()
        end
    end)

    -- Simple checkbox toggle — no keybind
    local kblChk = set_bind:Checkbox("Keybind List", false, function(v)
        kblFrame.Visible = v
    end)
    DraxUI.RegCfg("kbl.enable", kblChk)
    
    kblChk:AddSettings(function(p)
        local preserveWdg = p:Checkbox("Preserve", kblCfg.Preserve, function(v) kblCfg.Preserve = v end)
        DraxUI.RegCfg("kbl.preserve", preserveWdg)
        
        local enabledColWdg = p:ColorPicker("Enabled Color",  kblCfg.EnabledColor,  1, function(col) kblCfg.EnabledColor  = col end)
        DraxUI.RegCfg("kbl.enabledcolor", enabledColWdg)
        
        local disabledColWdg = p:ColorPicker("Disabled Color", kblCfg.DisabledColor, 1, function(col) kblCfg.DisabledColor = col end)
        DraxUI.RegCfg("kbl.disabledcolor", disabledColWdg)
        
        local prefixOnWdg = p:TextBox("Prefix ON",  "e.g. [ON]",  kblCfg.PrefixEnabled,  function(v) kblCfg.PrefixEnabled  = v end)
        DraxUI.RegCfg("kbl.prefixon", prefixOnWdg)
        
        local prefixOffWdg = p:TextBox("Prefix OFF", "e.g. [OFF]", kblCfg.PrefixDisabled, function(v) kblCfg.PrefixDisabled = v end)
        DraxUI.RegCfg("kbl.prefixoff", prefixOffWdg)
    end)
end

-- ── Background System ────────────────────────────────────────────
do
    local bgCfg = {
        Enabled    = true,
        AlwaysShow = false,
        BlockInputs = true,  -- Block background inputs when menu is open
        Color      = Color3.fromRGB(0, 0, 0),
        Transparency = 0.7,
    }

    -- Create ScreenGui for background (sits below menu, keybind list, notifications but above Roblox UI)
    local bgGui = c("ScreenGui", {Name = "BackgroundGui", ResetOnSpawn = false, ZIndexBehavior = Enum.ZIndexBehavior.Global, IgnoreGuiInset = true, DisplayOrder = 800})
    local success = pcall(function() bgGui.Parent = CoreGui end)
    if not success then bgGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui") end

    -- Full-screen background frame (covers entire screen including top bar)
    local bgFrame = c("Frame", {
        Name                 = "Background",
        BackgroundColor3     = bgCfg.Color,
        BackgroundTransparency = bgCfg.Transparency,
        Position             = UDim2.new(0, 0, 0, 0),
        Size                 = UDim2.new(1, 0, 1, 0),
        Visible              = false,
        Active               = false,  -- Not focusable
        ZIndex               = 800,
        ClipsDescendants     = false,
    })
    bgFrame.Parent = bgGui

    -- Function to update background visibility and input blocker based on menu state and settings
    local function updateBgVisibility()
        local shouldShow = bgCfg.Enabled and (bgCfg.AlwaysShow or DraxUI.Open)
        bgFrame.Visible = shouldShow
        
        -- Update click blocker button visibility
        if DraxUI.CursorUnlockBtn then
            local shouldBlockInputs = bgCfg.BlockInputs and DraxUI.Open
            DraxUI.CursorUnlockBtn.Visible = shouldBlockInputs
        end
    end

    -- Monitor menu open/close state 
    local lastMenuState = false
    RunService.RenderStepped:Connect(function()
        if lastMenuState ~= DraxUI.Open then
            lastMenuState = DraxUI.Open
            updateBgVisibility()
        end
    end)

    local bgChk = set_bind:CheckboxColor("Background", bgCfg.Enabled, bgCfg.Color, nil, 
        function(v)  -- cbBox - checkbox state
            bgCfg.Enabled = v
            updateBgVisibility()
        end,
        function(c)  -- cbVis - color picker
            bgCfg.Color = c
            bgFrame.BackgroundColor3 = c
        end
    )
    DraxUI.RegCfg("bg.enabled", bgChk)
    
    bgChk:AddSettings(function(p)
        local alwaysShowWdg = p:Checkbox("Always show", bgCfg.AlwaysShow, function(v)
            bgCfg.AlwaysShow = v
            updateBgVisibility()
        end)
        DraxUI.RegCfg("bg.alwaysshow", alwaysShowWdg)
        
        local transWdg = p:Slider("Transparency", 0, 1, bgCfg.Transparency, "%.2f", function(v)
            bgCfg.Transparency = v
            bgFrame.BackgroundTransparency = v
        end)
        DraxUI.RegCfg("bg.transparency", transWdg)
    end)
    
    -- Separate toggle for blocking inputs
    local blockInputsChk = set_bind:Checkbox("Block inputs for background", bgCfg.BlockInputs, function(v)
        bgCfg.BlockInputs = v
        updateBgVisibility()
    end)
    DraxUI.RegCfg("bg.blockinputs", blockInputsChk)
end

-- ── Snowfall System ──────────────────────────────────────────────
do
    local snowCfg = {
        Enabled    = true,
        AlwaysShow = false,
        Color      = Color3.fromRGB(255, 255, 255),
        Transparency = 0,
        Amount     = 0.3,   -- Snowflakes per spawn cycle (much less)
        Speed      = 0.5,   -- Multiplier for fall speed
        WindDir    = 0,     -- Wind direction (-1 to 1)
    }

    -- Create ScreenGui for snowfall
    local snowGui = c("ScreenGui", {Name = "SnowfallGui", ResetOnSpawn = false, ZIndexBehavior = Enum.ZIndexBehavior.Global, IgnoreGuiInset = true, DisplayOrder = 801})
    local success = pcall(function() snowGui.Parent = CoreGui end)
    if not success then snowGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui") end

    local snowContainer = c("Frame", {
        Size = UDim2.new(2, 0, 2, 0),
        Position = UDim2.new(0, 0, 0, -150),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 801,
    })
    snowContainer.Parent = snowGui

    local snowParticles = {}
    local spawnTimer = 0

    -- Function to create a snowflake with manual update
    local function createSnowflake()
        local startX = math.random(-200, math.max(100, snowGui.AbsoluteSize.X + 200))
        local startY = -0.05
        
        local snowflake = c("ImageLabel", {
            Size = UDim2.new(0, 15, 0, 15),
            Position = UDim2.new(0, startX, 0, -10),
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundTransparency = 1,
            Image = "rbxassetid://4906868769",
            ImageColor3 = snowCfg.Color,
            ImageTransparency = snowCfg.Transparency,
            ZIndex = 801,
        })
        snowflake.Parent = snowContainer

        table.insert(snowParticles, {
            Obj = snowflake,
            Y = startY,
            SpeedY = (math.random(20, 40) / 1000) * snowCfg.Speed,  -- Fall speed (much slower)
            WindX = (math.random(-10, 30) / 1000) + (snowCfg.WindDir * 0.25),  -- Wind direction control (stronger)
            X = startX,
            Rotation = 0,
            RotationSpeed = math.random(-3, 3),
        })
    end

    -- Function to update snowfall visibility; immediately destroys lingering particles on disable
    local function updateSnowVisibility()
        local shouldShow = snowCfg.Enabled and (snowCfg.AlwaysShow or DraxUI.Open)
        local wasEnabled = snowGui.Enabled
        snowGui.Enabled = shouldShow
        if wasEnabled and not shouldShow then
            for i = #snowParticles, 1, -1 do
                pcall(function() snowParticles[i].Obj:Destroy() end)
            end
            table.clear(snowParticles)
            spawnTimer = 0
        end
    end

    -- Monitor menu open/close and drive particle updates
    RunService.RenderStepped:Connect(function(dt)
        local shouldShow = snowCfg.Enabled and (snowCfg.AlwaysShow or DraxUI.Open)
        if snowGui.Enabled ~= shouldShow then
            updateSnowVisibility()
        end
        if not snowGui.Enabled then return end

        -- Spawn new snowflakes periodically
        spawnTimer = spawnTimer + dt
        if spawnTimer > (0.15 / snowCfg.Amount) then
            spawnTimer = 0
            createSnowflake()
        end

        -- Update existing snowflakes
        -- OOB threshold 0.65 ≈ just below visible screen bottom in snowContainer scale
        -- (snowContainer is 2× screen height offset -150 px, so screen-bottom ≈ 0.57 scale)
        for i = #snowParticles, 1, -1 do
            local p = snowParticles[i]
            p.Y = p.Y + p.SpeedY * dt * 60
            p.X = p.X + p.WindX
            p.Rotation = p.Rotation + p.RotationSpeed

            if p.Y > 0.65 then
                pcall(function() p.Obj:Destroy() end)
                table.remove(snowParticles, i)
            else
                p.Obj.Position = UDim2.new(0, p.X, p.Y, 0)
                p.Obj.Rotation = p.Rotation
                p.Obj.ImageColor3 = snowCfg.Color
                p.Obj.ImageTransparency = snowCfg.Transparency
            end
        end
    end)

    -- Add Snowfall as hybrid checkbox+colorpicker
    local snowChk = set_bind:CheckboxColor("Snowfall", snowCfg.Enabled, snowCfg.Color, nil,
        function(v)
            snowCfg.Enabled = v
            updateSnowVisibility()
        end,
        function(c)
            snowCfg.Color = c
        end
    )
    DraxUI.RegCfg("snow.enabled", snowChk)
    
    snowChk:AddSettings(function(p)
        local alwaysShowWdg = p:Checkbox("Always show", snowCfg.AlwaysShow, function(v)
            snowCfg.AlwaysShow = v
            updateSnowVisibility()
        end)
        DraxUI.RegCfg("snow.alwaysshow", alwaysShowWdg)
        
        local amountWdg = p:Slider("Amount", 0.01, 0.5, snowCfg.Amount, "%.2f", function(v)
            snowCfg.Amount = v
        end)
        DraxUI.RegCfg("snow.amount", amountWdg)
        
        local speedWdg = p:Slider("Speed", 0.1, 6, snowCfg.Speed, "%.1f", function(v) snowCfg.Speed = v end)
        DraxUI.RegCfg("snow.speed", speedWdg)
        
        local windDirWdg = p:Slider("Wind Direction", -1, 1, snowCfg.WindDir, "%.1f", function(v)
            snowCfg.WindDir = v
        end)
        DraxUI.RegCfg("snow.winddir", windDirWdg)
        
        local transWdg = p:Slider("Transparency", 0, 1, snowCfg.Transparency, "%.2f", function(v)
            snowCfg.Transparency = v
        end)
        DraxUI.RegCfg("snow.transparency", transWdg)
    end)
end

local _unhookWdg
local _unhookStage  = 0
local _unhookThread = nil
_unhookWdg = set_bind:Button("Unhook/panic (2 taps for full exit)", function()
    if _unhookStage == 0 then
        -- Stage 1: kill all active features, start countdown
        _unhookStage = 1
        for _, entry in pairs(DraxUI.ConfigWidgets) do
            if entry.forceOff then pcall(entry.forceOff) end
        end
        local function _setTxt(t) if _unhookWdg and _unhookWdg._btn then _unhookWdg._btn.Text = t end end
        _setTxt("Unhook again for full exit (5)")
        if _unhookThread then task.cancel(_unhookThread) end
        _unhookThread = task.spawn(function()
            for i = 4, 1, -1 do
                task.wait(1)
                if _unhookStage ~= 1 then return end
                _setTxt("Unhook again for full exit (" .. i .. ")")
            end
            task.wait(1)
            if _unhookStage == 1 then
                _unhookStage  = 0
                _unhookThread = nil
                _setTxt("Unhook/panic (2 taps for full exit)")
            end
        end)
    elseif _unhookStage == 1 then
        -- Stage 2: full exit
        _unhookStage = 2
        if _unhookThread then task.cancel(_unhookThread); _unhookThread = nil end
        task.defer(function()
            pcall(function() if DraxUI.ScreenGui then DraxUI.ScreenGui:Destroy() end end)
            pcall(function() if DraxUI.NotifGui  then DraxUI.NotifGui:Destroy()  end end)
        end)
    end
end)

-- ── Config system ────────────────────────────────────────────────
do
    local HS = game:GetService("HttpService")

    -- Recursively replace Color3 values with a serialisable table before JSON
    local function prepareForJSON(v)
        if typeof(v) == "Color3" then
            return {__c3 = true, r = v.R, g = v.G, b = v.B}
        elseif type(v) == "table" then
            local out = {}
            for k2, v2 in pairs(v) do out[k2] = prepareForJSON(v2) end
            return out
        end
        return v
    end

    -- Recursively reconstruct Color3 values after JSON decode
    local function restoreFromJSON(v)
        if type(v) == "table" then
            if v.__c3 then return Color3.new(v.r or 0, v.g or 0, v.b or 0) end
            for k2, v2 in pairs(v) do v[k2] = restoreFromJSON(v2) end
        end
        return v
    end

    -- Deep-merge src into dst, skipping non-primitive mismatches silently
    local function deepMerge(dst, src)
        if type(dst) ~= "table" or type(src) ~= "table" then return end
        for k, v in pairs(src) do
            if type(v) == "table" and type(dst[k]) == "table" then
                deepMerge(dst[k], v)
            else
                dst[k] = v
            end
        end
    end

    local CFG_FOLDER = "AkuConfigs"

    local function cfgEnsureFolder()
        if not isfolder(CFG_FOLDER) then makefolder(CFG_FOLDER) end
    end

    local function cfgSaveConfig(name)
        if not name or name == "" then return false, "No name" end
        cfgEnsureFolder()
        -- Collect all registered widget states (excluding player statuses)
        local widgetData = {}
        for key, entry in pairs(DraxUI.ConfigWidgets) do
            -- Exclude player-related configs from main config
            if not key:match("^plr%.") and not key:match("^players%.") then
                local ok, val = pcall(entry.get)
                if ok then widgetData[key] = prepareForJSON(val) end
            end
        end
        -- Save Config without Players.statuses
        local data = {
            widgets = widgetData,
            Config  = prepareForJSON(Config),
        }
        -- Remove player statuses from the data if they exist
        if data.Config and type(data.Config) == "table" then
            data.Config.Players = nil
            data.Config.plrStatuses = nil
        end
        local ok, encoded = pcall(function() return HS:JSONEncode(data) end)
        if not ok then return false, "Encode failed" end
        local ok2, err2 = pcall(writefile, CFG_FOLDER .. "/" .. name .. ".json", encoded)
        if not ok2 then return false, tostring(err2) end
        return true
    end

    local function cfgLoadConfig(name)
        if not name or name == "" then return false, "No name" end
        local path = CFG_FOLDER .. "/" .. name .. ".json"
        if not isfile(path) then return false, "Not found" end
        local ok, raw = pcall(readfile, path)
        if not ok then return false, "Read failed" end
        local ok2, data = pcall(function() return HS:JSONDecode(raw) end)
        if not ok2 then return false, "Decode failed" end
        -- Restore raw Config table first (covers sub-settings not in registry)
        if type(data.Config) == "table" then
            deepMerge(Config, restoreFromJSON(data.Config))
            -- Ensure player statuses are never loaded from config
            Config.Players = nil
            Config.plrStatuses = nil
        end
        -- Apply all registered widget states (updates UI visuals + fires callbacks)
        if type(data.widgets) == "table" then
            DraxUI.IsLoadingConfig = true
            -- First reset every registered widget to its script default so that widgets
            -- missing from an older config snapshot are properly cleared.
            for _, entry in pairs(DraxUI.ConfigWidgets) do
                if entry.reset then pcall(entry.reset) end
            end
            -- Apply accent first so all subsequent widget loads tween with the correct color
            local accentVal = data.widgets["set.accent"]
            if accentVal then
                local ae = DraxUI.ConfigWidgets["set.accent"]
                if ae and ae.load then pcall(ae.load, restoreFromJSON(accentVal)) end
            end
            for key, val in pairs(data.widgets) do
                if key ~= "set.accent" then
                    local entry = DraxUI.ConfigWidgets[key]
                    if entry and entry.load then
                        pcall(entry.load, restoreFromJSON(val))
                    end
                end
            end
            DraxUI.IsLoadingConfig = false
        end
        return true
    end

    local function cfgList()
        cfgEnsureFolder()
        local files = listfiles(CFG_FOLDER)
        local names = {}
        for _, f in ipairs(files) do
            local nm = f:match("([^/\\]+)%.json$")
            if nm then table.insert(names, nm) end
        end
        table.sort(names)
        return names
    end

    local function cfgDelete(name)
        if not name or name == "" then return false, "No name" end
        local path = CFG_FOLDER .. "/" .. name .. ".json"
        if not isfile(path) then return false, "Not found" end
        local ok, err = pcall(delfile, path)
        if not ok then return false, tostring(err) end
        return true
    end

    -- Notification helper
    local function cfgNotify(msg)
        DraxUI.Notification("Config", msg)
    end

    -- ── UI ──────────────────────────────────────────────────────
    cfg_left  = tab5:Section("Left",  "Configs")
    cfg_right = tab5:Section("Right", "Saved")

    local cfgNameWidget = cfg_left:TextBox("Name", "my_config", "", function(v) end)
    local cfgCurrentName = ""
    local _cfgTB = cfgNameWidget.Frame:FindFirstChildWhichIsA("TextBox")
    if _cfgTB then
        _cfgTB:GetPropertyChangedSignal("Text"):Connect(function()
            if _cfgTB and _cfgTB.Parent then cfgCurrentName = _cfgTB.Text end
        end)
    end

    -- Scrollable list of saved configs inside cfg_right
    local listScroll = Instance.new("ScrollingFrame")
    listScroll.BackgroundTransparency = 1
    listScroll.Size = UDim2.new(1, 0, 0, 120)
    listScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
    listScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
    listScroll.ScrollBarThickness = 4
    listScroll.ScrollBarImageColor3 = Color3.fromRGB(60, 60, 60)
    listScroll.BorderSizePixel = 0
    listScroll.Parent = cfg_right.Content
    local listLayout = Instance.new("UIListLayout")
    listLayout.SortOrder = Enum.SortOrder.LayoutOrder
    listLayout.Padding = UDim.new(0, 3)
    listLayout.Parent = listScroll

    local function cfgRebuildList()
        for _, ch in ipairs(listScroll:GetChildren()) do
            if ch:IsA("TextButton") then ch:Destroy() end
        end
        local names = cfgList()
        for i, nm in ipairs(names) do
            local btn = Instance.new("TextButton")
            btn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
            btn.Size = UDim2.new(1, -4, 0, 20)
            btn.Text = nm
            btn.TextColor3 = Color3.fromRGB(180, 180, 180)
            btn.TextSize = 12
            btn.Font = Enum.Font.Gotham
            btn.BorderSizePixel = 0
            btn.LayoutOrder = i
            local uc = Instance.new("UICorner"); uc.CornerRadius = UDim.new(0, 4); uc.Parent = btn
            btn.MouseButton1Click:Connect(function()
                cfgCurrentName = nm
                local tb = cfgNameWidget.Frame:FindFirstChildWhichIsA("TextBox")
                if tb then tb.Text = nm end
            end)
            btn.Parent = listScroll
        end
        if #names == 0 then
            local lbl = Instance.new("TextLabel")
            lbl.BackgroundTransparency = 1
            lbl.Size = UDim2.new(1, 0, 0, 20)
            lbl.Text = "(no saved configs)"
            lbl.TextColor3 = Color3.fromRGB(80, 80, 80)
            lbl.TextSize = 12
            lbl.Font = Enum.Font.Gotham
            lbl.Name = "EmptyLabel"
            lbl.Parent = listScroll
        end
    end
    cfgRebuildList()

    cfg_left:Button("Save config", function()
        local nm = cfgCurrentName
        local ok, err = cfgSaveConfig(nm)
        cfgNotify(ok and ("Saved: " .. nm) or ("Save failed: " .. (err or "")))
        cfgRebuildList()
    end)

    cfg_left:Button("Load config", function()
        local nm = cfgCurrentName
        local ok, err = cfgLoadConfig(nm)
        cfgNotify(ok and ("Loaded: " .. nm) or ("Load failed: " .. (err or "")))
    end)

    cfg_left:Button("Delete config", function()
        local nm = cfgCurrentName
        local ok, err = cfgDelete(nm)
        cfgNotify(ok and ("Deleted: " .. nm) or ("Delete failed: " .. (err or "")))
        cfgRebuildList()
    end)

    cfg_left:Button("Refresh list", function()
        cfgRebuildList()
        cfgNotify("Config list refreshed")
    end)
end
-- ── End config system ─────────────────────────────────────────────

-- World tab
Lighting = game:GetService("Lighting")
worldConns = {}

function worldDisconn(key)
    if worldConns[key] then
        pcall(function() worldConns[key]:Disconnect() end)
        worldConns[key] = nil
    end
end

world_left  = tab3:Section("Left",  "Camera")
world_right = tab3:Section("Right", "Lighting")

-- Freecam
freecamConns = {}
freecamHiddenParts = {}  -- body parts whose LocalTransparencyModifier we zeroed when entering freecam
freecamPitch = 0
freecamYaw   = 0
freecamSpeed = 40
freecamSensitivity = (pcall(function() return UserInputService.MouseDeltaSensitivity end) and UserInputService.MouseDeltaSensitivity) or 1
-- Freecam overlay (Line/Dot/Distance pointing at local player)
freecamLineEnable = false; freecamLineColor = Color3.fromRGB(255,255,255)
freecamDotEnable  = false; freecamDotColor  = Color3.fromRGB(255,255,255)
freecamDistEnable = false
fcLine = Drawing.new("Line"); fcLine.Thickness = 1.5; fcLine.Visible = false
fcDot  = Drawing.new("Circle"); fcDot.Filled = true; fcDot.Radius = 6; fcDot.Visible = false
fcDist = Drawing.new("Text");   fcDist.Size = 13; fcDist.Center = true; fcDist.Outline = true; fcDist.OutlineColor = Color3.fromRGB(0,0,0); fcDist.Visible = false

-- Freecam freeze player position
freecamFreezeEnabled = false
freecamFreezeConn = nil

function unfreezeFreecamPlayer()
    if freecamFreezeConn then
        pcall(function() freecamFreezeConn:Disconnect() end)
        freecamFreezeConn = nil
    end
    local lp = game.Players.LocalPlayer
    local char = lp and lp.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    if hrp then
        pcall(function()
            hrp.Anchored = false
        end)
    end
end

function freezeFreecamPlayer()
    local lp = game.Players.LocalPlayer
    local char = lp and lp.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    if hrp then
        pcall(function()
            hrp.Anchored = true
        end)
        -- Disconnect any existing freeze connection
        if freecamFreezeConn then
            pcall(function() freecamFreezeConn:Disconnect() end)
        end
        -- Listen for position changes and immediately set back to anchored position
        freecamFreezeConn = hrp:GetPropertyChangedSignal("CFrame"):Connect(function()
            if freecamFreezeEnabled then
                pcall(function() hrp.Anchored = true end)
            end
        end)
    end
end

function doDisableFreecam()
    for _, conn in ipairs(freecamConns) do pcall(function() conn:Disconnect() end) end
    freecamConns = {}
    -- Unfreeze player but keep the flag so it restores when freecam is enabled again
    if freecamFreezeEnabled then
        unfreezeFreecamPlayer()
    end
    -- Restore LocalTransparencyModifier=1 on parts that Roblox hid for first-person view
    for _, p in ipairs(freecamHiddenParts) do
        pcall(function() p.LocalTransparencyModifier = 1 end)
    end
    freecamHiddenParts = {}
    -- Hide overlay drawings
    fcLine.Visible = false; fcDot.Visible = false; fcDist.Visible = false
    UIS.MouseBehavior = Enum.MouseBehavior.Default
    workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
    do  -- re-attach camera to new character after potential respawn
        local lp   = game.Players.LocalPlayer
        local char = lp and lp.Character
        local hum  = char and char:FindFirstChildOfClass("Humanoid")
        if hum then workspace.CurrentCamera.CameraSubject = hum end
    end
    pcall(function()
        local lp = game.Players.LocalPlayer
        local pm = require(lp:WaitForChild("PlayerScripts"):WaitForChild("PlayerModule"))
        pm:GetControls():Enable()
    end)
end

function doEnableFreecam()
    -- Collect body parts with LocalTransparencyModifier=1 (set by Roblox camera for first-person) and reveal them
    freecamHiddenParts = {}
    local lpChar = game.Players.LocalPlayer.Character
    if lpChar then
        for _, p in ipairs(lpChar:GetDescendants()) do
            if p:IsA("BasePart") and p.LocalTransparencyModifier >= 1 then
                table.insert(freecamHiddenParts, p)
                pcall(function() p.LocalTransparencyModifier = 0 end)
            end
        end
    end
    local cam = workspace.CurrentCamera
    freecamPos   = cam.CFrame.Position
    local lv     = cam.CFrame.LookVector
    freecamYaw   = math.atan2(-lv.X, -lv.Z)
    freecamPitch = math.asin(math.clamp(lv.Y, -1, 1))
    pcall(function()
        local lp = game.Players.LocalPlayer
        if lp and lp:FindFirstChild("PlayerScripts") then
            local pm = require(lp.PlayerScripts:FindFirstChild("PlayerModule"))
            if pm then pm:GetControls():Disable() end
        end
    end)
    cam.CameraType = Enum.CameraType.Scriptable
    local rmbDown = false
    local fc1 = UIS.InputBegan:Connect(function(inp, gpe)
        if gpe then return end
        if inp.UserInputType == Enum.UserInputType.MouseButton2 then
            rmbDown = true
            UIS.MouseBehavior = Enum.MouseBehavior.LockCurrentPosition
        end
    end)
    local fc2 = UIS.InputEnded:Connect(function(inp)
        if inp.UserInputType == Enum.UserInputType.MouseButton2 then
            rmbDown = false
            UIS.MouseBehavior = Enum.MouseBehavior.Default
        end
    end)
    local fc3 = UIS.InputChanged:Connect(function(inp)
        if inp.UserInputType == Enum.UserInputType.MouseMovement and rmbDown then
            local delta = UIS:GetMouseDelta()
            local sens = freecamSensitivity * 0.0075  -- 2.5x multiplier for sensitivity
            freecamYaw   = freecamYaw   - delta.X * sens
            freecamPitch = math.clamp(freecamPitch - delta.Y * sens, -math.pi/2 + 0.05, math.pi/2 - 0.05)
        end
    end)
    local fc4 = game:GetService("RunService").RenderStepped:Connect(function(dt)
        -- Re-assert Scriptable every frame so respawn can't reset CameraType
        if cam.CameraType ~= Enum.CameraType.Scriptable then
            cam.CameraType = Enum.CameraType.Scriptable
        end
        local spd = freecamSpeed * dt
        local cf  = CFrame.Angles(0, freecamYaw, 0) * CFrame.Angles(freecamPitch, 0, 0)
        local fwd = cf.LookVector
        local rgt = cf.RightVector
        if UIS:IsKeyDown(Enum.KeyCode.W) then freecamPos += fwd * spd end
        if UIS:IsKeyDown(Enum.KeyCode.S) then freecamPos -= fwd * spd end
        if UIS:IsKeyDown(Enum.KeyCode.A) then freecamPos -= rgt * spd end
        if UIS:IsKeyDown(Enum.KeyCode.D) then freecamPos += rgt * spd end
        if UIS:IsKeyDown(Enum.KeyCode.Space) then freecamPos += Vector3.new(0, spd, 0) end
        if UIS:IsKeyDown(Enum.KeyCode.LeftControl) or UIS:IsKeyDown(Enum.KeyCode.RightControl) then
            freecamPos -= Vector3.new(0, spd, 0)
        end
        cam.CFrame = CFrame.new(freecamPos) * CFrame.Angles(0, freecamYaw, 0) * CFrame.Angles(freecamPitch, 0, 0)
        -- Freecam overlay: draw Line/Dot/Distance pointing at local player's HRP
        local hrpFC = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        local cam2 = workspace.CurrentCamera
        if hrpFC and cam2 then
            local sp, onSc = cam2:WorldToViewportPoint(hrpFC.Position)
            if freecamDotEnable and onSc then
                fcDot.Visible = true; fcDot.Position = Vector2.new(sp.X, sp.Y); fcDot.Color = freecamDotColor
            else fcDot.Visible = false end
            if freecamDistEnable and onSc then
                local dist = (hrpFC.Position - freecamPos).Magnitude
                fcDist.Visible = true
                fcDist.Position = Vector2.new(sp.X, sp.Y + (freecamDotEnable and 14 or 0))
                fcDist.Color = freecamLineColor
                fcDist.Text = string.format("[%.0fm]", dist * 0.28)
            else fcDist.Visible = false end
            if freecamLineEnable and onSc then
                local mp = UIS:GetMouseLocation()
                fcLine.Visible = true; fcLine.From = Vector2.new(mp.X, mp.Y); fcLine.To = Vector2.new(sp.X, sp.Y); fcLine.Color = freecamLineColor
            else fcLine.Visible = false end
        else
            fcDot.Visible = false; fcDist.Visible = false; fcLine.Visible = false
        end
    end)
    freecamConns = {fc1, fc2, fc3, fc4}
    
    -- Restore freeze if it was enabled before
    if freecamFreezeEnabled then
        freezeFreecamPlayer()
    end
end

freecamRunning = false
freecamWidget = world_left:CheckboxKeybind("Freecam", false, nil, function(armed)
    if armed then
        if not freecamRunning then
            doEnableFreecam()
            freecamRunning = true
        end
    else
        if freecamRunning then
            doDisableFreecam()
            freecamRunning = false
        end
    end
end, function()
    freecamRunning = not freecamRunning
    if freecamRunning then doEnableFreecam() else doDisableFreecam() end
end)
-- Override GetActive to sync with actual freecamRunning state
freecamWidget.GetActive = function() return freecamRunning end
DraxUI.RegCfg("world.freecam", freecamWidget)
freecamWidget:AddSettings(function(p)
    p:Checkbox("Freeze plr pos", freecamFreezeEnabled, function(v)
        freecamFreezeEnabled = v
        if v then
            freezeFreecamPlayer()
        else
            unfreezeFreecamPlayer()
        end
    end)
    p:CheckboxColor("Line", freecamLineEnable, freecamLineColor, nil,
        function(v) freecamLineEnable = v end,
        function(col) freecamLineColor = col end)
    p:CheckboxColor("Dot", freecamDotEnable, freecamDotColor, nil,
        function(v) freecamDotEnable = v end,
        function(col) freecamDotColor = col end)
    p:Checkbox("Distance", freecamDistEnable, function(v) freecamDistEnable = v end)
end)
DraxUI.ConfigWidgets["world.fc.line"] = {
    get   = function() return {en=freecamLineEnable, r=freecamLineColor.R, g=freecamLineColor.G, b=freecamLineColor.B} end,
    load  = function(d) if type(d)=="table" then
        freecamLineEnable = d.en==true
        if d.r then freecamLineColor = Color3.new(d.r,d.g,d.b) end
    end end,
    reset = function() freecamLineEnable=false; freecamLineColor=Color3.fromRGB(255,255,255) end,
    forceOff = function() freecamLineEnable=false end,
}
DraxUI.ConfigWidgets["world.fc.dot"] = {
    get   = function() return {en=freecamDotEnable, r=freecamDotColor.R, g=freecamDotColor.G, b=freecamDotColor.B} end,
    load  = function(d) if type(d)=="table" then
        freecamDotEnable = d.en==true
        if d.r then freecamDotColor = Color3.new(d.r,d.g,d.b) end
    end end,
    reset = function() freecamDotEnable=false; freecamDotColor=Color3.fromRGB(255,255,255) end,
    forceOff = function() freecamDotEnable=false end,
}
DraxUI.ConfigWidgets["world.fc.dist"] = {
    get   = function() return freecamDistEnable end,
    load  = function(v) freecamDistEnable = (v==true) end,
    reset = function() freecamDistEnable = false end,
    forceOff = function() freecamDistEnable = false end,
}
DraxUI.RegCfg("world.camspeed", world_left:Slider("Cam Speed", 5, 500, freecamSpeed, "%.0f", function(v)
    freecamSpeed = v
end))
teleportWidget = world_left:CheckboxKeybind("Teleport to cam", false, nil, function() end, function()
    local pos = freecamRunning and freecamPos or workspace.CurrentCamera.CFrame.Position
    if freecamRunning then
        doDisableFreecam()
        freecamRunning = false
        -- Update keybind list since freecam is now disabled
        if DraxUI.UpdateKeybindList then DraxUI.UpdateKeybindList() end
    end
    task.defer(function()
        local char = game.Players.LocalPlayer.Character
        if char and char:FindFirstChild("HumanoidRootPart") then
            local hrp = char.HumanoidRootPart
            hrp.CFrame = CFrame.new(pos) * hrp.CFrame.Rotation
        end
    end)
end, "press", {"press"})
DraxUI.RegCfg("world.tpcam", teleportWidget)

-- FOV
defaultFov = workspace.CurrentCamera.FieldOfView
fovValue   = defaultFov
do local _wfov = world_left:Checkbox("Custom FOV", false, function(v)
    if v then
        worldConns.fov = workspace.CurrentCamera:GetPropertyChangedSignal("FieldOfView"):Connect(function()
            workspace.CurrentCamera.FieldOfView = fovValue
        end)
        workspace.CurrentCamera.FieldOfView = fovValue
    else
        worldDisconn("fov")
        workspace.CurrentCamera.FieldOfView = defaultFov
    end
end); DraxUI.RegCfg("world.fov.en", _wfov) end
DraxUI.RegCfg("world.fovamt", world_left:Slider("FOV Amount", 10, 120, defaultFov, "%.0f", function(v)
    fovValue = v
    if worldConns.fov then workspace.CurrentCamera.FieldOfView = fovValue end
end))

-- Stretch Res
do local _wstr = world_left:Checkbox("Stretch Res", false, function(v)
    stretchActive = v
    if v then
        RunService:BindToRenderStep("akuStretch", Enum.RenderPriority.Camera.Value + 1, function()
            workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame
                * CFrame.new(0,0,0, 1,0,0, 0,stretchScale,0, 0,0,1)
        end)
    else
        pcall(RunService.UnbindFromRenderStep, RunService, "akuStretch")
    end
end); DraxUI.RegCfg("world.stretch.en", _wstr) end
DraxUI.RegCfg("world.stretchamt", world_left:Slider("Stretch Amount", 0.1, 1.0, stretchScale, "%.2f", function(v)
    stretchScale = v
end))

local lp = game:GetService("Players").LocalPlayer
local camClipState = {Enabled = false, Method = "InvisCam"}
local origOcclusion = lp and lp.DevCameraOcclusionMode or Enum.DevCameraOcclusionMode.Zoom

local function setPopperHook(enableClip)
    local pm = lp:FindFirstChild("PlayerScripts") and lp.PlayerScripts:FindFirstChild("PlayerModule")
    if not pm then return false end
    local camMod = pm:FindFirstChild("CameraModule")
    if not camMod then return false end
    local zoomCtrl = camMod:FindFirstChild("ZoomController")
    if not zoomCtrl then return false end
    local PopperClient = zoomCtrl:FindFirstChild("Popper")
    if not PopperClient then return false end

    for i, v in next, getgc() do
        if typeof(v) == "function" and getfenv(v).script == PopperClient then
            for i2, v2 in next, debug.getconstants(v) do
                local num = tonumber(v2)
                if enableClip and num == 0.25 then
                    debug.setconstant(v, i2, 0)
                elseif not enableClip and num == 0 then
                    debug.setconstant(v, i2, 0.25)
                end
            end
        end
    end
    return true
end

local function applyCameraClip()
    lp.DevCameraOcclusionMode = origOcclusion
    pcall(setPopperHook, false)
    if not camClipState.Enabled then return end
    if camClipState.Method == "InvisCam" then
        lp.DevCameraOcclusionMode = Enum.DevCameraOcclusionMode.Invisicam
    elseif camClipState.Method == "Hook" then
        pcall(setPopperHook, true)
    end
end

DraxUI.RegCfg("misc.camclip", world_left:CheckboxDropdown("Camera Clip", false, {"InvisCam", "Hook"}, 1,
    function(v)
        camClipState.Enabled = v
        applyCameraClip()
    end,
    function(idx)
        camClipState.Method = idx == 1 and "InvisCam" or "Hook"
        if camClipState.Enabled then
            applyCameraClip()
        end
    end
))

do
    local origMaxZoom = nil
    DraxUI.RegCfg("misc.unlockzoom", world_left:Checkbox("Unlock Camera Distance", false, function(v)
        if v then
            origMaxZoom = lp.CameraMaxZoomDistance
            lp.CameraMaxZoomDistance = math.huge
        else
            if origMaxZoom then
                lp.CameraMaxZoomDistance = origMaxZoom
                origMaxZoom = nil
            end
        end
    end))
end
DraxUI.RegCfg("world.ambient", world_right:ColorPicker("Ambience", Lighting.Ambient, 1, function(col)
    worldDisconn("ambient")
    Lighting.Ambient = col
    worldConns.ambient = Lighting:GetPropertyChangedSignal("Ambient"):Connect(function()
        Lighting.Ambient = col
    end)
end))

-- Custom Fog
origFogColor = Lighting.FogColor
origFogEnd   = Lighting.FogEnd
origFogStart = Lighting.FogStart
fogColor     = origFogColor
fogEnd       = origFogEnd
function applyFog()
    worldDisconn("fog")
    Lighting.FogColor = fogColor
    Lighting.FogEnd   = fogEnd
    Lighting.FogStart = math.max(0, fogEnd * 0.1)
    worldConns.fog = Lighting:GetPropertyChangedSignal("FogEnd"):Connect(function()
        Lighting.FogEnd   = fogEnd
        Lighting.FogStart = math.max(0, fogEnd * 0.1)
        Lighting.FogColor = fogColor
    end)
end
do local _w = world_right:CheckboxColor("Custom Fog", false, origFogColor, nil,
    function(v)
        if v then applyFog()
        else
            worldDisconn("fog")
            Lighting.FogColor = origFogColor
            Lighting.FogEnd   = origFogEnd
            Lighting.FogStart = origFogStart
        end
    end,
    function(col, a)
        fogColor = col
        if worldConns.fog then applyFog() end
    end,
    nil); DraxUI.RegCfg("world.fog", _w) end
DraxUI.RegCfg("world.fogdist", world_right:Slider("Fog Distance", 0, 4000, origFogEnd, "%.0f", function(v)
    fogEnd = v
    if worldConns.fog then applyFog() end
end))

-- Custom Exposure
origExpVal = Lighting.ExposureCompensation
expVal     = origExpVal
DraxUI.RegCfg("world.exp.en", world_right:Checkbox("Custom Exposure", false, function(v)
    if v then
        Lighting.ExposureCompensation = expVal
        worldConns.exposure = Lighting:GetPropertyChangedSignal("ExposureCompensation"):Connect(function()
            Lighting.ExposureCompensation = expVal
        end)
    else
        worldDisconn("exposure")
        Lighting.ExposureCompensation = origExpVal
    end
end))
DraxUI.RegCfg("world.expamt", world_right:Slider("Exposure", -5, 5, origExpVal, "%.2f", function(v)
    expVal = v
    if worldConns.exposure then Lighting.ExposureCompensation = expVal end
end))

-- Custom Brightness
origBrtVal = Lighting.Brightness
brtVal     = origBrtVal
DraxUI.RegCfg("world.brt.en", world_right:Checkbox("Custom Brightness", false, function(v)
    if v then
        Lighting.Brightness = brtVal
        worldConns.brightness = Lighting:GetPropertyChangedSignal("Brightness"):Connect(function()
            Lighting.Brightness = brtVal
        end)
    else
        worldDisconn("brightness")
        Lighting.Brightness = origBrtVal
    end
end))
DraxUI.RegCfg("world.brtamt", world_right:Slider("Brightness", 0, 10, origBrtVal, "%.2f", function(v)
    brtVal = v
    if worldConns.brightness then Lighting.Brightness = brtVal end
end))

-- Custom Time
origTimeVal = Lighting.ClockTime
timeVal     = origTimeVal
DraxUI.RegCfg("world.time.en", world_right:Checkbox("Custom Time", false, function(v)
    if v then
        Lighting.ClockTime = timeVal
        worldConns.clocktime = Lighting:GetPropertyChangedSignal("ClockTime"):Connect(function()
            Lighting.ClockTime = timeVal
        end)
    else
        worldDisconn("clocktime")
        Lighting.ClockTime = origTimeVal
    end
end))
DraxUI.RegCfg("world.timeamt", world_right:Slider("Clock Time", 0, 24, origTimeVal, "%.2f", function(v)
    timeVal = v
    if worldConns.clocktime then Lighting.ClockTime = timeVal end
end))

-- Custom Atmosphere (Ambience)
local realAtmos = Lighting:FindFirstChildOfClass("Atmosphere")
local origAtmosProps = nil
if realAtmos then
    origAtmosProps = {
        Haze = realAtmos.Haze, Glare = realAtmos.Glare, Color = realAtmos.Color,
        Decay = realAtmos.Decay, Density = realAtmos.Density, Offset = realAtmos.Offset
    }
end

local atmosEnabled = false
local atmosData = {
    Haze = realAtmos and realAtmos.Haze or 0,
    Glare = realAtmos and realAtmos.Glare or 0,
    Color = realAtmos and realAtmos.Color or Color3.fromRGB(199, 199, 199),
    Decay = realAtmos and realAtmos.Decay or Color3.fromRGB(106, 112, 125),
    Density = realAtmos and realAtmos.Density or 0.3,
    Offset = realAtmos and realAtmos.Offset or 0,
}

-- Forward declarations for sky guard
local skyWatchTask = nil
local function _worldGuardNeeded() return skyEnabled or atmosEnabled end
local function startSkyWatch() end  -- stub, will be redefined
local function stopSkyWatch() end   -- stub, will be redefined

local function updateAtmos()
    local atm = Lighting:FindFirstChildOfClass("Atmosphere")
    if not atm then
        atm = Instance.new("Atmosphere")
        atm.Parent = Lighting
    end
    atm.Haze = atmosData.Haze
    atm.Glare = atmosData.Glare
    atm.Color = atmosData.Color
    atm.Decay = atmosData.Decay
    atm.Density = atmosData.Density
    atm.Offset = 1 - atmosData.Offset -- Инверсия: при 0 в UI будет 1 в Roblox
end

local function restoreAtmos()
    local atm = Lighting:FindFirstChildOfClass("Atmosphere")
    if origAtmosProps and atm then
        atm.Haze = origAtmosProps.Haze
        atm.Glare = origAtmosProps.Glare
        atm.Color = origAtmosProps.Color
        atm.Decay = origAtmosProps.Decay
        atm.Density = origAtmosProps.Density
        atm.Offset = origAtmosProps.Offset
    elseif not origAtmosProps and atm then
        atm:Destroy() -- Если изначально атмосферы не было, удаляем нашу
    end
end

local atmosWidget = world_right:Checkbox("Custom Atmosphere", false, function(v)
    atmosEnabled = v
    if v then updateAtmos(); startSkyWatch() else restoreAtmos(); stopSkyWatch() end
end)

DraxUI.RegCfg("world.atmos", atmosWidget)
DraxUI.ConfigWidgets["world.atmos.data"] = {
    get  = function() return {haze=atmosData.Haze, glare=atmosData.Glare, density=atmosData.Density, offset=atmosData.Offset, color=atmosData.Color, decay=atmosData.Decay} end,
    load = function(d)
        if type(d) ~= "table" then return end
        if type(d.haze)    == "number" then atmosData.Haze    = d.haze    end
        if type(d.glare)   == "number" then atmosData.Glare   = d.glare   end
        if type(d.density) == "number" then atmosData.Density = d.density end
        if type(d.offset)  == "number" then atmosData.Offset  = d.offset  end
        if typeof(d.color) == "Color3" then atmosData.Color   = d.color   end
        if typeof(d.decay) == "Color3" then atmosData.Decay   = d.decay   end
        if atmosEnabled then updateAtmos() end
    end,
    reset = function() end, forceOff = function() end,
}

atmosWidget:AddSettings(function(p)
    p:Slider("Lightning haze", 0, 1, atmosData.Haze, "%.2f", function(v)
        atmosData.Haze = v
        if atmosEnabled then updateAtmos() end
    end)
    p:Slider("Haze Strenght", 0, 1, atmosData.Glare, "%.2f", function(v)
        atmosData.Glare = v
        if atmosEnabled then updateAtmos() end
    end)
    p:ColorPicker("Color", atmosData.Color, 1, function(col)
        atmosData.Color = col
        if atmosEnabled then updateAtmos() end
    end)
    p:ColorPicker("Decay", atmosData.Decay, 1, function(col)
        atmosData.Decay = col
        if atmosEnabled then updateAtmos() end
    end)
    p:Slider("Sky density", 0, 1, atmosData.Density, "%.2f", function(v)
        atmosData.Density = v
        if atmosEnabled then updateAtmos() end
    end)
    p:Slider("density mirorness", 0, 1, atmosData.Offset, "%.2f", function(v)
        atmosData.Offset = v
        if atmosEnabled then updateAtmos() end
    end)
end)

-- Clouds system
local originalClouds = nil
local cloudsEnabled = false
local cloudsData = {
    Cover = 0.5,
    Density = 0.3,
    Color = Color3.fromRGB(199, 199, 199)
}

local function updateClouds()
    pcall(function()
        local terrain = workspace.Terrain
        if not terrain or not terrain.Clouds then return end
        
        terrain.Clouds.Enabled = true
        terrain.Clouds.Color = cloudsData.Color
        terrain.Clouds.Density = cloudsData.Density
        terrain.Clouds.Cover = cloudsData.Cover
    end)
end

local function restoreClouds()
    pcall(function()
        local terrain = workspace.Terrain
        if not terrain or not terrain.Clouds then return end
        
        if originalClouds then
            terrain.Clouds.Enabled = originalClouds.Enabled
            terrain.Clouds.Color = originalClouds.Color
            terrain.Clouds.Density = originalClouds.Density
            terrain.Clouds.Cover = originalClouds.Cover
        else
            terrain.Clouds.Enabled = false
        end
    end)
end

pcall(function()
    local terrain = workspace.Terrain
    if terrain and terrain.Clouds then
        originalClouds = {
            Enabled = terrain.Clouds.Enabled,
            Color = terrain.Clouds.Color,
            Density = terrain.Clouds.Density,
            Cover = terrain.Clouds.Cover
        }
    end
end)

local cloudsWidget = world_right:Checkbox("Clouds", false, function(v)
    cloudsEnabled = v
    if v then updateClouds() else restoreClouds() end
end)

DraxUI.RegCfg("world.clouds", cloudsWidget)
DraxUI.ConfigWidgets["world.clouds.data"] = {
    get  = function() return {cover=cloudsData.Cover, density=cloudsData.Density, color=cloudsData.Color} end,
    load = function(d)
        if type(d) ~= "table" then return end
        if type(d.cover)   == "number" then cloudsData.Cover   = d.cover   end
        if type(d.density) == "number" then cloudsData.Density = d.density end
        if typeof(d.color) == "Color3" then cloudsData.Color   = d.color   end
        if cloudsEnabled then updateClouds() end
    end,
    reset = function() end, forceOff = function() end,
}

cloudsWidget:AddSettings(function(p)
    p:Slider("Cover", 0, 1, cloudsData.Cover, "%.2f", function(v)
        cloudsData.Cover = v
        if cloudsEnabled then updateClouds() end
    end)
    p:Slider("Density", 0, 1, cloudsData.Density, "%.2f", function(v)
        cloudsData.Density = v
        if cloudsEnabled then updateClouds() end
    end)
    p:ColorPicker("Color", cloudsData.Color, 1, function(col)
        cloudsData.Color = col
        if cloudsEnabled then updateClouds() end
    end)
end)
-- Custom Sky
skyPresets = {
    {name="Default"},
    {name="Galaxy Nebula", Up="15983964246",    Rt="15983966246",    Lf="15983967420",    Ft="15983965025",    Bk="15983968922",    Dn="15983966825"},
    {name="Sunset",        Up="600835177",      Rt="600833862",      Lf="600886090",      Ft="600832720",      Bk="600830446",      Dn="600831635"},
    {name="Red Classic",   Up="126944775797063",Rt="94190734796082", Lf="109838453114563",Ft="90546017435179", Bk="108929045660200",Dn="78646480540009"},
    {name="Astral Veil",   Up="16553667750",    Rt="16553665766",    Lf="16553664042",    Ft="16553662144",    Bk="16553658937",    Dn="16553660713"},
    {name="Emerald Nocturne",Up="16563489821",  Rt="16563487078",    Lf="16563485362",    Ft="16563484084",    Bk="16563478983",    Dn="16563481302"},
    
    {name="Black hole",    Bk="10042540787",     Dn="10042545084",    Ft="10042548945",    Lf="10042554320",    Rt="10042560621",    Up="10042563671"},
    {name="Night",         Bk="5346760450",      Dn="5346760689",     Ft="5346760919",     Lf="5346761102",     Rt="5346761335",     Up="5346761509"},
    {name="Foggy water",   Bk="15876597103",     Dn="15876592775",    Ft="15876640231",    Lf="15876638420",    Rt="15876595486",    Up="15876639348"},
    {name="Aurora Veil",   Bk="17124357467",     Dn="17124359797",    Ft="17124362093",    Lf="17124365127",    Rt="17124367200",    Up="17124369657"},
    {name="Green",         Bk="11941775243",     Dn="11941774975",    Ft="11941774655",    Lf="11941774369",    Rt="11941774042",    Up="11941773718"},
    {name="Sunset 2",      Bk="458016711",       Dn="458016826",      Ft="458016532",      Lf="458016655",      Rt="458016782",      Up="458016792"},
    {name="Candy",         Bk="103994796436499", Dn="88135141884296", Ft="71705651078185", Lf="83560072752341", Rt="96879039628172", Up="131043401069407"},
    {name="Aurora",        Bk="340908398",       Dn="340908450",      Ft="340908468",      Lf="340908504",      Rt="340908530",      Up="340908586"},
    {name="Sunny Mewdom",  Bk="11832141390",     Dn="11832143153",    Ft="11832140714",    Lf="11832142032",    Rt="11832142403",    Up="11832185944"},
    {name="Heaven",        Bk="7951826533",      Dn="7951706908",     Ft="7951694757",     Lf="7951697216",     Rt="7951700251",     Up="7951703855"},
    {name="Cartoon night", Bk="16676744885",     Dn="16676747356",    Ft="16676750819",    Lf="16676754379",    Rt="16676757270",    Up="16676760882"}
}
skyNames = {}; for _, p in ipairs(skyPresets) do table.insert(skyNames, p.name) end
activeSky = nil
skyEnabled = false
skyPresetIdx = 1
function applySkyPreset(idx)
    if activeSky then activeSky:Destroy(); activeSky = nil end
    local p = skyPresets[idx]
    if not p or p.name == "Default" then
        -- Restore game's current sky (defaultGameSky) if we have it
        if defaultGameSky then
            defaultGameSky.Parent = Lighting
            defaultGameSky = nil
        elseif originalSky then
            -- Fallback to originalSky if defaultGameSky doesn't exist
            originalSky.Parent = Lighting
        end
        return
    end
    
    -- Before applying custom sky, save the CURRENT sky as the game's default
    local currentSky = Lighting:FindFirstChildOfClass("Sky")
    if currentSky then
        if not defaultGameSky then
            defaultGameSky = currentSky:Clone()
            defaultGameSky.Parent = nil  -- Keep in memory
        end
        -- Also keep originalSky for reference
        if not originalSky then
            originalSky = currentSky:Clone()
            originalSky.Parent = nil
        end
        currentSky.Parent = nil  -- Remove from Lighting
    end
    
    activeSky = Instance.new("Sky")
    activeSky.SkyboxUp  = "rbxassetid://" .. p.Up
    activeSky.SkyboxRt  = "rbxassetid://" .. p.Rt
    activeSky.SkyboxLf  = "rbxassetid://" .. p.Lf
    activeSky.SkyboxFt  = "rbxassetid://" .. p.Ft
    activeSky.SkyboxBk  = "rbxassetid://" .. p.Bk
    activeSky.SkyboxDn  = "rbxassetid://" .. p.Dn
    activeSky.CelestialBodiesShown = skySunMoonEnabled
    activeSky.SunAngularSize = skySunAngularSize
    activeSky.MoonAngularSize = skyMoonAngularSize
    activeSky.Parent = Lighting
end

-- Sky settings
skyOrientEnabled = false
skyRotEnabled = false
skyOrientation = Vector3.new(0, 0, 0)
skyRotSpeed = Vector3.new(0, 0, 0)
skyOrientSaved = Vector3.new(0, 0, 0)  -- Save orientation values when switching to rotation
skySunMoonEnabled = true
skySunAngularSize = 21.5  -- Default value
skyMoonAngularSize = 11  -- Default value
skyOrientConn = nil
skyRotConn    = nil
originalSky   = nil  -- Store original sky from Lighting
defaultGameSky = nil  -- Store the GAME's current sky (updates while custom sky is active)

-- Initialize: save the game's current sky as default on startup
pcall(function()
    local currentSky = Lighting:FindFirstChildOfClass("Sky")
    if currentSky then
        defaultGameSky = currentSky:Clone()
        defaultGameSky.Parent = nil
    end
end)

-- Full definitions of sky guard functions (world visual guard)
local savedSkyProps = nil  -- Store ALL custom sky properties when guard enabled
function startSkyWatch()
    if skyWatchTask then return end
    
    -- Save ALL current sky properties when starting guard
    if not savedSkyProps then
        local currentSky = Lighting:FindFirstChildOfClass("Sky")
        if currentSky then
            savedSkyProps = {
                SkyboxUp = currentSky.SkyboxUp,
                SkyboxRt = currentSky.SkyboxRt,
                SkyboxLf = currentSky.SkyboxLf,
                SkyboxFt = currentSky.SkyboxFt,
                SkyboxBk = currentSky.SkyboxBk,
                SkyboxDn = currentSky.SkyboxDn,
                CelestialBodiesShown = currentSky.CelestialBodiesShown,
                SunAngularSize = currentSky.SunAngularSize,
                MoonAngularSize = currentSky.MoonAngularSize,
                StarCount = currentSky.StarCount,
            }
        else
            savedSkyProps = {noSky = true}  -- Flag: не было неба изначально
        end
    end
    
    skyWatchTask = task.spawn(function()
        local lastExpensiveCheck = 0
        while _worldGuardNeeded() do
            task.wait(0.05)  -- Check frequently
            lastExpensiveCheck = lastExpensiveCheck + 0.05
            
            -- FREQUENT sky checks (every frame practically)
            if skyEnabled then
                local allSkies = Lighting:FindFirstChildOfClass("Sky")
                local skyCount = 0
                if allSkies then
                    for _, obj in ipairs(Lighting:GetChildren()) do
                        if obj:IsA("Sky") then skyCount = skyCount + 1 end
                    end
                end
                
                -- Ensure only ONE sky exists (delete extras)
                if skyCount > 1 then
                    for _, obj in ipairs(Lighting:GetChildren()) do
                        if obj:IsA("Sky") and obj ~= activeSky then
                            obj:Destroy()
                        end
                    end
                end
                
                -- Guard active sky preset (check every tick if preset is applied)
                if skyPresetIdx > 1 then
                    local currentSky = Lighting:FindFirstChildOfClass("Sky")
                    if not currentSky then
                        applySkyPreset(skyPresetIdx)
                    else
                        local p = skyPresets[skyPresetIdx]
                        if p then
                            local expectedUp = "rbxassetid://" .. p.Up
                            local expectedRt = "rbxassetid://" .. p.Rt
                            local expectedLf = "rbxassetid://" .. p.Lf
                            local expectedFt = "rbxassetid://" .. p.Ft
                            local expectedBk = "rbxassetid://" .. p.Bk
                            local expectedDn = "rbxassetid://" .. p.Dn
                            
                            -- Check all 6 faces
                            if currentSky.SkyboxUp ~= expectedUp
                                or currentSky.SkyboxRt ~= expectedRt
                                or currentSky.SkyboxLf ~= expectedLf
                                or currentSky.SkyboxFt ~= expectedFt
                                or currentSky.SkyboxBk ~= expectedBk
                                or currentSky.SkyboxDn ~= expectedDn
                                or currentSky.CelestialBodiesShown ~= skySunMoonEnabled
                                or math.abs(currentSky.SunAngularSize - skySunAngularSize) > 0.01
                                or math.abs(currentSky.MoonAngularSize - skyMoonAngularSize) > 0.01
                            then
                                -- Game changed the sky while custom sky was active - save it as new default
                                defaultGameSky = currentSky:Clone()
                                defaultGameSky.Parent = nil
                                
                                -- Restore sky properties quickly
                                currentSky.SkyboxUp = expectedUp
                                currentSky.SkyboxRt = expectedRt
                                currentSky.SkyboxLf = expectedLf
                                currentSky.SkyboxFt = expectedFt
                                currentSky.SkyboxBk = expectedBk
                                currentSky.SkyboxDn = expectedDn
                                currentSky.CelestialBodiesShown = skySunMoonEnabled
                                currentSky.SunAngularSize = skySunAngularSize
                                currentSky.MoonAngularSize = skyMoonAngularSize
                            end
                        end
                    end
                elseif skyPresetIdx == 1 then
                    -- Default preset selected - update defaultGameSky when it changes
                    local currentSky = Lighting:FindFirstChildOfClass("Sky")
                    if currentSky then
                        defaultGameSky = currentSky:Clone()
                        defaultGameSky.Parent = nil
                    end
                end
            end
            
            -- Expensive checks every 1.5 seconds
            if lastExpensiveCheck >= 1.5 then
                lastExpensiveCheck = 0
                
                -- Guard atmosphere
                if atmosEnabled then
                    local atm = Lighting:FindFirstChildOfClass("Atmosphere")
                    if not atm then
                        updateAtmos()
                    else
                        local expected = 1 - atmosData.Offset
                        if math.abs(atm.Density - atmosData.Density) > 0.001
                            or math.abs(atm.Haze   - atmosData.Haze)    > 0.001
                            or math.abs(atm.Glare  - atmosData.Glare)   > 0.001
                            or math.abs(atm.Offset - expected)          > 0.001
                        then
                            updateAtmos()
                        end
                    end
                end
                
                -- Guard fog
                if worldConns.fog then
                    if math.abs(Lighting.FogColor.R - fogColor.R) > 0.01
                        or math.abs(Lighting.FogColor.G - fogColor.G) > 0.01
                        or math.abs(Lighting.FogColor.B - fogColor.B) > 0.01
                        or math.abs(Lighting.FogEnd - fogEnd) > 1
                    then
                        applyFog()
                    end
                end
                
                -- Guard exposure
                if worldConns.exposure then
                    if math.abs(Lighting.ExposureCompensation - expVal) > 0.01 then
                        Lighting.ExposureCompensation = expVal
                    end
                end
                
                -- Guard brightness
                if worldConns.brightness then
                    if math.abs(Lighting.Brightness - brtVal) > 0.01 then
                        Lighting.Brightness = brtVal
                    end
                end
                
                -- Guard clock time
                if worldConns.clocktime then
                    if math.abs(Lighting.ClockTime - timeVal) > 0.1 then
                        Lighting.ClockTime = timeVal
                    end
                end
            end
        end
        skyWatchTask = nil
    end)
end

function stopSkyWatch()
    if not _worldGuardNeeded() then
        if skyWatchTask then task.cancel(skyWatchTask); skyWatchTask = nil end
        
        -- Restore saved sky when disabling guard
        if savedSkyProps then
            if savedSkyProps.noSky then
                -- Не было неба изначально - удаляем все sky объекты
                local sky = Lighting:FindFirstChildOfClass("Sky")
                if sky then sky:Destroy() end
                activeSky = nil
            else
                -- Восстанавливаем сохраненное небо
                local currentSky = Lighting:FindFirstChildOfClass("Sky")
                if not currentSky then
                    currentSky = Instance.new("Sky")
                    currentSky.Parent = Lighting
                end
                currentSky.SkyboxUp = savedSkyProps.SkyboxUp
                currentSky.SkyboxRt = savedSkyProps.SkyboxRt
                currentSky.SkyboxLf = savedSkyProps.SkyboxLf
                currentSky.SkyboxFt = savedSkyProps.SkyboxFt
                currentSky.SkyboxBk = savedSkyProps.SkyboxBk
                currentSky.SkyboxDn = savedSkyProps.SkyboxDn
                currentSky.CelestialBodiesShown = savedSkyProps.CelestialBodiesShown
                currentSky.SunAngularSize = savedSkyProps.SunAngularSize
                currentSky.MoonAngularSize = savedSkyProps.MoonAngularSize
                currentSky.StarCount = savedSkyProps.StarCount
                activeSky = currentSky
            end
            savedSkyProps = nil
        end
    end
end

do local _w = world_right:CheckboxDropdown("Custom Sky", false, skyNames, skyPresetIdx,
    function(v)
        skyEnabled = v
        if v then
            -- Enabling custom sky - save current game sky as default
            local currentSky = Lighting:FindFirstChildOfClass("Sky")
            if currentSky and not defaultGameSky then
                defaultGameSky = currentSky:Clone()
                defaultGameSky.Parent = nil
            end
            applySkyPreset(skyPresetIdx)
            startSkyWatch()
        else
            stopSkyWatch()
            if activeSky then activeSky:Destroy(); activeSky = nil end
            -- Restore the game's last known sky (defaultGameSky) or fallback to originalSky
            if defaultGameSky then
                defaultGameSky.Parent = Lighting
                defaultGameSky = nil
            elseif originalSky then
                originalSky.Parent = Lighting
            else
                local currentSky = Lighting:FindFirstChildOfClass("Sky")
                if currentSky then currentSky:Destroy() end
            end
        end
    end,
    function(idx)
        skyPresetIdx = idx
        if skyEnabled then applySkyPreset(idx) end
    end)
_w:AddSettings(function(p)
    -- Sun/Moon toggle
    p:Checkbox("Sun/Moon enabled", skySunMoonEnabled, function(v)
        skySunMoonEnabled = v
        if activeSky then
            activeSky.CelestialBodiesShown = v
        end
    end)
    
    -- Sun Size slider
    p:Slider("Sun Size", 0, 60, skySunAngularSize, "%.1f", function(v)
        skySunAngularSize = v
        if activeSky then
            activeSky.SunAngularSize = v
        end
    end)
    
    -- Moon Size slider
    p:Slider("Moon Size", 0, 60, skyMoonAngularSize, "%.1f", function(v)
        skyMoonAngularSize = v
        if activeSky then
            activeSky.MoonAngularSize = v
        end
    end)
    
    -- Orientation toggle
    p:Checkbox("Orientation", skyOrientEnabled, function(v)
        skyOrientEnabled = v
        if v then
            if activeSky then
                activeSky.SkyboxOrientation = skyOrientation
            end
            if skyOrientConn then skyOrientConn:Disconnect() end
            skyOrientConn = Lighting:GetPropertyChangedSignal("SkyboxOrientation"):Connect(function()
                if skyOrientEnabled and activeSky then
                    activeSky.SkyboxOrientation = skyOrientation
                end
            end)
        else
            if skyOrientConn then skyOrientConn:Disconnect(); skyOrientConn = nil end
        end
    end)
    
    -- 3 sliders for Orient/Rotation - behavior changes based on skyRotEnabled
    local sliderX = p:Slider("Orient X", -180, 180, skyRotEnabled and skyRotSpeed.X or skyOrientation.X, "%.0f", function(v)
        if skyRotEnabled then
            skyRotSpeed = Vector3.new(v, skyRotSpeed.Y, skyRotSpeed.Z)
        else
            skyOrientation = Vector3.new(v, skyOrientation.Y, skyOrientation.Z)
            if skyOrientEnabled and activeSky then activeSky.SkyboxOrientation = skyOrientation end
        end
    end)
    
    local sliderY = p:Slider("Orient Y", -180, 180, skyRotEnabled and skyRotSpeed.Y or skyOrientation.Y, "%.0f", function(v)
        if skyRotEnabled then
            skyRotSpeed = Vector3.new(skyRotSpeed.X, v, skyRotSpeed.Z)
        else
            skyOrientation = Vector3.new(skyOrientation.X, v, skyOrientation.Z)
            if skyOrientEnabled and activeSky then activeSky.SkyboxOrientation = skyOrientation end
        end
    end)
    
    local sliderZ = p:Slider("Orient Z", -180, 180, skyRotEnabled and skyRotSpeed.Z or skyOrientation.Z, "%.0f", function(v)
        if skyRotEnabled then
            skyRotSpeed = Vector3.new(skyRotSpeed.X, skyRotSpeed.Y, v)
        else
            skyOrientation = Vector3.new(skyOrientation.X, skyOrientation.Y, v)
            if skyOrientEnabled and activeSky then activeSky.SkyboxOrientation = skyOrientation end
        end
    end)
    
    -- Rotation toggle - switches slider behavior and starts rotation loop
    p:Checkbox("Rotation", skyRotEnabled, function(v)
        skyRotEnabled = v
        if v then
            -- Only initialize speed/saved-orientation when starting fresh (not when panel reopens)
            if not skyRotConn then
                skyOrientSaved = skyOrientation
            end
            -- (Re)start rotation loop
            if skyRotConn then skyRotConn:Disconnect() end
            skyRotConn = game:GetService("RunService").RenderStepped:Connect(function(dt)
                if skyRotEnabled and activeSky and (skyRotSpeed.X ~= 0 or skyRotSpeed.Y ~= 0 or skyRotSpeed.Z ~= 0) then
                    skyOrientation = skyOrientation + (skyRotSpeed * dt)
                    activeSky.SkyboxOrientation = skyOrientation
                end
            end)
        else
            -- Stop rotation loop and restore orientation
            if skyRotConn then skyRotConn:Disconnect(); skyRotConn = nil end
            skyOrientation = skyOrientSaved
            if activeSky and skyOrientEnabled then activeSky.SkyboxOrientation = skyOrientation end
        end
    end)
end)
DraxUI.RegCfg("world.sky", _w) end

-- Sky sub-settings config (AddSettings widgets are ephemeral, so register against globals)
DraxUI.ConfigWidgets["world.sky.sunmoon"] = {
    get  = function() return skySunMoonEnabled end,
    load = function(v) if type(v)=="boolean" then skySunMoonEnabled=v; if activeSky then activeSky.CelestialBodiesShown=v end end end
}
DraxUI.ConfigWidgets["world.sky.sunsize"] = {
    get  = function() return skySunAngularSize end,
    load = function(v) if type(v)=="number" then skySunAngularSize=v; if activeSky then activeSky.SunAngularSize=v end end end
}
DraxUI.ConfigWidgets["world.sky.moonsize"] = {
    get  = function() return skyMoonAngularSize end,
    load = function(v) if type(v)=="number" then skyMoonAngularSize=v; if activeSky then activeSky.MoonAngularSize=v end end end
}
DraxUI.ConfigWidgets["world.sky.orient.en"] = {
    get  = function() return skyOrientEnabled end,
    load = function(v) if type(v)=="boolean" then skyOrientEnabled=v; if v and activeSky then activeSky.SkyboxOrientation=skyOrientation end end end
}
DraxUI.ConfigWidgets["world.sky.orient"] = {
    get  = function() return {skyOrientation.X, skyOrientation.Y, skyOrientation.Z} end,
    load = function(v) if type(v)=="table" then skyOrientation=Vector3.new(v[1] or 0, v[2] or 0, v[3] or 0) end end
}
DraxUI.ConfigWidgets["world.sky.rot.en"] = {
    get  = function() return skyRotEnabled end,
    load = function(v)
        if type(v)=="boolean" then
            skyRotEnabled = v
            if v then
                if skyRotConn then skyRotConn:Disconnect() end
                skyOrientSaved = skyOrientation
                skyRotConn = game:GetService("RunService").RenderStepped:Connect(function(dt)
                    if skyRotEnabled and activeSky and (skyRotSpeed.X ~= 0 or skyRotSpeed.Y ~= 0 or skyRotSpeed.Z ~= 0) then
                        skyOrientation = skyOrientation + (skyRotSpeed * dt)
                        activeSky.SkyboxOrientation = skyOrientation
                    end
                end)
            else
                if skyRotConn then skyRotConn:Disconnect(); skyRotConn = nil end
            end
        end
    end
}
DraxUI.ConfigWidgets["world.sky.rot.speed"] = {
    get  = function() return {skyRotSpeed.X, skyRotSpeed.Y, skyRotSpeed.Z} end,
    load = function(v) if type(v)=="table" then skyRotSpeed=Vector3.new(v[1] or 0, v[2] or 0, v[3] or 0) end end
}

DraxUI.UpdateSecondaryColorPickers()

-- Character tab
HITBOX_PART_GROUPS = {
    HumanoidRootPart = {"HumanoidRootPart"},
    Head             = {"Head", "FakeHead"},
    Torso            = {"UpperTorso","LowerTorso","Torso"},
    Arms             = {"LeftUpperArm","LeftLowerArm","LeftHand","RightUpperArm","RightLowerArm","RightHand","Left Arm","Right Arm"},
    Legs             = {"LeftUpperLeg","LeftLowerLeg","LeftFoot","RightUpperLeg","RightLowerLeg","RightFoot","Left Leg","Right Leg"},
}
HITBOX_GROUPS = {"HumanoidRootPart","Head","Torso","Arms","Legs"}

local _vizPurple = Color3.fromRGB(145, 120, 240)
hbCfg = { Enable=false, Visualize=false, TeamCheck=false, HealthCheck=true, Size=6.5, Transparency=1, Massless=false, Collide=true,
    VizColor = _vizPurple, VizHidColor = _vizPurple,
    VizBox = true, VizOutline = true,
    VizOutlineColor = _vizPurple, VizOutlineHidColor = _vizPurple,
    VizType = "Corners", VizCornersSize = 0.28 }
hbLastVizColor  = nil
hbLastVizHidColor = nil
hbSelParts = {[1]=true,[2]=true,[3]=false,[4]=false,[5]=false}

hbCache = {}  -- [userId][partName] = {size, trans} original values
hbExpandRS = nil  -- single RenderStepped connection for all players

-- Visualization state
VIZ_HALF_CORNERS = {
    Vector3.new(-1,-1,-1), Vector3.new( 1,-1,-1),
    Vector3.new(-1, 1,-1), Vector3.new( 1, 1,-1),
    Vector3.new(-1,-1, 1), Vector3.new( 1,-1, 1),
    Vector3.new(-1, 1, 1), Vector3.new( 1, 1, 1),
}
VIZ_EDGES = {
    {1,2},{3,4},{5,6},{7,8},
    {1,3},{2,4},{5,7},{6,8},
    {1,5},{2,6},{3,7},{4,8},
}
hbVizState   = {}  -- [uid][partName] = {adorn, lines={24×Line}}
hbVizRS      = nil
hbLastAccent = nil

-- Reusable buffers to avoid per-frame table/array allocations inside tight loops.
local _hbPartsBuf = {}           -- for hbGetParts — safe: inner ipairs always completes before next call
local _hbWcBuf  = {}             -- 8-slot world-corner buffer for hbVizRS
local _hbScBuf  = {}             -- 8-slot screen-pos buffer for hbVizRS
local _hbSvBuf  = {}             -- 8-slot screen-visible buffer for hbVizRS
local _hbPlayerList = {}         -- cached Players list; avoids GetPlayers() every frame in hbExpandRS
for _i = 1, 8 do _hbWcBuf[_i] = Vector3.new(0,0,0); _hbScBuf[_i] = Vector2.new(0,0); _hbSvBuf[_i] = false end

function hbVizStartRS()
    if hbVizRS then return end
    hbVizRS = game:GetService("RunService").RenderStepped:Connect(function()
        local cam = workspace.CurrentCamera
        local camPos = cam.CFrame.Position
        local vizType = hbCfg.VizType or "Corners"
        local cornerRatio = hbCfg.VizCornersSize or 0.28
        for uid, parts in pairs(hbVizState) do
            for _, s in pairs(parts) do
                local part = s.part
                if not part or not part.Parent then
                    for _, ln in ipairs(s.lines) do ln.Visible = false end
                else
                    if s.adorn and s.adorn.Parent then s.adorn.Size = part.Size end
                    -- Visibility raycast - only run if VisibleCheck is enabled
                    local isVisible = true
                    local notRenderMode = Config.Global.VisibleCheck.Enable and Config.Global.RaycastParse and Config.Global.VisibleCheck.Mode == "Render"
                    if notRenderMode or (Config.Global.VisibleCheck.Enable and Config.Global.RaycastParse) then
                        local partPos = part.Position
                        local dir = partPos - camPos
                        local rc = doRaycast(camPos, dir)
                        isVisible = not rc or rc.Instance == part or (rc.Instance and rc.Instance:IsDescendantOf(part.Parent))
                    end
                    if notRenderMode and not isVisible then
                        if s.adorn and s.adorn.Parent then s.adorn.Transparency = 1 end
                        for _, ln in ipairs(s.lines) do ln.Visible = false end
                        continue
                    end
                    if s.adorn and s.adorn.Parent then s.adorn.Transparency = (hbCfg.VizBox and 0.7 or 1) end
                    -- Apply adorn color based on visibility
                    local adorColor = isVisible and (hbCfg.VizColor or Color3.fromRGB(145,120,240)) or (hbCfg.VizHidColor or Color3.fromRGB(145,120,240))
                    local lineColor = isVisible and (hbCfg.VizOutlineColor or Color3.fromRGB(145,120,240)) or (hbCfg.VizOutlineHidColor or Color3.fromRGB(145,120,240))
                    if s.adorn and s.adorn.Parent then s.adorn.Color3 = adorColor end
                    for _, ln in ipairs(s.lines) do ln.Color = lineColor end
                    -- Project corners — reuse module-level buffers to avoid 3 table + 16 userdata allocs per part per frame
                    local cf, hs = part.CFrame, part.Size * 0.5
                    for _ci, hcv in ipairs(VIZ_HALF_CORNERS) do
                        _hbWcBuf[_ci] = cf:PointToWorldSpace(Vector3.new(hcv.X*hs.X, hcv.Y*hs.Y, hcv.Z*hs.Z))
                    end
                    for _ci = 1, 8 do
                        local sp = cam:WorldToViewportPoint(_hbWcBuf[_ci])
                        _hbScBuf[_ci] = Vector2.new(sp.X, sp.Y); _hbSvBuf[_ci] = sp.Z > 0
                    end
                    local sc, sv = _hbScBuf, _hbSvBuf
                    local li = 1
                    for _, e in ipairs(VIZ_EDGES) do
                        local l1, l2 = s.lines[li], s.lines[li+1]; li += 2
                        if sv[e[1]] and sv[e[2]] then
                            local pa, pb = sc[e[1]], sc[e[2]]
                            local d = pb - pa; local len = d.Magnitude
                            if len > 1 then
                                if vizType == "Full" then
                                    l1.From=pa; l1.To=pb; l1.Visible=true
                                    l2.Visible=false
                                else
                                    local seg = len * cornerRatio
                                    local u = d.Unit * seg
                                    l1.From=pa; l1.To=pa+u; l1.Visible=true
                                    l2.From=pb; l2.To=pb-u; l2.Visible=true
                                end
                            else l1.Visible=false; l2.Visible=false end
                        else l1.Visible=false; l2.Visible=false end
                    end
                    -- Apply VizOutline toggle
                    if not hbCfg.VizOutline then
                        for _, ln in ipairs(s.lines) do ln.Visible = false end
                    end
                end
            end
        end
    end)
end

function hbVizStopRS()
    if hbVizRS then hbVizRS:Disconnect(); hbVizRS = nil end
end

function hbVizDestroyPart(uid, partName)
    if not hbVizState[uid] or not hbVizState[uid][partName] then return end
    local s = hbVizState[uid][partName]
    pcall(function() s.adorn:Destroy() end)
    for _, ln in ipairs(s.lines) do pcall(function() ln:Remove() end) end
    hbVizState[uid][partName] = nil
end

function hbVizDestroyPlayer(uid)
    if not hbVizState[uid] then return end
    for pn in pairs(hbVizState[uid]) do hbVizDestroyPart(uid, pn) end
    hbVizState[uid] = nil
end

function hbVizDestroyAll()
    for uid in pairs(hbVizState) do hbVizDestroyPlayer(uid) end
end

function hbVizCreatePart(uid, part)
    if not hbCfg.Enable or not hbCfg.Visualize then return end
    if not hbCfg.Enable or not hbCfg.Visualize then return end
    if not hbVizState[uid] then hbVizState[uid] = {} end
    if hbVizState[uid][part.Name] then return end
    local adorn = Instance.new("BoxHandleAdornment")
    adorn.Size        = part.Size
    local _vp = Color3.fromRGB(145,120,240)
    adorn.Color3      = hbCfg.VizHidColor or _vp
    adorn.Transparency = hbCfg.VizBox and 0.7 or 1
    adorn.AlwaysOnTop = true
    adorn.ZIndex      = 5
    adorn.Adornee     = part
    adorn.Parent      = part
    local lines = {}
    for i = 1, 24 do
        local ln      = Drawing.new("Line")
        ln.Thickness  = 1.5
        ln.Color      = hbCfg.VizOutlineColor or _vp
        ln.ZIndex     = 6
        ln.Visible    = false
        table.insert(lines, ln)
    end
    hbVizState[uid][part.Name] = {adorn=adorn, lines=lines, part=part}
end

function hbDisconn(uid)
    -- no-op: signal connections replaced by RenderStepped loop
end

function hbGetParts(char, groupName)
    table.clear(_hbPartsBuf)
    for _, pn in ipairs(HITBOX_PART_GROUPS[groupName] or {}) do
        local p = char:FindFirstChild(pn)
        if p and p:IsA("BasePart") then _hbPartsBuf[#_hbPartsBuf + 1] = p end
    end
    return _hbPartsBuf
end

function hbApplyPlayer(player)
    if player == game.Players.LocalPlayer then return end
    if not hbCfg.Enable then return end
    local char = player.Character; if not char then return end
    if hbCfg.TeamCheck then
        local ok, same = pcall(function() return player.Team == game.Players.LocalPlayer.Team end)
        if ok and same then return end
    end
    if hbCfg.HealthCheck then
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum and hum.Health <= 0 then return end
    end
    local uid = player.UserId
    hbVizDestroyPlayer(uid)
    if not hbCache[uid] then hbCache[uid] = {} end
    -- Cache original values (only on first apply per part)
    for i, sel in ipairs(hbSelParts) do
        if sel then
            for _, part in ipairs(hbGetParts(char, HITBOX_GROUPS[i])) do
                if not hbCache[uid][part.Name] then
                    hbCache[uid][part.Name] = { size=part.Size, trans=part.Transparency }
                end
            end
        end
    end
    if hbCfg.Visualize then
        for i, sel in ipairs(hbSelParts) do
            if sel then
                for _, part in ipairs(hbGetParts(char, HITBOX_GROUPS[i])) do
                    hbVizCreatePart(uid, part)
                end
            end
        end
        hbVizStartRS()
    end
end

function hbRestorePlayer(uid, char)
    hbVizDestroyPlayer(uid)
    if not char or not hbCache[uid] then hbCache[uid] = nil; return end
    for _, group in ipairs(HITBOX_GROUPS) do
        for _, part in ipairs(hbGetParts(char, group)) do
            local orig = hbCache[uid][part.Name]
            if orig then
                part.Size = orig.size
                part.Transparency = orig.trans
            end
            part.CanCollide = true
            part.Massless = false
        end
    end
    hbCache[uid] = nil
    local anyViz = false; for _ in pairs(hbVizState) do anyViz = true; break end
    if not anyViz then hbVizStopRS() end
end

function hbApplyAll()
    -- Start RenderStepped loop that forces hitbox sizes every frame (executor thread wins over game resets)
    if not hbExpandRS then
        local _lp = game.Players.LocalPlayer
        hbExpandRS = game:GetService("RunService").RenderStepped:Connect(function()
            if not hbCfg.Enable then return end
            local newSz = Vector3.new(hbCfg.Size, hbCfg.Size, hbCfg.Size)
            for _, pl in ipairs(_hbPlayerList) do
                if pl == _lp then continue end
                local char = pl.Character
                if not char then continue end
                if hbCfg.TeamCheck then
                    local ok, same = pcall(function() return pl.Team == _lp.Team end)
                    if ok and same then continue end
                end
                if hbCfg.HealthCheck then
                    local hum = char:FindFirstChildOfClass("Humanoid")
                    if hum and hum.Health <= 0 then continue end
                end
                for i, sel in ipairs(hbSelParts) do
                    if sel then
                        for _, part in ipairs(hbGetParts(char, HITBOX_GROUPS[i])) do
                            if part.Size ~= newSz then part.Size = newSz end
                            if not hbCfg.Collide and part.CanCollide then part.CanCollide = false end
                            if hbCfg.Collide and not part.CanCollide then part.CanCollide = true end
                            if hbCfg.Massless and not part.Massless then part.Massless = true end
                            if not hbCfg.Massless and part.Massless then part.Massless = false end
                            if part.Transparency ~= hbCfg.Transparency then part.Transparency = hbCfg.Transparency end
                        end
                    end
                end
            end
        end)
    end
    for _, pl in ipairs(game.Players:GetPlayers()) do hbApplyPlayer(pl) end
end

function hbRestoreAll()
    if hbExpandRS then hbExpandRS:Disconnect(); hbExpandRS = nil end
    for _, pl in ipairs(game.Players:GetPlayers()) do
        hbRestorePlayer(pl.UserId, pl.Character)
    end
end

local hbCharConns = {}  -- [userId] = CharacterAdded connection

function hbConnectPlayer(pl)
    local function onCharAdded(char)
        -- Anti-Fling: apply collision group to new character
        if antiFlingEnabled then antiFlingApply(pl) end
        if not char:WaitForChild("HumanoidRootPart", 5) then return end
        task.wait(0.05)
        if hbCfg.Enable then hbApplyPlayer(pl) end
        -- Re-apply after ~0.5s in case avatar appearance finishes loading and resizes parts
        task.delay(0.5, function()
            if hbCfg.Enable and pl.Character == char then hbApplyPlayer(pl) end
        end)
    end
    -- Disconnect previous connection for this player if any (guards against double-call)
    if hbCharConns[pl.UserId] then
        pcall(function() hbCharConns[pl.UserId]:Disconnect() end)
    end
    hbCharConns[pl.UserId] = pl.CharacterAdded:Connect(onCharAdded)
    -- If character already exists when this function is called (player was already spawned)
    if pl.Character then
        task.defer(function() onCharAdded(pl.Character) end)
    end
end

-- Seed _hbPlayerList with players already in-game, then keep it up to date.
for _, _pl in ipairs(game.Players:GetPlayers()) do
    if _pl ~= game.Players.LocalPlayer then
        _hbPlayerList[#_hbPlayerList + 1] = _pl
    end
end
game.Players.PlayerAdded:Connect(function(pl)
    if pl ~= game.Players.LocalPlayer then
        _hbPlayerList[#_hbPlayerList + 1] = pl
    end
    hbConnectPlayer(pl)
end)
-- Connect players already in the game when the script ran
for _, pl in ipairs(game.Players:GetPlayers()) do
    if pl ~= game.Players.LocalPlayer then
        hbConnectPlayer(pl)
    end
end
game.Players.PlayerRemoving:Connect(function(pl)
    -- Remove from cached player list
    for i = #_hbPlayerList, 1, -1 do
        if _hbPlayerList[i] == pl then table.remove(_hbPlayerList, i) break end
    end
    hbVizDestroyPlayer(pl.UserId)
    hbDisconn(pl.UserId); hbCache[pl.UserId] = nil
    -- Disconnect the CharacterAdded connection for this player
    if hbCharConns[pl.UserId] then
        pcall(function() hbCharConns[pl.UserId]:Disconnect() end)
        hbCharConns[pl.UserId] = nil
    end
end)

char_sec = tab4:Section("Left", "Hitbox Expander")

DraxUI.RegCfg("hb.enable", char_sec:CheckboxKeybind("Hitbox Expander", false, nil, function(v)
    hbCfg.Enable = v
    if v then hbApplyAll() else hbRestoreAll() end
end, function()
    hbCfg.Enable = not hbCfg.Enable
    if hbCfg.Enable then hbApplyAll() else hbRestoreAll() end
end, "always", {"toggle","hold","always"}))
do
    local hbVizWidget = char_sec:CheckboxColor("Visualize", false,
        hbCfg.VizColor, hbCfg.VizHidColor,
        function(v)
            hbCfg.Visualize = v
            if hbCfg.Enable then hbRestoreAll(); hbApplyAll() end
        end,
        function(c) hbCfg.VizColor = c end,
        function(c) hbCfg.VizHidColor = c end
    )
    hbVizWidget:AddSettings(function(p)
        local _dp = Color3.fromRGB(145,120,240)
        p:Checkbox("Box", hbCfg.VizBox, function(v) hbCfg.VizBox = v end)
        local outlineWidget = p:CheckboxColor("Outline", hbCfg.VizOutline, hbCfg.VizOutlineColor or _dp, 1,
            function(v) hbCfg.VizOutline = v end,
            function(c) hbCfg.VizOutlineColor = c end,
            hbCfg.VizOutlineHidColor or _dp,
            function(c) hbCfg.VizOutlineHidColor = c end
        )
        -- Force outline color pickers to always show both colors (not dependent on VisibleCheck)
        if outlineWidget.HidSq then
            outlineWidget.HidSq.Visible = true
            local hidGl = outlineWidget.HidSq:FindFirstChild("Bloom")
            if hidGl then DraxUI.SetGlowVisibility(hidGl, true) end
        end
        local csSlider
        p:Droplet("Type", {"Full", "Corners"}, hbCfg.VizType == "Full" and 1 or 2, function(v)
            hbCfg.VizType = v == 1 and "Full" or "Corners"
            if csSlider then csSlider.Frame.Visible = (hbCfg.VizType == "Corners") end
        end)
        csSlider = p:Slider("Corners Size", 0.05, 0.5, hbCfg.VizCornersSize or 0.28, "%.2f", function(v) hbCfg.VizCornersSize = v end)
        csSlider.Frame.Visible = (hbCfg.VizType == "Corners")
    end)
    DraxUI.RegCfg("hb.viz", hbVizWidget)
    DraxUI.ConfigWidgets["hb.vizbox"]     = {get=function() return hbCfg.VizBox end, load=function(d) if type(d)=="boolean" then hbCfg.VizBox=d end end}
    DraxUI.ConfigWidgets["hb.vizoutline"] = {
        get  = function() return {en=hbCfg.VizOutline, c=hbCfg.VizOutlineColor, hc=hbCfg.VizOutlineHidColor} end,
        load = function(d)
            if type(d) ~= "table" then return end
            if type(d.en) == "boolean" then hbCfg.VizOutline = d.en end
            if typeof(d.c)  == "Color3" then hbCfg.VizOutlineColor    = d.c  end
            if typeof(d.hc) == "Color3" then hbCfg.VizOutlineHidColor = d.hc end
        end,
    }
    DraxUI.ConfigWidgets["hb.viztype"]    = {get=function() return hbCfg.VizType end, load=function(d) if type(d)=="string" then hbCfg.VizType=d end end}
    DraxUI.ConfigWidgets["hb.vizcorners"] = {get=function() return hbCfg.VizCornersSize end, load=function(d) if type(d)=="number" then hbCfg.VizCornersSize=d end end}
end
DraxUI.RegCfg("hb.teamcheck", char_sec:Checkbox("Team Check", false, function(v)
    hbCfg.TeamCheck = v
    if hbCfg.Enable then hbRestoreAll(); hbApplyAll() end
end))
DraxUI.RegCfg("hb.size", char_sec:Slider("Hitbox Size", 1, 100, hbCfg.Size, "%.1f", function(v)
    hbCfg.Size = v
    if hbCfg.Enable then hbRestoreAll(); hbApplyAll() end
end))
DraxUI.RegCfg("hb.transparency", char_sec:Slider("Hitboxes Transparency", 0, 1, hbCfg.Transparency, "%.2f", function(v)
    hbCfg.Transparency = v
    if hbCfg.Enable then hbRestoreAll(); hbApplyAll() end
end))
DraxUI.RegCfg("hb.parts", char_sec:MultiDropdown("Parts", HITBOX_GROUPS, hbSelParts, function(sel)
    if hbCfg.Enable then hbRestoreAll() end
    for i = 1, #HITBOX_GROUPS do hbSelParts[i] = sel[i] end
    if hbCfg.Enable then hbApplyAll() end
end))
DraxUI.RegCfg("hb.massless", char_sec:Checkbox("Hitbox Massless", hbCfg.Massless, function(v)
    hbCfg.Massless = v
end))
DraxUI.RegCfg("hb.collide", char_sec:Checkbox("Hitbox Collide", hbCfg.Collide, function(v)
    hbCfg.Collide = v
end))

lp_sec = tab4:Section("Right", "Local Player")

-- Anti Fling (CanCollide method — forces other players' parts non-collidable every physics step)
antiFlingEnabled   = false
antiFlingConns     = {}   -- flat list of RBXScriptConnections
local antiFlingStepConn = nil

local function afApplyChar(char)
    if not char then return end
    task.defer(function()
        for _, p in ipairs(char:GetDescendants()) do
            if p:IsA("BasePart") then pcall(function() p.CanCollide = false end) end
        end
    end)
end

function antiFlingApply(pl)
    if not pl or pl == LocalPlayer then return end
    afApplyChar(pl.Character)
    table.insert(antiFlingConns, pl.CharacterAdded:Connect(afApplyChar))
end

local function afEnable()
    if antiFlingStepConn then return end
    for _, pl in ipairs(Players:GetPlayers()) do
        if pl ~= LocalPlayer then antiFlingApply(pl) end
    end
    table.insert(antiFlingConns, Players.PlayerAdded:Connect(function(pl)
        if pl == LocalPlayer then return end
        antiFlingApply(pl)
    end))
    -- Enforce every physics step so server replication can't re-enable collision
    antiFlingStepConn = RunService.Stepped:Connect(function()
        for _, pl in ipairs(Players:GetPlayers()) do
            if pl == LocalPlayer then continue end
            local char = pl.Character; if not char then continue end
            for _, p in ipairs(char:GetDescendants()) do
                if p:IsA("BasePart") and p.CanCollide then
                    pcall(function() p.CanCollide = false end)
                end
            end
        end
    end)
end

local function afDisable()
    if antiFlingStepConn then antiFlingStepConn:Disconnect(); antiFlingStepConn = nil end
    for _, co in ipairs(antiFlingConns) do pcall(function() co:Disconnect() end) end
    antiFlingConns = {}
end

DraxUI.RegCfg("lp.antifling", lp_sec:Checkbox("Anti Fling", false, function(v)
    antiFlingEnabled = v
    if v then afEnable() else afDisable() end
end))


-- Only R6 and R15 body parts - no accessories or tools
NOCLIP_BODY_PARTS = {
    ["Head"] = true, ["Torso"] = true, ["Left Arm"] = true, ["Right Arm"] = true, ["Left Leg"] = true, ["Right Leg"] = true,
    ["UpperTorso"] = true, ["LowerTorso"] = true, ["LeftUpperArm"] = true, ["LeftLowerArm"] = true, ["LeftHand"] = true,
    ["RightUpperArm"] = true, ["RightLowerArm"] = true, ["RightHand"] = true, ["LeftUpperLeg"] = true, ["LeftLowerLeg"] = true,
    ["LeftFoot"] = true, ["RightUpperLeg"] = true, ["RightLowerLeg"] = true, ["RightFoot"] = true
}
noclipActive   = false
noclipRS       = nil
noclipCache    = {}  -- Store original CanCollide values for each part

function startNoclip()
    noclipActive = true
    if noclipRS then return end
    local char = LocalPlayer.Character; if not char then return end
    
    -- Only disable collision for body parts (R6/R15), not accessories/tools
    for _, child in ipairs(char:GetChildren()) do
        if child:IsA("BasePart") and NOCLIP_BODY_PARTS[child.Name] then
            noclipCache[child] = child.CanCollide
            child.CanCollide = false
        end
    end
    
    noclipRS = RunService.Stepped:Connect(function()
        local c2 = LocalPlayer.Character; if not c2 then return end
        for _, child in ipairs(c2:GetChildren()) do
            if child:IsA("BasePart") and NOCLIP_BODY_PARTS[child.Name] then
                if child.CanCollide then
                    child.CanCollide = false
                end
            end
        end
    end)
end

function stopNoclip()
    noclipActive = false
    if noclipRS then noclipRS:Disconnect(); noclipRS = nil end
    
    -- Restore original CanCollide values
    for part, originalValue in pairs(noclipCache) do
        if part and part.Parent then
            part.CanCollide = originalValue
        end
    end
    table.clear(noclipCache)
end

DraxUI.RegCfg("lp.noclip", lp_sec:CheckboxKeybind("Noclip", false, nil,
    function(armed)
        if armed then
            if not noclipActive then startNoclip() end
        else
            if noclipActive then stopNoclip() end
        end
    end,
    function() if noclipActive then stopNoclip() else startNoclip() end end,
    nil, {"toggle","hold","always"}
))

-- Inf Jump
infJumpEnabled = false
UIS.InputBegan:Connect(function(inp, gpe)
    if gpe then return end
    if not infJumpEnabled then return end
    if inp.KeyCode ~= Enum.KeyCode.Space then return end
    local char = LocalPlayer.Character; if not char then return end
    local hum  = char:FindFirstChildOfClass("Humanoid"); if not hum then return end
    if hum.FloorMaterial == Enum.Material.Air then
        hum:ChangeState(Enum.HumanoidStateType.Jumping)
    end
end)
DraxUI.RegCfg("lp.infjump", lp_sec:Checkbox("Inf Jump", false, function(v)
    infJumpEnabled = v
end))

-- Click TP
clickTpArmed     = false
clickTpRS        = nil
clickTpClickConn = nil

-- 24 lines = 3D ring, 4 lines = 3D crosshair arms
clickTpDraw = {}
for _i = 1, 28 do
    local _l     = Drawing.new("Line")
    _l.Thickness = 1.5
    _l.Color     = DraxUI.AccentColor
    _l.Visible   = false
    table.insert(clickTpDraw, _l)
end

clickRayParams = RaycastParams.new()
clickRayParams.FilterType = Enum.RaycastFilterType.Exclude

function hideClickTpDraw()
    for _, _l in ipairs(clickTpDraw) do _l.Visible = false end
end

function startClickTp()
    clickTpArmed = true
    clickTpRS = RunService.RenderStepped:Connect(function()
        local mp   = UIS:GetMouseLocation()
        local cam  = workspace.CurrentCamera
        local uray = cam:ViewportPointToRay(mp.X, mp.Y)
        local res  = workspace:Raycast(uray.Origin, uray.Direction * 2000, clickRayParams)
        if res then
            local ac     = DraxUI.AccentColor
            local norm   = res.Normal
            local center = res.Position + norm * 0.05
            local wUp    = math.abs(norm:Dot(Vector3.new(0,1,0))) > 0.98 and Vector3.new(1,0,0) or Vector3.new(0,1,0)
            local t1     = norm:Cross(wUp).Unit
            local t2     = norm:Cross(t1).Unit
            local Rring  = 1.4   -- world units radius of ring
            local Rcin   = 0.0   -- crosshair from center
            local Rcout  = Rring -- crosshair to ring edge
            local N      = 24
            for i3 = 1, N do
                local a1 = (i3-1)/N * math.pi*2
                local a2 = i3/N     * math.pi*2
                local p1 = center + t1*math.cos(a1)*Rring + t2*math.sin(a1)*Rring
                local p2 = center + t1*math.cos(a2)*Rring + t2*math.sin(a2)*Rring
                local v1 = cam:WorldToViewportPoint(p1)
                local v2 = cam:WorldToViewportPoint(p2)
                local ln = clickTpDraw[i3]
                ln.Color = ac
                if v1.Z > 0 and v2.Z > 0 then
                    ln.From = Vector2.new(v1.X, v1.Y); ln.To = Vector2.new(v2.X, v2.Y); ln.Visible = true
                else ln.Visible = false end
            end
            local crossDirs = {t1, -t1, t2, -t2}
            for i3 = 1, 4 do
                local dir = crossDirs[i3]
                local p1  = center + dir * Rcin
                local p2  = center + dir * Rcout
                local v1  = cam:WorldToViewportPoint(p1)
                local v2  = cam:WorldToViewportPoint(p2)
                local ln  = clickTpDraw[24+i3]
                ln.Color  = ac
                if v1.Z > 0 and v2.Z > 0 then
                    ln.From = Vector2.new(v1.X, v1.Y); ln.To = Vector2.new(v2.X, v2.Y); ln.Visible = true
                else ln.Visible = false end
            end
        else
            hideClickTpDraw()
        end
    end)
    clickTpClickConn = UIS.InputBegan:Connect(function(inp, gpe)
        if gpe or not clickTpArmed then return end
        if inp.UserInputType ~= Enum.UserInputType.MouseButton1 then return end
        local mp2  = UIS:GetMouseLocation()
        local cam2 = workspace.CurrentCamera
        local ur2  = cam2:ViewportPointToRay(mp2.X, mp2.Y)
        local r2   = workspace:Raycast(ur2.Origin, ur2.Direction * 2000, clickRayParams)
        if r2 then
            local char2 = LocalPlayer.Character
            if char2 and char2:FindFirstChild("HumanoidRootPart") then
                local hrp2 = char2.HumanoidRootPart
                hrp2.CFrame = CFrame.new(r2.Position + r2.Normal * 3) * hrp2.CFrame.Rotation
            end
        end
    end)
end

function stopClickTp()
    clickTpArmed = false
    if clickTpRS        then clickTpRS:Disconnect();        clickTpRS        = nil end
    if clickTpClickConn then clickTpClickConn:Disconnect(); clickTpClickConn = nil end
    hideClickTpDraw()
end

DraxUI.RegCfg("lp.clicktp", lp_sec:CheckboxKeybind("Click TP", false, nil,
    function(armed)
        if armed then
            if not clickTpArmed then startClickTp() end
        else
            if clickTpArmed then stopClickTp() end
        end
    end,
    function() if clickTpArmed then stopClickTp() else startClickTp() end end
))

-- Speed
speedActive    = false
speedMethod    = "Velocity"
speedAmount    = 50
origWalkSpeed  = nil
speedRS        = nil

function stopSpeed()
    speedActive = false
    if speedRS then speedRS:Disconnect(); speedRS = nil end
    local char = LocalPlayer.Character; if not char then return end
    local hum  = char:FindFirstChildOfClass("Humanoid"); if not hum then return end
    if origWalkSpeed then hum.WalkSpeed = origWalkSpeed; origWalkSpeed = nil end
end

function startSpeed()
    speedActive = true
    local char = LocalPlayer.Character; if not char then return end
    local hum  = char:FindFirstChildOfClass("Humanoid"); if not hum then return end
    if speedMethod == "Velocity" then
        origWalkSpeed = hum.WalkSpeed
        hum.WalkSpeed = speedAmount
    elseif speedMethod == "Insta Velocity" then
        origWalkSpeed = hum.WalkSpeed
        hum.WalkSpeed = speedAmount
        if speedRS then speedRS:Disconnect(); speedRS = nil end
        speedRS = RunService.Stepped:Connect(function()
            local c2  = LocalPlayer.Character; if not c2 then return end
            local hrp = c2:FindFirstChild("HumanoidRootPart"); if not hrp then return end
            local h2  = c2:FindFirstChildOfClass("Humanoid"); if not h2 then return end
            if h2.MoveDirection.Magnitude > 0.01 then
                local dir = Vector3.new(h2.MoveDirection.X, 0, h2.MoveDirection.Z).Unit
                hrp.AssemblyLinearVelocity = Vector3.new(dir.X * speedAmount, hrp.AssemblyLinearVelocity.Y, dir.Z * speedAmount)
            end
        end)
    else -- Position
        if speedRS then speedRS:Disconnect(); speedRS = nil end
        speedRS = RunService.Stepped:Connect(function(_, dt)
            local c2  = LocalPlayer.Character; if not c2 then return end
            local hrp = c2:FindFirstChild("HumanoidRootPart"); if not hrp then return end
            local h2  = c2:FindFirstChildOfClass("Humanoid"); if not h2 or h2.MoveDirection.Magnitude < 0.1 then return end
            local dir = Vector3.new(h2.MoveDirection.X, 0, h2.MoveDirection.Z)
            if dir.Magnitude > 0.01 then
                hrp.CFrame = hrp.CFrame + dir.Unit * speedAmount * dt
            end
        end)
    end
end

DraxUI.RegCfg("lp.speed", lp_sec:CheckboxKeybind("Speed", false, nil,
    function(armed)
        if armed then
            if not speedActive then startSpeed() end
        else
            if speedActive then stopSpeed() end
        end
    end,
    function() if speedActive then stopSpeed() else startSpeed() end end,
    nil, {"toggle","hold","always"}
))
DraxUI.RegCfg("lp.speedmethod", lp_sec:Dropdown("Speed Method", {"Velocity", "Insta Velocity", "Position"}, 1, function(idx)
    local prev = speedMethod
    speedMethod = ({"Velocity", "Insta Velocity", "Position"})[idx]
    if speedActive and prev ~= speedMethod then stopSpeed(); startSpeed() end
end))
DraxUI.RegCfg("lp.speedamt", lp_sec:Slider("Speed Amount", 1, 500, 50, "%.0f", function(v)
    speedAmount = v
    if speedActive and (speedMethod == "Velocity" or speedMethod == "Insta Velocity") then
        local char = LocalPlayer.Character; if not char then return end
        local hum  = char:FindFirstChildOfClass("Humanoid"); if not hum then return end
        hum.WalkSpeed = v
    end
end))

-- Flight
flightActive      = false
flightMethod      = "Velocity"
flightAmount      = 50
flightCamAngles      = false
flightCamAnglesVert  = true  -- space/ctrl follow camera pitch
flightSpoofAnim      = false
flightSpoofAnimIdx   = 1
flightSpoofState     = false
flightSpoofIdx    = 1
flightRS          = nil
flightSpoofConn   = nil  -- AnimationPlayed interception connection
flightSpoofTrack  = nil  -- the currently playing spoof animation track

-- Maps dropdown index to {animFolder, animId} paths inside the Animate script
FLIGHT_ANIM_MAP = {
    {"idle",     "Animation1"},  -- Idle
    {"run",      "RunAnim"},     -- Running
    {"fall",     "FallAnim"},    -- Falling
    {"jump",     "JumpAnim"},    -- Jumping
    {"swimidle", "SwimIdle"},    -- Swimming
    nil,                          -- PlatformStand (handled separately)
}
FLIGHT_HSTATE_MAP = {
    Enum.HumanoidStateType.Running,   -- Idle (engine plays idle anim in Running state)
    Enum.HumanoidStateType.Running,   -- Running
    Enum.HumanoidStateType.Freefall,  -- Falling
    Enum.HumanoidStateType.Jumping,   -- Jumping
    Enum.HumanoidStateType.Swimming,  -- Swimming
    -- PlatformStand handled via hum.PlatformStand
}

function stopFlightAnimSpoof()
    if flightSpoofTrack then pcall(function() flightSpoofTrack:Stop() end); flightSpoofTrack = nil end
end

function startFlightAnimSpoof()
    stopFlightAnimSpoof()
    if not flightSpoofAnim then return end
    local char = LocalPlayer.Character; if not char then return end
    local hum = char:FindFirstChildOfClass("Humanoid"); if not hum then return end
    local animPath = FLIGHT_ANIM_MAP[flightSpoofAnimIdx]; if not animPath then return end
    local animate = char:FindFirstChild("Animate"); if not animate then return end
    local animator = hum:FindFirstChildOfClass("Animator"); if not animator then return end
    local folder = animate:FindFirstChild(animPath[1]); if not folder then return end
    local animObj = folder:FindFirstChild(animPath[2]); if not animObj then return end
    local targetId = animObj.AnimationId
    local anim = Instance.new("Animation")
    anim.AnimationId = targetId
    local track = animator:LoadAnimation(anim)
    track.Priority = Enum.AnimationPriority.Action4
    track:Play()
    flightSpoofTrack = track
end

function stopFlightSpoof()
    if flightSpoofConn then flightSpoofConn:Disconnect(); flightSpoofConn = nil end
    local char = LocalPlayer.Character; if not char then return end
    local hum = char:FindFirstChildOfClass("Humanoid"); if not hum then return end
    hum.PlatformStand = false
end

function startFlightSpoof()
    stopFlightSpoof()
    if not flightSpoofState then return end
    local char = LocalPlayer.Character; if not char then return end
    local hum = char:FindFirstChildOfClass("Humanoid"); if not hum then return end
    if flightSpoofIdx == 6 then hum.PlatformStand = true; return end
    -- Drive HumanoidStateType every physics step to match the chosen spoof state
    local targetState = FLIGHT_HSTATE_MAP[flightSpoofIdx]
    if targetState then
        flightSpoofConn = RunService.Stepped:Connect(function()
            if not flightActive or not flightSpoofState then return end
            local c = LocalPlayer.Character; if not c then return end
            local h = c:FindFirstChildOfClass("Humanoid"); if not h then return end
            pcall(function() h:ChangeState(targetState) end)
        end)
    end
end

function stopFlight()
    flightActive = false
    if flightRS then flightRS:Disconnect(); flightRS = nil end
    stopFlightSpoof()
    stopFlightAnimSpoof()
end

function startFlight()
    flightActive = true
    local char = LocalPlayer.Character; if not char then return end
    local hum  = char:FindFirstChildOfClass("Humanoid"); if not hum then return end
    if flightRS then flightRS:Disconnect(); flightRS = nil end
    if flightSpoofState then startFlightSpoof() end
    if flightSpoofAnim then startFlightAnimSpoof() end
    flightRS = RunService.Stepped:Connect(function(_, dt)
        local c2  = LocalPlayer.Character; if not c2 then return end
        local hrp = c2:FindFirstChild("HumanoidRootPart"); if not hrp then return end
        local h2  = c2:FindFirstChildOfClass("Humanoid"); if not h2 then return end
        local camCF = workspace.CurrentCamera.CFrame
        local fwd, rgt
        if flightCamAngles then
            fwd = camCF.LookVector
            rgt = camCF.RightVector
        else
            fwd = Vector3.new(camCF.LookVector.X, 0, camCF.LookVector.Z)
            fwd = fwd.Magnitude > 0.01 and fwd.Unit or Vector3.zero
            rgt = Vector3.new(camCF.RightVector.X, 0, camCF.RightVector.Z)
            rgt = rgt.Magnitude > 0.01 and rgt.Unit or Vector3.zero
        end
        local md = Vector3.zero
        if UIS:IsKeyDown(Enum.KeyCode.W) then md = md + fwd end
        if UIS:IsKeyDown(Enum.KeyCode.S) then md = md - fwd end
        if UIS:IsKeyDown(Enum.KeyCode.A) then md = md - rgt end
        if UIS:IsKeyDown(Enum.KeyCode.D) then md = md + rgt end
        if UIS:IsKeyDown(Enum.KeyCode.Space) then
            md = md + (flightCamAngles and flightCamAnglesVert and camCF.UpVector or Vector3.new(0,1,0))
        end
        if UIS:IsKeyDown(Enum.KeyCode.LeftControl) or UIS:IsKeyDown(Enum.KeyCode.RightControl) then
            md = md - (flightCamAngles and flightCamAnglesVert and camCF.UpVector or Vector3.new(0,1,0))
        end
        local moving   = md.Magnitude > 0.01
        local flatDir  = Vector3.new(md.X, 0, md.Z)
        -- Rotate via angular velocity (avoids CFrame teleport jitter)
        local _, curYaw, _ = hrp.CFrame:ToEulerAnglesYXZ()
        local targetYaw
        if flatDir.Magnitude > 0.01 then
            targetYaw = math.atan2(-flatDir.X, -flatDir.Z)
        else
            targetYaw = curYaw
        end
        local diffYaw = math.atan2(math.sin(targetYaw - curYaw), math.cos(targetYaw - curYaw))
        hrp.AssemblyAngularVelocity = Vector3.new(0, diffYaw * 12, 0)
        -- Physics adds -gravity*dt to velocityY after Stepped; pre-add +gravity*dt to cancel sinking.
        local gravCompY = workspace.Gravity * dt
        if flightMethod == "Velocity" or flightMethod == "Insta Velocity" then
            if moving then
                local vel = md.Unit * flightAmount
                hrp.AssemblyLinearVelocity = Vector3.new(vel.X, vel.Y + gravCompY, vel.Z)
            else
                hrp.AssemblyLinearVelocity = Vector3.new(0, gravCompY, 0)
            end
        else -- Position: cancel gravity + move by CFrame offset
            hrp.AssemblyLinearVelocity = Vector3.new(0, gravCompY, 0)
            if moving then
                hrp.CFrame = CFrame.new(hrp.Position + md.Unit * flightAmount * dt) * CFrame.Angles(0, curYaw, 0)
            end
        end
    end)
end

DraxUI.RegCfg("lp.flight", lp_sec:CheckboxKeybind("Flight", false, nil,
    function(armed)
        if armed then
            if not flightActive then startFlight() end
        else
            if flightActive then stopFlight() end
        end
    end,
    function() if flightActive then stopFlight() else startFlight() end end,
    nil, {"toggle","hold","always"}
))
DraxUI.RegCfg("lp.camangles", lp_sec:Checkbox("Consider Camera Angles", false, function(v)
    flightCamAngles = v
    if camAnglesSubWidget then camAnglesSubWidget.Frame.Visible = v end
end))
camAnglesSubWidget = lp_sec:Checkbox("Space/Ctrl follow cam", true, function(v) flightCamAnglesVert = v end)
camAnglesSubWidget.Frame.Visible = false
DraxUI.RegCfg("lp.camvert", camAnglesSubWidget)
do local _w = lp_sec:CheckboxDropdown("Spoof Anim", false, {"Idle","Running","Falling","Jumping","Swimming"}, 1,
    function(v)
        flightSpoofAnim = v
        if flightActive then
            if v then startFlightAnimSpoof() else stopFlightAnimSpoof() end
        end
    end,
    function(idx)
        flightSpoofAnimIdx = idx
        if flightActive and flightSpoofAnim then startFlightAnimSpoof() end
    end); DraxUI.RegCfg("lp.spoofanim", _w) end
do local _w = lp_sec:CheckboxDropdown("Spoof State", false, {"Idle","Running","Falling","Jumping","Swimming","PlatformStand"}, 1,
    function(v)
        flightSpoofState = v
        if flightActive then
            if v then startFlightSpoof() else stopFlightSpoof() end
        end
    end,
    function(idx)
        flightSpoofIdx = idx
        if flightActive and flightSpoofState then startFlightSpoof() end
    end); DraxUI.RegCfg("lp.spoofstate", _w) end
DraxUI.RegCfg("lp.flymethod", lp_sec:Dropdown("Fly Method", {"Velocity", "Insta Velocity", "Position"}, 1, function(idx)
    local prev = flightMethod
    flightMethod = ({"Velocity", "Insta Velocity", "Position"})[idx]
    if flightActive and prev ~= flightMethod then stopFlight(); startFlight() end
end))
DraxUI.RegCfg("lp.flyamt", lp_sec:Slider("Fly Amount", 1, 500, 50, "%.0f", function(v)
    flightAmount = v
end))

-- Jump Power
jumpEnabled       = false
jumpAmount        = 50
origJumpPow       = nil
origUseJumpPower  = nil  -- track if we forced UseJumpPower on

-- Float (HipHeight)
floatEnabled  = false
floatAmount   = 5
origHipHeight = nil

-- Respawn re-apply hook for local player features
LocalPlayer.CharacterAdded:Connect(function(newChar)
    -- Speed (Velocity mode): WalkSpeed resets on respawn, re-apply
    if speedActive and speedMethod == "Velocity" then
        local hum = newChar:WaitForChild("Humanoid", 5)
        if not hum then return end
        origWalkSpeed = hum.WalkSpeed
        hum.WalkSpeed = speedAmount
    end
    -- Jump Power
    if jumpEnabled then
        local hum = newChar:WaitForChild("Humanoid", 5)
        if not hum then return end
        if not hum.UseJumpPower then
            origUseJumpPower = false
            hum.UseJumpPower = true
        end
        origJumpPow = hum.JumpPower
        hum.JumpPower = jumpAmount
    end
    -- Float / HipHeight
    if floatEnabled then
        local hum = newChar:WaitForChild("Humanoid", 5)
        if not hum then return end
        origHipHeight = hum.HipHeight
        hum.HipHeight = floatAmount
    end
    -- Hitbox expander: apply to local player too (game may put local player in others' hitbox lists)
    if hbCfg.Enable then
        task.wait(0.5)
        hbApplyPlayer(LocalPlayer)
    end
    -- Rebuild desync viz clone for the new character
    if desyncEnabled and desyncVizEnabled and desyncVizRigCharEnable and desyncVizMode == "Character" then
        desyncDestroyVizChar()
        task.spawn(function()
            -- wait until the new character is fully loaded
            newChar:WaitForChild("HumanoidRootPart", 10)
            task.wait()  -- one extra frame for motors/welds to settle
            desyncMakeVizChar()
        end)
    end
end)
DraxUI.RegCfg("lp.jumppower", lp_sec:Checkbox("Jump Power", false, function(v)
    jumpEnabled = v
    local char = LocalPlayer.Character; if not char then return end
    local hum  = char:FindFirstChildOfClass("Humanoid"); if not hum then return end
    if v then
        if not hum.UseJumpPower then
            origUseJumpPower = false
            hum.UseJumpPower = true
        end
        origJumpPow   = hum.JumpPower
        hum.JumpPower = jumpAmount
    else
        if origJumpPow then hum.JumpPower = origJumpPow; origJumpPow = nil end
        if origUseJumpPower == false then hum.UseJumpPower = false; origUseJumpPower = nil end
    end
end))
DraxUI.RegCfg("lp.jumpamt", lp_sec:Slider("Jump Amount", 1, 500, 50, "%.0f", function(v)
    jumpAmount = v
    if jumpEnabled then
        local char = LocalPlayer.Character
        local hum  = char and char:FindFirstChildOfClass("Humanoid")
        if hum then hum.JumpPower = v end
    end
end))
DraxUI.RegCfg("lp.float", lp_sec:Checkbox("Float", false, function(v)
    floatEnabled = v
    local char = LocalPlayer.Character; if not char then return end
    local hum  = char:FindFirstChildOfClass("Humanoid"); if not hum then return end
    if v then
        origHipHeight  = hum.HipHeight
        hum.HipHeight  = floatAmount
    else
        if origHipHeight then hum.HipHeight = origHipHeight; origHipHeight = nil end
    end
end))
DraxUI.RegCfg("lp.floatamt", lp_sec:Slider("Float Amount", -5, 50, 5, "%.1f", function(v)
    floatAmount = v
    if floatEnabled then
        local char = LocalPlayer.Character; if not char then return end
        local hum  = char:FindFirstChildOfClass("Humanoid"); if not hum then return end
        hum.HipHeight = v
    end
end))

-- ── Velocity Spoof ─────────────────────────────────────────────────────────
vel_sec = tab4:Section("Right", "Velocity Spoof")
velSpoofActive  = false
velSpoofX       = 0
velSpoofY       = 0
velSpoofZ       = 0
velSpoofMethod  = "Pred Breaker"
velSpoofConn    = nil
velSpoofCst     = nil  -- LinearVelocity constraint instance

local function _vsStop()
    velSpoofActive = false
    if velSpoofConn then velSpoofConn:Disconnect(); velSpoofConn = nil end
    if velSpoofCst  then pcall(function() velSpoofCst:Destroy() end); velSpoofCst = nil end
end

local function _vsStart()
    _vsStop()
    velSpoofActive = true
    if velSpoofMethod == "Pred Breaker" then
        velSpoofConn = RunService.Heartbeat:Connect(function()
            local char = LocalPlayer.Character; if not char then return end
            local hrp  = char:FindFirstChild("HumanoidRootPart"); if not hrp then return end
            local saved = hrp.AssemblyLinearVelocity
            hrp.AssemblyLinearVelocity = Vector3.new(velSpoofX, velSpoofY, velSpoofZ)
            RunService.RenderStepped:Wait()
            if hrp and hrp.Parent then hrp.AssemblyLinearVelocity = saved end
        end)
    elseif velSpoofMethod == "Assembly" then
        velSpoofConn = RunService.Stepped:Connect(function()
            local char = LocalPlayer.Character; if not char then return end
            local hrp  = char:FindFirstChild("HumanoidRootPart"); if not hrp then return end
            hrp.AssemblyLinearVelocity = Vector3.new(velSpoofX, velSpoofY, velSpoofZ)
        end)
    elseif velSpoofMethod == "BodyVelocity" then
        local char = LocalPlayer.Character; if not char then return end
        local hrp  = char:FindFirstChild("HumanoidRootPart"); if not hrp then return end
        local bv   = Instance.new("BodyVelocity")
        bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
        bv.Velocity = Vector3.new(velSpoofX, velSpoofY, velSpoofZ)
        bv.Parent   = hrp
        velSpoofCst = bv
        velSpoofConn = RunService.Stepped:Connect(function()
            if velSpoofCst and velSpoofCst.Parent then
                velSpoofCst.Velocity = Vector3.new(velSpoofX, velSpoofY, velSpoofZ)
            end
        end)
    else  -- Constraint (LinearVelocity)
        local char = LocalPlayer.Character; if not char then return end
        local hrp  = char:FindFirstChild("HumanoidRootPart"); if not hrp then return end
        local att  = hrp:FindFirstChildOfClass("Attachment")
        if not att then att = Instance.new("Attachment"); att.Parent = hrp end
        local lv   = Instance.new("LinearVelocity")
        lv.MaxForce               = math.huge
        lv.VelocityConstraintMode = Enum.VelocityConstraintMode.Vector
        lv.VectorVelocity         = Vector3.new(velSpoofX, velSpoofY, velSpoofZ)
        lv.Attachment0            = att
        lv.Parent                 = hrp
        velSpoofCst = lv
        velSpoofConn = RunService.Stepped:Connect(function()
            if velSpoofCst and velSpoofCst.Parent then
                velSpoofCst.VectorVelocity = Vector3.new(velSpoofX, velSpoofY, velSpoofZ)
            end
        end)
    end
end

local vsWidget = vel_sec:CheckboxKeybind("Velocity Spoof", false, nil,
    function(armed)
        if armed then if not velSpoofActive then _vsStart() end
        else          if velSpoofActive then _vsStop() end end
    end,
    function() if velSpoofActive then _vsStop() else _vsStart() end end,
    "always", {"toggle", "hold", "always"}
)
DraxUI.RegCfg("lp.velspoof", vsWidget)
DraxUI.RegCfg("lp.vsmethod", vel_sec:Dropdown("Method", {"Pred Breaker", "Assembly", "BodyVelocity", "Constraint"}, 1, function(idx)
    velSpoofMethod = ({"Pred Breaker", "Assembly", "BodyVelocity", "Constraint"})[idx]
    if velSpoofActive then _vsStart() end
end))
local vsxW = vel_sec:TextBox("Velocity X", "0", "0", function(t) velSpoofX = tonumber(t) or 0 end)
DraxUI.RegCfg("lp.vsx", vsxW)
local vsyW = vel_sec:TextBox("Velocity Y", "0", "0", function(t) velSpoofY = tonumber(t) or 0 end)
DraxUI.RegCfg("lp.vsy", vsyW)
local vszW = vel_sec:TextBox("Velocity Z", "0", "0", function(t) velSpoofZ = tonumber(t) or 0 end)
DraxUI.RegCfg("lp.vsz", vszW)

-- ── Anim Force ───────────────────────────────────────────────────────────────
local af_sec = tab4:Section("Right", "Anim Force")
local afEnabled       = false
local afDelay         = 0.4
local afStep          = 0.4
local afAnimTracks    = {}
local afAnimatorConn  = nil
local afHeartbeatConn = nil
local afCoroutine     = nil
local afCharConn      = nil

local function _afStop()
    afEnabled = false
    if afHeartbeatConn then afHeartbeatConn:Disconnect(); afHeartbeatConn = nil end
    if afCoroutine     then pcall(coroutine.close, afCoroutine); afCoroutine = nil end
    if afAnimatorConn  then afAnimatorConn:Disconnect(); afAnimatorConn = nil end
    for track in pairs(afAnimTracks) do
        pcall(function() if track and track.IsPlaying then track:AdjustSpeed(1) end end)
    end
    table.clear(afAnimTracks)
end

local function _afFreezeTrack(track)
    if not track or not track.IsPlaying then return end
    -- freeze every track including fall/jump/action — that is the intended choppy effect
    track:AdjustSpeed(0)
    afAnimTracks[track] = true
end

local function _afSetupChar(char)
    if afAnimatorConn then afAnimatorConn:Disconnect(); afAnimatorConn = nil end
    table.clear(afAnimTracks)
    local hum = char:WaitForChild("Humanoid", 5)
    if not hum then return end
    local animator = hum:WaitForChild("Animator", 5)
    if not animator then return end
    for _, track in pairs(animator:GetPlayingAnimationTracks()) do
        _afFreezeTrack(track)
    end
    afAnimatorConn = animator.AnimationPlayed:Connect(_afFreezeTrack)
end

local function _afStart()
    _afStop()
    afEnabled = true
    local char = LocalPlayer.Character
    if char then _afSetupChar(char) end
    afHeartbeatConn = RunService.Heartbeat:Connect(function()
        for track in pairs(afAnimTracks) do
            if track and track.IsPlaying then track:AdjustSpeed(0)
            else afAnimTracks[track] = nil end
        end
    end)
    afCoroutine = coroutine.create(function()
        while afEnabled do
            for track in pairs(afAnimTracks) do
                if track and track.IsPlaying then
                    track.TimePosition = track.TimePosition + afStep
                end
            end
            task.wait(afDelay)
        end
    end)
    coroutine.resume(afCoroutine)
end

if afCharConn then afCharConn:Disconnect() end
afCharConn = LocalPlayer.CharacterAdded:Connect(function(char)
    if afEnabled then _afSetupChar(char) end
end)

local afWidget = af_sec:CheckboxKeybind("Anim Force", false, nil,
    function(armed)
        if armed then if not afEnabled then _afStart() end
        else          if afEnabled  then _afStop()  end end
    end,
    function()
        if afEnabled then _afStop() else _afStart() end
    end,
    "always", {"toggle", "hold", "always"}
)
DraxUI.RegCfg("lp.animforce", afWidget)
DraxUI.RegCfg("lp.af_delay", af_sec:Slider("Delay", 0, 2, 0.4, "%.2f", function(v)
    afDelay = v
end))
DraxUI.RegCfg("lp.af_step", af_sec:Slider("Step", 0, 2, 0.4, "%.2f", function(v)
    afStep = v
end))

desyncFrozenCF   = nil
desyncConn       = nil
desyncResetOnDis = false
desyncUseTick    = false
desyncTicks      = 5
desyncTickCount  = 0
desyncVizEnabled   = false
desyncVizMode      = "Rig"
desyncVizColor     = Color3.fromRGB(255, 255, 255)
desyncVizTransp    = 0
desyncVizDotEnable = false
desyncVizDotColor  = Color3.fromRGB(255, 255, 255)
desyncVizRig       = nil
desyncVizChar      = nil
desyncVizSyncList  = {}
desyncVizRigCharEnable = true  -- Toggle for enabling/disabling Rig/Character visualization
desyncVizHLEnabled    = false
desyncVizHLMode       = "Highlight"
desyncVizHLFillColor  = Color3.fromRGB(255, 0, 0)
desyncVizHLOutColor   = Color3.fromRGB(255, 255, 255)
desyncVizHLFillTransp = 0.5
desyncVizHLOutTransp  = 0
desyncVizHLAlwaysOnTop = true
desyncVizGlowColor    = Color3.fromRGB(255, 255, 255)
desyncVizGlowMult     = 3.5
desyncVizGlowThruWalls = true
desyncVizGlowMainColor = Color3.fromRGB(0, 0, 0)
desyncVizGlowTransp    = 1
desyncVizHLInst       = nil
desyncVizGlowAdorns   = {}
desyncVizCharWatcher  = nil   -- ChildAdded connection for character viz rebuild on clothing/accessory changes
desyncLineEnable = false
desyncLineColor  = Color3.fromRGB(255, 255, 255)
desyncDistEnable = false
desyncDistColor  = Color3.fromRGB(255, 255, 255)
desyncRealCF     = nil
desyncVizModeIdx = 1
desyncMode       = 1
desyncHookInstalled = false
desyncToggleActive = false  -- Track toggle state for keybind in Toggle mode
cstToggleActive = false     -- Track toggle state for Custom desync in Toggle mode
desyncCamFix          = false
cstMethod             = 1
cstX, cstY, cstZ      = 0, 0, 0
cstAX, cstAY, cstAZ   = 0, 0, 0
cstWho                = ""
desyncCstFollowTarget = nil
desyncCstOffCF        = CFrame.new()
cstRandomEnabled      = false
cstRandX, cstRandY, cstRandZ = 0, 0, 0
cstCurrentRandOff     = CFrame.new()
dsRandEnabled         = false
dsRandX, dsRandY, dsRandZ = 0, 0, 0
dsCurrentRandOff      = CFrame.new()
dsRotEnabled          = false
dsRotX, dsRotY, dsRotZ = 0, 0, 0
dsLerpRot             = true
dsCurrentRotOff       = CFrame.new()
dsTargetRotOff        = CFrame.new()
desyncSource          = 0 
dsVizDot  = Drawing.new("Circle")
dsVizDot.Filled = true
dsVizDot.Radius = 6
dsVizDot.Visible = false
dsVizLine = Drawing.new("Line")
dsVizLine.Thickness = 1.5
dsVizLine.Visible = false
dsDistLbl = Drawing.new("Text")
dsDistLbl.Size = 13
dsDistLbl.Center = true
dsDistLbl.Outline = true
dsDistLbl.OutlineColor = Color3.fromRGB(0,0,0)
dsDistLbl.Visible = false
dsVizRS   = nil

RunService = game:GetService("RunService")
UIS = game:GetService("UserInputService")
Players = game:GetService("Players")
PhysicsService = game:GetService("PhysicsService")
LocalPlayer = Players.LocalPlayer

pcall(function()
    PhysicsService:RegisterCollisionGroup("GasViz")
    PhysicsService:CollisionGroupSetCollidable("GasViz", "Default", false)
    PhysicsService:CollisionGroupSetCollidable("GasViz", "GasViz", false)
end)

function desyncGetHRP()
    local char = LocalPlayer.Character
    if not char then return nil end
    return char:FindFirstChild("HumanoidRootPart")
end

function desyncStop()
    desyncEnabled = false
    desyncSource  = 0
    if desyncConn then 
        desyncConn:Disconnect()
        desyncConn = nil 
    end
    RunService:UnbindFromRenderStep("GasVizRender")
    RunService:UnbindFromRenderStep("desyncRestore")
    RunService:UnbindFromRenderStep("desyncCamFix")
    if dsVizRS then 
        dsVizRS:Disconnect()
        dsVizRS = nil 
    end
    dsVizDot.Visible = false
    dsVizLine.Visible = false
    dsDistLbl.Visible = false
    desyncRemoveVizHL()
    desyncDestroyVizRig()
    desyncDestroyVizChar()
    
    local hrp = desyncGetHRP()
    if hrp and desyncRealCF then 
        hrp.CFrame = desyncRealCF 
    end
    desyncRealCF = nil
    desyncCstFollowTarget = nil
    
    if desyncResetOnDis and desyncFrozenCF and hrp then
        hrp.CFrame = desyncFrozenCF
    end
    
    local char = LocalPlayer.Character
    local hum = char and char:FindFirstChild("Humanoid")
    if hum then 
        hum.CameraOffset = Vector3.new(0, 0, 0) 
    end
end

function desyncMakeVizRig()
    if desyncVizRig then return end
    local model = Instance.new("Model")
    model.Name = "DesyncVizRig"
    local function makePart(name, size)
        local p = Instance.new("Part")
        p.Name = name; p.Size = size
        p.Anchored = true; p.CanCollide = false
        p.CanTouch = false; p.CastShadow = false
        p.Transparency = desyncVizTransp
        p.CollisionGroup = "GasViz"
        p.Parent = model
        return p
    end
    local torso    = makePart("Torso",    Vector3.new(2,2,1))
    local leftArm  = makePart("LeftArm",  Vector3.new(1,2,1))
    local rightArm = makePart("RightArm", Vector3.new(1,2,1))
    local leftLeg  = makePart("LeftLeg",  Vector3.new(1,2,1))
    local rightLeg = makePart("RightLeg", Vector3.new(1,2,1))
    local head     = makePart("Head",     Vector3.new(1,1,1))
    model.Parent = workspace
    desyncVizRig = {model=model, torso=torso, leftArm=leftArm, rightArm=rightArm, leftLeg=leftLeg, rightLeg=rightLeg, head=head}
end

function desyncUpdateVizRig(cf)
    if not desyncVizRig then return end
    local r = desyncVizRig
    r.torso.CFrame    = cf
    r.leftArm.CFrame  = cf * CFrame.new(-1.5, 0, 0)
    r.rightArm.CFrame = cf * CFrame.new(1.5, 0, 0)
    r.leftLeg.CFrame  = cf * CFrame.new(-0.5, -2, 0)
    r.rightLeg.CFrame = cf * CFrame.new(0.5, -2, 0)
    r.head.CFrame     = cf * CFrame.new(0, 1.5, 0)
end

function desyncDestroyVizRig()
    if desyncVizRig then
        desyncVizRig.model:Destroy()
        desyncVizRig = nil
    end
end

function desyncMakeVizChar()
    if desyncVizChar then return end
    local char = LocalPlayer.Character
    if not char then return end
    if not char:FindFirstChild("HumanoidRootPart") then return end
    
    local model = Instance.new("Model")
    model.Name = "DesyncVizChar"
    desyncVizSyncList = {}
    
    local function setupPart(p, src, isAnchored)
        p.Anchored = isAnchored
        p.CanCollide = false
        p.CanTouch = false
        p.CastShadow = false
        p.Massless = true
        p.CollisionGroup = "GasViz"
        p.Color = src.Color
        p.Material = src.Material
        p.Transparency = (p.Name == "HumanoidRootPart") and 1 or desyncVizTransp
        p.Reflectance = src.Reflectance
        
        if p:IsA("MeshPart") then p.TextureID = src.TextureID end
        
        local tt = p:FindFirstChildOfClass("TouchTransmitter")
        if tt then tt:Destroy() end
    end
    
    for _, obj in ipairs(char:GetDescendants()) do
        if obj:IsA("BasePart") and not obj:FindFirstAncestorOfClass("Accessory") then
            local m = obj:Clone()
            m.Name = obj.Name
            for _, child in ipairs(m:GetChildren()) do
                if child:IsA("JointInstance") or child:IsA("WeldConstraint") or child:IsA("Motor6D") or child:IsA("Attachment") or child:IsA("Weld") or child:IsA("ManualWeld") then
                    child:Destroy()
                end
            end
            setupPart(m, obj, true)
            m.Parent = model
            table.insert(desyncVizSyncList, {m, obj})
        elseif obj:IsA("CharacterMesh") or obj:IsA("Shirt") or obj:IsA("Pants") or obj:IsA("ShirtGraphic") then
            obj:Clone().Parent = model
        elseif obj:IsA("Accessory") then
            local origHandle = obj:FindFirstChild("Handle") or obj:FindFirstChildWhichIsA("BasePart")
            if origHandle then
                local acc = obj:Clone()
                local handle = acc:FindFirstChild(origHandle.Name) or acc:FindFirstChildWhichIsA("BasePart")
                if handle then
                    setupPart(handle, origHandle, true)
                    for _, v in ipairs(handle:GetChildren()) do
                        if v:IsA("JointInstance") or v:IsA("WeldConstraint") or v:IsA("Weld") or v:IsA("ManualWeld") then
                            v:Destroy()
                        end
                    end
                    handle.Parent = model
                    table.insert(desyncVizSyncList, {handle, origHandle})
                end
            end
        end
    end
    
    local hum = Instance.new("Humanoid")
    hum.Name = "Humanoid"
    hum.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
    hum.HealthDisplayType = Enum.HumanoidHealthDisplayType.AlwaysOff
    hum.MaxHealth = math.huge
    hum.Health = math.huge
    hum:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
    hum.PlatformStand = true
    hum.Parent = model
    hum:ChangeState(Enum.HumanoidStateType.None)
    
    model:PivotTo(CFrame.new(0, 10000, 0))
    model.Parent = workspace
    desyncVizChar = model
    
    local root = char:FindFirstChild("HumanoidRootPart")
    if root then
        root.Anchored = true
        task.wait()
        if root.Parent then root.Anchored = false end
    end

    if desyncVizCharWatcher then desyncVizCharWatcher:Disconnect() end
    local _watchDebounce = false
    local _watchChar = char
    desyncVizCharWatcher = _watchChar.DescendantAdded:Connect(function(obj)
        if not (obj:IsA("Accessory") or obj:IsA("Shirt") or obj:IsA("Pants") or obj:IsA("CharacterMesh") or obj:IsA("ShirtGraphic") or obj:IsA("BasePart")) then return end
        if _watchDebounce then return end
        _watchDebounce = true
        task.delay(0.35, function()
            _watchDebounce = false
            if not desyncVizChar then return end
            if not desyncVizRigCharEnable then return end
            if not desyncVizEnabled then return end
            if desyncVizMode ~= "Character" then return end
            desyncDestroyVizChar()
            desyncMakeVizChar()
            if desyncVizHLEnabled then desyncApplyVizHL() end
        end)
    end)
end

function desyncDestroyVizChar()
    if desyncVizCharWatcher then desyncVizCharWatcher:Disconnect(); desyncVizCharWatcher = nil end
    if desyncVizChar then
        desyncVizChar:Destroy()
        desyncVizChar = nil
        desyncVizSyncList = {}
    end
end

function desyncRemoveVizHL()
    if desyncVizHLInst then desyncVizHLInst:Destroy(); desyncVizHLInst = nil end
    for _, ads in pairs(desyncVizGlowAdorns) do
        if ads.glow and ads.glow.Parent then ads.glow:Destroy() end
        if ads.body and ads.body.Parent then ads.body:Destroy() end
    end
    desyncVizGlowAdorns = {}
end

function desyncApplyVizHL()
    desyncRemoveVizHL()
    local model = desyncVizRig and desyncVizRig.model or desyncVizChar
    if not model then return end
    if desyncVizHLMode == "Highlight" then
        local hl = Instance.new("Highlight")
        hl.FillColor = desyncVizHLFillColor
        hl.OutlineColor = desyncVizHLOutColor
        hl.FillTransparency = desyncVizHLFillTransp
        hl.OutlineTransparency = desyncVizHLOutTransp
        hl.DepthMode = desyncVizHLAlwaysOnTop and Enum.HighlightDepthMode.AlwaysOnTop or Enum.HighlightDepthMode.Occluded
        hl.Parent = model
        desyncVizHLInst = hl
    elseif desyncVizHLMode == "Glow" then
        desyncVizGlowAdorns = {}
        local char = LocalPlayer.Character
        local hum = char and char:FindFirstChild("Humanoid")
        local isR6 = hum and hum.RigType == Enum.HumanoidRigType.R6
        for _, part in ipairs(model:GetDescendants()) do
            if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
                local isHead = part.Name == "Head" or part.Name == "FakeHead"
                local isR6Head = isR6 and isHead
                
                -- Убрали math.min для HDR свечения
                local glowCol = Color3.new(
                    desyncVizGlowColor.R * desyncVizGlowMult,
                    desyncVizGlowColor.G * desyncVizGlowMult,
                    desyncVizGlowColor.B * desyncVizGlowMult
                )
                
                local bodyTrans = desyncVizGlowTransp
                local glowTrans = -1 -- Жестко форсим отрицательную прозрачность
                
                local glowAd = CreateAdornment(part, isHead and "Cylinder" or "Box",
                    glowCol, glowTrans, isHead and 10 or 9, Vector3.new(0.03, 0.03, 0.03),
                    { Shading = desyncVizGlowThruWalls and Enum.AdornShading.XRayShaded or nil,
                      IsR6Head = isR6Head, AlwaysOnTop = desyncVizGlowThruWalls })
                      
                local bodyAd = CreateAdornment(part, isHead and "Cylinder" or "Box",
                    desyncVizGlowMainColor, bodyTrans, 10, Vector3.new(0.02, 0.02, 0.02),
                    { IsR6Head = isR6Head, AlwaysOnTop = false })
                    
                desyncVizGlowAdorns[part] = { glow = glowAd, body = bodyAd }
            end
        end
    end
end

function desyncEnsureHook()
    if desyncHookInstalled then return end
    desyncHookInstalled = true
    -- Use the shared __index hook — do NOT call hookmetamethod(__index) again.
    -- The shared hook already checks desyncEnabled/desyncMode/desyncRealCF.
    ensureSharedIdxHook()
end

function desyncStart(frozenCF)
    local hrp = desyncGetHRP()
    if not hrp then return end
    desyncFrozenCF  = frozenCF or hrp.CFrame
    desyncRealCF    = hrp.CFrame
    desyncEnabled   = true
    desyncTickCount = 0
    dsCurrentRandOff = CFrame.new()
    dsCurrentRotOff  = CFrame.new()
    dsTargetRotOff   = CFrame.new()
    if desyncMode == 2 then 
        desyncEnsureHook() 
    end

    if desyncVizEnabled and desyncVizRigCharEnable then
        if desyncVizMode == "Rig" then desyncMakeVizRig() end
        if desyncVizMode == "Character" then desyncMakeVizChar() end
        if desyncVizHLEnabled then desyncApplyVizHL() end
    end

    if dsVizRS then dsVizRS:Disconnect(); dsVizRS = nil end
    RunService:UnbindFromRenderStep("GasVizRender")
    RunService:BindToRenderStep("GasVizRender", 2005, function()
        if not desyncFrozenCF then return end
        -- Use the same effective CFrame as the heartbeat (with rand/rot offsets)
        local posAdj = (dsRandEnabled and dsCurrentRandOff) or CFrame.new()
        local rotAdj = (dsRotEnabled and dsCurrentRotOff) or CFrame.new()
        local effectiveCF = desyncFrozenCF * posAdj * rotAdj
        local cam = workspace.CurrentCamera
        local sp, onSc = cam:WorldToViewportPoint(effectiveCF.Position)
        
        if desyncVizEnabled and desyncVizDotEnable and onSc then
            dsVizDot.Visible  = true
            dsVizDot.Position = Vector2.new(sp.X, sp.Y)
            dsVizDot.Color    = desyncVizDotColor
        else
            dsVizDot.Visible = false
        end

        if desyncVizEnabled then
            if desyncDistEnable and onSc then
                local hrp2 = desyncGetHRP()
                local d = hrp2 and (hrp2.Position - effectiveCF.Position).Magnitude or 0
                dsDistLbl.Visible  = true
                dsDistLbl.Color    = desyncDistColor
                dsDistLbl.Position = Vector2.new(sp.X, sp.Y + (desyncVizDotEnable and 14 or 0))
                dsDistLbl.Text     = string.format("[%.0fm]", d * 0.28)
            else
                dsDistLbl.Visible = false
            end
            
            if desyncLineEnable and onSc then
                local mp = UIS:GetMouseLocation()
                dsVizLine.Visible = true
                dsVizLine.From    = Vector2.new(mp.X, mp.Y)
                dsVizLine.To      = Vector2.new(sp.X, sp.Y)
                dsVizLine.Color   = desyncLineColor
            else
                dsVizLine.Visible = false
            end
            
            if desyncVizMode == "Rig" then
                desyncUpdateVizRig(effectiveCF)
            elseif desyncVizMode == "Character" and desyncVizChar and desyncFrozenCF then
                local hrpSrc = desyncGetHRP()
                if hrpSrc then
                    local rootCF = desyncRealCF or hrpSrc.CFrame
                    local invRoot = rootCF:Inverse()
                    
                    for i = 1, #desyncVizSyncList do
                        local pair = desyncVizSyncList[i]
                        local mirror = pair[1]
                        local source = pair[2]
                        -- Skip if source part was destroyed (e.g. after character respawn before rebuild)
                        if not source.Parent then continue end
                        mirror.CFrame = effectiveCF * (invRoot * source.CFrame)
                        mirror.CanCollide = false
                    end
                end
            end
        else
            dsDistLbl.Visible = false
            dsVizLine.Visible = false
        end
    end)

    RunService:BindToRenderStep("desyncRestore", desyncCamFix and 0 or 2000, function()
        if not desyncEnabled then return end
        local h = desyncGetHRP()
        if h and desyncRealCF then
            h.CFrame = desyncRealCF
            if desyncCamFix then
                local char2 = LocalPlayer.Character
                local hum = char2 and char2:FindFirstChild("Humanoid")
                if hum then hum.CameraOffset = Vector3.new(0, 0, 0) end
            end
        end
    end)

    desyncConn = RunService.Heartbeat:Connect(function(dt)
        local hrp2 = desyncGetHRP()
        if not hrp2 or not desyncFrozenCF then return end
        if desyncSource == 2 then
            local rotCF = CFrame.fromEulerAnglesXYZ(math.rad(cstAX), math.rad(cstAY), math.rad(cstAZ))
            desyncCstOffCF = CFrame.new(cstX, cstY, cstZ) * rotCF
            if cstMethod == 1 then
                desyncFrozenCF = desyncCstOffCF
            elseif cstMethod == 2 then
                desyncFrozenCF = hrp2.CFrame * desyncCstOffCF
            elseif cstMethod == 3 and desyncCstFollowTarget and desyncCstFollowTarget ~= "" then
                local wl = string.lower(desyncCstFollowTarget)
                for _, p in ipairs(Players:GetPlayers()) do
                    if p ~= LocalPlayer then
                        if string.lower(p.Name):find(wl, 1, true) or string.lower(p.DisplayName):find(wl, 1, true) then
                            local tHRP = p.Character and p.Character:FindFirstChild("HumanoidRootPart")
                            if tHRP then desyncFrozenCF = tHRP.CFrame * desyncCstOffCF end
                            break
                        end
                    end
                end
            end
        end
        if desyncUseTick then
            desyncTickCount = desyncTickCount + 1
            if desyncTickCount >= desyncTicks then
                desyncTickCount = 0
                -- Re-freeze base position on tick
                if desyncSource == 1 then
                    desyncFrozenCF = hrp2.CFrame
                elseif desyncSource == 2 and cstMethod == 1 then
                    local rotCF = CFrame.fromEulerAnglesXYZ(math.rad(cstAX), math.rad(cstAY), math.rad(cstAZ))
                    desyncFrozenCF = CFrame.new(cstX, cstY, cstZ) * rotCF
                end
                -- On tick: random position
                if dsRandEnabled then
                    local rx = dsRandX ~= 0 and (math.random() * 2 - 1) * dsRandX or 0
                    local ry = dsRandY ~= 0 and (math.random() * 2 - 1) * dsRandY or 0
                    local rz = dsRandZ ~= 0 and (math.random() * 2 - 1) * dsRandZ or 0
                    dsCurrentRandOff = CFrame.new(rx, ry, rz)
                end
                -- On tick: random snap rotation (non-lerp)
                if dsRotEnabled and not dsLerpRot then
                    local rx2 = dsRotX ~= 0 and (math.random() * 2 - 1) * math.rad(math.abs(dsRotX)) or 0
                    local ry2 = dsRotY ~= 0 and (math.random() * 2 - 1) * math.rad(math.abs(dsRotY)) or 0
                    local rz2 = dsRotZ ~= 0 and (math.random() * 2 - 1) * math.rad(math.abs(dsRotZ)) or 0
                    dsCurrentRotOff = CFrame.Angles(rx2, ry2, rz2)
                end
            end
        else
            -- No tick: every frame
            if dsRandEnabled then
                local rx = dsRandX ~= 0 and (math.random() * 2 - 1) * dsRandX or 0
                local ry = dsRandY ~= 0 and (math.random() * 2 - 1) * dsRandY or 0
                local rz = dsRandZ ~= 0 and (math.random() * 2 - 1) * dsRandZ or 0
                dsCurrentRandOff = CFrame.new(rx, ry, rz)
            end
            -- Non-lerp: random snap every frame
            if dsRotEnabled and not dsLerpRot then
                local rx2 = dsRotX ~= 0 and (math.random() * 2 - 1) * math.rad(math.abs(dsRotX)) or 0
                local ry2 = dsRotY ~= 0 and (math.random() * 2 - 1) * math.rad(math.abs(dsRotY)) or 0
                local rz2 = dsRotZ ~= 0 and (math.random() * 2 - 1) * math.rad(math.abs(dsRotZ)) or 0
                dsCurrentRotOff = CFrame.Angles(rx2, ry2, rz2)
            end
        end
        -- Lerp: smooth continuous spin using dt (tick does NOT affect this)
        if dsRotEnabled and dsLerpRot then
            dsCurrentRotOff = dsCurrentRotOff * CFrame.Angles(
                math.rad(dsRotX) * dt * 2,
                math.rad(dsRotY) * dt * 2,
                math.rad(dsRotZ) * dt * 2
            )
        end
        -- Apply shared random position + rotation offsets when setting the CFrame (do NOT modify desyncFrozenCF)
        local posAdj = (dsRandEnabled and dsCurrentRandOff) or CFrame.new()
        local rotAdj = (dsRotEnabled and dsCurrentRotOff) or CFrame.new()
        desyncRealCF = hrp2.CFrame
        hrp2.CFrame = desyncFrozenCF * posAdj * rotAdj
    end)
end

function desyncFindTarget(who)
    local wl = string.lower(who)
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and (string.lower(p.Name):find(wl, 1, true) or string.lower(p.DisplayName):find(wl, 1, true)) then
            return p
        end
    end
end

function desyncStartCustom()
    local hrp = desyncGetHRP(); if not hrp then return end
    local rotCF = CFrame.fromEulerAnglesXYZ(math.rad(cstAX), math.rad(cstAY), math.rad(cstAZ))
    local offCF = CFrame.new(cstX, cstY, cstZ) * rotCF
    desyncCstOffCF        = offCF
    desyncCstFollowTarget = nil
    if cstMethod == 1 then
        desyncFrozenCF = offCF
    elseif cstMethod == 2 then
        desyncFrozenCF = hrp.CFrame * offCF
    elseif cstMethod == 3 then
        local t    = desyncFindTarget(cstWho)
        local tHRP = t and t.Character and t.Character:FindFirstChild("HumanoidRootPart")
        desyncFrozenCF        = tHRP and (tHRP.CFrame * offCF) or hrp.CFrame
        desyncCstFollowTarget = cstWho
    end
    desyncStart(desyncFrozenCF)
end

desync_sec  = tab4:Section("Left", "Desync")
desync_subs = desync_sec:SubSection({"Default", "Custom"})
ds_def      = desync_subs["Default"]
ds_cst      = desync_subs["Custom"]

local dsDefWidget, dsCstWidget
dsDefWidget = ds_def:CheckboxKeybind("Def Desync", false, nil,
    function(armed)
        if armed then
            -- Stop custom if it was running
            if desyncSource == 2 then
                cstToggleActive = false
                if dsCstWidget then dsCstWidget.ToggleActive = false end
                desyncStop()
            end
            if desyncSource == 0 then
                desyncSource = 1
                desyncToggleActive = true
                desyncStart()
            end
        else
            if desyncSource == 1 then
                desyncToggleActive = false
                desyncStop()
            end
        end
    end,
    function()
        desyncToggleActive = not desyncToggleActive
        if desyncToggleActive then
            -- Stop custom if it was running
            if desyncSource == 2 then
                cstToggleActive = false
                if dsCstWidget then dsCstWidget.ToggleActive = false end
                desyncStop()
            end
            desyncSource = 1
            desyncStart()
        elseif desyncSource == 1 then
            desyncStop()
        end
    end,
    nil, {"toggle","hold","always"}
)
DraxUI.RegCfg("ds.def", dsDefWidget)
local cstWhoWidget
dsCstWidget = ds_cst:CheckboxKeybind("Custom Desync", false, nil,
    function(armed)
        if armed then
            -- Stop def if it was running
            if desyncSource == 1 then
                desyncToggleActive = false
                if dsDefWidget then dsDefWidget.ToggleActive = false end
                desyncStop()
            end
            if desyncSource == 0 then
                desyncSource = 2
                cstToggleActive = true
                desyncStartCustom()
            end
        else
            if desyncSource == 2 then
                cstToggleActive = false
                desyncStop()
            end
        end
    end,
    function()
        cstToggleActive = not cstToggleActive
        if cstToggleActive then
            -- Stop def if it was running
            if desyncSource == 1 then
                desyncToggleActive = false
                if dsDefWidget then dsDefWidget.ToggleActive = false end
                desyncStop()
            end
            desyncSource = 2
            desyncStartCustom()
        elseif desyncSource == 2 then
            desyncStop()
        end
    end,
    nil, {"toggle","hold","always"}
)
DraxUI.RegCfg("ds.cst", dsCstWidget)
DraxUI.RegCfg("ds.cstmode", ds_cst:Dropdown("Mode", {"Position", "Offset", "Follow player"}, 1, function(idx)
    cstMethod = idx
    if cstWhoWidget then cstWhoWidget.Frame.Visible = (idx == 3) end
end))
do
    local _x = ds_cst:TextBox("X", "0", "0", function(t) cstX = tonumber(t) or 0 end)
    local _y = ds_cst:TextBox("Y", "0", "0", function(t) cstY = tonumber(t) or 0 end)
    local _z = ds_cst:TextBox("Z", "0", "0", function(t) cstZ = tonumber(t) or 0 end)
    DraxUI.RegCfg("ds.cstx", _x)
    DraxUI.RegCfg("ds.csty", _y)
    DraxUI.RegCfg("ds.cstz", _z)
end
DraxUI.RegCfg("ds.cstax", ds_cst:Slider("Angle X", -180, 180, 0, "%.0f deg", function(v) cstAX = v end))
DraxUI.RegCfg("ds.cstay", ds_cst:Slider("Angle Y", -180, 180, 0, "%.0f deg", function(v) cstAY = v end))
DraxUI.RegCfg("ds.cstaz", ds_cst:Slider("Angle Z", -180, 180, 0, "%.0f deg", function(v) cstAZ = v end))
cstWhoWidget = ds_cst:TextBox("Who to follow", "name or part of name", "", function(t) cstWho = t end)
cstWhoWidget.Frame.Visible = false
DraxUI.RegCfg("ds.cstwho", cstWhoWidget)

-- ── Desync Settings section ──────────────────────────────────────────────────
ds_set = tab4:Section("Left", "Desync Settings")
DraxUI.RegCfg("ds.method", ds_set:Dropdown("Method", {"Position", "Hook position"}, 1, function(idx)
    desyncMode = idx
    if camFixWidget then camFixWidget.Frame.Visible = (idx == 1) end
end))
camFixWidget = ds_set:Checkbox("Recalculate camera offset", false, function(v)
    desyncCamFix = v
    if desyncEnabled then
        RunService:UnbindFromRenderStep("desyncRestore")
        RunService:BindToRenderStep("desyncRestore", desyncCamFix and 0 or 2000, function()
            if not desyncEnabled then return end
            local h = desyncGetHRP()
            if h and desyncRealCF then
                h.CFrame = desyncRealCF
                if desyncCamFix then
                    local char2 = LocalPlayer.Character
                    local hum = char2 and char2:FindFirstChild("Humanoid")
                    if hum then hum.CameraOffset = Vector3.new(0, 0, 0) end
                end
            end
        end)
    end
end)
DraxUI.RegCfg("ds.camfix", camFixWidget)
DraxUI.RegCfg("ds.resetondis", ds_set:Checkbox("Reset pos on disable", false, function(v) desyncResetOnDis = v end))
DraxUI.RegCfg("ds.usetick",    ds_set:Checkbox("Use tick", false, function(v) desyncUseTick = v; desyncTickCount = 0 end))
DraxUI.RegCfg("ds.ticks",      ds_set:Slider("Ticks", 1, 500, 50, "%.0f", function(v) desyncTicks = v end))

vizWidget = ds_set:Checkbox("Visualize server pos", false, function(v)
    desyncVizEnabled = v
    if v then
        if desyncEnabled and desyncFrozenCF and desyncVizRigCharEnable then
            if desyncVizMode == "Rig" then desyncMakeVizRig() end
            if desyncVizMode == "Character" then desyncMakeVizChar() end
            if desyncVizHLEnabled then desyncApplyVizHL() end
        end
    else
        desyncRemoveVizHL()
        desyncDestroyVizRig()
        desyncDestroyVizChar()
        dsVizLine.Visible = false
        dsDistLbl.Visible = false
    end
end)
DraxUI.RegCfg("ds.viz", vizWidget)
vizWidget:AddSettings(function(p)
    local modeIdx = desyncVizMode == "Rig" and 1 or 2
    p:CheckboxDroplet("Visualizer", {"Rig", "Character"}, desyncVizRigCharEnable, modeIdx,
        function(v)
            desyncVizRigCharEnable = v
            if not v then
                desyncDestroyVizRig()
                desyncDestroyVizChar()
            elseif desyncVizEnabled and desyncEnabled and desyncFrozenCF then
                if desyncVizMode == "Rig" then desyncMakeVizRig()
                elseif desyncVizMode == "Character" then desyncMakeVizChar() end
                if desyncVizHLEnabled then desyncApplyVizHL() end
            end
        end,
        function(idx)
            local modes = {"Rig", "Character"}
            desyncVizMode = modes[idx] or "Rig"
            if desyncVizRigCharEnable and desyncVizEnabled and desyncEnabled and desyncFrozenCF then
                desyncDestroyVizRig()
                desyncDestroyVizChar()
                if desyncVizMode == "Rig" then desyncMakeVizRig()
                elseif desyncVizMode == "Character" then desyncMakeVizChar() end
                if desyncVizHLEnabled then desyncApplyVizHL() end
            end
        end
    )
    p:Slider("Transparency", 0, 1, desyncVizTransp, "%.2f", function(v)
        desyncVizTransp = v
        if desyncVizRig then
            for _, part in ipairs(desyncVizRig.model:GetDescendants()) do
                if part:IsA("BasePart") then part.Transparency = v end
            end
        end
        if desyncVizChar then
            for _, part in ipairs(desyncVizChar:GetDescendants()) do
                if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
                    part.Transparency = v
                end
            end
        end
    end)
    local hlw = {}
    p:Checkbox("Highlight", desyncVizHLEnabled, function(v)
        desyncVizHLEnabled = v
        if v then desyncApplyVizHL() else desyncRemoveVizHL() end
    end)
    p:Droplet("HL Mode", {"Glow", "Highlight"}, desyncVizHLMode == "Glow" and 1 or 2, function(idx)
        desyncVizHLMode = idx == 1 and "Glow" or "Highlight"
        local isG = (desyncVizHLMode == "Glow")
        if hlw.gc  then hlw.gc.Frame.Visible  = isG end
        if hlw.gmc then hlw.gmc.Frame.Visible = isG end
        if hlw.gm  then hlw.gm.Frame.Visible  = isG end
        if hlw.gtr then hlw.gtr.Frame.Visible = isG end
        if hlw.gtw then hlw.gtw.Frame.Visible = isG end
        if hlw.haot then hlw.haot.Frame.Visible = not isG end
        if hlw.hf  then hlw.hf.Frame.Visible  = not isG end
        if hlw.ho  then hlw.ho.Frame.Visible  = not isG end
        if hlw.htf then hlw.htf.Frame.Visible = not isG end
        if hlw.hto then hlw.hto.Frame.Visible = not isG end
        if desyncVizHLEnabled then desyncApplyVizHL() end
    end)
    hlw.gc  = p:ColorPicker("Glow color", desyncVizGlowColor, 1, function(c,a) desyncVizGlowColor = c; if desyncVizHLEnabled and desyncVizHLMode == "Glow" then desyncApplyVizHL() end end)
    hlw.gm  = p:Slider("Glow Mult", 1, 10, desyncVizGlowMult, "%.1f", function(v) desyncVizGlowMult = v; if desyncVizHLEnabled and desyncVizHLMode == "Glow" then desyncApplyVizHL() end end)
    hlw.gtr = p:Slider("Body Trans", 0, 1, desyncVizGlowTransp, "%.2f", function(v) desyncVizGlowTransp = v; if desyncVizHLEnabled and desyncVizHLMode == "Glow" then desyncApplyVizHL() end end)
    hlw.gtw = p:Checkbox("Glow thru walls", desyncVizGlowThruWalls, function(v) desyncVizGlowThruWalls = v; if desyncVizHLEnabled and desyncVizHLMode == "Glow" then desyncApplyVizHL() end end)
    hlw.haot = p:Checkbox("Always on top", desyncVizHLAlwaysOnTop, function(v) desyncVizHLAlwaysOnTop = v; if desyncVizHLInst then desyncVizHLInst.DepthMode = v and Enum.HighlightDepthMode.AlwaysOnTop or Enum.HighlightDepthMode.Occluded end end)
    hlw.hf  = p:ColorPicker("Fill", desyncVizHLFillColor, 1 - desyncVizHLFillTransp, function(c,a) desyncVizHLFillColor = c; desyncVizHLFillTransp = 1-a; if desyncVizHLInst then desyncVizHLInst.FillColor = c; desyncVizHLInst.FillTransparency = 1-a end end)
    hlw.ho  = p:ColorPicker("Outline", desyncVizHLOutColor, 1 - desyncVizHLOutTransp, function(c,a) desyncVizHLOutColor = c; desyncVizHLOutTransp = 1-a; if desyncVizHLInst then desyncVizHLInst.OutlineColor = c; desyncVizHLInst.OutlineTransparency = 1-a end end)
    hlw.htf = p:Slider("Fill Trans", 0, 1, desyncVizHLFillTransp, "%.2f", function(v) desyncVizHLFillTransp = v; if desyncVizHLInst then desyncVizHLInst.FillTransparency = v end end)
    hlw.hto = p:Slider("Outline Trans", 0, 1, desyncVizHLOutTransp, "%.2f", function(v) desyncVizHLOutTransp = v; if desyncVizHLInst then desyncVizHLInst.OutlineTransparency = v end end)
    local isGInit = (desyncVizHLMode == "Glow")
    hlw.haot.Frame.Visible = not isGInit
    hlw.hf.Frame.Visible   = not isGInit
    hlw.ho.Frame.Visible   = not isGInit
    hlw.htf.Frame.Visible  = not isGInit
    hlw.hto.Frame.Visible  = not isGInit
    hlw.gc.Frame.Visible   = isGInit
    hlw.gm.Frame.Visible   = isGInit
    hlw.gtr.Frame.Visible  = isGInit
    hlw.gtw.Frame.Visible  = isGInit
    p:CheckboxColor("Dot", desyncVizDotEnable, desyncVizDotColor, nil,
        function(v) desyncVizDotEnable = v end,
        function(col) desyncVizDotColor = col end)
    p:CheckboxColor("Line", desyncLineEnable, desyncLineColor, nil,
        function(v) desyncLineEnable = v end,
        function(col) desyncLineColor = col end)
    p:Checkbox("Distance", desyncDistEnable, function(v) desyncDistEnable = v end)
end)
-- Persist Dot / Line / Distance enable+color across config saves
DraxUI.ConfigWidgets["ds.viz.dot"] = {
    get      = function() return {en=desyncVizDotEnable, col=desyncVizDotColor} end,
    load     = function(d) if type(d)=="table" then if type(d.en)=="boolean" then desyncVizDotEnable=d.en end; if typeof(d.col)=="Color3" then desyncVizDotColor=d.col end end end,
    reset    = function() desyncVizDotEnable=false; desyncVizDotColor=Color3.fromRGB(255,255,255) end,
    forceOff = function() desyncVizDotEnable=false end,
}
DraxUI.ConfigWidgets["ds.viz.line"] = {
    get      = function() return {en=desyncLineEnable, col=desyncLineColor} end,
    load     = function(d) if type(d)=="table" then if type(d.en)=="boolean" then desyncLineEnable=d.en end; if typeof(d.col)=="Color3" then desyncLineColor=d.col end end end,
    reset    = function() desyncLineEnable=false; desyncLineColor=Color3.fromRGB(255,255,255) end,
    forceOff = function() desyncLineEnable=false end,
}
DraxUI.ConfigWidgets["ds.viz.dist"] = {
    get      = function() return {en=desyncDistEnable, col=desyncDistColor} end,
    load     = function(d) if type(d)=="table" then if type(d.en)=="boolean" then desyncDistEnable=d.en end; if typeof(d.col)=="Color3" then desyncDistColor=d.col end end end,
    reset    = function() desyncDistEnable=false; desyncDistColor=Color3.fromRGB(255,255,255) end,
    forceOff = function() desyncDistEnable=false end,
}
-- Persist Visualizer (Rig/Character toggle + mode) across config saves
DraxUI.ConfigWidgets["ds.viz.rig"] = {
    get      = function() return {en=desyncVizRigCharEnable, mode=desyncVizMode} end,
    load     = function(d)
        if type(d) ~= "table" then return end
        if type(d.en) == "boolean" then
            desyncVizRigCharEnable = d.en
            if not d.en then desyncDestroyVizRig(); desyncDestroyVizChar() end
        end
        if type(d.mode) == "string" then desyncVizMode = d.mode end
    end,
    reset    = function() desyncVizRigCharEnable = true; desyncVizMode = "Rig" end,
    forceOff = function() desyncVizRigCharEnable = false; desyncDestroyVizRig(); desyncDestroyVizChar() end,
}
local dsRandXWidget, dsRandYWidget, dsRandZWidget
DraxUI.RegCfg("ds.rand", ds_set:Checkbox("Random in XYZ radius", false, function(v)
    dsRandEnabled = v
    if dsRandXWidget then dsRandXWidget.Frame.Visible = v end
    if dsRandYWidget then dsRandYWidget.Frame.Visible = v end
    if dsRandZWidget then dsRandZWidget.Frame.Visible = v end
    if not v then dsCurrentRandOff = CFrame.new() end
end))
dsRandXWidget = ds_set:TextBox("Random X", "0", "0", function(t) dsRandX = tonumber(t) or 0 end)
dsRandXWidget.Frame.Visible = false
DraxUI.RegCfg("ds.randx", dsRandXWidget)
dsRandYWidget = ds_set:TextBox("Random Y", "0", "0", function(t) dsRandY = tonumber(t) or 0 end)
dsRandYWidget.Frame.Visible = false
DraxUI.RegCfg("ds.randy", dsRandYWidget)
dsRandZWidget = ds_set:TextBox("Random Z", "0", "0", function(t) dsRandZ = tonumber(t) or 0 end)
dsRandZWidget.Frame.Visible = false
DraxUI.RegCfg("ds.randz", dsRandZWidget)

-- Rotation in XYZ radius (shared for Default & Custom)
local dsRotXWidget, dsRotYWidget, dsRotZWidget, dsLerpWidget
DraxUI.RegCfg("ds.rot", ds_set:Checkbox("Rotation in XYZ radius", false, function(v)
    dsRotEnabled = v
    if dsRotXWidget then dsRotXWidget.Frame.Visible = v end
    if dsRotYWidget then dsRotYWidget.Frame.Visible = v end
    if dsRotZWidget then dsRotZWidget.Frame.Visible = v end
    if dsLerpWidget then dsLerpWidget.Frame.Visible = v end
    if not v then dsCurrentRotOff = CFrame.new() end
end))
dsRotXWidget = ds_set:Slider("Rot X", -360, 360, 0, "%.0f deg", function(v) dsRotX = v end)
dsRotXWidget.Frame.Visible = false
DraxUI.RegCfg("ds.rotx", dsRotXWidget)
dsRotYWidget = ds_set:Slider("Rot Y", -360, 360, 0, "%.0f deg", function(v) dsRotY = v end)
dsRotYWidget.Frame.Visible = false
DraxUI.RegCfg("ds.roty", dsRotYWidget)
dsRotZWidget = ds_set:Slider("Rot Z", -360, 360, 0, "%.0f deg", function(v) dsRotZ = v end)
dsRotZWidget.Frame.Visible = false
DraxUI.RegCfg("ds.rotz", dsRotZWidget)
dsLerpWidget = ds_set:Checkbox("Lerp rotation", true, function(v)
    dsLerpRot = v
    if not v then dsCurrentRotOff = CFrame.new() end
end)
dsLerpWidget.Frame.Visible = false
DraxUI.RegCfg("ds.lerp", dsLerpWidget)

DraxUI.Notification("aku.hook", "shit")

--backtrack
Config.Backtrack = {
    Enable = false,
    Transparency = 0.5,
    PingText = false,
    AddPing = 80
}

backtrack_sec = tab4:Section("Left", "Backtrack")

DraxUI.RegCfg("bt.enable", backtrack_sec:Checkbox("Enable Backtrack Visualizer", false, function(v)
    Config.Backtrack.Enable = v
end))

DraxUI.RegCfg("bt.trans", backtrack_sec:Slider("Transparency", 0, 1, 0.5, "%.2f", function(v)
    Config.Backtrack.Transparency = v
end))

DraxUI.RegCfg("bt.addping", backtrack_sec:Slider("Additional Ping (ms)", 0, 200, 80, "%.0f ms", function(v)
    Config.Backtrack.AddPing = v
end))

DraxUI.RegCfg("bt.pingtext", backtrack_sec:Checkbox("Overhead Ping Text", false, function(v)
    Config.Backtrack.PingText = v
end))

positionHistory = {}
btVizChar = nil
btVizSyncList = {}
btVizCharWatcher = nil

createBtVizChar = function()
    if btVizChar then return end
    local char = LocalPlayer.Character
    if not char then return end
    
    local oldArchivable = char.Archivable
    char.Archivable = true
    local rawClone = char:Clone()
    char.Archivable = oldArchivable
    
    local model = Instance.new("Model")
    model.Name = "BtVizChar"
    btVizSyncList = {}
    
    local function setupPart(p, src)
        p.Anchored = true
        p.CanCollide = false
        p.CanTouch = false
        p.CanQuery = false
        p.CastShadow = false
        p.Massless = true
        p.CollisionGroup = "GasViz"
        p.Color = src.Color
        p.Material = src.Material
        p.Transparency = (p.Name == "HumanoidRootPart") and 1 or Config.Backtrack.Transparency
        p.Reflectance = src.Reflectance
        if p:IsA("MeshPart") then p.TextureID = src.TextureID end
        local tt = p:FindFirstChildOfClass("TouchTransmitter")
        if tt then tt:Destroy() end
    end

    for _, obj in ipairs(rawClone:GetChildren()) do
        if not obj:IsA("Humanoid") and not obj:IsA("Highlight") then
            obj.Parent = model
        else
            obj:Destroy()
        end
    end
    rawClone:Destroy()

    local rawSourceDesc = char:GetDescendants()
    local rawModelDesc = model:GetDescendants()
    local sourceParts = {}

    for _, desc in ipairs(rawSourceDesc) do
        if desc:IsA("BasePart") then
            table.insert(sourceParts, desc)
        end
    end

    local sourceIndex = 1
    for _, desc in ipairs(rawModelDesc) do
        if desc:IsA("BasePart") then
            local srcPart = sourceParts[sourceIndex]
            if srcPart then
                for _, child in ipairs(desc:GetChildren()) do
                    if child:IsA("JointInstance") or child:IsA("WeldConstraint") or child:IsA("Motor6D") or child:IsA("Weld") or child:IsA("ManualWeld") or child:IsA("LuaSourceContainer") or child:IsA("Highlight") then
                        child:Destroy()
                    end
                end
                setupPart(desc, srcPart)
                table.insert(btVizSyncList, {desc, srcPart})
                sourceIndex = sourceIndex + 1
            else
                desc:Destroy()
            end
        elseif desc:IsA("JointInstance") or desc:IsA("WeldConstraint") or desc:IsA("Motor6D") or desc:IsA("Weld") or desc:IsA("ManualWeld") or desc:IsA("LuaSourceContainer") or desc:IsA("Highlight") then
            desc:Destroy()
        end
    end
    
    local hum = Instance.new("Humanoid")
    hum.Name = "Humanoid"
    hum.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
    hum.HealthDisplayType = Enum.HumanoidHealthDisplayType.AlwaysOff
    hum.MaxHealth = math.huge
    hum.Health = math.huge
    hum:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
    hum.PlatformStand = true
    hum.Parent = model
    hum:ChangeState(Enum.HumanoidStateType.None)
    
    local head = model:FindFirstChild("Head") or model:FindFirstChild("FakeHead") or model:FindFirstChildWhichIsA("BasePart")
    if head then
        local bb = Instance.new("BillboardGui")
        bb.Name = "BtPingTag"
        bb.Size = UDim2.new(0, 100, 0, 30)
        bb.StudsOffset = Vector3.new(0, 2.5, 0)
        bb.AlwaysOnTop = true
        bb.Enabled = false
        
        local lbl = Instance.new("TextLabel")
        lbl.Name = "PingLabel"
        lbl.Size = UDim2.new(1, 0, 1, 0)
        lbl.BackgroundTransparency = 1
        lbl.TextColor3 = Color3.fromRGB(255, 255, 255)
        lbl.Font = Enum.Font.RobotoMono
        lbl.TextSize = 15
        lbl.TextXAlignment = Enum.TextXAlignment.Center
        lbl.TextYAlignment = Enum.TextYAlignment.Center
        lbl.Text = ""
        
        local stroke = Instance.new("UIStroke")
        stroke.Name = "TextOutline"
        stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual
        stroke.Color = Color3.fromRGB(0, 0, 0)
        stroke.Thickness = 1
        stroke.Transparency = 0
        stroke.Parent = lbl
        
        lbl.Parent = bb
        bb.Parent = head
    end
    
    local currentHrp = char:FindFirstChild("HumanoidRootPart")
    if currentHrp then model:PivotTo(currentHrp.CFrame) end
    
    model.Parent = workspace
    btVizChar = model

    if btVizCharWatcher then btVizCharWatcher:Disconnect() end
    btVizCharWatcher = char.ChildAdded:Connect(function(obj)
        if not btVizChar or not Config.Backtrack.Enable then return end
        if not obj:IsA("Humanoid") and not obj:IsA("LocalScript") and not obj:IsA("Script") and not obj:IsA("Highlight") then
            task.delay(0.1, function()
                if not btVizChar or not obj.Parent then return end
                local itemClone = obj:Clone()
                
                local srcParts = obj:IsA("BasePart") and {obj} or {}
                if not obj:IsA("BasePart") then
                    for _, v in ipairs(obj:GetDescendants()) do
                        if v:IsA("BasePart") then table.insert(srcParts, v) end
                    end
                end
                
                local cloneParts = itemClone:IsA("BasePart") and {itemClone} or {}
                if not itemClone:IsA("BasePart") then
                    for _, v in ipairs(itemClone:GetDescendants()) do
                        if v:IsA("BasePart") then table.insert(cloneParts, v) end
                    end
                end
                
                for idx, cPart in ipairs(cloneParts) do
                    local sPart = srcParts[idx]
                    if sPart then
                        for _, child in ipairs(cPart:GetChildren()) do
                            if child:IsA("JointInstance") or child:IsA("WeldConstraint") or child:IsA("Motor6D") or child:IsA("Weld") or child:IsA("ManualWeld") or child:IsA("LuaSourceContainer") or child:IsA("Highlight") then
                                child:Destroy()
                            end
                        end
                        setupPart(cPart, sPart)
                        table.insert(btVizSyncList, {cPart, sPart})
                    end
                end
                itemClone.Parent = btVizChar
            end)
        end
    end)
end
removeBtVizChar = function()
    if btVizCharWatcher then
        btVizCharWatcher:Disconnect()
        btVizCharWatcher = nil
    end
    if btVizChar then
        btVizChar:Destroy()
        btVizChar = nil
        btVizSyncList = {}
    end
end
RunService.PostSimulation:Connect(function()
    if not Config.Backtrack.Enable then
        removeBtVizChar()
        if #positionHistory > 0 then
            table.clear(positionHistory)
        end
        return
    end

    local char = LocalPlayer.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    if not hrp then
        removeBtVizChar()
        return
    end

    local pingRaw = 0
    local stats = game:GetService("Stats")
    local perfStats = stats:FindFirstChild("PerformanceStats")
    local pingStat = perfStats and perfStats:FindFirstChild("Ping")
    if pingStat then
        pingRaw = pingStat:GetValue()
    end
    
    local addPingVal = Config.Backtrack.AddPing or 80
    local displayPing = math.floor(pingRaw + addPingVal)
    local pingCalc = (pingRaw + addPingVal + 30) / 1000
    local currentTime = workspace.DistributedGameTime
    
    local trueRealCF = hrp.CFrame
    local currentServerCF = hrp.CFrame
    
    if typeof(desyncEnabled) ~= "nil" and desyncEnabled then
        local posAdj = (typeof(dsRandEnabled) ~= "nil" and dsRandEnabled and typeof(dsCurrentRandOff) ~= "nil" and dsCurrentRandOff) or CFrame.new()
        local rotAdj = (typeof(dsRotEnabled) ~= "nil" and dsRotEnabled and typeof(dsCurrentRotOff) ~= "nil" and dsCurrentRotOff) or CFrame.new()
        if typeof(desyncFrozenCF) ~= "nil" and desyncFrozenCF then
            currentServerCF = desyncFrozenCF * posAdj * rotAdj
        end
        if typeof(desyncRealCF) ~= "nil" and desyncRealCF then
            trueRealCF = desyncRealCF
        end
    end

    local liveParts = {}
    local invRealRoot = trueRealCF:Inverse()
    
    for i = 1, #btVizSyncList do
        local source = btVizSyncList[i][2]
        if source and source.Parent then
            liveParts[source] = invRealRoot * source.CFrame
        end
    end
    
    table.insert(positionHistory, {
        Time = currentTime,
        CFrame = currentServerCF,
        Parts = liveParts
    })

    local targetTime = currentTime - pingCalc
    local targetFrame = nil
    
    for i = #positionHistory, 1, -1 do
        if positionHistory[i].Time <= targetTime then
            targetFrame = positionHistory[i]
            for j = 1, i - 1 do
                table.remove(positionHistory, 1)
            end
            break
        end
    end

    if not targetFrame and #positionHistory > 0 then
        targetFrame = positionHistory[1]
    end

    if not btVizChar or btVizChar.Parent ~= workspace then
        createBtVizChar()
    end
    
    if btVizChar then
        if not targetFrame then
            for i = 1, #btVizSyncList do
                local mirror = btVizSyncList[i][1]
                if mirror and mirror.Parent then
                    mirror.Transparency = 1
                    mirror.CanCollide = false
                    mirror.CanTouch = false
                    mirror.CanQuery = false
                end
            end
            local head = btVizChar:FindFirstChild("Head") or btVizChar:FindFirstChild("FakeHead") or btVizChar:FindFirstChildWhichIsA("BasePart")
            local bb = head and head:FindFirstChild("BtPingTag")
            if bb then bb.Enabled = false end
            return
        end

        local targetCFrame = targetFrame.CFrame
        local dist = (trueRealCF.Position - targetCFrame.Position).Magnitude
        
        local activeTrans = dist < 0.5 and 1 or Config.Backtrack.Transparency
        local isFullyHidden = activeTrans == 1
        
        local head = btVizChar:FindFirstChild("Head") or btVizChar:FindFirstChild("FakeHead") or btVizChar:FindFirstChildWhichIsA("BasePart")
        local bb = head and head:FindFirstChild("BtPingTag")
        local lbl = bb and bb:FindFirstChild("PingLabel")
        
        if bb and lbl then
            if Config.Backtrack.PingText and not isFullyHidden then
                lbl.Text = tostring(displayPing) .. " ms"
                bb.Enabled = true
            else
                bb.Enabled = false
            end
        end

        for i = #btVizSyncList, 1, -1 do
            local pair = btVizSyncList[i]
            local mirror = pair[1]
            local source = pair[2]
            
            if not source.Parent or not source:IsDescendantOf(char) then
                if mirror and mirror.Parent then
                    mirror:Destroy()
                end
                table.remove(btVizSyncList, i)
            else
                local pastRelativeCF = targetFrame.Parts[source]
                if pastRelativeCF then
                    mirror.CFrame = targetCFrame * pastRelativeCF
                else
                    mirror.CFrame = targetCFrame * (invRealRoot * source.CFrame)
                end
                
                mirror.CanCollide = false
                mirror.CanTouch = false
                mirror.CanQuery = false
                mirror.CollisionGroup = "GasViz"
                
                mirror.Color = source.Color
                mirror.Material = source.Material
                
                if mirror.Name == "HumanoidRootPart" then
                    mirror.Transparency = 1
                else
                    mirror.Transparency = activeTrans
                end
            end
        end
    end
end)

-- PLAYERS TAB
do
    local _PlService = game:GetService("Players")
    local _lp6       = _PlService.LocalPlayer
    local plTab      = win.Tabs["Players"]

    -- [userId (number)] = "None" | "Enemy" | "Friendly"
    -- Stored separately from menu configs in its own folder
    local plrStatuses   = _plrStatuses
    local PLSTATUS_FILE = "AkuData/players_status.json"

    local function savePlrStatuses()
        if not isfolder("AkuData") then makefolder("AkuData") end
        local s = {}
        for uid, st in pairs(plrStatuses) do s[tostring(uid)] = st end
        local ok, enc = pcall(function() return HttpService:JSONEncode(s) end)
        if ok then pcall(writefile, PLSTATUS_FILE, enc) end
    end

    local function loadPlrStatuses()
        if not isfile(PLSTATUS_FILE) then return end
        local ok, raw = pcall(readfile, PLSTATUS_FILE)
        if not ok then return end
        local ok2, data = pcall(function() return HttpService:JSONDecode(raw) end)
        if ok2 and type(data) == "table" then
            for k, v in pairs(data) do
                local uid = tonumber(k)
                if uid and type(v) == "string" then plrStatuses[uid] = v end
            end
        end
    end

    loadPlrStatuses()

    -- ── Selection state ─────────────────────────────────────────────────────
    local selectedPlayer = nil
    local selectedRow    = nil

    -- ── Spectate state ──────────────────────────────────────────────────────
    local spectateActive   = false
    local spectateTarget   = nil
    local spectateSubConn  = nil
    local spectateCharConn = nil
    local spectateBtn      = nil   -- set later when button is created

    -- ── Stats tracking ──────────────────────────────────────────────────────
    local statsConn = nil

    -- ── Colors ──────────────────────────────────────────────────────────────
    local COL_BG     = Color3.fromRGB(18, 18, 18)
    local COL_ROW    = Color3.fromRGB(25, 25, 25)
    local COL_ROWSEL = Color3.fromRGB(32, 28, 32)
    local COL_TEXT   = Color3.fromRGB(220, 220, 220)
    local COL_SUB    = Color3.fromRGB(110, 110, 110)
    local COL_BORDER = Color3.fromRGB(36, 36, 36)

    local BADGE_COLS = {
        None      = {bg = Color3.fromRGB(40, 40, 40),  fg = Color3.fromRGB(95,  95,  95)},
        Enemy     = {bg = Color3.fromRGB(56, 14, 14),  fg = Color3.fromRGB(255, 80,  80)},
        Friendly  = {bg = Color3.fromRGB(14, 46, 14),  fg = Color3.fromRGB(80,  200, 80)},
        Client    = {bg = Color3.fromRGB(30, 20, 60),  fg = Color3.fromRGB(255, 255, 255)},
    }

    -- ── Helper: accent-colored section divider with glow ────────────────────
    -- Adds a 1px bar + glow as children of `parent` at the given Y offset.
    local function makeDivider(parent, yOff, xPad)
        xPad = xPad or 10
        local div = c("Frame", {
            BackgroundColor3 = DraxUI.AccentColor,
            Position         = UDim2.new(0, xPad, 0, yOff),
            Size             = UDim2.new(1, -xPad * 2, 0, 1),
            ZIndex           = 2,
        })
        div.Parent = parent
        table.insert(DraxUI.AccentObjects, {Obj = div, Prop = "BackgroundColor3"})
        -- Glow is a child of the divider; extends 9px above and below
        local glow = c("ImageLabel", {
            Name               = "Bloom",
            BackgroundTransparency = 1,
            Image              = "rbxassetid://18245826428",
            ImageColor3        = DraxUI.AccentColor,
            ImageTransparency  = 0.45,
            ScaleType          = Enum.ScaleType.Slice,
            SliceCenter        = Rect.new(21, 21, 79, 79),
            Position           = UDim2.new(0, -1, 0, -7),
            Size               = UDim2.new(1, 2, 0, 15),
            ZIndex             = 1,
        })
        glow.Parent = div
        DraxUI.GlowRegistry[glow] = true
        DraxUI.SetGlowVisibility(glow, true)
        table.insert(DraxUI.AccentObjects, {Obj = glow, Prop = "ImageColor3"})
        return div
    end

    -- ── LEFT PANEL ───────────────────────────────────────────────────────────
    local leftPanel = c("Frame", {
        BackgroundColor3 = COL_BG,
        Position         = UDim2.new(0, 8,  0, 6),
        Size             = UDim2.new(0, 295, 1, -12),
    }, {c("UICorner", {CornerRadius = UDim.new(0, 6)})})
    leftPanel.Parent = plTab

    local leftTitle = c("TextLabel", {
        BackgroundTransparency = 1,
        Position       = UDim2.new(0, 10, 0, 8),
        Size           = UDim2.new(1, -20, 0, 16),
        Text           = "Players [0]",
        TextColor3     = COL_TEXT,
        TextSize       = 14,
        Font           = Enum.Font.GothamBold,
        TextXAlignment = Enum.TextXAlignment.Left,
    })
    leftTitle.Parent = leftPanel

    local searchBox = c("TextBox", {
        BackgroundColor3  = Color3.fromRGB(24, 24, 24),
        Position          = UDim2.new(0, 8,  0, 30),
        Size              = UDim2.new(1, -16, 0, 24),
        Text              = "",
        PlaceholderText   = "Search player...",
        PlaceholderColor3 = COL_SUB,
        TextColor3        = COL_TEXT,
        TextSize          = 13,
        Font              = Enum.Font.Gotham,
        ClearTextOnFocus  = false,
        TextXAlignment    = Enum.TextXAlignment.Left,
    }, {
        c("UICorner",  {CornerRadius = UDim.new(0, 5)}),
        c("UIStroke",  {Color = COL_BORDER, Thickness = 1}),
        c("UIPadding", {PaddingLeft = UDim.new(0, 8), PaddingRight = UDim.new(0, 6)}),
    })
    searchBox.Parent = leftPanel

    local listFrame = c("ScrollingFrame", {
        BackgroundTransparency = 1,
        Position               = UDim2.new(0, 8, 0, 60),
        Size                   = UDim2.new(1, -16, 1, -68),
        ScrollBarThickness     = 3,
        ScrollBarImageColor3   = Color3.fromRGB(65, 65, 65),
        CanvasSize             = UDim2.new(0, 0, 0, 0),
        AutomaticCanvasSize    = Enum.AutomaticSize.Y,
        BorderSizePixel        = 0,
    }, {
        c("UIListLayout", {SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 3)}),
    })
    listFrame.Parent = leftPanel

    -- ── RIGHT PANEL ──────────────────────────────────────────────────────────
    -- Sections are absolutely positioned; shown/hidden by Visible + position shift.
    local rightPanel = c("Frame", {
        BackgroundColor3 = COL_BG,
        Position         = UDim2.new(0, 311, 0, 6),
        Size             = UDim2.new(1, -319, 1, -12),
        Visible          = false,
        ClipsDescendants = true,
    }, {c("UICorner", {CornerRadius = UDim.new(0, 6)})})
    rightPanel.Parent = plTab

    -- ── Header section (always visible) — height 90 ──────────────────────────
    local headerSection = c("Frame", {
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 0, 0, 0),
        Size     = UDim2.new(1, 0, 0, 90),
    })
    headerSection.Parent = rightPanel

    c("TextLabel", {
        BackgroundTransparency = 1,
        Position       = UDim2.new(0, 10, 0, 6),
        Size           = UDim2.new(1, -20, 0, 14),
        Text           = "Selected Player",
        TextColor3     = COL_SUB,
        TextSize       = 10,
        Font           = Enum.Font.GothamMedium,
        TextXAlignment = Enum.TextXAlignment.Left,
    }).Parent = headerSection

    makeDivider(headerSection, 24)

    -- Avatar + info row
    local headerRow = c("Frame", {
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 10, 0, 31),
        Size     = UDim2.new(1, -20, 0, 54),
    })
    headerRow.Parent = headerSection

    local avatarOuter = c("Frame", {
        BackgroundColor3 = Color3.fromRGB(26, 26, 26),
        Position         = UDim2.new(0, 0, 0, 1),
        Size             = UDim2.new(0, 50, 0, 50),
    }, {
        c("UICorner", {CornerRadius = UDim.new(1, 0)}),
        c("UIStroke", {Color = DraxUI.AccentColor, Thickness = 1.5, Name = "AvatarStroke"}),
    })
    avatarOuter.Parent = headerRow
    do
        local sk = avatarOuter:FindFirstChild("AvatarStroke")
        if sk then table.insert(DraxUI.AccentObjects, {Obj = sk, Prop = "Color"}) end
    end

    local avatarImg = c("ImageLabel", {
        BackgroundTransparency = 1,
        Image     = "rbxasset://textures/ui/GuiImagePlaceholder.png",
        Position  = UDim2.new(0, 3, 0, 3),
        Size      = UDim2.new(1, -6, 1, -6),
        ScaleType = Enum.ScaleType.Crop,
    }, {c("UICorner", {CornerRadius = UDim.new(1, 0)})})
    avatarImg.Parent = avatarOuter

    local nameLabel = c("TextLabel", {
        BackgroundTransparency = 1,
        Position       = UDim2.new(0, 58, 0, 1),
        Size           = UDim2.new(1, -58, 0, 20),
        Text           = "",
        TextColor3     = COL_TEXT,
        TextSize       = 15,
        Font           = Enum.Font.GothamBold,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextTruncate   = Enum.TextTruncate.AtEnd,
    })
    nameLabel.Parent = headerRow

    local userLabel = c("TextLabel", {
        BackgroundTransparency = 1,
        Position       = UDim2.new(0, 58, 0, 23),
        Size           = UDim2.new(1, -58, 0, 14),
        Text           = "",
        TextColor3     = COL_SUB,
        TextSize       = 12,
        Font           = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextTruncate   = Enum.TextTruncate.AtEnd,
    })
    userLabel.Parent = headerRow

    local uidLabel = c("TextLabel", {
        BackgroundTransparency = 1,
        Position       = UDim2.new(0, 58, 0, 39),
        Size           = UDim2.new(1, -58, 0, 12),
        Text           = "",
        TextColor3     = COL_SUB,
        TextSize       = 11,
        Font           = Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Left,
    })
    uidLabel.Parent = headerRow

    -- ── Status section (hidden for LocalPlayer) — height 60 ──────────────────
    -- Positioned at y=90 normally; when hidden, Visible=false + y stays (panel clips).
    local statusSection = c("Frame", {
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 0, 0, 90),
        Size     = UDim2.new(1, 0, 0, 60),
    })
    statusSection.Parent = rightPanel

    makeDivider(statusSection, 0)

    c("TextLabel", {
        BackgroundTransparency = 1,
        Position       = UDim2.new(0, 10, 0, 8),
        Size           = UDim2.new(1, -20, 0, 12),
        Text           = "STATUS",
        TextColor3     = COL_SUB,
        TextSize       = 10,
        Font           = Enum.Font.GothamMedium,
        TextXAlignment = Enum.TextXAlignment.Left,
    }).Parent = statusSection

    local statusBar = c("Frame", {
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 10, 0, 24),
        Size     = UDim2.new(1, -20, 0, 26),
    }, {
        c("UIListLayout", {
            SortOrder           = Enum.SortOrder.LayoutOrder,
            FillDirection       = Enum.FillDirection.Horizontal,
            Padding             = UDim.new(0, 4),
            HorizontalAlignment = Enum.HorizontalAlignment.Left,
        }),
    })
    statusBar.Parent = statusSection

    local statusBtns  = {}
    local activeStatus = nil

    local function refreshStatusHighlights(active)
        for lbl, btn in pairs(statusBtns) do
            local sk = btn:FindFirstChild("Stroke")
            if lbl == active then
                btn.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
                btn.TextColor3       = COL_TEXT
                if sk then sk.Color = COL_BORDER end
            else
                btn.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
                btn.TextColor3       = COL_TEXT
                if sk then sk.Color = COL_BORDER end
            end
        end
        activeStatus = active
    end

    local function makeStatusBtn(label, order)
        local btn = c("TextButton", {
            BackgroundColor3 = Color3.fromRGB(26, 26, 26),
            Size             = UDim2.new(0, 82, 1, 0),
            Text             = label,
            TextColor3       = COL_TEXT,
            TextSize         = 12,
            Font             = Enum.Font.Gotham,
            LayoutOrder      = order,
            AutoButtonColor  = false,
        }, {
            c("UICorner", {CornerRadius = UDim.new(0, 5)}),
            c("UIStroke", {Color = COL_BORDER, Thickness = 1, Name = "Stroke"}),
        })
        btn.Parent = statusBar
        statusBtns[label] = btn

        btn.MouseButton1Click:Connect(function()
            if not selectedPlayer or selectedPlayer == _lp6 then return end
            plrStatuses[selectedPlayer.UserId] = label
            savePlrStatuses()
            if selectedRow then
                local badge = selectedRow:FindFirstChild("BadgeLabel")
                if badge then
                    local bc = BADGE_COLS[label] or BADGE_COLS.None
                    badge.BackgroundColor3 = bc.bg
                    badge.TextColor3       = bc.fg
                    badge.Text             = label
                end
            end
            refreshStatusHighlights(label)
        end)

        return btn
    end

    makeStatusBtn("None",     1)
    makeStatusBtn("Enemy",    2)
    makeStatusBtn("Friendly", 3)

    -- ── Stats section (always visible) — height 96 ────────────────────────────
    -- Y position adjusted in populateRight: 90 for client, 150 for others.
    local statsSection = c("Frame", {
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 0, 0, 150),   -- default non-client position
        Size     = UDim2.new(1, 0, 0, 96),
    })
    statsSection.Parent = rightPanel

    makeDivider(statsSection, 0)

    c("TextLabel", {
        BackgroundTransparency = 1,
        Position       = UDim2.new(0, 10, 0, 8),
        Size           = UDim2.new(1, -20, 0, 12),
        Text           = "STATS",
        TextColor3     = COL_SUB,
        TextSize       = 10,
        Font           = Enum.Font.GothamMedium,
        TextXAlignment = Enum.TextXAlignment.Left,
    }).Parent = statsSection

    local statLabels = {}
    local function makeStatLabel(key, yPos)
        local lbl = c("TextLabel", {
            BackgroundTransparency = 1,
            Position       = UDim2.new(0, 10, 0, yPos),
            Size           = UDim2.new(1, -20, 0, 13),
            Text           = key .. ": —",
            TextColor3     = COL_TEXT,
            TextSize       = 12,
            Font           = Enum.Font.Gotham,
            TextXAlignment = Enum.TextXAlignment.Left,
        })
        lbl.Parent = statsSection
        statLabels[key] = lbl
    end

    makeStatLabel("Health", 25)
    makeStatLabel("State",  41)
    makeStatLabel("Pos",    57)
    makeStatLabel("Vel",    73)

    local function stopStatsTracking()
        if statsConn then statsConn:Disconnect(); statsConn = nil end
        statLabels.Health.Text = "Health: —"
        statLabels.State.Text  = "State: —"
        statLabels.Pos.Text    = "Pos: —"
        statLabels.Vel.Text    = "Vel: —"
    end

    local function startStatsTracking(pl)
        stopStatsTracking()
        statsConn = RunService.Heartbeat:Connect(function()
            local char = pl.Character
            if not char then return end
            local hum = char:FindFirstChildOfClass("Humanoid")
            local hrp = char:FindFirstChild("HumanoidRootPart")
            if hum then
                statLabels.Health.Text = string.format("Health: %.0f / %.0f", hum.Health, hum.MaxHealth)
                local st = tostring(hum:GetState())
                local stName = st:match("([^.]+)$") or st
                if (stName == "Running" or stName == "RunningNoPhysics") and hrp then
                    if hrp.AssemblyLinearVelocity.Magnitude < 1 then stName = "Idle" end
                end
                statLabels.State.Text = "State: " .. stName
            end
            if hrp then
                local p   = hrp.Position
                local vel = hrp.AssemblyLinearVelocity
                statLabels.Pos.Text = string.format("Pos: %.0f  %.0f  %.0f", p.X, p.Y, p.Z)
                statLabels.Vel.Text = string.format("Vel: %.1f", vel.Magnitude)
            end
        end)
    end

    -- ── Actions section (hidden for LocalPlayer) — height 64 ─────────────────
    -- Y position adjusted in populateRight: 246 for non-client.
    local actionsSection = c("Frame", {
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 0, 0, 246),
        Size     = UDim2.new(1, 0, 0, 64),
    })
    actionsSection.Parent = rightPanel

    makeDivider(actionsSection, 0)

    c("TextLabel", {
        BackgroundTransparency = 1,
        Position       = UDim2.new(0, 10, 0, 8),
        Size           = UDim2.new(1, -20, 0, 12),
        Text           = "ACTIONS",
        TextColor3     = COL_SUB,
        TextSize       = 10,
        Font           = Enum.Font.GothamMedium,
        TextXAlignment = Enum.TextXAlignment.Left,
    }).Parent = actionsSection

    local function makeActBtn(label, xPos, xSize)
        local btn = c("TextButton", {
            BackgroundColor3 = Color3.fromRGB(26, 26, 26),
            Position         = xPos,
            Size             = xSize,
            Text             = label,
            TextColor3       = COL_TEXT,
            TextSize         = 12,
            Font             = Enum.Font.GothamMedium,
            AutoButtonColor  = false,
        }, {
            c("UICorner", {CornerRadius = UDim.new(0, 5)}),
            c("UIStroke", {Color = COL_BORDER, Thickness = 1}),
        })
        btn.Parent = actionsSection
        -- No hover effects on action buttons
        return btn
    end

    -- Teleport (left half)
    local teleportBtn = makeActBtn("Teleport",
        UDim2.new(0, 10,  0, 24), UDim2.new(0.5, -14, 0, 30))
    teleportBtn.MouseButton1Click:Connect(function()
        if not selectedPlayer then return end
        local lc = _lp6.Character
        local tr = selectedPlayer.Character and selectedPlayer.Character:FindFirstChild("HumanoidRootPart")
        if lc and tr then
            lc:PivotTo(CFrame.new(tr.Position))
        end
    end)

    -- Spectate / Unspectate toggle (right half)
    spectateBtn = makeActBtn("Spectate",
        UDim2.new(0.5, 4,  0, 24), UDim2.new(0.5, -14, 0, 30))

    spectateBtn.MouseButton1Click:Connect(function()
        if not selectedPlayer then return end
        if spectateActive then
            -- ── Stop spectating ──────────────────────────────────────────────
            spectateActive = false
            if spectateSubConn  then spectateSubConn:Disconnect();  spectateSubConn  = nil end
            if spectateCharConn then spectateCharConn:Disconnect(); spectateCharConn = nil end
            spectateTarget = nil
            local lhum = _lp6.Character and _lp6.Character:FindFirstChildOfClass("Humanoid")
            if lhum then workspace.CurrentCamera.CameraSubject = lhum end
            spectateBtn.Text = "Spectate"
        else
            -- ── Start spectating selectedPlayer ──────────────────────────────
            spectateTarget = selectedPlayer
            spectateActive = true

            local function applySubject()
                local t = spectateTarget
                if not t then return end
                local hum = t.Character and t.Character:FindFirstChildOfClass("Humanoid")
                if hum then workspace.CurrentCamera.CameraSubject = hum end
            end

            applySubject()

            -- Re-apply if external code changes CameraSubject
            spectateSubConn = workspace.CurrentCamera:GetPropertyChangedSignal("CameraSubject"):Connect(function()
                if not spectateActive then return end
                local t = spectateTarget
                if not t then return end
                local hum = t.Character and t.Character:FindFirstChildOfClass("Humanoid")
                -- Only re-apply if something else stole the subject
                if workspace.CurrentCamera.CameraSubject ~= hum then
                    task.defer(function()
                        if spectateActive then applySubject() end
                    end)
                end
            end)

            -- Re-apply when target's character respawns
            spectateCharConn = spectateTarget.CharacterAdded:Connect(function(newChar)
                if spectateActive then
                    local hum = newChar:WaitForChild("Humanoid", 5)
                    if hum and spectateActive then
                        workspace.CurrentCamera.CameraSubject = hum
                    end
                end
            end)

            spectateBtn.Text = "Unspectate"
        end
    end)

    -- ── Right panel populate ──────────────────────────────────────────────────
    local function populateRight(pl)
        local isClient = (pl == _lp6)

        -- Avatar thumbnail (async)
        avatarImg.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
        task.spawn(function()
            local ok, img = pcall(function()
                return _PlService:GetUserThumbnailAsync(pl.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
            end)
            if ok and img and typeof(img) == "string" then avatarImg.Image = img end
        end)

        -- Name / username / uid
        nameLabel.Text = pl.DisplayName
        userLabel.Text = "(@" .. pl.Name .. ")"
        uidLabel.Text  = "UID: " .. pl.UserId

        -- Show / hide sections; adjust Y positions
        statusSection.Visible  = not isClient
        actionsSection.Visible = not isClient
        if isClient then
            statsSection.Position = UDim2.new(0, 0, 0, 90)
        else
            statsSection.Position = UDim2.new(0, 0, 0, 150)
            actionsSection.Position = UDim2.new(0, 0, 0, 246)
            refreshStatusHighlights(plrStatuses[pl.UserId] or "None")
        end

        -- Spectate button text
        if spectateActive and spectateTarget == pl then
            spectateBtn.Text = "Unspectate"
        else
            spectateBtn.Text = "Spectate"
        end

        -- Live stats
        startStatsTracking(pl)

        rightPanel.Visible = true
    end

    -- ── Row builder ───────────────────────────────────────────────────────────
    local rowMap = {}  -- [userId] = row Frame

    local function buildRow(pl)
        if rowMap[pl.UserId] then return end

        local isLocal = (pl == _lp6)
        local status  = isLocal and "Client" or (plrStatuses[pl.UserId] or "None")
        local bc      = BADGE_COLS[status] or BADGE_COLS.None

        -- Row frame: no ClipsDescendants so bar glow can bleed outwards
        local row = c("Frame", {
            BackgroundColor3 = COL_ROW,
            Size             = UDim2.new(1, 0, 0, 34),
        }, {c("UICorner", {CornerRadius = UDim.new(0, 5)})})

        -- Left accent bar
        local accentBar = c("Frame", {
            BackgroundColor3 = DraxUI.AccentColor,
            Position         = UDim2.new(0, 0, 0.5, -12),
            Size             = UDim2.new(0, 3, 0, 24),
            Visible          = false,
            Name             = "AccentBar",
        }, {c("UICorner", {CornerRadius = UDim.new(0, 2)})})
        accentBar.Parent = row
        table.insert(DraxUI.AccentObjects, {Obj = accentBar, Prop = "BackgroundColor3"})

        -- Glow on accent bar (extends right into the row content)
        local barGlow = c("ImageLabel", {
            Name               = "Bloom",
            BackgroundTransparency = 1,
            Image              = "rbxassetid://18245826428",
            ImageColor3        = DraxUI.AccentColor,
            ImageTransparency  = 0.35,
            ScaleType          = Enum.ScaleType.Slice,
            SliceCenter        = Rect.new(21, 21, 79, 79),
            AnchorPoint        = Vector2.new(0.4, 0),
            Position           = UDim2.new(0, 0, 0, -8),
            Size               = UDim2.new(0, 14, 0, 40),
            ZIndex             = 1,
        })
        barGlow.Parent = accentBar
        DraxUI.GlowRegistry[barGlow] = true
        DraxUI.SetGlowVisibility(barGlow, false)   -- hidden until row selected
        table.insert(DraxUI.AccentObjects, {Obj = barGlow, Prop = "ImageColor3"})

        -- Player avatar thumbnail (small circle, loaded async)
        local avatarRowImg = c("ImageLabel", {
            BackgroundColor3       = Color3.fromRGB(28, 28, 28),
            BackgroundTransparency = 0,
            Position = UDim2.new(0, 10, 0.5, -14),
            Size     = UDim2.new(0, 28, 0, 28),
        }, {c("UICorner", {CornerRadius = UDim.new(1, 0)})})
        avatarRowImg.Parent = row
        task.spawn(function()
            local ok, thumb = pcall(function()
                return _PlService:GetUserThumbnailAsync(
                    pl.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size48x48)
            end)
            if ok and thumb and avatarRowImg.Parent then avatarRowImg.Image = thumb end
        end)

        -- Player name label  (DisplayName + @username, shifted right past avatar)
        local nameL = c("TextLabel", {
            BackgroundTransparency = 1,
            Position       = UDim2.new(0, 46, 0, 0),
            Size           = UDim2.new(1, -132, 1, 0),
            Text           = pl.DisplayName .. " (@" .. pl.Name .. ")",
            TextColor3     = COL_TEXT,
            TextSize       = 13,
            Font           = Enum.Font.GothamMedium,
            TextXAlignment = Enum.TextXAlignment.Left,
            TextTruncate   = Enum.TextTruncate.AtEnd,
            Name           = "NameLabel",
        })
        nameL.Parent = row
        -- Live accent: text is accent colored only when this row is selected
        table.insert(DraxUI.AccentObjects, {
            Obj      = nameL,
            Prop     = "TextColor3",
            IsToggle = true,
            GetState = function() return selectedRow == row end,
        })

        -- Status badge
        local badge = c("TextLabel", {
            BackgroundColor3 = bc.bg,
            Position         = UDim2.new(1, -88, 0.5, -9),
            Size             = UDim2.new(0, 74, 0, 18),
            Text             = status,
            TextColor3       = bc.fg,
            TextSize         = 11,
            Font             = Enum.Font.GothamMedium,
            TextXAlignment   = Enum.TextXAlignment.Center,
            Name             = "BadgeLabel",
        }, {c("UICorner", {CornerRadius = UDim.new(0, 4)})})
        badge.Parent = row
        -- Client badge background tracks accent color
        if isLocal then
            table.insert(DraxUI.AccentObjects, {Obj = badge, Prop = "BackgroundColor3"})
        end

        -- Invisible hit button
        local btn = c("TextButton", {
            BackgroundTransparency = 1,
            Size   = UDim2.new(1, 0, 1, 0),
            Text   = "",
            ZIndex = 5,
        })
        btn.Parent = row

        -- Hover effects disabled on player rows

        btn.MouseButton1Click:Connect(function()
            -- Deselect previous row
            if selectedRow and selectedRow ~= row then
                tween(selectedRow, {0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.Out}, {BackgroundColor3 = COL_ROW})
                local prevBar = selectedRow:FindFirstChild("AccentBar")
                if prevBar then
                    prevBar.Visible = false
                    local pg = prevBar:FindFirstChild("Bloom")
                    if pg then DraxUI.SetGlowVisibility(pg, false) end
                end
                local prevN = selectedRow:FindFirstChild("NameLabel")
                if prevN then prevN.TextColor3 = COL_TEXT end
            end

            if selectedRow == row then
                -- Deselect current
                selectedRow    = nil
                selectedPlayer = nil
                tween(row, {0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.Out}, {BackgroundColor3 = COL_ROW})
                accentBar.Visible = false
                DraxUI.SetGlowVisibility(barGlow, false)
                nameL.TextColor3  = COL_TEXT
                rightPanel.Visible = false
                stopStatsTracking()
            else
                -- Select
                selectedRow    = row
                selectedPlayer = pl
                tween(row, {0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.Out}, {BackgroundColor3 = COL_ROWSEL})
                accentBar.Visible = true
                DraxUI.SetGlowVisibility(barGlow, true)
                nameL.TextColor3  = DraxUI.AccentColor
                populateRight(pl)
            end
        end)

        row.Parent = listFrame
        rowMap[pl.UserId] = row

        -- Update count
        local cnt = 0
        for _, ch in ipairs(listFrame:GetChildren()) do
            if ch:IsA("Frame") then cnt = cnt + 1 end
        end
        leftTitle.Text = "Players [" .. cnt .. "]"
    end

    local function removeRow(pl)
        local row = rowMap[pl.UserId]
        if not row then return end
        rowMap[pl.UserId] = nil
        -- Stop spectating if the leaving player was the spectate target
        if spectateActive and spectateTarget == pl then
            spectateActive = false
            if spectateSubConn  then spectateSubConn:Disconnect();  spectateSubConn  = nil end
            if spectateCharConn then spectateCharConn:Disconnect(); spectateCharConn = nil end
            spectateTarget = nil
            if spectateBtn then spectateBtn.Text = "Spectate" end
            local lhum = _lp6.Character and _lp6.Character:FindFirstChildOfClass("Humanoid")
            if lhum then workspace.CurrentCamera.CameraSubject = lhum end
        end
        if selectedRow == row then
            selectedRow    = nil
            selectedPlayer = nil
            rightPanel.Visible = false
            stopStatsTracking()
        end
        row:Destroy()
        local cnt = 0
        for _, ch in ipairs(listFrame:GetChildren()) do
            if ch:IsA("Frame") then cnt = cnt + 1 end
        end
        leftTitle.Text = "Players [" .. cnt .. "]"
    end

    -- ── Search filter ─────────────────────────────────────────────────────────
    searchBox:GetPropertyChangedSignal("Text"):Connect(function()
        local q = searchBox.Text:lower()
        for _, row in pairs(rowMap) do
            local nl = row:FindFirstChild("NameLabel")
            if nl then
                row.Visible = (q == "" or nl.Text:lower():find(q, 1, true) ~= nil)
            end
        end
    end)

    -- ── Populate existing players ─────────────────────────────────────────────
    for _, pl in ipairs(_PlService:GetPlayers()) do buildRow(pl) end

    _PlService.PlayerAdded:Connect(function(pl)   buildRow(pl)   end)
    _PlService.PlayerRemoving:Connect(function(pl) removeRow(pl) end)
end  -- Players tab

-- ── Game Detection ──────────────────────────────────────────────────────────
-- Game modules are injected by build.py between the markers below.
-- Each module is a table: { name, placeIds = {}, setup = function(tab, Config, DraxUI) }
local _GAME_MODULES = {
    -- [Baseplate.lua]
    {
        name     = "Baseplate",
        placeIds = {123974602339071},

        setup = function(tab, Config, DraxUI)
            -- ── Services ──────────────────────────────────────────────────────────
            local ps  = game:GetService("Players")
            local rs  = game:GetService("RunService")
            local hs  = game:GetService("HttpService")
            local cp  = game:GetService("ContentProvider")
            local ss  = game:GetService("SoundService")
            local lp  = ps.LocalPlayer

            -- ── Feature flags (declared first so closures below can reference them)
            local anti_oof_enabled = true
            local hitsound_enabled = true

            -- ── Kill Sound ────────────────────────────────────────────────────────
            local ks = Instance.new("Sound")
            ks.SoundId = "rbxassetid://99877646093596"
            ks.Volume  = 2
            ks.Parent  = ss
            task.spawn(function() pcall(function() cp:PreloadAsync({ks}) end) end)

            -- ── Anti-OOF (mute death sound) ───────────────────────────────────────
            local function mute_character(char)
                if not anti_oof_enabled then return end
                local hrp = char:WaitForChild("HumanoidRootPart", 5)
                if hrp then
                    local died = hrp:WaitForChild("Died", 2) or hrp:FindFirstChild("Died")
                    if died then died:Destroy() end
                end
            end
            local function track_player_sounds(p)
                if p.Character then task.spawn(mute_character, p.Character) end
                p.CharacterAdded:Connect(mute_character)
            end
            for _, p in ipairs(ps:GetPlayers()) do track_player_sounds(p) end
            ps.PlayerAdded:Connect(track_player_sounds)

            local forbidden_ids = {
                "rbxasset://sounds/uuhhh.mp3", "sounds/uuhhh.mp3",
                "12222242", "rbxassetid://12222242"
            }
            local function kill_sound(s)
                if not anti_oof_enabled then return end
                if s:IsA("Sound") then
                    local id = s.SoundId:lower()
                    for _, f in ipairs(forbidden_ids) do
                        if id:find(f, 1, true) then s:Stop(); s.Volume = 0; s:Destroy(); break end
                    end
                end
            end
            for _, v in ipairs(game:GetDescendants()) do pcall(kill_sound, v) end
            game.DescendantAdded:Connect(function(v) pcall(kill_sound, v) end)
            rs.Heartbeat:Connect(function()
                for _, p in ipairs(ps:GetPlayers()) do
                    local ch = p.Character
                    if ch then
                        local hrp = ch:FindFirstChild("HumanoidRootPart")
                        if hrp then
                            local sd = hrp:FindFirstChild("Died") or hrp:FindFirstChild("Death")
                            if sd then pcall(kill_sound, sd) end
                        end
                    end
                end
            end)

            -- ── State ─────────────────────────────────────────────────────────────
            local nan              = 0/0
            local void_act         = false
            local kill_mode        = "tpkill"
            local use_void         = false
            local auto_mode        = false
            local use_webhook      = false
            local is_killing       = false
            local queued_target    = nil
            local target_start_time = 0
            local self_destructing = false
            local spawn_times      = {}
            local kill_counts      = {}
            local total_kills      = 0
            local my_spawn         = 0
            local auto_targets_text = ""
            local webhook_url_text  = ""

            -- ── Forward declarations (needed by callbacks created before defs) ────
            local update_list
            local execute_action
            local overlay
            local overlay_text
            local ensure_void_rs
            local voidCamPart

            -- ── Raw tab frame (for custom right-side player list) ─────────────────
            local tabRaw  = win.Tabs["Baseplate"]
            -- Hide the unused right DraxUI column so it doesn't block mouse events
            local _rightCol = tabRaw:FindFirstChild("Right")
            if _rightCol then _rightCol.Visible = false end

            -- ── Colors ────────────────────────────────────────────────────────────
            local COL_TEXT   = Color3.fromRGB(220, 220, 220)
            local COL_SUB    = Color3.fromRGB(110, 110, 110)
            local COL_BORDER = Color3.fromRGB(36, 36, 36)
            local COL_WAIT   = Color3.fromRGB(30, 30, 30)
            local COL_DEAD   = Color3.fromRGB(20, 20, 20)

            -- ── Dynamic accent color live-update ──────────────────────────────────
            local accent_frames = {}
            rs.Heartbeat:Connect(function()
                local ac = DraxUI.AccentColor
                for i = #accent_frames, 1, -1 do
                    local e = accent_frames[i]
                    if e.obj and e.obj.Parent then
                        e.obj[e.prop] = Color3.new(ac.R * e.mult, ac.G * e.mult, ac.B * e.mult)
                    else
                        table.remove(accent_frames, i)
                    end
                end
            end)

            -- ── LEFT — DraxUI Sections ────────────────────────────────────────────
            local kill_sec = tab:Section("Left", "Kill")

            local MODES = {"tpkill", "gotokill", "givetool"}
            local modeWidget = kill_sec:Dropdown("Mode", MODES, 1, function(idx)
                kill_mode = MODES[idx]
                if update_list then update_list() end
            end)
            DraxUI.RegCfg("bp.killmode", modeWidget)

            local voidWidget = kill_sec:Checkbox("Void kill", false, function(v)
                use_void = v
            end)
            DraxUI.RegCfg("bp.void", voidWidget)

            local autoWidget = kill_sec:Checkbox("Auto kill", false, function(v)
                auto_mode = v
                if not v and is_killing and not queued_target then
                    is_killing = false
                    if overlay then overlay.Visible = false end
                end
            end)
            DraxUI.RegCfg("bp.auto", autoWidget)

            local antiOofWidget = kill_sec:Checkbox("Anti-OOF", true, function(v)
                anti_oof_enabled = v
            end)
            DraxUI.RegCfg("bp.antioof", antiOofWidget)

            local hitsoundWidget = kill_sec:Checkbox("Hitsound", true, function(v)
                hitsound_enabled = v
            end)
            DraxUI.RegCfg("bp.hitsound", hitsoundWidget)

            kill_sec:Button("Godmode", function()
                local has_tool = lp.Backpack:FindFirstChildOfClass("Tool")
                    or (lp.Character and lp.Character:FindFirstChildOfClass("Tool"))
                if not has_tool then
                    DraxUI.Notification("aku.hook", "Get a tool first!")
                    return
                end

                local function get_initial_tool_name()
                    local tool = lp.Backpack:FindFirstChildOfClass("Tool")
                        or (lp.Character and lp.Character:FindFirstChildOfClass("Tool"))
                    return tool and tool.Name or nil
                end
                local auth_name = get_initial_tool_name()

                local function enforce()
                    for _, v in ipairs(lp.Backpack:GetChildren()) do
                        if v:IsA("Tool") and v.Name ~= auth_name then v:Destroy() end
                    end
                    if lp.Character then
                        for _, v in ipairs(lp.Character:GetChildren()) do
                            if v:IsA("Tool") and v.Name ~= auth_name then v:Destroy() end
                        end
                    end
                end

                local function monitor(container)
                    if not container then return end
                    container.ChildAdded:Connect(function(child)
                        if child:IsA("Tool") then
                            rs.Heartbeat:Wait()
                            if child.Name ~= auth_name then
                                child:Destroy()
                            else
                                local tools = {}
                                for _, v in ipairs(lp.Backpack:GetChildren()) do
                                    if v:IsA("Tool") and v.Name == auth_name then table.insert(tools, v) end
                                end
                                if lp.Character then
                                    for _, v in ipairs(lp.Character:GetChildren()) do
                                        if v:IsA("Tool") and v.Name == auth_name then table.insert(tools, v) end
                                    end
                                end
                                if #tools > 1 then child:Destroy() end
                            end
                        end
                    end)
                end

                if auth_name then
                    enforce()
                    monitor(lp.Backpack)
                    if lp.Character then monitor(lp.Character) end
                    lp.CharacterAdded:Connect(function(char)
                        task.wait(0.1)
                        enforce()
                        monitor(char)
                    end)
                end
                DraxUI.Notification("aku.hook", "Godmode Activated")
            end)

            -- Auto Targets section
            local auto_sec = tab:Section("Left", "Auto Targets")
            local autoBoxWidget = auto_sec:TextBox("Names", "comma separated", "", function(v)
                auto_targets_text = v
            end)
            DraxUI.RegCfg("bp.autotargets", autoBoxWidget)

            -- Webhook section
            local web_sec = tab:Section("Left", "Webhook")
            local webWidget = web_sec:Checkbox("Enable webhook", false, function(v)
                use_webhook = v
            end)
            DraxUI.RegCfg("bp.webhook", webWidget)

            local webUrlWidget = web_sec:TextBox("URL", "https://discord.com/api/webhooks/...", "", function(v)
                webhook_url_text = v
            end)
            DraxUI.RegCfg("bp.webhookurl", webUrlWidget)

            -- ── RIGHT — custom player list panel ──────────────────────────────────
            -- Y=25 matches where leftCol (DraxUI sections column) begins inside tabContent
            local listPanel = c("Frame", {
                BackgroundColor3 = Color3.fromRGB(18, 18, 18),
                Position         = UDim2.new(0, 323, 0, 25),
                Size             = UDim2.new(1, -331, 1, -35),
            }, {
                c("UICorner", {CornerRadius = UDim.new(0, 6)}),
                c("UIStroke",  {Color = Color3.fromRGB(35, 35, 35), Thickness = 1}),
            })
            listPanel.Parent = tabRaw

            -- Kill graph (scrollable leaderboard)
            local graph_title = c("TextLabel", {
                BackgroundTransparency = 1,
                Position       = UDim2.new(0, 10, 0, 8),
                Size           = UDim2.new(1, -20, 0, 14),
                Text           = "Kill Leaderboard",
                TextColor3     = COL_SUB,
                TextSize       = 11,
                Font           = Enum.Font.GothamMedium,
                TextXAlignment = Enum.TextXAlignment.Left,
            })
            graph_title.Parent = listPanel

            local graph_frame = c("ScrollingFrame", {
                BackgroundColor3       = Color3.fromRGB(22, 22, 22),
                Position               = UDim2.new(0, 8, 0, 26),
                Size                   = UDim2.new(1, -16, 0, 56),
                ScrollBarThickness     = 2,
                ScrollBarImageColor3   = Color3.fromRGB(65, 65, 65),
                CanvasSize             = UDim2.new(0, 0, 0, 0),
                AutomaticCanvasSize    = Enum.AutomaticSize.Y,
                BorderSizePixel        = 0,
            }, {
                c("UICorner",    {CornerRadius = UDim.new(0, 4)}),
                c("UIStroke",    {Color = COL_BORDER, Thickness = 1}),
                c("UIListLayout",{SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 2)}),
                c("UIPadding",   {PaddingTop = UDim.new(0, 3), PaddingBottom = UDim.new(0, 3),
                                   PaddingLeft = UDim.new(0, 4), PaddingRight = UDim.new(0, 4)}),
            })
            graph_frame.Parent = listPanel

            local listTitle = c("TextLabel", {
                BackgroundTransparency = 1,
                Position       = UDim2.new(0, 10, 0, 90),
                Size           = UDim2.new(1, -20, 0, 14),
                Text           = "Players [0]",
                TextColor3     = COL_SUB,
                TextSize       = 11,
                Font           = Enum.Font.GothamMedium,
                TextXAlignment = Enum.TextXAlignment.Left,
            })
            listTitle.Parent = listPanel

            local scroll = c("ScrollingFrame", {
                BackgroundTransparency = 1,
                Position               = UDim2.new(0, 8, 0, 108),
                Size                   = UDim2.new(1, -16, 1, -116),
                ScrollBarThickness     = 3,
                ScrollBarImageColor3   = Color3.fromRGB(65, 65, 65),
                CanvasSize             = UDim2.new(0, 0, 0, 0),
                AutomaticCanvasSize    = Enum.AutomaticSize.Y,
                BorderSizePixel        = 0,
            }, {
                c("UIListLayout", {SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 3)}),
            })
            scroll.Parent = listPanel

            -- Overlay (covers full tab while killing / waiting)
            overlay = c("Frame", {
                BackgroundColor3       = Color3.fromRGB(0, 0, 0),
                BackgroundTransparency = 0.55,
                Size                   = UDim2.new(1, 0, 1, 0),
                ZIndex                 = 20,
                Visible                = false,
                Active                 = true,
            })
            overlay.Parent = tabRaw

            overlay_text = c("TextLabel", {
                BackgroundTransparency = 1,
                Size                   = UDim2.new(1, 0, 1, 0),
                TextColor3             = Color3.fromRGB(255, 255, 255),
                Font                   = Enum.Font.GothamBold,
                TextSize               = 16,
                ZIndex                 = 21,
                TextWrapped            = true,
            })
            overlay_text.Parent = overlay

            -- ── Helpers ───────────────────────────────────────────────────────────
            local function update_graph()
                for i = #accent_frames, 1, -1 do
                    if accent_frames[i].tag == "graph" then table.remove(accent_frames, i) end
                end
                for _, v in ipairs(graph_frame:GetChildren()) do
                    if v:IsA("Frame") then v:Destroy() end
                end
                local sorted = {}
                for p, cnt in pairs(kill_counts) do
                    if cnt > 0 and p.Parent then table.insert(sorted, {p = p, c = cnt}) end
                end
                table.sort(sorted, function(a, b) return a.c > b.c end)
                local max_k = math.max(1, sorted[1] and sorted[1].c or 1)
                local ac = DraxUI.AccentColor
                for i, d in ipairs(sorted) do
                    local bar_bg = c("Frame", {
                        Size             = UDim2.new(1, 0, 0, 16),
                        BackgroundColor3 = Color3.fromRGB(15, 15, 15),
                        BorderSizePixel  = 0,
                    })
                    local bar_fill = c("Frame", {
                        Size             = UDim2.new(d.c / max_k, 0, 1, 0),
                        BackgroundColor3 = Color3.new(ac.R * 0.45, ac.G * 0.45, ac.B * 0.45),
                        BorderSizePixel  = 0,
                    })
                    bar_fill.Parent = bar_bg
                    table.insert(accent_frames, {obj = bar_fill, prop = "BackgroundColor3", mult = 0.45, tag = "graph"})
                    c("TextLabel", {
                        BackgroundTransparency = 1,
                        Position       = UDim2.new(0, 4, 0, 0),
                        Size           = UDim2.new(1, -4, 1, 0),
                        Text           = string.format("#%d  %s — %d kill%s", i, d.p.Name, d.c, d.c == 1 and "" or "s"),
                        TextColor3     = Color3.fromRGB(200, 200, 200),
                        Font           = Enum.Font.Gotham,
                        TextSize       = 11,
                        TextXAlignment = Enum.TextXAlignment.Left,
                    }).Parent = bar_bg
                    bar_bg.Parent = graph_frame
                end
            end

            local function send_webhook(action, t, tm)
                if not use_webhook or webhook_url_text == "" then return end
                local req = (syn and syn.request) or (http and http.request) or http_request or request
                if not req then return end

                local thumb = string.format(
                    "https://www.roblox.com/headshot-thumbnail/image?userId=%d&width=420&height=420&format=png",
                    t.UserId)

                local min_val = "N/A"
                local ls = t:FindFirstChild("leaderstats")
                if ls and ls:FindFirstChild("Minutes") then min_val = tostring(ls.Minutes.Value) end

                local time_lived_s = spawn_times[t] and (spawn_times[t] > 0)
                    and string.format("%.1fs", tick() - spawn_times[t]) or "N/A"

                -- color: red=kill/void, green=givetool
                local embed_color = (action == "Given Tool") and 0x2ECC71 or 0xE74C3C

                local data = {
                    ["embeds"] = {{
                        ["title"]       = action .. " — " .. t.DisplayName,
                        ["description"] = string.format("**@%s** | UID: %d", t.Name, t.UserId),
                        ["color"]       = embed_color,
                        ["thumbnail"]   = {["url"] = thumb},
                        ["fields"] = {
                            {["name"] = "Display Name",  ["value"] = t.DisplayName,                     ["inline"] = true},
                            {["name"] = "Username",      ["value"] = "@" .. t.Name,                    ["inline"] = true},
                            {["name"] = "User ID",       ["value"] = tostring(t.UserId),               ["inline"] = true},
                            {["name"] = "Account Age",   ["value"] = tostring(t.AccountAge) .. "d",   ["inline"] = true},
                            {["name"] = "Minutes",       ["value"] = min_val,                          ["inline"] = true},
                            {["name"] = "Time Lived",    ["value"] = time_lived_s,                     ["inline"] = true},
                            {["name"] = "Target Kills",  ["value"] = tostring(kill_counts[t] or 0),   ["inline"] = true},
                            {["name"] = "Total Kills",   ["value"] = tostring(total_kills),            ["inline"] = true},
                            {["name"] = "Killed in",     ["value"] = string.format("%.1fs", tm),       ["inline"] = true},
                        },
                        ["footer"] = {["text"] = "aku.hook · " .. kill_mode},
                    }}
                }
                task.spawn(function()
                    pcall(function()
                        req({
                            Url     = webhook_url_text,
                            Method  = "POST",
                            Headers = {["Content-Type"] = "application/json"},
                            Body    = hs:JSONEncode(data),
                        })
                    end)
                end)
            end

            local function send_missed_webhook(t)
                if not use_webhook or webhook_url_text == "" or not t or not t.Parent then return end
                local req = (syn and syn.request) or (http and http.request) or http_request or request
                if not req then return end
                local thumb = string.format(
                    "https://www.roblox.com/headshot-thumbnail/image?userId=%d&width=420&height=420&format=png",
                    t.UserId)
                local time_lived_s = spawn_times[t] and (spawn_times[t] > 0)
                    and string.format("%.1fs", tick() - spawn_times[t]) or "N/A"
                local data = {
                    ["embeds"] = {{
                        ["title"]       = "Missed — " .. t.DisplayName,
                        ["description"] = string.format("**@%s** | UID: %d", t.Name, t.UserId),
                        ["color"]       = 0xE67E22,
                        ["thumbnail"]   = {["url"] = thumb},
                        ["fields"] = {
                            {["name"] = "Display Name", ["value"] = t.DisplayName,                      ["inline"] = true},
                            {["name"] = "Username",     ["value"] = "@" .. t.Name,                     ["inline"] = true},
                            {["name"] = "User ID",      ["value"] = tostring(t.UserId),                ["inline"] = true},
                            {["name"] = "Account Age",  ["value"] = tostring(t.AccountAge) .. "d",    ["inline"] = true},
                            {["name"] = "Time Lived",   ["value"] = time_lived_s,                      ["inline"] = true},
                            {["name"] = "Kill Mode",    ["value"] = kill_mode,                         ["inline"] = true},
                        },
                        ["footer"] = {["text"] = "aku.hook · missed"},
                    }}
                }
                task.spawn(function()
                    pcall(function()
                        req({
                            Url     = webhook_url_text,
                            Method  = "POST",
                            Headers = {["Content-Type"] = "application/json"},
                            Body    = hs:JSONEncode(data),
                        })
                    end)
                end)
            end

            local function send_death_webhook()            if not use_webhook or webhook_url_text == "" then return end
                local req = (syn and syn.request) or (http and http.request) or http_request or request
                if not req then return end
                local thumb = string.format(
                    "https://www.roblox.com/headshot-thumbnail/image?userId=%d&width=420&height=420&format=png",
                    lp.UserId)
                local data = {
                    ["embeds"] = {{
                        ["title"]     = "LocalPlayer Died (External)",
                        ["color"]     = 16776960,
                        ["thumbnail"] = {["url"] = thumb},
                        ["fields"] = {
                            {["name"] = "Display Name", ["value"] = lp.DisplayName, ["inline"] = true},
                            {["name"] = "Username",     ["value"] = "@" .. lp.Name, ["inline"] = true},
                        }
                    }}
                }
                task.spawn(function()
                    pcall(function()
                        req({
                            Url     = webhook_url_text,
                            Method  = "POST",
                            Headers = {["Content-Type"] = "application/json"},
                            Body    = hs:JSONEncode(data),
                        })
                    end)
                end)
            end

            -- Player list (mirrors Players tab row style)
            update_list = function()
                for i = #accent_frames, 1, -1 do
                    if accent_frames[i].tag == "row" then table.remove(accent_frames, i) end
                end
                for _, v in ipairs(scroll:GetChildren()) do
                    if v:IsA("Frame") then v:Destroy() end
                end
                local cnt = 0
                for _, p in ipairs(ps:GetPlayers()) do
                    if p ~= lp then
                        local is_dead    = not p.Character
                            or not p.Character:FindFirstChild("Humanoid")
                            or p.Character.Humanoid.Health <= 0
                        local charged    = (spawn_times[p] or 0) < my_spawn
                        local can_action = (kill_mode == "givetool") or charged

                        local ac = DraxUI.AccentColor
                        local row_col = is_dead and COL_DEAD
                            or can_action and Color3.new(ac.R * 0.28, ac.G * 0.28, ac.B * 0.28)
                            or COL_WAIT

                        local row_stroke = c("UIStroke", {
                            Color     = can_action and not is_dead
                                and Color3.new(DraxUI.AccentColor.R*0.65, DraxUI.AccentColor.G*0.65, DraxUI.AccentColor.B*0.65)
                                or COL_BORDER,
                            Thickness = 1,
                        })
                        local row = c("Frame", {
                            Size             = UDim2.new(1, 0, 0, 32),
                            BackgroundColor3 = row_col,
                            BorderSizePixel  = 0,
                        }, {
                            c("UICorner", {CornerRadius = UDim.new(0, 5)}),
                            row_stroke,
                        })
                        if can_action and not is_dead then
                            table.insert(accent_frames, {obj = row,        prop = "BackgroundColor3", mult = 0.28, tag = "row"})
                            table.insert(accent_frames, {obj = row_stroke, prop = "Color",            mult = 0.65, tag = "row"})
                        end

                        -- Avatar thumbnail
                        local img = c("ImageLabel", {
                            BackgroundTransparency = 1,
                            Position = UDim2.new(0, 4, 0.5, -12),
                            Size     = UDim2.new(0, 24, 0, 24),
                            Image    = "rbxasset://textures/ui/GuiImagePlaceholder.png",
                        }, {c("UICorner", {CornerRadius = UDim.new(1, 0)})})
                        img.Parent = row
                        task.spawn(function()
                            local ok, thumb = pcall(function()
                                return ps:GetUserThumbnailAsync(
                                    p.UserId,
                                    Enum.ThumbnailType.HeadShot,
                                    Enum.ThumbnailSize.Size48x48)
                            end)
                            if ok and img.Parent then img.Image = thumb end
                        end)

                        -- Name label
                        local k_str  = kill_counts[p] and kill_counts[p] > 0
                            and string.format(" [%dx]", kill_counts[p]) or ""
                        local name_str = p.DisplayName .. " (@" .. p.Name .. ")"
                            .. (is_dead and " [DEAD]" or "") .. k_str

                        c("TextLabel", {
                            BackgroundTransparency = 1,
                            Position       = UDim2.new(0, 33, 0, 0),
                            Size           = UDim2.new(1, -37, 1, 0),
                            Text           = name_str,
                            TextColor3     = is_dead and COL_SUB or COL_TEXT,
                            Font           = Enum.Font.Gotham,
                            TextSize       = 11,
                            TextXAlignment = Enum.TextXAlignment.Left,
                            TextTruncate   = Enum.TextTruncate.AtEnd,
                        }).Parent = row

                        -- Click overlay button
                        local click_btn = c("TextButton", {
                            BackgroundTransparency = 1,
                            Size = UDim2.new(1, 0, 1, 0),
                            Text = "",
                            ZIndex = 2,
                        })
                        click_btn.Parent = row

                        -- Capture loop vars
                        local _p          = p
                        local _can_action = can_action
                        local _is_dead    = is_dead
                        click_btn.MouseButton1Click:Connect(function()
                            if is_killing or auto_mode then return end
                            target_start_time = tick()
                            if _can_action and not _is_dead then
                                queued_target = nil
                                execute_action(_p)
                            else
                                queued_target    = _p
                                is_killing       = true
                                overlay.Visible  = true
                                overlay_text.Text = "Waiting for " .. _p.DisplayName .. "..."
                                if lp.Character then
                                    self_destructing = true
                                    lp.Character:BreakJoints()
                                end
                            end
                        end)

                        row.Parent = scroll
                        cnt = cnt + 1
                    end
                end
                listTitle.Text = "Players [" .. cnt .. "]"
                update_graph()
            end

            -- ── execute_action ────────────────────────────────────────────────────
            execute_action = function(t)
                if not t then return end
                local char = lp.Character or lp.CharacterAdded:Wait()
                local hrp  = char:WaitForChild("HumanoidRootPart", 5)
                local tr   = t.Character
                    and (t.Character:FindFirstChild("HumanoidRootPart") or t.Character:FindFirstChild("Torso"))

                local has_tool_check = lp.Backpack:FindFirstChildOfClass("Tool")
                    or (lp.Character and lp.Character:FindFirstChildOfClass("Tool"))
                if not has_tool_check then
                    DraxUI.Notification("aku.hook", "No tools!", true)
                    return
                end

                is_killing       = true
                overlay.Visible  = true
                local act_str    = (kill_mode == "givetool") and "Giving tool to " or "Killing "
                overlay_text.Text = act_str .. t.DisplayName .. "..."

                local hum = char:WaitForChild("Humanoid", 5)
                if not hum or not hrp then
                    is_killing = false; overlay.Visible = false; queued_target = nil
                    return
                end

                local tl
                for i = 1, 30 do
                    tl = char:FindFirstChildOfClass("Tool") or lp.Backpack:FindFirstChildOfClass("Tool")
                    if tl then break end
                    task.wait()
                end

                if not tl or not tr or not tl:FindFirstChild("Handle") then
                    is_killing = false; overlay.Visible = false; queued_target = nil
                    return
                end

                local h      = tl.Handle
                local t_name = tl.Name

                if kill_mode == "givetool" then
                    hum:EquipTool(tl)
                    task.wait(0.1)
                    local po = hrp.CFrame:Inverse() * h.CFrame
                    hum:UnequipTools()

                    local nh = hum:Clone()
                    if char:FindFirstChild("Animate") then char.Animate.Disabled = true end
                    hum:Destroy()
                    nh.Parent = char
                    tl.Parent = char
                    workspace.CurrentCamera.CameraSubject = nh

                    -- Snapshot which tool instances the target already owns; only count NEW ones as success
                    local target_tools_before = {}
                    if t.Character then
                        for _, v in ipairs(t.Character:GetChildren()) do
                            if v:IsA("Tool") then target_tools_before[v] = true end
                        end
                    end
                    if t.Backpack then
                        for _, v in ipairs(t.Backpack:GetChildren()) do
                            if v:IsA("Tool") then target_tools_before[v] = true end
                        end
                    end

                    local loop
                    local loop_deadline = tick() + 5
                    loop = rs.Stepped:Connect(function()
                        if tick() > loop_deadline then
                            loop:Disconnect()
                            is_killing = false; overlay.Visible = false; queued_target = nil
                            send_missed_webhook(t)
                            DraxUI.Notification("aku.hook", "Timeout: couldn't give to " .. t.Name, true)
                            -- break joints to reset the fake-humanoid character state
                            if char and char:FindFirstChild("HumanoidRootPart") then
                                self_destructing = true
                                char:BreakJoints()
                            end
                            return
                        end
                        -- target left the game
                        if not t.Parent then
                            loop:Disconnect()
                            is_killing = false; overlay.Visible = false; queued_target = nil
                            if char and char:FindFirstChild("HumanoidRootPart") then
                                self_destructing = true
                                char:BreakJoints()
                            end
                            return
                        end
                        local t_char = t.Character
                        local t_hum  = t_char and t_char:FindFirstChildOfClass("Humanoid")
                        -- Only count as 'given' if a NEW tool instance appeared (not one target already had)
                        local has_tool = false
                        if t_char then
                            for _, v in ipairs(t_char:GetChildren()) do
                                if v:IsA("Tool") and v.Name == t_name and not target_tools_before[v] then
                                    has_tool = true; break
                                end
                            end
                        end
                        if not has_tool and t.Backpack then
                            for _, v in ipairs(t.Backpack:GetChildren()) do
                                if v:IsA("Tool") and v.Name == t_name and not target_tools_before[v] then
                                    has_tool = true; break
                                end
                            end
                        end

                        if not t_char or not t_hum or t_hum.Health <= 0 or has_tool or not tl.Parent then
                            loop:Disconnect()
                            local elapsed = tick() - target_start_time
                            if has_tool then
                                send_webhook("Given Tool", t, elapsed)
                                DraxUI.Notification("aku.hook", "Given tool to " .. t.Name)
                            end
                            is_killing = false; overlay.Visible = false; queued_target = nil
                            if char and char:FindFirstChild("HumanoidRootPart") then
                                self_destructing = true
                                char:BreakJoints()
                            end
                            return
                        end

                        nh:ChangeState(15)
                        local cur_tr = t.Character:FindFirstChild("HumanoidRootPart")
                            or t.Character:FindFirstChild("Torso")
                        if cur_tr and tl:FindFirstChild("Handle") then
                            h.CanCollide  = false
                            h.Massless    = true
                            h.Velocity    = Vector3.zero
                            h.RotVelocity = Vector3.zero
                            h.CFrame      = cur_tr.CFrame * po
                            for _, part in ipairs(t.Character:GetChildren()) do
                                if part:IsA("BasePart")
                                    and part:IsDescendantOf(workspace)
                                    and h:IsDescendantOf(workspace) then
                                    firetouchinterest(part, h, 0)
                                    firetouchinterest(part, h, 1)
                                end
                            end
                        end
                    end)
                else
                    if use_void then void_act = true; task.wait(0.5) end
                    -- gotokill: teleport our character to the target first
                    if kill_mode == "gotokill" and tr then
                        hrp.CFrame = tr.CFrame * CFrame.new(0, 0, 1.5)
                        task.wait(0.05)
                    end
                    hum:UnequipTools()

                    local a0, a1
                    local rc_inst = Instance.new("RigidConstraint", h)
                    if kill_mode == "gotokill" then
                        a0 = Instance.new("Attachment", tr)
                        a1 = Instance.new("Attachment", h)
                    else
                        a0 = Instance.new("Attachment", h)
                        a1 = Instance.new("Attachment", tr)
                    end
                    rc_inst.Attachment0 = a0
                    rc_inst.Attachment1 = a1
                    h.Massless   = true
                    h.CanCollide = false

                    local nh = hum:Clone()
                    hum:Destroy()
                    nh.Parent = char
                    tl.Parent = char
                    workspace.CurrentCamera.CameraSubject = nh
                    nh:ChangeState(15)

                    local loop
                    local loop_deadline = tick() + 5
                    loop = rs.Heartbeat:Connect(function()
                        if tick() > loop_deadline then
                            loop:Disconnect()
                            void_act = false
                            if a0 then a0:Destroy() end
                            if a1 then a1:Destroy() end
                            if rc_inst then rc_inst:Destroy() end
                            is_killing = false; overlay.Visible = false; queued_target = nil
                            send_missed_webhook(t)
                            DraxUI.Notification("aku.hook", "Timeout: " .. t.Name .. " survived", true)
                            return
                        end
                        -- target left the game (don't count as kill)
                        if not t.Parent then
                            loop:Disconnect()
                            void_act = false
                            if a0 then a0:Destroy() end
                            if a1 then a1:Destroy() end
                            if rc_inst then rc_inst:Destroy() end
                            is_killing = false; overlay.Visible = false; queued_target = nil
                            return
                        end
                        if not t.Character
                            or not t.Character:FindFirstChild("Humanoid")
                            or t.Character.Humanoid.Health <= 0 then

                            loop:Disconnect()
                            if hitsound_enabled then ks:Play() end
                            local elapsed = tick() - target_start_time
                            local action  = use_void and "Voided" or "Killed"
                            kill_counts[t] = (kill_counts[t] or 0) + 1
                            total_kills    = total_kills + 1
                            update_graph()
                            DraxUI.Notification(
                                "aku.hook",
                                string.format("%s %s in %.1fs", action, t.Name, elapsed),
                                not hitsound_enabled
                            )
                            send_webhook(action, t, elapsed)
                            void_act = false
                            if a0 then a0:Destroy() end
                            if a1 then a1:Destroy() end
                            if rc_inst then rc_inst:Destroy() end
                            is_killing = false; overlay.Visible = false; queued_target = nil
                            if char and char:FindFirstChild("HumanoidRootPart") then
                                self_destructing = true
                                char:BreakJoints()
                            end
                            return
                        end
                        if tr and tr:IsDescendantOf(workspace) and h:IsDescendantOf(workspace) then
                            firetouchinterest(tr, h, 0)
                            firetouchinterest(tr, h, 1)
                        end
                    end)
                end
            end

            -- ── Auto targets helper ───────────────────────────────────────────────
            local function get_auto_targets()
                local targs   = {}
                local raw     = string.split(auto_targets_text, ",")
                local filters = {}
                for _, v in ipairs(raw) do
                    local clean = v:gsub("^%s+", ""):gsub("%s+$", ""):lower()
                    if clean ~= "" then table.insert(filters, clean) end
                end
                for _, p in ipairs(ps:GetPlayers()) do
                    if p ~= lp then
                        if #filters == 0 then
                            table.insert(targs, p)
                        else
                            for _, f in ipairs(filters) do
                                if p.Name:lower():sub(1, #f) == f
                                    or p.DisplayName:lower():sub(1, #f) == f then
                                    table.insert(targs, p); break
                                end
                            end
                        end
                    end
                end
                return targs
            end

            -- ── Auto kill loop ────────────────────────────────────────────────────
            task.spawn(function()
                while true do
                    task.wait(0.2)
                    if auto_mode and not is_killing then
                        local my_char = lp.Character
                        local my_hum  = my_char and my_char:FindFirstChild("Humanoid")
                        if my_char and my_hum and my_hum.Health > 0 and not self_destructing then
                            local targs = get_auto_targets()
                            if #targs > 0 then
                                local valid             = {}
                                local invalid_but_alive = {}
                                local dead              = {}
                                for _, p in ipairs(targs) do
                                    local is_dead = not p.Character
                                        or not p.Character:FindFirstChild("Humanoid")
                                        or p.Character.Humanoid.Health <= 0
                                    if is_dead then
                                        table.insert(dead, p)
                                    else
                                        local charged = (spawn_times[p] or 0) < my_spawn
                                        if charged or kill_mode == "givetool" then
                                            table.insert(valid, p)
                                        else
                                            table.insert(invalid_but_alive, p)
                                        end
                                    end
                                end
                                if #valid > 0 then
                                    local picked = valid[math.random(1, #valid)]
                                    target_start_time = tick()
                                    queued_target     = nil
                                    execute_action(picked)
                                elseif #invalid_but_alive > 0 or #dead > 0 then
                                    self_destructing  = true
                                    overlay.Visible   = true
                                    overlay_text.Text = "Auto: Resetting to sync..."
                                    my_char:BreakJoints()
                                    -- Safety: if respawn doesn't trigger in 5s, clear overlay
                                    task.delay(5, function()
                                        if self_destructing then
                                            self_destructing = false
                                            overlay.Visible = false
                                        end
                                    end)
                                end
                            end
                        end
                    end
                end
            end)

            -- ── Void heartbeat ────────────────────────────────────────────────────
            -- Same proven pattern as final.lua: set NaN in Heartbeat (post-physics),
            -- then yield until RenderStepped so the replication packet includes NaN.
            -- Desync-aware: use desyncRealCF for restore so desync tracking stays valid.
            rs.Heartbeat:Connect(function()
                if not void_act then return end
                local ch  = lp.Character
                local hrp = ch and ch:FindFirstChild("HumanoidRootPart")
                if not hrp then return end
                -- Use desyncRealCF if desync is active to avoid reading the hook-faked value
                -- (mode 2 hook intercepts external .CFrame reads, but checkcaller=true in our
                -- code returns real value; still safer to use desyncRealCF explicitly).
                local realCF = (desyncEnabled and desyncRealCF) or hrp.CFrame
                hrp.CFrame = CFrame.new(nan, nan, nan)
                rs.RenderStepped:Wait()
                -- BindToRenderStep(desync restore at 0 or 2000) already ran during the yield.
                -- Only restore manually when desync is NOT active.
                if not desyncEnabled and realCF then
                    hrp.CFrame = realCF
                end
            end)

            -- ── Void camera fix (BindToRenderStep) ────────────────────────────
            -- When void + desync camFix: anchor camera at frozen server position.
            rs:BindToRenderStep("bpVoidCam", 2001, function()
                if not void_act or not desyncEnabled or not desyncCamFix or not desyncFrozenCF then
                    if voidCamPart then
                        voidCamPart:Destroy(); voidCamPart = nil
                        local lhum = lp.Character and lp.Character:FindFirstChildOfClass("Humanoid")
                        if lhum then workspace.CurrentCamera.CameraSubject = lhum end
                    end
                    return
                end
                if not voidCamPart then
                    voidCamPart              = Instance.new("Part")
                    voidCamPart.Size         = Vector3.new(0.1, 0.1, 0.1)
                    voidCamPart.Anchored     = true
                    voidCamPart.CanCollide   = false
                    voidCamPart.Transparency = 1
                    voidCamPart.Parent       = workspace
                    workspace.CurrentCamera.CameraSubject = voidCamPart
                end
                voidCamPart.CFrame = desyncFrozenCF
            end)

            -- ── Spawn tracking ────────────────────────────────────────────────────
            local function track_spawn(p)
                if p.Character then spawn_times[p] = tick() end
                p.CharacterAdded:Connect(function()
                    spawn_times[p] = tick()
                    task.wait(0.1)
                    update_list()
                end)
                p.CharacterRemoving:Connect(function()
                    task.wait(0.1)
                    update_list()
                end)
            end

            for _, p in ipairs(ps:GetPlayers()) do
                if p ~= lp then
                    spawn_times[p] = 0
                    kill_counts[p] = 0
                    track_spawn(p)
                end
            end

            ps.PlayerAdded:Connect(function(p)
                spawn_times[p] = tick()
                kill_counts[p] = 0
                track_spawn(p)
                update_list()
            end)

            ps.PlayerRemoving:Connect(function(p)
                if queued_target == p then
                    is_killing = false; overlay.Visible = false; queued_target = nil
                end
                spawn_times[p] = nil
                kill_counts[p] = nil
                update_list()
            end)

            lp.CharacterAdded:Connect(function(char)
                my_spawn         = tick()
                void_act         = false
                self_destructing = false
                if not is_killing then overlay.Visible = false end
                local hum = char:WaitForChild("Humanoid", 5)
                if hum then
                    hum.Died:Connect(function()
                        void_act = false
                        if not self_destructing then send_death_webhook() end
                    end)
                end
                update_list()
                -- 2s kill timeout: if still locked onto a target after respawn, cancel
                if is_killing and queued_target then
                    local qt_snap = queued_target
                    task.delay(2, function()
                        if is_killing and queued_target == qt_snap then
                            is_killing = false
                            overlay.Visible = false
                            queued_target = nil
                            send_missed_webhook(qt_snap)
                            DraxUI.Notification("aku.hook", "Missed " .. qt_snap.Name, true)
                        end
                    end)
                end
                if queued_target and not auto_mode then
                    task.spawn(function()
                        local qt = queued_target
                        while qt and (not qt.Character
                            or not qt.Character:FindFirstChild("HumanoidRootPart")
                            or qt.Character.Humanoid.Health <= 0) do
                            if not queued_target or not qt.Parent then break end
                            task.wait()
                        end
                        if queued_target == qt and qt.Character then
                            local charged = (spawn_times[qt] or 0) < my_spawn
                            if charged or kill_mode == "givetool" then
                                target_start_time = tick()
                                execute_action(qt)
                            else
                                if lp.Character then
                                    self_destructing = true
                                    lp.Character:BreakJoints()
                                end
                            end
                        else
                            is_killing = false; overlay.Visible = false; queued_target = nil
                        end
                    end)
                end
            end)

            -- Initial state if already spawned
            if lp.Character then
                my_spawn         = tick()
                self_destructing = false
                local hum = lp.Character:FindFirstChild("Humanoid")
                if hum then
                    hum.Died:Connect(function()
                        void_act = false
                        if not self_destructing then send_death_webhook() end
                    end)
                end
                update_list()
            end
        end,
    },
    -- [CombatSurf.lua]
    {
        name = "Combat Surf",
        placeIds = {16167223198},

        setup = function(tab, Config, DraxUI)
            local plr = game:GetService("Players").LocalPlayer
            local rps = game:GetService("ReplicatedStorage")
            local https = game:GetService("HttpService")
            local rs = game:GetService("RunService")
            local ws = game:GetService("Workspace")
            local players = game:GetService("Players")
        
            local force10kXpEnabled = false
            local forceBackstabEnabled = false
            local killauraEnabled = false
            local killauraBackstabEnabled = false
            local forceKnifeEnabled = false
            local norecoilValue = 0
            local nospreadValue = 0
            local fullAutoEnabled = false
            local instantReloadEnabled = false
            local instantEquipEnabled = false
        
            local killauraWidget = nil
            local forceBackstabWidget = nil
            local forceKnifeWidget = nil
        
            local configName = "aku_combatsurf.json"
            local origTradeID = nil
            local initialized = false
            local currentSlot = "Knife"
            local lastAuraHit = 0

            local localplrinvent = require(rps:WaitForChild("ClientInventory"))
            local Skinchiki = require(rps:WaitForChild("BaseItems"))
        
            local function applyRecoilSpreadReduction()
                local rMult = math.clamp(1 - (norecoilValue / 100), 0, 1)
                local sMult = math.clamp(1 - (nospreadValue / 100), 0, 1)
            
                local function applyToGunStats(gunStats)
                    if not gunStats then return end
                
                    -- Store original values if not already stored
                    if not gunStats._orig then
                        gunStats._orig = {
                            rx = type(gunStats.Recoil) == "table" and gunStats.Recoil.RecoilX or 0,
                            ry = type(gunStats.Recoil) == "table" and gunStats.Recoil.RecoilY or 0,
                            rz = type(gunStats.Recoil) == "table" and gunStats.Recoil.RecoilZ or 0,
                            mb = type(gunStats.Bloom) == "table" and gunStats.Bloom.MinBloom or 0,
                            xb = type(gunStats.Bloom) == "table" and gunStats.Bloom.MaxBloom or 0
                        }
                    end
                
                    -- Apply reduction to Recoil
                    if type(gunStats.Recoil) == "table" then
                        gunStats.Recoil.RecoilX = gunStats._orig.rx * rMult
                        gunStats.Recoil.RecoilY = gunStats._orig.ry * rMult
                        gunStats.Recoil.RecoilZ = gunStats._orig.rz * rMult
                    end
                
                    -- Apply reduction to Bloom
                    if type(gunStats.Bloom) == "table" then
                        gunStats.Bloom.MinBloom = gunStats._orig.mb * sMult
                        gunStats.Bloom.MaxBloom = gunStats._orig.xb * sMult
                    end
                end
            
                -- Apply to BaseItems
                for _, itemData in pairs(Skinchiki.BaseItems) do
                    if type(itemData) == "table" and itemData.GunStats then
                        applyToGunStats(itemData.GunStats)
                    end
                end
            
                -- Apply to ClientInventory
                local inv = type(localplrinvent.getInv) == "function" and localplrinvent.getInv() or localplrinvent.Inventory
                if type(inv) == "table" then
                    for _, itemData in pairs(inv) do
                        if type(itemData) == "table" and itemData.GunStats then
                            applyToGunStats(itemData.GunStats)
                        end
                    end
                end
            end
        
            local function applyFullAuto()
                local function applyToGunStats(gunStats)
                    if not gunStats then return end
                    if type(gunStats._orig) ~= "table" then
                        gunStats._orig = {}
                    end
                    if gunStats._orig.Auto == nil then
                        gunStats._orig.Auto = gunStats.Auto
                    end
                
                    if fullAutoEnabled then
                        gunStats.Auto = true
                    else
                        if gunStats._orig.Auto ~= nil then
                            gunStats.Auto = gunStats._orig.Auto
                        end
                    end
                end
            
                -- Apply to BaseItems
                for _, itemData in pairs(Skinchiki.BaseItems) do
                    if type(itemData) == "table" and itemData.GunStats then
                        applyToGunStats(itemData.GunStats)
                    end
                end
            
                -- Apply to ClientInventory
                local inv = type(localplrinvent.getInv) == "function" and localplrinvent.getInv() or localplrinvent.Inventory
                if type(inv) == "table" then
                    for _, itemData in pairs(inv) do
                        if type(itemData) == "table" and itemData.GunStats then
                            applyToGunStats(itemData.GunStats)
                        end
                    end
                end
            end
        
            local function applyInstantActions()
                local function applyToGunStats(gunStats)
                    if not gunStats then return end
                    if type(gunStats._orig) ~= "table" then
                        gunStats._orig = {}
                    end
                
                    if not gunStats._orig.TimersSaved then
                        gunStats._orig.EquipTime = gunStats.EquipTime
                        gunStats._orig.ReloadTime1 = gunStats.ReloadTime1
                        gunStats._orig.ReloadTime2 = gunStats.ReloadTime2
                        gunStats._orig.TimersSaved = true
                    end
                
                    if instantEquipEnabled then
                        gunStats.EquipTime = 0
                    else
                        if gunStats._orig.EquipTime ~= nil then
                            gunStats.EquipTime = gunStats._orig.EquipTime
                        end
                    end

                    if instantReloadEnabled then
                        gunStats.ReloadTime1 = 0
                        gunStats.ReloadTime2 = 0
                    else
                        if gunStats._orig.ReloadTime1 ~= nil then
                            gunStats.ReloadTime1 = gunStats._orig.ReloadTime1
                        end
                        if gunStats._orig.ReloadTime2 ~= nil then
                            gunStats.ReloadTime2 = gunStats._orig.ReloadTime2
                        end
                    end
                end
            
                -- Apply to BaseItems
                for _, itemData in pairs(Skinchiki.BaseItems) do
                    if type(itemData) == "table" and itemData.GunStats then
                        applyToGunStats(itemData.GunStats)
                    end
                end
            
                -- Apply to ClientInventory
                local inv = type(localplrinvent.getInv) == "function" and localplrinvent.getInv() or localplrinvent.Inventory
                if type(inv) == "table" then
                    for _, itemData in pairs(inv) do
                        if type(itemData) == "table" and itemData.GunStats then
                            applyToGunStats(itemData.GunStats)
                        end
                    end
                end
            end
        
            local itemmodul = require(rps:WaitForChild("Item")).Item
            local gameInfo = require(rps:WaitForChild("GameInfo"))
            local Cevents = rps:WaitForChild("Client-Events")
            local add = Cevents:WaitForChild("AddButton")
            local aku = getconnections(add.OnClientEvent)
            local bruh = nil
        
            origTradeID = gameInfo.TradingServerID
            local nigger = {Primary = nil, Secondary = nil, Knife = nil}

            local function spoofSet(slot, serial)
                pcall(function()
                    setreadonly(gameInfo, false)
                    gameInfo.TradingServerID = game.PlaceId
                    setreadonly(gameInfo, true)
                end)
                plr:SetAttribute(slot, serial)
                task.delay(0.5, function()
                    pcall(function()
                        setreadonly(gameInfo, false)
                        gameInfo.TradingServerID = origTradeID
                        setreadonly(gameInfo, true)
                    end)
                end)
            end

            local function fuckall(itemName, baseName, subType)
                local serial = itemName
                if bruh and bruh[serial] then return end
                local customItem = itemmodul.new(itemName:gsub("_", " "), baseName, subType, math.random(1, 1000), nil, nil, false, 0, serial)
                localplrinvent.AddItem(customItem)
                for _, connection in ipairs(aku) do connection.Function(customItem, true) end
            end

            local function getCleanWeaponData(wpnData)
                if type(wpnData) ~= "table" or type(wpnData.GunStats) ~= "table" then return wpnData end
            
                -- Делаем клон таблицы пушки, чтобы не сломать локальное оружие
                local cleanWpn = {}
                for k, v in pairs(wpnData) do cleanWpn[k] = v end
            
                -- Делаем клон статов
                cleanWpn.GunStats = {}
                for k, v in pairs(wpnData.GunStats) do cleanWpn.GunStats[k] = v end
            
                -- Подменяем читерские статы на оригинальные из _orig (если они есть)
                local orig = wpnData.GunStats._orig
                if orig then
                    if orig.Auto ~= nil then cleanWpn.GunStats.Auto = orig.Auto end
                    if orig.EquipTime ~= nil then cleanWpn.GunStats.EquipTime = orig.EquipTime end
                    if orig.ReloadTime1 ~= nil then cleanWpn.GunStats.ReloadTime1 = orig.ReloadTime1 end
                    if orig.ReloadTime2 ~= nil then cleanWpn.GunStats.ReloadTime2 = orig.ReloadTime2 end
                
                    -- Клонируем и чистим отдачу
                    if type(cleanWpn.GunStats.Recoil) == "table" and orig.rx then
                        cleanWpn.GunStats.Recoil = {}
                        for k, v in pairs(wpnData.GunStats.Recoil) do cleanWpn.GunStats.Recoil[k] = v end
                        cleanWpn.GunStats.Recoil.RecoilX = orig.rx
                        cleanWpn.GunStats.Recoil.RecoilY = orig.ry
                        cleanWpn.GunStats.Recoil.RecoilZ = orig.rz
                    end
                
                    -- Клонируем и чистим разброс (Bloom)
                    if type(cleanWpn.GunStats.Bloom) == "table" and orig.mb then
                        cleanWpn.GunStats.Bloom = {}
                        for k, v in pairs(wpnData.GunStats.Bloom) do cleanWpn.GunStats.Bloom[k] = v end
                        cleanWpn.GunStats.Bloom.MinBloom = orig.mb
                        cleanWpn.GunStats.Bloom.MaxBloom = orig.xb
                    end
                end
            
                return cleanWpn
            end

            local oldnc
            oldnc = hookmetamethod(game, "__namecall", function(self, ...)
                local m = getnamecallmethod()
                local args = {...}
                local argCount = select("#", ...)
            
                if m == "InvokeServer" and self.Name == "SwitchWpns" then
                    local a1 = args[1]
                    if type(a1) == "table" and a1.Base then
                        local bData = Skinchiki.BaseItems[a1.Base]
                        if bData and bData.Slot then
                            currentSlot = bData.Slot
                            if nigger[bData.Slot] then
                                args[1] = nigger[bData.Slot]
                                return oldnc(self, unpack(args, 1, argCount))
                            end
                        end
                    end
                end

                if m == "InvokeServer" and self.Name == "ChangeLoadout" then
                    local a1, a2 = args[1], args[2]
                    if type(a2) == "table" and a2.Serial and (Skinchiki.SubItem[a2.Serial] or Skinchiki.BaseItems[a2.Serial]) then
                        spoofSet(a1, a2.Serial)
                        return true
                    end
                end
            
                if m == "FireServer" and self.Name == "Shoot" then
                    local modded = false
                    local wpn = args[7]
                    local isMelee = type(wpn) == "table" and wpn.GunStats and wpn.GunStats.Melee
                
                    if type(wpn) == "table" and wpn.Base then
                        local bData = Skinchiki.BaseItems[wpn.Base]
                        if bData and bData.Slot and nigger[bData.Slot] then
                            args[7] = nigger[bData.Slot]
                            wpn = args[7]
                            modded = true
                        end
                    end

                    -- Очищаем статы перед отправкой на сервер (только если модифицировали оружие)
                    if type(args[7]) == "table" and (instantReloadEnabled or instantEquipEnabled or fullAutoEnabled or norecoilValue > 0 or nospreadValue > 0) then
                        args[7] = getCleanWeaponData(args[7])
                        modded = true
                    end

                    if force10kXpEnabled then
                        args[13] = 999999
                        if argCount < 13 then argCount = 13 end
                        modded = true
                    end
                
                    if forceBackstabWidget and forceBackstabWidget:GetActive() and isMelee then
                        args[11] = true
                        if argCount < 11 then argCount = 11 end
                        modded = true
                    end

                    if modded then
                        return oldnc(self, unpack(args, 1, argCount))
                    end
                end
            
                return oldnc(self, ...)
            end)

            task.spawn(function()
                while task.wait() do
                    if killauraWidget and killauraWidget:GetActive() and currentSlot == "Knife" then
                        local cooldown = killauraBackstabEnabled and 1 or 0.5
                        if tick() - lastAuraHit >= cooldown then
                            local char = plr.Character
                            local gunServer = char and char:FindFirstChild("_.GunServer")
                            local shootRemote = gunServer and gunServer:FindFirstChild("Shoot")
                            local hrp = char and char:FindFirstChild("HumanoidRootPart")
                        
                            if hrp and shootRemote then
                                local knifeData = nigger.Knife
                                if not knifeData then
                                    local inv = localplrinvent.getInv()
                                    local kSerial = plr:GetAttribute("Knife")
                                    knifeData = inv and kSerial and inv[kSerial]
                                end

                                if knifeData then
                                    local target, minDist = nil, 10
                                    for _, enemy in ipairs(players:GetPlayers()) do
                                        if enemy == plr then continue end
                                        local eChar = enemy.Character
                                        local eHrp = eChar and eChar:FindFirstChild("HumanoidRootPart")
                                        local eHum = eChar and eChar:FindFirstChild("Humanoid")
                                    
                                        if eHrp and eHum and eHum.Health > 0 and not eChar:GetAttribute("Invincible") then
                                            local dist = (hrp.Position - eHrp.Position).Magnitude
                                            if dist < minDist then
                                                minDist = dist
                                                target = eChar
                                            end
                                        end
                                    end

                                    if target then
                                        local tHrp = target.HumanoidRootPart
                                        local targetPart = target:FindFirstChild("Torso") or target:FindFirstChild("UpperTorso") or tHrp
                                        shootRemote:FireServer(
                                            tick(),
                                            hrp.Position,
                                            (tHrp.Position - hrp.Position).Unit,
                                            targetPart,
                                            tHrp.Position,
                                            Vector3.new(0, 1, 0),
                                            knifeData,
                                            target,
                                            false,
                                            nil,
                                            killauraBackstabEnabled,
                                            "Knife",
                                            7.5
                                        )
                                        lastAuraHit = tick()
                                    end
                                end
                            end
                        end
                    end
                end
            end)

            local function initializeUnlockAll()
                if initialized then return end
                initialized = true
                task.spawn(function()
                    repeat
                        bruh = localplrinvent.getInv()
                        if not bruh then task.wait(0.5) end
                    until bruh
                
                    for id, data in pairs(bruh) do
                        if type(data) == "table" and data.Base and not Skinchiki.SubItem[id] and not Skinchiki.BaseItems[id] then
                            local bData = Skinchiki.BaseItems[data.Base]
                            if bData and bData.Slot then
                                if bData.Slot == "Primary" and not nigger.Primary then nigger.Primary = data end
                                if bData.Slot == "Secondary" and not nigger.Secondary then nigger.Secondary = data end
                                if bData.Slot == "Knife" and not nigger.Knife then nigger.Knife = data end
                            end
                        end
                    end
                
                    local pId, sId, kId = plr:GetAttribute("Primary"), plr:GetAttribute("Secondary"), plr:GetAttribute("Knife")
                    if pId and bruh[pId] and not Skinchiki.SubItem[pId] and not Skinchiki.BaseItems[pId] then nigger.Primary = bruh[pId] end
                    if sId and bruh[sId] and not Skinchiki.SubItem[sId] and not Skinchiki.BaseItems[sId] then nigger.Secondary = bruh[sId] end
                    if kId and bruh[kId] and not Skinchiki.SubItem[kId] and not Skinchiki.BaseItems[kId] then nigger.Knife = bruh[kId] end
                
                    if isfile and isfile(configName) then
                        local success, decoded = pcall(function() return https:JSONDecode(readfile(configName)) end)
                        if success and type(decoded) == "table" then
                            for slot, serial in pairs(decoded) do
                                if serial and serial ~= "" then
                                    if Skinchiki.SubItem[serial] then
                                        fuckall(serial, Skinchiki.SubItem[serial].Base or serial, serial)
                                    elseif Skinchiki.BaseItems[serial] then
                                        fuckall(serial, serial, nil)
                                    end
                                    if bruh[serial] then spoofSet(slot, serial) end
                                end
                            end
                        end
                    end
                
                    local queue = {}
                    for n, d in pairs(Skinchiki.SubItem) do table.insert(queue, {n, d.Base or n, n}) end
                    for n, d in pairs(Skinchiki.BaseItems) do table.insert(queue, {n, n, nil}) end
                
                    local total, current = #queue, 0
                    local loop
                    loop = rs.Heartbeat:Connect(function()
                        for i = 1, 10 do
                            if current >= total then loop:Disconnect() return end
                            current = current + 1
                            local d = queue[current]
                            fuckall(d[1], d[2], d[3])
                        end
                    end)
                
                    local function saveConfig()
                        local curr = {
                            Primary = plr:GetAttribute("Primary") or "",
                            Secondary = plr:GetAttribute("Secondary") or "",
                            Knife = plr:GetAttribute("Knife") or ""
                        }
                        if writefile then writefile(configName, https:JSONEncode(curr)) end
                    end
                
                    plr:GetAttributeChangedSignal("Primary"):Connect(saveConfig)
                    plr:GetAttributeChangedSignal("Secondary"):Connect(saveConfig)
                    plr:GetAttributeChangedSignal("Knife"):Connect(saveConfig)
                end)
            end

            local function openAllCases()
                task.spawn(function()
                    local openCaseRemote = rps:WaitForChild("Client-Events"):WaitForChild("OpenCase")
                    while true do
                        local freshBruh = localplrinvent.getInv()
                        local targetCase = nil
                        for serial, data in pairs(freshBruh) do
                            if type(data) == "table" and data.Base and string.find(data.Base, "Case") then
                                targetCase = data
                                break
                            end
                        end
                        if targetCase then
                            pcall(function() openCaseRemote:InvokeServer(targetCase) end)
                            task.wait(0.5)
                        else break end
                    end
                end)
            end

            local cs_sec = tab:Section("Left", "Combat Surf")
            cs_sec:Button("unlock all", function() initializeUnlockAll() end)
            cs_sec:Button("open all cases", function() openAllCases() end)
        
            DraxUI.RegCfg("cs.force10k", cs_sec:Checkbox("force high xp (for 10k use pred breaker)", false, function(v) 
                force10kXpEnabled = v 
            end))
        
            DraxUI.RegCfg("cs.norecoil", cs_sec:Slider("Norecoil", 0, 100, norecoilValue, "%.0f%%", function(v)
                norecoilValue = v
                applyRecoilSpreadReduction()
            end))
        
            DraxUI.RegCfg("cs.nospread", cs_sec:Slider("Nospread", 0, 100, nospreadValue, "%.0f%%", function(v)
                nospreadValue = v
                applyRecoilSpreadReduction()
            end))
        
            DraxUI.RegCfg("cs.fullauto", cs_sec:Checkbox("Full auto", fullAutoEnabled, function(v)
                fullAutoEnabled = v
                applyFullAuto()
            end))
        
            DraxUI.RegCfg("cs.instantreload", cs_sec:Checkbox("Instant reload", instantReloadEnabled, function(v)
                instantReloadEnabled = v
                applyInstantActions()
            end))
        
            DraxUI.RegCfg("cs.instantequip", cs_sec:Checkbox("Instant equip", instantEquipEnabled, function(v)
                instantEquipEnabled = v
                applyInstantActions()
            end))
        
            -- Exploits section (right side)
            local cs_exploits = tab:Section("Right", "Exploits")
        
            killauraWidget = cs_exploits:CheckboxKeybind("Kill Aura", false, nil,
                function(v)
                    killauraEnabled = v
                end,
                function()
                    -- This is called when keybind mode changes
                end,
                "always", {"hold", "toggle", "always"}
            )
            DraxUI.RegCfg("cs.killaura", killauraWidget)
        
            DraxUI.RegCfg("cs.killaurabackstab", cs_exploits:Checkbox("Killaura backstab", false, function(v)
                killauraBackstabEnabled = v
            end))
        
            forceBackstabWidget = cs_exploits:CheckboxKeybind("Force backstab", false, nil,
                function(v)
                    forceBackstabEnabled = v
                end,
                function()
                    -- This is called when keybind mode changes
                end,
                "always", {"hold", "toggle", "always"}
            )
            DraxUI.RegCfg("cs.forcebs", forceBackstabWidget)
        
            forceKnifeWidget = cs_exploits:CheckboxKeybind("Force knife (press only)", false, nil,
                function(v)
                    forceKnifeEnabled = v
                end,
                function()
                    -- When "press" is triggered, execute force knife attack
                    if not forceKnifeEnabled then return end
                
                    local char = plr.Character
                    local gunServer = char and char:FindFirstChild("_.GunServer")
                    local shootRemote = gunServer and gunServer:FindFirstChild("Shoot")
                    local hrp = char and char:FindFirstChild("HumanoidRootPart")
                    local cam = workspace.CurrentCamera
                
                    if not (hrp and shootRemote and cam) then return end
                
                    -- Get knife data
                    local knifeData = nigger.Knife
                    if not knifeData then
                        local inv = localplrinvent.getInv()
                        local kSerial = plr:GetAttribute("Knife")
                        knifeData = inv and kSerial and inv[kSerial]
                    end
                
                    if not knifeData then return end
                
                    -- Find closest enemy to screen center
                    local target = nil
                    local minScreenDist = math.huge
                
                    for _, enemy in ipairs(players:GetPlayers()) do
                        if enemy == plr then continue end
                        local eChar = enemy.Character
                        local eHrp = eChar and eChar:FindFirstChild("HumanoidRootPart")
                        local eHum = eChar and eChar:FindFirstChild("Humanoid")
                    
                        if eHrp and eHum and eHum.Health > 0 and not eChar:GetAttribute("Invincible") then
                            -- Check distance from world to screen center (works regardless of screen visibility)
                            local screenPos = cam:WorldToScreenPoint(eHrp.Position)
                            local screenDist = (Vector2.new(screenPos.X, screenPos.Y) - Vector2.new(cam.ViewportSize.X / 2, cam.ViewportSize.Y / 2)).Magnitude
                            if screenDist < minScreenDist then
                                minScreenDist = screenDist
                                target = eChar
                            end
                        end
                    end
                
                    if target then
                        local tHrp = target.HumanoidRootPart
                        -- Use player position offset to make it look like close range backstab
                        local attackFromPos = hrp.Position + (tHrp.Position - hrp.Position).Unit * 0.1  -- 0.1 studs from player
                        local targetPart = target:FindFirstChild("Torso") or target:FindFirstChild("UpperTorso") or tHrp
                    
                        shootRemote:FireServer(
                            tick(),
                            attackFromPos,  -- Pretend to attack from very close
                            (tHrp.Position - attackFromPos).Unit,
                            targetPart,
                            tHrp.Position,
                            Vector3.new(0, 1, 0),
                            knifeData,
                            target,
                            false,
                            nil,
                            true,  -- Always backstab for force knife
                            "Knife",
                            7.5
                        )
                    end
                end,
                "press", {"press"}
            )
            DraxUI.RegCfg("cs.forceknife", forceKnifeWidget)
        
            -- Initialize gun modifications with default values
            pcall(function() applyInstantActions() end)  -- Apply instant reload/equip on startup
        end,
    },
    -- [Criminality.lua]
    {
        name     = "Criminality",
        placeIds = {8343259840, 124450980636920, 86998659564752, 114857245307626, 115062252103974, 114857245307626},

        setup = function(tab, Config, DraxUI)
            -- ── State ─────────────────────────────────────────────────────────
            local meleeAuraEnabled  = false
            local meleeAuraConn     = nil
            local auraHitPart       = "Head"
            local auraRange         = 30

            local wallbangEnabled   = false
            local wallbangOldCast   = nil

            -- Inf Stamina
            local infStaminaEnabled  = false
            local staminaConn        = nil
            local staminaTbls        = {}

            -- WS Bypass
            local bypassEnabled      = false
            local bypassHooked       = false
            local _wsOrigVal         = 16   -- last value game tried to write; returned to AC reads
            local _oldNI, _oldIdx, _oldNC

            -- No Recoil
            local noRecoilEnabled    = false
            local noRecoilCharConn   = nil
            local noRecoilToolConns  = {}
            local recoilOrigs        = {}

            -- Insta Reload
            local instaReloadEnabled = false
            local reloadConns        = {}

            -- Rebel ESP
            local rebelEspEnabled    = false
            local rebelEspConn       = nil

            -- Hitbox Bypass
            local hbHooked        = false
            local hbExpandEnabled = false
            local hbLoop          = nil
            local hbPatchedFns    = {}
            local hbOldIndex      = nil
            local HB_EXPANDED     = Vector3.new(6.5, 6.5, 6.5)
            local HB_DEFAULT      = Vector3.new(2, 1, 1)

            -- Ragebot
            local ragebotEnabled  = false
            local _HIT_EMOJI_RB   = "\240\159\141\175"  -- 🍯 U+1F36F (verified via remotespy)
            local _rbGnxS, _rbZfklf  -- cached remotes

            -- ── Helpers ───────────────────────────────────────────────────────
            local function getNearestEnemy()
                local Players    = game:GetService("Players")
                local lp         = Players.LocalPlayer
                local char        = lp.Character
                if not char then return nil end
                local root = char:FindFirstChild(auraHitPart)
                if not root then return nil end

                local nearest, minDist = nil, math.huge
                for _, p in ipairs(Players:GetPlayers()) do
                    if p ~= lp and p.Character then
                        local part = p.Character:FindFirstChild(auraHitPart)
                        if part then
                            local d = (root.Position - part.Position).Magnitude
                            if d < minDist then nearest = p; minDist = d end
                        end
                    end
                end
                return (minDist <= auraRange) and nearest or nil
            end

            local function setDmgPointToTarget(dmgPoint, targetPart)
                local x = targetPart.Position.X + math.random(-targetPart.Size.X, targetPart.Size.X) / 10
                local y = targetPart.Position.Y + math.random(-targetPart.Size.Y, targetPart.Size.Y) / 10
                local z = targetPart.Position.Z + math.random(-targetPart.Size.Z, targetPart.Size.Z) / 10
                dmgPoint.CFrame = CFrame.new(0, 0, 0)
                dmgPoint.WorldCFrame = CFrame.new(x, y, z) * CFrame.new(0, 0.5, 0)
            end

            local function startMeleeAura()
                if meleeAuraConn then meleeAuraConn:Disconnect() end
                meleeAuraConn = game:GetService("RunService").RenderStepped:Connect(function()
                    if not meleeAuraEnabled then
                        meleeAuraConn:Disconnect(); meleeAuraConn = nil; return
                    end
                    local lp = game:GetService("Players").LocalPlayer
                    if not lp.Character then return end

                    local target = getNearestEnemy()
                    if not target or not target.Character then return end
                    local tHum  = target.Character:FindFirstChild("Humanoid")
                    local tPart = target.Character:FindFirstChild(auraHitPart)
                    if not tHum or not tPart or tHum.Health <= 0 then return end

                    for _, tool in ipairs(lp.Character:GetChildren()) do
                        if tool:IsA("Tool") then
                            -- Fists: move DmgPoints on arms
                            if tool.Name == "Fists" then
                                for _, arm in ipairs(lp.Character:GetChildren()) do
                                    if arm.Name == "Left Arm" or arm.Name == "Right Arm" then
                                        for _, dp in ipairs(arm:GetChildren()) do
                                            if dp.Name == "DmgPoint" then
                                                setDmgPointToTarget(dp, tPart)
                                            end
                                        end
                                    end
                                end
                            -- Sledgehammer: move DmgPoints on Handle (during swing)
                            elseif tool.Name == "Sledgehammer" then
                                local handle = tool:FindFirstChild("Handle")
                                if handle and (handle:FindFirstChild("Swing1") or handle:FindFirstChild("Swing2")) then
                                    for _, dp in ipairs(handle:GetChildren()) do
                                        if dp.Name == "DmgPoint" then
                                            local offset = CFrame.new(0, 0.4, 0)
                                            local x = tPart.Position.X + math.random(-tPart.Size.X, tPart.Size.X) / 10
                                            local y = tPart.Position.Y + math.random(-tPart.Size.Y, tPart.Size.Y) / 10
                                            local z = tPart.Position.Z + math.random(-tPart.Size.Z, tPart.Size.Z) / 10
                                            dp.CFrame = CFrame.new(0, 0, 0)
                                            dp.WorldCFrame = CFrame.new(x, y, z) * offset
                                        end
                                    end
                                end
                            -- Any melee weapon with WeaponHandle (during swing)
                            else
                                local wHandle = tool:FindFirstChild("WeaponHandle")
                                if wHandle and (wHandle:FindFirstChild("Swing1") or wHandle:FindFirstChild("Swing2")) then
                                    for _, dp in ipairs(wHandle:GetChildren()) do
                                        if dp.Name == "DmgPoint" then
                                            local x = tPart.Position.X + math.random(-tPart.Size.X, tPart.Size.X) / 10
                                            local y = tPart.Position.Y + math.random(-tPart.Size.Y, tPart.Size.Y) / 10
                                            local z = tPart.Position.Z + math.random(-tPart.Size.Z, tPart.Size.Z) / 10
                                            dp.CFrame = CFrame.new(0, 0, 0)
                                            dp.WorldCFrame = CFrame.new(x, y, z) * CFrame.new(0, 0.54, 0)
                                        end
                                    end
                                end
                            end
                        end
                    end
                end)
            end

            local function stopMeleeAura()
                meleeAuraEnabled = false
                if meleeAuraConn then meleeAuraConn:Disconnect(); meleeAuraConn = nil end
            end

            -- Wallbang: hook FastCast to insert Map into blacklist so bullets pass through walls
            local function startWallbang()
                local RS = game:GetService("ReplicatedStorage")
                local fastcast = (RS:FindFirstChild("Modules") and RS.Modules:FindFirstChild("FastCastRedux"))
                              or (RS:FindFirstChild("NewModules") and RS.NewModules:FindFirstChild("Shared") and RS.NewModules.Shared:FindFirstChild("Services") and RS.NewModules.Shared.Services:FindFirstChild("FastCastRedux"))
                if not fastcast then return end
                local ok, fc = pcall(require, fastcast)
                if not ok or not fc then return end
                wallbangOldCast = fc.FireWithBlacklist
                fc.FireWithBlacklist = function(self, ...)
                    local args = {...}
                    if args[1] and args[1].fc and args[1].fc[1] then
                        local map = workspace:FindFirstChild("Map")
                        if map and args[5] then
                            local alreadyIn = false
                            for _, v in ipairs(args[5]) do if v == map then alreadyIn = true; break end end
                            if not alreadyIn then table.insert(args[5], map) end
                        end
                    end
                    return wallbangOldCast(self, unpack(args))
                end
            end

            local function stopWallbang()
                if not wallbangOldCast then return end
                local RS = game:GetService("ReplicatedStorage")
                local fastcast = (RS:FindFirstChild("Modules") and RS.Modules:FindFirstChild("FastCastRedux"))
                              or (RS:FindFirstChild("NewModules") and RS.NewModules:FindFirstChild("Shared") and RS.NewModules.Shared:FindFirstChild("Services") and RS.NewModules.Shared.Services:FindFirstChild("FastCastRedux"))
                if not fastcast then return end
                local ok, fc = pcall(require, fastcast)
                if ok and fc then fc.FireWithBlacklist = wallbangOldCast end
                wallbangOldCast = nil
            end

            -- ── Inf Stamina helpers ──────────────────────────────────────────
            local function updateStaminaTbls()
                table.clear(staminaTbls)
                for _, v in pairs(getgc(true)) do
                    if type(v) == "table" and rawget(v, "S") then
                        table.insert(staminaTbls, v)
                    end
                end
            end
            local function startInfStamina()
                updateStaminaTbls()
                if staminaConn then staminaConn:Disconnect() end
                staminaConn = game:GetService("RunService").RenderStepped:Connect(function()
                    for _, t in pairs(staminaTbls) do t.S = 100 end
                end)
            end
            local function stopInfStamina()
                if staminaConn then staminaConn:Disconnect(); staminaConn = nil end
            end
            game:GetService("Players").LocalPlayer.CharacterAdded:Connect(function()
                task.wait(1)
                if infStaminaEnabled then updateStaminaTbls() end
            end)

            -- ── WS Bypass helpers ────────────────────────────────────────────
            -- __newindex: blocks game from resetting WalkSpeed, saves what it tried to write.
            -- __index:    returns that saved value so anti-cheat reads "normal" speed.
            -- __namecall: blocks anti-cheat FireServer remotes and Kick.
            local function enableBypassHooks()
                if bypassHooked then return end
                bypassHooked = true
                local o1; o1 = hookmetamethod(game, "__newindex", function(self, key, value)
                    if bypassEnabled and not checkcaller() and key == "WalkSpeed"
                        and typeof(self) == "Instance" and self:IsA("Humanoid") then
                        _wsOrigVal = value  -- remember what AC expected to write
                        return              -- block the write; our script keeps actual speed
                    end
                    return o1(self, key, value)
                end)
                _oldNI = o1
                local o2; o2 = hookmetamethod(game, "__index", function(self, key)
                    if bypassEnabled and not checkcaller() and key == "WalkSpeed"
                        and typeof(self) == "Instance" and self:IsA("Humanoid") then
                        return _wsOrigVal   -- AC reads this → thinks speed is normal
                    end
                    return o2(self, key)
                end)
                _oldIdx = o2
                local o3; o3 = hookmetamethod(game, "__namecall", function(self, ...)
                    if bypassEnabled and not checkcaller() then
                        local m = getnamecallmethod()
                        if m == "FireServer" and (self.Name == "__DFfDD" or self.Name == "0924023902330") then
                            return task.wait(9e9)
                        elseif m == "Kick" then
                            return task.wait(9e9)
                        end
                    end
                    return o3(self, ...)
                end)
                _oldNC = o3
            end
            local function disableBypassHooks()
                if not bypassHooked then return end
                if _oldNI  then pcall(hookmetamethod, game, "__newindex", _oldNI) end
                if _oldIdx then pcall(hookmetamethod, game, "__index",    _oldIdx) end
                if _oldNC  then pcall(hookmetamethod, game, "__namecall", _oldNC) end
                bypassHooked = false
                _oldNI = nil; _oldIdx = nil; _oldNC = nil
            end

            -- ── No Recoil helpers ────────────────────────────────────────────
            -- Single getgc scan called only on enable + on each tool equip.
            -- No periodic Heartbeat — weapon config tables are module-level and stay in gc.
            local function scanAndPatchRecoil()
                for _, v in next, getgc(true) do
                    if type(v) == "table" and rawget(v, "EquipTime") and rawget(v, "Recoil") then
                        if not recoilOrigs[v] then
                            recoilOrigs[v] = {
                                Recoil=v.Recoil, AX_Min=v.AngleX_Min, AX_Max=v.AngleX_Max,
                                AY_Min=v.AngleY_Min, AY_Max=v.AngleY_Max, AZ_Min=v.AngleZ_Min, AZ_Max=v.AngleZ_Max,
                                RSpeed=v.RecoilSpeed, RDamp=v.RecoilDamper, Acc=v.Accuracy, RRed=v.RecoilReduction,
                                CamRecoil=v.CameraRecoilingEnabled,
                            }
                        end
                        v.Recoil=0; v.AngleX_Min=0; v.AngleX_Max=0; v.AngleY_Min=0; v.AngleY_Max=0
                        v.AngleZ_Min=0; v.AngleZ_Max=0; v.RecoilSpeed=0; v.RecoilDamper=1
                        v.Accuracy=1; v.RecoilReduction=1; v.CameraRecoilingEnabled=false
                        if v.SprayLerp then v.SprayLerp.Enabled=false end
                    end
                end
            end
            local function restoreRecoil()
                for v, o in pairs(recoilOrigs) do
                    if type(v) == "table" then
                        v.Recoil=o.Recoil; v.AngleX_Min=o.AX_Min; v.AngleX_Max=o.AX_Max
                        v.AngleY_Min=o.AY_Min; v.AngleY_Max=o.AY_Max; v.AngleZ_Min=o.AZ_Min; v.AngleZ_Max=o.AZ_Max
                        v.RecoilSpeed=o.RSpeed; v.RecoilDamper=o.RDamp; v.Accuracy=o.Acc; v.RecoilReduction=o.RRed
                        v.CameraRecoilingEnabled=o.CamRecoil
                        if v.SprayLerp then v.SprayLerp.Enabled=true end
                    end
                end
                recoilOrigs = {}
            end
            local function hookCharRecoil(char)
                if noRecoilCharConn then noRecoilCharConn:Disconnect() end
                noRecoilCharConn = char.ChildAdded:Connect(function(child)
                    if not noRecoilEnabled or not child:IsA("Tool") then return end
                    task.wait()  -- let tool scripts require their modules
                    scanAndPatchRecoil()
                end)
            end
            local function startNoRecoil()
                scanAndPatchRecoil()
                local lp = game:GetService("Players").LocalPlayer
                if lp.Character then hookCharRecoil(lp.Character) end
                noRecoilToolConns[#noRecoilToolConns+1] = lp.CharacterAdded:Connect(function(newChar)
                    task.wait(0.5)
                    if noRecoilEnabled then scanAndPatchRecoil() end
                    hookCharRecoil(newChar)
                end)
            end
            local function stopNoRecoil()
                if noRecoilCharConn then noRecoilCharConn:Disconnect(); noRecoilCharConn = nil end
                for _, c in pairs(noRecoilToolConns) do c:Disconnect() end
                noRecoilToolConns = {}
                restoreRecoil()
            end


            -- ── Rebel ESP helpers ────────────────────────────────────────────────
            local function startRebelEsp()
                if rebelEspConn then rebelEspConn:Disconnect() end
                rebelEspConn = game:GetService("RunService").Heartbeat:Connect(function()
                    if not rebelEspEnabled then
                        rebelEspConn:Disconnect(); rebelEspConn = nil; return
                    end
                    local ok, dealer = pcall(function()
                        return workspace.Map.Shopz.RebelDealer
                    end)
                    if not ok or not dealer then return end
                    if dealer:FindFirstChildOfClass("Highlight") then return end
                    local hl = Instance.new("Highlight")
                    hl.FillColor    = Color3.fromRGB(255, 50, 50)
                    hl.OutlineColor = Color3.fromRGB(255, 200, 200)
                    hl.FillTransparency    = 0.4
                    hl.OutlineTransparency = 0
                    hl.Adornee = dealer
                    hl.Parent  = dealer
                end)
            end

            local function stopRebelEsp()
                if rebelEspConn then rebelEspConn:Disconnect(); rebelEspConn = nil end
                local ok, dealer = pcall(function() return workspace.Map.Shopz.RebelDealer end)
                if ok and dealer then
                    local hl = dealer:FindFirstChildOfClass("Highlight")
                    if hl then hl:Destroy() end
                end
            end

            -- ── Insta Reload helpers ─────────────────────────────────────────
            local _gunR
            local function getGunR()
                if not _gunR then
                    local ok, v = pcall(function()
                        return game:GetService("ReplicatedStorage").Events["GNX_R"]
                    end)
                    if ok then _gunR = v end
                end
                return _gunR
            end
            local function clearReloadConns()
                for _, c in pairs(reloadConns) do c:Disconnect() end; reloadConns = {}
            end
            local function setupGunReload(tool)
                if not tool or not tool:FindFirstChild("IsGun") then return end
                local vals = tool:FindFirstChild("Values"); if not vals then return end
                local ammo   = vals:FindFirstChild("SERVER_Ammo")
                local stored = vals:FindFirstChild("SERVER_StoredAmmo")
                local r = getGunR(); if not r then return end
                if stored then
                    reloadConns[#reloadConns+1] = stored.Changed:Connect(function()
                        if instaReloadEnabled and stored.Value ~= 0 then
                            r:FireServer(tick(), "KLWE89U0", tool)
                        end
                    end)
                end
                if ammo then
                    reloadConns[#reloadConns+1] = ammo.Changed:Connect(function()
                        if instaReloadEnabled and stored and stored.Value ~= 0 then
                            r:FireServer(tick(), "KLWE89U0", tool)
                        end
                    end)
                end
            end
            local function startInstaReload()
                clearReloadConns()
                local lp = game:GetService("Players").LocalPlayer
                local char = lp.Character
                if char then
                    setupGunReload(char:FindFirstChildOfClass("Tool"))
                    reloadConns[#reloadConns+1] = char.ChildAdded:Connect(function(c)
                        if c:IsA("Tool") then setupGunReload(c) end
                    end)
                end
                reloadConns[#reloadConns+1] = lp.CharacterAdded:Connect(function(ch)
                    task.wait(); clearReloadConns(); startInstaReload()
                end)
            end
            local function stopInstaReload()
                clearReloadConns()
            end

            -- ── Ragebot helpers ──────────────────────────────────────────────
            -- Returns the enemy player whose Head is closest to the mouse cursor on screen.
            local function rbGetClosestToCursor()
                local cam   = workspace.CurrentCamera
                local lp    = game:GetService("Players").LocalPlayer
                local mouse = lp:GetMouse()
                local mp    = Vector2.new(mouse.X, mouse.Y)
                local closest, minDist = nil, math.huge
                for _, p in ipairs(game:GetService("Players"):GetPlayers()) do
                    if p == lp or not p.Character then continue end
                    local hum = p.Character:FindFirstChildOfClass("Humanoid")
                    if not hum or hum.Health <= 0 then continue end
                    local head = p.Character:FindFirstChild("Head")
                    if not head then continue end
                    local sp, onScreen = cam:WorldToViewportPoint(head.Position)
                    if not onScreen then continue end
                    local d = (Vector2.new(sp.X, sp.Y) - mp).Magnitude
                    if d < minDist then minDist = d; closest = p end
                end
                return closest
            end

            local function rbGetRemotes()
                if not _rbGnxS or not _rbZfklf then
                    local ev = game:GetService("ReplicatedStorage"):FindFirstChild("Events")
                    if ev then
                        _rbGnxS  = ev:FindFirstChild("GNX_S")
                        _rbZfklf = ev:FindFirstChild("ZFKLF_H")
                    end
                end
                return _rbGnxS, _rbZfklf
            end

            local function rbCg()
                local rs = game:GetService("ReplicatedStorage")
                local st = rs:FindFirstChild("Values") and rs.Values:FindFirstChild("ServerTick")
                return st and (st.Value - 28951) or 0
            end

            local function rbRandomStr(n)
                local chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
                local s = ""
                for _ = 1, n do s = s .. chars:sub(math.random(1, #chars), math.random(1, #chars)) end
                return s
            end

            local function rbShoot()
                if not ragebotEnabled then return end
                local target = rbGetClosestToCursor()
                if not target or not target.Character then return end
                local head = target.Character:FindFirstChild("Head")
                if not head then return end
                local lp   = game:GetService("Players").LocalPlayer
                local char = lp.Character
                if not char then return end
                local tool = char:FindFirstChildOfClass("Tool")
                if not tool then return end
                local vals = tool:FindFirstChild("Values")
                local ammo = vals and vals:FindFirstChild("SERVER_Ammo")
                if ammo and ammo.Value <= 0 then return end
                local gnxS, zfklf = rbGetRemotes()
                if not gnxS or not zfklf then return end
                local lpRoot  = char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("Head")
                local camPos  = workspace.CurrentCamera.CFrame.Position
                local hitPos  = head.Position
                -- silent aim: visual bullet flies toward local HRP, hit reg still targets enemy head
                local silentDir = CFrame.new(camPos, lpRoot and lpRoot.Position or camPos + Vector3.new(0, -1, 0)).LookVector
                local realDir   = CFrame.new(camPos, hitPos).LookVector
                local shotCode = rbRandomStr(30) .. "0"
                gnxS:FireServer(rbCg(), shotCode, tool, "FDS9I83", camPos, {silentDir}, false)
                zfklf:FireServer(_HIT_EMOJI_RB, tick(), tool, shotCode, 1, head, hitPos, realDir)
            end

            -- ── Hitbox Bypass helpers ────────────────────────────────────────────
            local function hbScanAndPatch()
                for _, v in next, getgc(true) do
                    if type(v) ~= "table" then continue end
                    local fn1 = rawget(v, "lol")
                    if type(fn1) == "function" and not hbPatchedFns[fn1] then
                        local ok, info = pcall(debug and debug.getinfo or getinfo, fn1)
                        if ok and info and info.source and string.find(info.source, ".RCHB", 1, true) then
                            hbPatchedFns[fn1] = {}
                            for i, c in next, getconstants(fn1) do
                                if c == 1.75 or c == 10 then
                                    hbPatchedFns[fn1][i] = c
                                    setconstant(fn1, i, 20)
                                end
                            end
                        end
                    end
                    local fn2 = rawget(v, "ONRH_S4")
                    if type(fn2) == "function" and not hbPatchedFns[fn2] then
                        hbPatchedFns[fn2] = {}
                        for i, c in next, getconstants(fn2) do
                            if c == 1.5 or c == 10 then
                                hbPatchedFns[fn2][i] = c
                                setconstant(fn2, i, 20)
                            end
                        end
                    end
                end
            end

            local function initHitboxHooks()
                if hbHooked then return end
                hbHooked = true
                hbScanAndPatch()
                local lp = game:GetService("Players").LocalPlayer
                local defSize = HB_DEFAULT
                if lp.Character then
                    local hd = lp.Character:FindFirstChild("Head")
                    if hd then defSize = hd.Size end
                end
                local o; o = hookmetamethod(game, "__index", newcclosure(function(self, key)
                    if not checkcaller() and typeof(self) == "Instance" and key == "Size" then
                        local ok1, cn = pcall(o, self, "ClassName")
                        local ok2, nm = pcall(o, self, "Name")
                        if ok1 and ok2 and cn == "Part" and (nm == "Head" or nm == "FakeHead") then
                            return defSize
                        end
                    end
                    return o(self, key)
                end))
                hbOldIndex = o
                local function hbBindChar(char)
                    char.ChildAdded:Connect(function(child)
                        if hbExpandEnabled and child:IsA("Tool") then
                            task.wait(0.5); hbScanAndPatch()
                        end
                    end)
                end
                if lp.Character then hbBindChar(lp.Character) end
                lp.CharacterAdded:Connect(function(char)
                    task.wait(1)
                    if hbExpandEnabled then hbScanAndPatch() end
                    hbBindChar(char)
                end)
            end

            local function startHitboxLoop()
                if hbLoop then return end
                local lp = game:GetService("Players").LocalPlayer
                hbLoop = game:GetService("RunService").RenderStepped:Connect(function()
                    local targetSize = hbExpandEnabled and HB_EXPANDED or HB_DEFAULT
                    for _, p in ipairs(game:GetService("Players"):GetPlayers()) do
                        if p ~= lp and p.Character then
                            local head = p.Character:FindFirstChild("Head") or p.Character:FindFirstChild("FakeHead")
                            if head and head:IsA("BasePart") and head.Size ~= targetSize then
                                head.Size = targetSize
                                head.CanCollide = false
                                head.Massless   = true
                            end
                        end
                    end
                end)
            end

            local function stopHitboxLoop()
                if hbLoop then hbLoop:Disconnect(); hbLoop = nil end
                local lp = game:GetService("Players").LocalPlayer
                for _, p in ipairs(game:GetService("Players"):GetPlayers()) do
                    if p ~= lp and p.Character then
                        local head = p.Character:FindFirstChild("Head") or p.Character:FindFirstChild("FakeHead")
                        if head and head:IsA("BasePart") then head.Size = HB_DEFAULT end
                    end
                end
            end

            -- ── Init ────────────────────────────────────────────────────────────
            initHitboxHooks()

            -- ── UI ────────────────────────────────────────────────────────────
            local left = tab:Section("Left", "Exploits")

            -- Melee Aura
            DraxUI.RegCfg("game.crim.meleeaura", left:CheckboxKeybind(
                "Melee Aura", false, nil,
                function(armed)  -- cbArm: called when toggle state changes (Toggle/Hold)
                    meleeAuraEnabled = armed
                    if armed then startMeleeAura() else stopMeleeAura() end
                end,
                function()       -- cbFire: called on press (Always mode) / each hold frame
                    meleeAuraEnabled = not meleeAuraEnabled
                    if meleeAuraEnabled then startMeleeAura() else stopMeleeAura() end
                end,
                "always", {"toggle", "hold", "always"}
            ))

            -- Wallbang
            DraxUI.RegCfg("game.crim.wallbang", left:CheckboxKeybind(
                "Wallbang", false, nil,
                function(armed)
                    wallbangEnabled = armed
                    if armed then startWallbang() else stopWallbang() end
                end,
                function()
                    wallbangEnabled = not wallbangEnabled
                    if wallbangEnabled then startWallbang() else stopWallbang() end
                end,
                "always", {"toggle", "hold", "always"}
            ))

            -- Ragebot
            local rbLeft = tab:Section("Left", "Ragebot")
            DraxUI.RegCfg("game.crim.ragebot", rbLeft:CheckboxKeybind(
                "Ragebot", false, nil,
                function(armed)
                    ragebotEnabled = armed
                    if armed then
                        -- Pre-cache remotes in background so first shot works immediately
                        task.spawn(function()
                            local ev = game:GetService("ReplicatedStorage"):WaitForChild("Events", 10)
                            if ev then
                                _rbGnxS  = ev:WaitForChild("GNX_S",   10)
                                _rbZfklf = ev:WaitForChild("ZFKLF_H", 10)
                            end
                        end)
                    end
                end,
                function() rbShoot() end,
                "press", {"press"}
            ))

            -- ── Bypasses / Extras ─────────────────────────────────────────────
            local right = tab:Section("Right", "Bypasses")

            -- Hitbox Bypass
            DraxUI.RegCfg("game.crim.hbexpand", right:CheckboxKeybind(
                "Hitbox Bypass", false, nil,
                function(armed)  -- toggle/hold: armed = expanded on/off
                    hbExpandEnabled = armed
                    if armed then startHitboxLoop() else stopHitboxLoop() end
                end,
                function()       -- always/press: flip state
                    hbExpandEnabled = not hbExpandEnabled
                    if hbExpandEnabled then startHitboxLoop() else stopHitboxLoop() end
                end,
                "always", {"toggle", "hold", "always"}
            ))

            -- Rebel ESP
            DraxUI.RegCfg("game.crim.rebelesp", right:Checkbox("Rebel ESP", false, function(v)
                rebelEspEnabled = v
                if v then startRebelEsp() else stopRebelEsp() end
            end))

            -- Inf Stamina
            DraxUI.RegCfg("game.crim.infstamina", right:Checkbox("Inf Stamina", false, function(v)
                infStaminaEnabled = v
                if v then startInfStamina() else stopInfStamina() end
            end))

            -- WS Bypass — blocks game resetting WalkSpeed + anti-cheat remotes/kicks
            DraxUI.RegCfg("game.crim.wsbypass", right:Checkbox("WS Bypass", false, function(v)
                bypassEnabled = v
                if v then enableBypassHooks() else disableBypassHooks() end
            end))

            -- No Recoil
            DraxUI.RegCfg("game.crim.norecoil", right:Checkbox("No Recoil", false, function(v)
                noRecoilEnabled = v
                if v then startNoRecoil() else stopNoRecoil() end
            end))

            -- Insta Reload
            DraxUI.RegCfg("game.crim.instareload", right:Checkbox("Insta Reload", false, function(v)
                instaReloadEnabled = v
                if v then startInstaReload() else stopInstaReload() end
            end))
        end,
    }
}
do
    local _pid = game.PlaceId
    local _gmod = nil
    for _, gm in ipairs(_GAME_MODULES) do
        for _, pid in ipairs(gm.placeIds or {}) do
            if _pid == pid then _gmod = gm; break end
        end
        if _gmod then break end
    end
    if _gmod then
        local gameTab = win:Tab(_gmod.name)
        _gmod.setup(gameTab, Config, DraxUI)
    end
end

DraxUI.RefreshAllGlows()

local plrs = game:GetService("Players")

plrs.PlayerRemoving:Connect(function(player)
    local uid = player.UserId
    
    if hbCharConns and hbCharConns[uid] then 
        hbCharConns[uid]:Disconnect() 
        hbCharConns[uid] = nil 
    end
    if hbCache then 
        hbCache[uid] = nil 
    end
    if hbVizDestroyPlayer then 
        hbVizDestroyPlayer(uid) 
    end
    
    if aimbotCfg and aimbotCfg.PredictLastCFrames then
        aimbotCfg.PredictLastCFrames[uid] = nil
    end
    
    if _plrStatuses then 
        _plrStatuses[uid] = nil 
    end
end)

local function updatePlayerCache()
    _hbPlayerList = plrs:GetPlayers()
end
plrs.PlayerAdded:Connect(updatePlayerCache)
plrs.PlayerRemoving:Connect(updatePlayerCache)
updatePlayerCache()