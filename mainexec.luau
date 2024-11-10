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
	gui.Header(container, "Import Module", 25)
	gui.TextInput(container, "Module Link", 450, 20, 350, "Module Link", "", function(value: string)
		loadstring(game:HttpGet(value))()(ui, gui)
	end)
end)
