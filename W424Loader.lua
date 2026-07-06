local correctKeys = {
	["KINGS-8762bf2e-b6ab-434e-b37d-b38cdecb6a9d"] = true,
	["NORMAL-8762bf2e-b6ab-434e-b37d-b38cdecb6a9d"] = true,
	["ATOMIC-8762bf2e-b6ab-434e-b37d-b38cdecb6a9d"] = true,
}
local keyLink = "https://w424cloud.netlify.app/"

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local gui = Instance.new("ScreenGui")
gui.Name = "PurpleDarkKeySystem"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.Parent = playerGui

local function corner(parent, radius)
	local c = Instance.new("UICorner")
	c.CornerRadius = UDim.new(0, radius)
	c.Parent = parent
	return c
end

local function stroke(parent, color, thickness, transparency)
	local s = Instance.new("UIStroke")
	s.Color = color
	s.Thickness = thickness
	s.Transparency = transparency or 0
	s.Parent = parent
	return s
end

local function gradient(parent, colors, rotation)
	local g = Instance.new("UIGradient")
	g.Color = ColorSequence.new(colors)
	g.Rotation = rotation or 0
	g.Parent = parent
	return g
end

local function tween(obj, props, time)
	TweenService:Create(
		obj,
		TweenInfo.new(time or 0.18, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
		props
	):Play()
end

local function isValidKey(key)
	return correctKeys[key] == true
end

local overlay = Instance.new("Frame")
overlay.Size = UDim2.fromScale(1, 1)
overlay.BackgroundColor3 = Color3.fromRGB(8, 4, 18)
overlay.BackgroundTransparency = 0.15
overlay.BorderSizePixel = 0
overlay.Parent = gui

local main = Instance.new("Frame")
main.Size = UDim2.new(0, 430, 0, 285)
main.Position = UDim2.new(0.5, -215, 0.5, -142)
main.BackgroundColor3 = Color3.fromRGB(18, 10, 33)
main.BorderSizePixel = 0
main.ZIndex = 2
main.Parent = overlay
corner(main, 22)
stroke(main, Color3.fromRGB(178, 92, 255), 2, 0.15)
gradient(main, {
	ColorSequenceKeypoint.new(0, Color3.fromRGB(31, 14, 55)),
	ColorSequenceKeypoint.new(0.55, Color3.fromRGB(16, 9, 30)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(42, 17, 72))
}, 35)

local accent = Instance.new("Frame")
accent.Size = UDim2.new(1, -40, 0, 5)
accent.Position = UDim2.new(0, 20, 0, 0)
accent.BackgroundColor3 = Color3.fromRGB(165, 76, 255)
accent.BorderSizePixel = 0
accent.ZIndex = 3
accent.Parent = main
corner(accent, 999)
gradient(accent, {
	ColorSequenceKeypoint.new(0, Color3.fromRGB(115, 50, 255)),
	ColorSequenceKeypoint.new(0.5, Color3.fromRGB(178, 80, 255)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 70, 205))
})

local logo = Instance.new("TextLabel")
logo.Size = UDim2.new(0, 48, 0, 48)
logo.Position = UDim2.new(0, 28, 0, 26)
logo.BackgroundColor3 = Color3.fromRGB(155, 70, 255)
logo.Text = "K"
logo.TextColor3 = Color3.fromRGB(255, 255, 255)
logo.Font = Enum.Font.GothamBlack
logo.TextSize = 25
logo.BorderSizePixel = 0
logo.ZIndex = 4
logo.Parent = main
corner(logo, 15)
gradient(logo, {
	ColorSequenceKeypoint.new(0, Color3.fromRGB(210, 95, 255)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(105, 45, 255))
}, 35)

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -120, 0, 32)
title.Position = UDim2.new(0, 90, 0, 29)
title.BackgroundTransparency = 1
title.Text = "Premium Access"
title.TextColor3 = Color3.fromRGB(245, 247, 255)
title.Font = Enum.Font.GothamBlack
title.TextSize = 25
title.TextXAlignment = Enum.TextXAlignment.Left
title.ZIndex = 4
title.Parent = main

local subtitle = Instance.new("TextLabel")
subtitle.Size = UDim2.new(1, -120, 0, 24)
subtitle.Position = UDim2.new(0, 91, 0, 60)
subtitle.BackgroundTransparency = 1
subtitle.Text = "Enter your key to continue"
subtitle.TextColor3 = Color3.fromRGB(145, 153, 180)
subtitle.Font = Enum.Font.GothamMedium
subtitle.TextSize = 13
subtitle.TextXAlignment = Enum.TextXAlignment.Left
subtitle.ZIndex = 4
subtitle.Parent = main

local close = Instance.new("TextButton")
close.Size = UDim2.new(0, 34, 0, 34)
close.Position = UDim2.new(1, -50, 0, 24)
close.BackgroundColor3 = Color3.fromRGB(35, 20, 55)
close.Text = "X"
close.TextColor3 = Color3.fromRGB(220, 225, 245)
close.Font = Enum.Font.GothamBold
close.TextSize = 14
close.BorderSizePixel = 0
close.ZIndex = 4
close.Parent = main
corner(close, 10)

local input = Instance.new("TextBox")
input.Size = UDim2.new(1, -56, 0, 52)
input.Position = UDim2.new(0, 28, 0, 105)
input.BackgroundColor3 = Color3.fromRGB(28, 16, 48)
input.PlaceholderText = "Type key here..."
input.Text = ""
input.TextColor3 = Color3.fromRGB(245, 247, 255)
input.PlaceholderColor3 = Color3.fromRGB(120, 130, 160)
input.Font = Enum.Font.GothamBold
input.TextSize = 16
input.ClearTextOnFocus = false
input.BorderSizePixel = 0
input.ZIndex = 4
input.Parent = main
corner(input, 14)
stroke(input, Color3.fromRGB(178, 92, 255), 1.4, 0.25)

local status = Instance.new("TextLabel")
status.Size = UDim2.new(1, -56, 0, 26)
status.Position = UDim2.new(0, 28, 0, 164)
status.BackgroundTransparency = 1
status.Text = "Click Get Key to copy the link."
status.TextColor3 = Color3.fromRGB(145, 153, 180)
status.Font = Enum.Font.GothamMedium
status.TextSize = 13
status.TextXAlignment = Enum.TextXAlignment.Left
status.ZIndex = 4
status.Parent = main

local getKey = Instance.new("TextButton")
getKey.Size = UDim2.new(0.5, -34, 0, 48)
getKey.Position = UDim2.new(0, 28, 1, -68)
getKey.BackgroundColor3 = Color3.fromRGB(35, 20, 55)
getKey.Text = "Buy Key"
getKey.TextColor3 = Color3.fromRGB(220, 225, 245)
getKey.Font = Enum.Font.GothamBlack
getKey.TextSize = 15
getKey.BorderSizePixel = 0
getKey.ZIndex = 4
getKey.Parent = main
corner(getKey, 14)
stroke(getKey, Color3.fromRGB(178, 92, 255), 1.2, 0.45)

local submit = Instance.new("TextButton")
submit.Size = UDim2.new(0.5, -34, 0, 48)
submit.Position = UDim2.new(0.5, 6, 1, -68)
submit.BackgroundColor3 = Color3.fromRGB(165, 76, 255)
submit.Text = "Submit"
submit.TextColor3 = Color3.fromRGB(255, 255, 255)
submit.Font = Enum.Font.GothamBlack
submit.TextSize = 15
submit.BorderSizePixel = 0
submit.ZIndex = 4
submit.Parent = main
corner(submit, 14)
gradient(submit, {
	ColorSequenceKeypoint.new(0, Color3.fromRGB(205, 85, 255)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(105, 45, 255))
}, 25)

local clickSound = Instance.new("Sound")
clickSound.Name = "SoftClick"
clickSound.SoundId = "rbxassetid://9118823101"
clickSound.Volume = 0.18
clickSound.PlaybackSpeed = 1.25
clickSound.Parent = gui

local function playClick()
	clickSound:Play()
end

local function showStartupInterface()
	main.Visible = false

	local startup = Instance.new("Frame")
	startup.Size = UDim2.new(0, 540, 0, 305)
	startup.Position = UDim2.new(0.5, -270, 0.5, -152)
	startup.BackgroundColor3 = Color3.fromRGB(9, 4, 17)
	startup.BorderSizePixel = 0
	startup.ZIndex = 10
	startup.Parent = overlay
	corner(startup, 16)
	stroke(startup, Color3.fromRGB(165, 75, 255), 1.4, 0.1)
	gradient(startup, {
		ColorSequenceKeypoint.new(0, Color3.fromRGB(5, 0, 12)),
		ColorSequenceKeypoint.new(0.55, Color3.fromRGB(13, 6, 26)),
		ColorSequenceKeypoint.new(1, Color3.fromRGB(32, 11, 54))
	}, 25)

	local tag = Instance.new("TextLabel")
	tag.Size = UDim2.new(0, 145, 0, 30)
	tag.Position = UDim2.new(0, 30, 0, 25)
	tag.BackgroundColor3 = Color3.fromRGB(22, 18, 32)
	tag.Text = "SECURE STARTUP"
	tag.TextColor3 = Color3.fromRGB(190, 95, 255)
	tag.Font = Enum.Font.GothamBlack
	tag.TextSize = 11
	tag.BorderSizePixel = 0
	tag.ZIndex = 11
	tag.Parent = startup
	corner(tag, 999)

	local icon = Instance.new("Frame")
	icon.Size = UDim2.new(0, 74, 0, 74)
	icon.Position = UDim2.new(0, 30, 0, 75)
	icon.BackgroundColor3 = Color3.fromRGB(8, 9, 16)
	icon.BorderSizePixel = 0
	icon.ZIndex = 11
	icon.Parent = startup
	corner(icon, 20)
	stroke(icon, Color3.fromRGB(170, 75, 255), 2, 0)

	local iconText = Instance.new("TextLabel")
	iconText.Size = UDim2.fromScale(1, 1)
	iconText.BackgroundTransparency = 1
	iconText.Text = "</>"
	iconText.TextColor3 = Color3.fromRGB(175, 85, 255)
	iconText.Font = Enum.Font.GothamBlack
	iconText.TextSize = 20
	iconText.ZIndex = 12
	iconText.Parent = icon

	local title2 = Instance.new("TextLabel")
	title2.Size = UDim2.new(1, -145, 0, 34)
	title2.Position = UDim2.new(0, 126, 0, 86)
	title2.BackgroundTransparency = 1
	title2.Text = "W424 COMMUNITY"
	title2.TextColor3 = Color3.fromRGB(245, 247, 255)
	title2.Font = Enum.Font.GothamBlack
	title2.TextSize = 26
	title2.TextXAlignment = Enum.TextXAlignment.Left
	title2.ZIndex = 11
	title2.Parent = startup

	local ver = Instance.new("TextLabel")
	ver.Size = UDim2.new(1, -145, 0, 22)
	ver.Position = UDim2.new(0, 128, 0, 121)
	ver.BackgroundTransparency = 1
	ver.Text = "Violence District | PREMIUM"
	ver.TextColor3 = Color3.fromRGB(120, 125, 150)
	ver.Font = Enum.Font.GothamMedium
	ver.TextSize = 12
	ver.TextXAlignment = Enum.TextXAlignment.Left
	ver.ZIndex = 11
	ver.Parent = startup

	local line = Instance.new("Frame")
	line.Size = UDim2.new(1, -60, 0, 1)
	line.Position = UDim2.new(0, 30, 0, 173)
	line.BackgroundColor3 = Color3.fromRGB(42, 24, 62)
	line.BorderSizePixel = 0
	line.ZIndex = 11
	line.Parent = startup

	local loadingText = Instance.new("TextLabel")
	loadingText.Size = UDim2.new(1, -120, 0, 25)
	loadingText.Position = UDim2.new(0, 30, 0, 195)
	loadingText.BackgroundTransparency = 1
	loadingText.Text = "Initializing core..."
	loadingText.TextColor3 = Color3.fromRGB(205, 210, 230)
	loadingText.Font = Enum.Font.GothamMedium
	loadingText.TextSize = 13
	loadingText.TextXAlignment = Enum.TextXAlignment.Left
	loadingText.ZIndex = 11
	loadingText.Parent = startup

	local percent = Instance.new("TextLabel")
	percent.Size = UDim2.new(0, 70, 0, 25)
	percent.Position = UDim2.new(1, -100, 0, 195)
	percent.BackgroundTransparency = 1
	percent.Text = "0%"
	percent.TextColor3 = Color3.fromRGB(185, 90, 255)
	percent.Font = Enum.Font.GothamBlack
	percent.TextSize = 13
	percent.TextXAlignment = Enum.TextXAlignment.Right
	percent.ZIndex = 11
	percent.Parent = startup

	local barBack = Instance.new("Frame")
	barBack.Size = UDim2.new(1, -60, 0, 9)
	barBack.Position = UDim2.new(0, 30, 0, 235)
	barBack.BackgroundColor3 = Color3.fromRGB(28, 15, 42)
	barBack.BorderSizePixel = 0
	barBack.ZIndex = 11
	barBack.Parent = startup
	corner(barBack, 999)

	local barFill = Instance.new("Frame")
	barFill.Size = UDim2.new(0, 0, 1, 0)
	barFill.BackgroundColor3 = Color3.fromRGB(175, 85, 255)
	barFill.BorderSizePixel = 0
	barFill.ZIndex = 12
	barFill.Parent = barBack
	corner(barFill, 999)
	gradient(barFill, {
		ColorSequenceKeypoint.new(0, Color3.fromRGB(130, 70, 255)),
		ColorSequenceKeypoint.new(0.55, Color3.fromRGB(190, 85, 255)),
		ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 80, 210))
	})

	local desc = Instance.new("TextLabel")
	desc.Size = UDim2.new(1, -60, 0, 22)
	desc.Position = UDim2.new(0, 30, 0, 263)
	desc.BackgroundTransparency = 1
	desc.Text = "Preparing a smooth and secure experience"
	desc.TextColor3 = Color3.fromRGB(85, 90, 110)
	desc.Font = Enum.Font.GothamMedium
	desc.TextSize = 11
	desc.TextXAlignment = Enum.TextXAlignment.Left
	desc.ZIndex = 11
	desc.Parent = startup

	local loadingMessages = {
		{0, "Initializing core..."},
		{18, "Checking access token..."},
		{37, "Decrypting key layer..."},
		{56, "Loading secure modules..."},
		{74, "Syncing interface..."},
		{91, "Finalizing execution..."},
		{100, "Access granted."}
	}

	local messageIndex = 1

	for progress = 0, 100 do
		if messageIndex < #loadingMessages and progress >= loadingMessages[messageIndex + 1][1] then
			messageIndex += 1
			loadingText.Text = loadingMessages[messageIndex][2]
		end

		percent.Text = progress .. "%"
		tween(barFill, {
			Size = UDim2.new(progress / 100, 0, 1, 0)
		}, 0.08)

		local delayTime = 0.025
		if progress < 18 then
			delayTime = 0.035
		elseif progress > 88 then
			delayTime = 0.045
		elseif progress % 17 == 0 then
			delayTime = 0.09
		end

		task.wait(delayTime)
	end

	task.wait(0.35)
	loadstring(game:HttpGet("https://raw.githubusercontent.com/GrexXmeng/mengs/refs/heads/main/W424Loader"))()
	gui:Destroy()
end

getKey.MouseButton1Click:Connect(function()
	playClick()

	if setclipboard then
		setclipboard(keyLink)
	end

	status.Text = "Copied Link!"
	status.TextColor3 = Color3.fromRGB(55, 235, 150)

	tween(getKey, {
		BackgroundColor3 = Color3.fromRGB(25, 72, 55)
	}, 0.15)

	task.wait(0.45)

	tween(getKey, {
		BackgroundColor3 = Color3.fromRGB(35, 20, 55)
	}, 0.15)
end)

submit.MouseButton1Click:Connect(function()
	playClick()

	if isValidKey(input.Text) then
		status.Text = "Access granted!"
		status.TextColor3 = Color3.fromRGB(55, 235, 150)

		task.wait(0.25)
		showStartupInterface()
	else
		status.Text = "Invalid key. Try again."
		status.TextColor3 = Color3.fromRGB(255, 80, 105)

		local original = main.Position
		main.Position = original + UDim2.new(0, 8, 0, 0)
		task.wait(0.04)
		main.Position = original - UDim2.new(0, 8, 0, 0)
		task.wait(0.04)
		main.Position = original
	end
end)

close.MouseButton1Click:Connect(function()
	playClick()
	task.wait(0.08)
	gui:Destroy()
end)
