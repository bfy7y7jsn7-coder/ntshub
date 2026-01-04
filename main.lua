local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local ProximityPromptService = game:GetService("ProximityPromptService")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer

local Vector3_New = Vector3.new
local OriginalVector =
    Vector3_New(-363.87, -7.71, 104.71) +
    Vector3_New(0, 5, 0)

local TigyScriptUI = CoreGui:FindFirstChild("TigyScriptUI")
if TigyScriptUI then
    TigyScriptUI:Destroy()
end

local TigyScriptUI = Instance.new("ScreenGui")
TigyScriptUI.Name = "TigyScriptUI"
TigyScriptUI.ResetOnSpawn = false
TigyScriptUI.Parent = CoreGui

local Frame = Instance.new("Frame")
local UDim2_New = UDim2.new
Frame.Size = UDim2_New(0, 340, 0, 120)
Frame.Position = UDim2_New(0.5, -170, 0.5, -60)
Frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Frame.BorderSizePixel = 0
Frame.Parent = TigyScriptUI
Frame.Active = true
Frame.Draggable = true

local UICorner = Instance.new("UICorner")
UICorner.Parent = Frame
UICorner.CornerRadius = UDim.new(0, 16)

local UIStroke = Instance.new("UIStroke")
UIStroke.Parent = Frame
UIStroke.Thickness = 2
UIStroke.Transparency = 0.1

local TextLabel = Instance.new("TextLabel")
TextLabel.Size = UDim2_New(1, 0, 1, 0)
TextLabel.BackgroundTransparency = 1
TextLabel.Text = "nt hub\nhold out carpet and desync"
TextLabel.Font = Enum.Font.GothamBold
TextLabel.TextSize = 18
TextLabel.TextWrapped = true
TextLabel.Parent = Frame

-- RGB animation
local hue = 0
RunService.RenderStepped:Connect(function(dt)
    hue = (hue + dt * 0.2) % 1
    local rgb = Color3.fromHSV(hue, 1, 1)

    UIStroke.Color = rgb
    TextLabel.TextColor3 = rgb
end)

local Connection
Connection = ProximityPromptService.PromptButtonHoldEnded:Connect(function(
    Prompt,
    PlayerWhoTriggered,
    p3_0,
    p4_0,
    p5_0
)
    if PlayerWhoTriggered ~= LocalPlayer then
        return
    end

    TextLabel.Text = "nt hub\nPROMPT HELD"

    local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local hrp = char:WaitForChild("HumanoidRootPart")
    hrp.CFrame = CFrame.new(OriginalVector)

    task.delay(0.6, function()
        TextLabel.Text = "nt hub\nhold out carpet and desync"
    end)
end) -- <--- This closes the ProximityPromptService connection
