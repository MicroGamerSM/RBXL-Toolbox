local gui = loadstring(game:HttpGet('https://raw.githubusercontent.com/MicroGamerSM/RBXL-Toolbox/refs/heads/main/source/GuiLib.luau'))()

local module = {}

function module.Run()
	module.ui.SpawnMainUiMenuEntry(Color3.new(0.431373, 0.733333, 1), "PlrEdit", function(container: ScrollingFrame): nil
		gui.Header(container, "Player Editor", 50)
		local walkSpeed = gui.TextInput(container, "Walk Speed", 200, 25, 75, "Unknown", game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid").WalkSpeed, function(value: string)
			if not tonumber(value) then return end
			game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid").WalkSpeed = value
		end)
		walkSpeed.LayoutOrder = 1
		game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid").Changed:Connect(function(property: string)
			if property == "WalkSpeed" then
				walkSpeed.Input.Text = game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid").WalkSpeed
			end
		end)
	end)
end

function module.Initialize(ui)
	module.ui = ui
	module.Run()
end

return module
