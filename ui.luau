--[[
	UI Library for Toolbox
]]

local ui = {
	theme = {
		corner                                     = Instance.new("UICorner"),
		drag                                       = Instance.new("UIDragDetector"),
		baseColor                                  = Color3.new(1, 0, 0),
		windowMediaAreaColor                       = Color3.new(0.203922, 0.184314, 0.231373),
		windowTopbarColor                          = Color3.new(0.34902, 0.0980392, 0.705882),
		windowTopbarSize                           = 25,
		windowTopbarTextAlignment                  = Enum.TextXAlignment.Center,
		windowTopbarTextSize                       = 14,
		windowTopbarTextSizeAutomatic              = true,
		mainUiCategorySelectionButtonContainerSize = 110
		
	},
	container = nil,
	mainUi = nil
}

--[[
	Spawns the Toolbox UI container. Does not spawn the mainUi, only the <code>ScreenGui</code> it goes inside of.
	  <code>spawnInside</code>: <code>Instance</code> | The instance to spawn the container inside of.
]]
function ui.SpawnContainer(spawnInside: Instance)
	local container = Instance.new("ScreenGui", spawnInside)
	
	container.Name = "ToolboxUiContainer"
	
	container.DisplayOrder = 999999
	
	container.ResetOnSpawn = false
	
	container.IgnoreGuiInset = true
	
	local frame = Instance.new("Frame", container)
	ui.container = frame
	
	frame.Size = UDim2.new(1, 0, 1, 0)
	
	frame.BorderSizePixel = 0
	
	frame.BackgroundTransparency = 1
	
	--Drag Detector Code
	
	ui.theme.drag.BoundingUI = frame
end

--[[
	Spawns the Toolbox UI menu. Expects <code>ui:SpawnContainer(...)</code> to have been executed already.
]]
function ui.SpawnMainToolboxUi()
	local frame = Instance.new("Frame", ui.container)
	ui.mainUi = frame
	
	ui.theme.drag:Clone().Parent = frame
	ui.theme.corner:Clone().Parent = frame
	
	frame.Size = UDim2.new(0, 600, 0, 400 + ui.theme.windowTopbarSize)
	
	frame.BackgroundColor3 = ui.theme.baseColor
	
	--Topbar
	
	local topbar = Instance.new("TextLabel", frame)
	
	ui.theme.corner:Clone().Parent = topbar
	
	topbar.Size = UDim2.new(1, 0, 0, ui.theme.windowTopbarSize)
	
	topbar.BackgroundColor3 = ui.theme.windowTopbarColor
	topbar.TextXAlignment = ui.theme.windowTopbarTextAlignment
	topbar.TextSize = ui.theme.windowTopbarTextSize
	topbar.TextScaled = ui.theme.windowTopbarTextSizeAutomatic
	topbar.Text = "Toolbox"
	
	--Media Area
	
	local media = Instance.new("Frame", frame)
	
	media.Size = UDim2.new(1, 0, 1, -ui.theme.windowTopbarSize)
	
	media.Position = UDim2.new(0, 0, 0, ui.theme.windowTopbarSize)
	
	media.BorderSizePixel = 0
	
	media.BackgroundColor3 = ui.theme.windowMediaAreaColor
	
	--Menu Buttons Area
	
	local buttons = Instance.new("ScrollingFrame", media)
	
	buttons.Size = UDim2.new(0, ui.theme.mainUiCategorySelectionButtonContainerSize, 1, 0)
	
	buttons.BorderSizePixel = 0
	
	buttons.BackgroundTransparency = 1
	
	buttons.AutomaticCanvasSize = Enum.AutomaticSize.Y
	
	buttons.ScrollingDirection = Enum.ScrollingDirection.Y
	
	buttons.ScrollBarThickness = 10
	
	buttons.VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Left
end

return ui
