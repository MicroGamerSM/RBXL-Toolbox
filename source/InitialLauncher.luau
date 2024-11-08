local ui = require(script.UILib)

local players = game:GetService("Players")

ui.SpawnContainer(players.LocalPlayer.PlayerGui)

ui.SpawnMainToolboxUi()

ui.SpawnMainUiMenuEntry(ui.theme.windowTopbarColor, "Toolbox", function(container: ScrollingFrame): nil
	local header = Instance.new("TextLabel", container)
	header.BackgroundTransparency = 1
	header.BorderSizePixel = 0
	header.Text = "Toolbox"
	header.TextXAlignment = Enum.TextXAlignment.Left
	header.TextYAlignment = Enum.TextYAlignment.Top
	header.TextScaled = true
	header.Size = UDim2.new(1, 0, 0, 50)
	header.TextColor3 = Color3.new(1, 1, 1)
	
	container.Visible = true
end)

ui.SpawnMainUiMenuEntry(Color3.new(1, 1, 1), "Modules", function(container: ScrollingFrame): nil
	local header = Instance.new("TextLabel", container)
	header.BackgroundTransparency = 1
	header.BorderSizePixel = 0
	header.Text = "Modules"
	header.TextXAlignment = Enum.TextXAlignment.Left
	header.TextYAlignment = Enum.TextYAlignment.Top
	header.TextScaled = true
	header.Size = UDim2.new(1, 0, 0, 50)
	header.TextColor3 = Color3.new(1, 1, 1)
	local importModuleLabel = Instance.new("TextLabel", container)
	importModuleLabel.BackgroundTransparency = 1
	importModuleLabel.BorderSizePixel = 0
	importModuleLabel.Text = "Import Module"
	importModuleLabel.TextXAlignment = Enum.TextXAlignment.Left
	importModuleLabel.TextScaled = true
	importModuleLabel.Size = UDim2.new(1, 0, 0, 25)
	importModuleLabel.Position = UDim2.new(0, 0, 0, 50)
	importModuleLabel.TextColor3 = Color3.new(1, 1, 1)
end)
