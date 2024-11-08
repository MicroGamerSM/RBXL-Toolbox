local ui, gui = loadstring(game:HttpGet('https://raw.githubusercontent.com/MicroGamerSM/RBXL-Toolbox/refs/heads/main/source/ui.luau'))(), loadstring(game:HttpGet('https://raw.githubusercontent.com/MicroGamerSM/RBXL-Toolbox/refs/heads/main/source/GuiLib.luau'))()

local players = game:GetService("Players")

ui.SpawnContainer(players.LocalPlayer.PlayerGui)

ui.SpawnMainToolboxUi()

ui.SpawnMainUiMenuEntry(ui.theme.windowTopbarColor, "Toolbox", function(container: ScrollingFrame): nil
	gui.Header(container, "Toolbox", 50)

	container.Visible = true
end)

ui.SpawnMainUiMenuEntry(Color3.new(1, 1, 1), "Modules", function(container: ScrollingFrame): nil
	gui.Header(container, "Modules", 50)
	local importModuleLabel = Instance.new("TextLabel", container)
	importModuleLabel.BackgroundTransparency = 1
	importModuleLabel.BorderSizePixel = 0
	importModuleLabel.Text = "Import Module"
	importModuleLabel.TextXAlignment = Enum.TextXAlignment.Left
	importModuleLabel.TextScaled = true
	importModuleLabel.Size = UDim2.new(1, 0, 0, 25)
	--importModuleLabel.Position = UDim2.new(0, 0, 0, 50)
	importModuleLabel.TextColor3 = Color3.new(1, 1, 1)
end)

local PM = loadstring(game:HttpGet(https://raw.githubusercontent.com/MicroGamerSM/RBXL-Toolbox/refs/heads/main/pretendModule.luau))()
wait(2)
PM.Initialize(ui)
