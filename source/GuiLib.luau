local gui = {}

function gui.Header(
	container: GuiBase2d,
	label: string,
	height: number
)
	local header = Instance.new("TextLabel")
	header.BackgroundTransparency = 1
	header.BorderSizePixel = 0
	header.Text = label
	header.TextXAlignment = Enum.TextXAlignment.Left
	header.TextYAlignment = Enum.TextYAlignment.Top
	header.TextScaled = true
	header.Size = UDim2.new(1, 0, 0, height)
	header.TextColor3 = Color3.new(1, 1, 1)
	
	header.Parent = container
	return header
end

function gui.TextInput(
	container: GuiBase2d,
	label: string,
	width: number,
	height: number,
	inputAreaWidth: number,
	placeholder: string,
	defaultValue: string,
	onEnter: (value: string) -> ()
)
	local frame = Instance.new("Frame")
	frame.BorderSizePixel = 0
	frame.BackgroundTransparency = 1
	frame.Size = UDim2.new(0, width, 0, height)
	gui.Header(frame, label, height)
	
	local input = Instance.new("TextBox", frame)
	input.BorderSizePixel = 0
	input.BackgroundColor3 = Color3.new(0.117647, 0.105882, 0.133333)
	input.TextColor3 = Color3.new(1, 1, 1)
	input.PlaceholderColor3 = Color3.new(0.552941, 0.458824, 0.678431)
	input.PlaceholderText = placeholder
	input.Text = defaultValue
	input.Size = UDim2.new(0, inputAreaWidth, 1, 0)
	input.Position = UDim2.new(0, width - inputAreaWidth, 0, 0)
	input.FocusLost:Connect(function(enterPressed: boolean, inputThatCausedFocusLoss: InputObject)
		if not enterPressed then return end
		onEnter(input.Text)
	end)
	
	frame.Parent = container
	return frame
end

return gui
