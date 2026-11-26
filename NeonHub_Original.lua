
-- NEON HUB OFICIAL
-- Dandy's World & Decorations
-- Criadores:
-- Mat3oBlaz3Alpha
-- Biaeonh65309

local Players = game:GetService("Players")
local player = Players.LocalPlayer

local gui = Instance.new("ScreenGui")
gui.Name = "NeonHubOriginal"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local GOLD = Color3.fromRGB(231, 184, 89)
local DARK = Color3.fromRGB(43, 36, 17)
local PANEL = Color3.fromRGB(64, 53, 23)
local TEXT = Color3.fromRGB(255, 225, 158)

local main = Instance.new("Frame")
main.Size = UDim2.new(0.88, 0, 0.75, 0)
main.Position = UDim2.new(0.06, 0, 0.12, 0)
main.BackgroundColor3 = DARK
main.BorderSizePixel = 0
main.Parent = gui

Instance.new("UICorner", main).CornerRadius =
    UDim.new(0, 18)

local outline = Instance.new("UIStroke", main)
outline.Color = GOLD
outline.Thickness = 2

local header = Instance.new("TextLabel")
header.Size = UDim2.new(1, -100, 0, 55)
header.Position = UDim2.fromOffset(12, 0)
header.BackgroundTransparency = 1
header.Text = "✦ Neon Hub Oficial"
header.TextColor3 = TEXT
header.TextSize = 21
header.Font = Enum.Font.GothamBold
header.TextXAlignment = Enum.TextXAlignment.Left
header.Parent = main

local close = Instance.new("TextButton")
close.Size = UDim2.fromOffset(38, 38)
close.Position = UDim2.new(1, -48, 0, 8)
close.Text = "X"
close.TextColor3 = GOLD
close.BackgroundColor3 = PANEL
close.TextSize = 20
close.Parent = main

Instance.new("UICorner", close).CornerRadius =
    UDim.new(0, 10)

close.MouseButton1Click:Connect(function()
    gui:Destroy()
end)

local sidebar = Instance.new("ScrollingFrame")
sidebar.Size = UDim2.new(0, 115, 1, -70)
sidebar.Position = UDim2.fromOffset(8, 62)
sidebar.BackgroundColor3 = PANEL
sidebar.BorderSizePixel = 0
sidebar.ScrollBarThickness = 3
sidebar.AutomaticCanvasSize = Enum.AutomaticSize.Y
sidebar.CanvasSize = UDim2.new(0, 0, 0, 0)
sidebar.Parent = main

Instance.new("UICorner", sidebar).CornerRadius =
    UDim.new(0, 10)

local sideLayout = Instance.new("UIListLayout")
sideLayout.Padding = UDim.new(0, 6)
sideLayout.Parent = sidebar

local content = Instance.new("ScrollingFrame")
content.Size = UDim2.new(1, -140, 1, -75)
content.Position = UDim2.fromOffset(130, 65)
content.BackgroundTransparency = 1
content.BorderSizePixel = 0
content.ScrollBarThickness = 4
content.ScrollBarImageColor3 = GOLD
content.AutomaticCanvasSize = Enum.AutomaticSize.Y
content.CanvasSize = UDim2.new(0, 0, 0, 0)
content.Parent = main

local contentLayout = Instance.new("UIListLayout")
contentLayout.Padding = UDim.new(0, 9)
contentLayout.Parent = content

local function clear()
    for _, item in ipairs(content:GetChildren()) do
        if item:IsA("GuiObject")
            and item ~= contentLayout then
            item:Destroy()
        end
    end
end

local function section(name)
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -8, 0, 36)
    label.BackgroundTransparency = 1
    label.Text = "✦ " .. name
    label.TextColor3 = GOLD
    label.TextSize = 17
    label.Font = Enum.Font.GothamBold
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Parent = content
end

local function toggle(name)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, -8, 0, 48)
    button.BackgroundColor3 = PANEL
    button.TextColor3 = TEXT
    button.Font = Enum.Font.GothamMedium
    button.TextSize = 14
    button.Parent = content

    Instance.new("UICorner", button).CornerRadius =
        UDim.new(0, 10)

    local enabled = false

    local function refresh()
        button.Text = name .. (enabled and "  [ON]" or "  [OFF]")
        button.BackgroundColor3 = enabled
            and Color3.fromRGB(112, 91, 38)
            or PANEL
    end

    button.MouseButton1Click:Connect(function()
        enabled = not enabled
        refresh()
    end)

    refresh()
end

local pages = {
    ["🌼 Main"] = function()
        section("MAIN")
        toggle("Interface")
        toggle("Animations")
        toggle("Golden Theme")
    end,

    ["🤖 Automation"] = function()
        section("AUTOMATION")
        toggle("Interface Notifications")
        toggle("Visual Effects")
    end,

    ["👁️ ESP"] = function()
        section("VISUAL OPTIONS")
        toggle("Show Interface Markers")
        toggle("Show Object Labels")
        toggle("Highlight UI Objects")
    end,

    ["👤 Player"] = function()
        section("PLAYER")
        toggle("Player Information")
        toggle("Status Panel")
    end,

    ["⚙️ Machine"] = function()
        section("MACHINE")
        toggle("Machine Information")
        toggle("Progress Panel")
    end,

    ["🗺️ Map"] = function()
        section("MAP")
        toggle("Map Legend")
        toggle("Location Panel")
    end,

    ["🎉 Fun"] = function()
        section("FUN")
        toggle("Decorative Effects")
        toggle("Confetti")
    end,

    ["🎨 Decorations"] = function()
        section("DECORATIONS")
        toggle("Golden Particles")
        toggle("Glow Effect")
        toggle("Animated Background")
    end,

    ["⭐ Credits"] = function()
        section("CREATORS")
        section("Mat3oBlaz3Alpha")
        section("Biaeonh65309")
        section("NEON HUB ORIGINAL")
    end
}

local function openPage(name)
    clear()
    pages[name]()
end

for name in pairs(pages) do
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, -8, 0, 43)
    button.BackgroundColor3 = DARK
    button.Text = name
    button.TextColor3 = TEXT
    button.TextSize = 12
    button.Font = Enum.Font.GothamBold
    button.Parent = sidebar

    Instance.new("UICorner", button).CornerRadius =
        UDim.new(0, 8)

    button.MouseButton1Click:Connect(function()
        openPage(name)
    end)
end

openPage("🌼 Main")

print("NEON HUB ORIGINAL carregado!")
