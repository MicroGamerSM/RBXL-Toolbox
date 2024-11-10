local moduleLoader = {}

function moduleLoader.Initialize(ui, gui)
	moduleLoader.ui = ui
	moduleLoader.gui = gui
	print("Module Loader initialized")
end

function moduleLoader.LoadFromTable(data)
	do
		local color = data.meta.categoryColor or nil
		if color then
			if color.mode == "rgb" then
				local newColor = Color3.fromRGB(color.r, color.g, color.b)
				color = newColor
			end
		else
			color = Color3.fromRGB(math.random(0, 255), math.random(0, 255), math.random(0, 255))
		end
		data.meta.categoryColor = color
	end
	for _, category in ipairs(data.categories) do
		moduleLoader.ui.SpawnMainUiMenuEntry(data.meta.categoryColor, category.label, function(container: ScrollingFrame)
			moduleLoader.gui.Header(container, category.label, category.labelSize or 50)
			if category.sublabel then
				moduleLoader.gui.Header(container, category.sublabel.text, category.sublabel.size or 25)
			end
			for i, element in ipairs(category.media) do
				
			end
		end)
	end
end

return moduleLoader
