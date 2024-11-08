--[[
	UI Library for Toolbox
]]

local ui = {
	theme = {
		corner                                         = Instance.new("UICorner"),
		drag                                           = Instance.new("UIDragDetector"),
		baseColor                                      = Color3.new(0.203922, 0.184314, 0.231373) --[[Color3.new(1, 0, 0)]],
		windowMediaAreaColor                           = Color3.new(0.203922, 0.184314, 0.231373),
		windowTopbarColor                              = Color3.new(0.34902, 0.0980392, 0.705882),
		windowTopbarSize                               = 25,
		windowTopbarTextAlignment                      = Enum.TextXAlignment.Center,
		windowTopbarTextSize                           = 14,
		windowTopbarTextSizeAutomatic                  = true,
		mainUiCategorySelectionButtonContainerSize     = 110,
		mainUiCategorySelectionButtonHeight            = 30,
		mainUiCategorySelectionButtonTextSize          = 14,
		mainUiCategorySelectionButtonTextSizeAutomatic = true,
		mainUiMediaPadding                             = 5
	},
	container = nil,
	mainUi = nil,
	mainUiPages = 0
}

ui.theme.mainUiPageLayout = Instance.new("UIPageLayout")
ui.theme.mainUiPageLayout.Circular = true
ui.theme.mainUiPageLayout.FillDirection = Enum.FillDirection.Vertical

ui.theme.mainUiCategorySelectionButtonLayout = Instance.new("UIListLayout")
ui.theme.mainUiCategorySelectionButtonLayout.Padding = UDim.new(1, 10)


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
	topbar.Name = "topbar"
	
	ui.theme.corner:Clone().Parent = topbar
	
	topbar.Size = UDim2.new(1, 0, 0, ui.theme.windowTopbarSize)
	
	topbar.BackgroundColor3 = ui.theme.windowTopbarColor
	topbar.TextXAlignment = ui.theme.windowTopbarTextAlignment
	topbar.TextSize = ui.theme.windowTopbarTextSize
	topbar.TextScaled = ui.theme.windowTopbarTextSizeAutomatic
	topbar.Text = "Toolbox"
	
	--Media Area
	
	local media = Instance.new("Frame", frame)
	media.Name = "media"
	
	media.Size = UDim2.new(1, 2 * -ui.theme.mainUiMediaPadding, 1, -ui.theme.windowTopbarSize + ((2 * -ui.theme.mainUiMediaPadding)))
	
	media.Position = UDim2.new(0, ui.theme.mainUiMediaPadding, 0, ui.theme.windowTopbarSize + ui.theme.mainUiMediaPadding)
	
	media.BorderSizePixel = 0
	
	media.BackgroundColor3 = ui.theme.windowMediaAreaColor
	
	--Menu Buttons Area
	
	local buttons = Instance.new("ScrollingFrame", media)
	buttons.Name = "buttons"
	
	ui.theme.mainUiCategorySelectionButtonLayout:Clone().Parent = buttons
	
	buttons.Size = UDim2.new(0, ui.theme.mainUiCategorySelectionButtonContainerSize, 1, 0)
	
	buttons.BorderSizePixel = 0
	
	buttons.BackgroundTransparency = 1
	
	buttons.AutomaticCanvasSize = Enum.AutomaticSize.Y
	
	buttons.ScrollingDirection = Enum.ScrollingDirection.Y
	
	buttons.ScrollBarThickness = 10
	
	--Page Area
	
	local page = Instance.new("Frame", media)
	page.Name = "page"
	
	ui.theme.mainUiPageLayout:Clone().Parent = page
	
	page.Position = UDim2.new(0, ui.theme.mainUiCategorySelectionButtonContainerSize, 0, 0)
	
	page.Size = UDim2.new(1, -ui.theme.mainUiCategorySelectionButtonContainerSize, 1, 0)
	
	page.BorderSizePixel = 0
	
	page.BackgroundTransparency = 1
end

--[[
	Internal function, not for generic use.
	Constructs the required elements for a UI Menu Entry.
	
	<code>color</code>: <code>Color3</code> | The color of the button used to open the menu.
	<code>label</code>: <code>string</code> | The label of the button used to open the menu.
	<code>mediaConstructor</code>: <code>(container: ScrollingFrame) -> nil</code> | The function used to populate the menu.
]]
function ui.SpawnMainUiMenuEntry(color: Color3, label: string, mediaConstructor: (container: ScrollingFrame) -> nil)
	local button = Instance.new("TextButton", ui.mainUi.media.buttons)
	
	ui.theme.corner:Clone().Parent = button
	
	button.Size = UDim2.new(1, -10, 0, ui.theme.mainUiCategorySelectionButtonHeight)
	
	button.BackgroundColor3 = color
	
	button.Text = label
	
	button.TextSize = ui.theme.mainUiCategorySelectionButtonTextSize
	
	button.TextScaled = ui.theme.mainUiCategorySelectionButtonTextSizeAutomatic
	
	local thisPageIndex = ui.mainUiPages
	
	local content = Instance.new("ScrollingFrame", ui.mainUi.media.page)
	
	content.LayoutOrder = thisPageIndex
	
	content.Size = UDim2.new(1, 0, 1, 0)
	
	content.BorderSizePixel = 0
	
	content.BackgroundTransparency = 1
	
	content.ScrollBarThickness = 10
	
	content.ScrollingDirection = Enum.ScrollingDirection.Y
	
	content.AutomaticCanvasSize = Enum.AutomaticSize.Y
	
	mediaConstructor(content)
	
	button.Activated:Connect(function()
		ui.mainUi.media.page.UIPageLayout:JumpToIndex(thisPageIndex)
	end)
	
	ui.mainUiPages = ui.mainUiPages + 1
end

return ui
