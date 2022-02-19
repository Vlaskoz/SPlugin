local tweenModule = require(script.Parent.Parent.Parent.Parent.Parent.Parent.Modules.TweenModule)
local valuesFolder = script.Parent.Parent.Parent.Parent.Parent.Parent.Values
local widgetButton = script.Parent.WidgetButtonFrame.WidgetButton
local modulesButton = script.Parent.ModulesButtonFrame.ModulesButton
local widgetValue = valuesFolder.WidgetBool
local modulesValue = valuesFolder.ModulesBool
local debounce = false
local widgetBool = false
local modulesBool = false

widgetButton.MouseButton1Down:Connect(function()
	if not debounce then
		debounce = true
		if widgetBool then
			widgetBool = false
			tweenModule.Tween(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.InOut, widgetButton, {BackgroundColor3 = Color3.fromRGB(196, 40, 28), Position = UDim2.new(0.25 , 0 , 0.5 , 0)})
			task.wait(0.6)
			widgetValue.Value = false
			debounce = false
		elseif not widgetBool then
			widgetBool = true
			tweenModule.Tween(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.InOut, widgetButton, {BackgroundColor3 = Color3.fromRGB(75, 151, 75), Position = UDim2.new(0.75 , 0 , 0.5 , 0)})
			widgetValue.Value = true
			task.wait(0.6)
			debounce = false
		end
	end
end)

modulesButton.MouseButton1Down:Connect(function()
	if not debounce then
		debounce = true
		if modulesBool then
			modulesBool = false
			tweenModule.Tween(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.InOut, modulesButton, {BackgroundColor3 = Color3.fromRGB(196, 40, 28), Position = UDim2.new(0.25 , 0 , 0.5 , 0)})
			task.wait(0.6)
			modulesValue.Value = false
			debounce = false
		elseif not modulesBool then
			modulesBool = true
			tweenModule.Tween(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.InOut, modulesButton, {BackgroundColor3 = Color3.fromRGB(75, 151, 75), Position = UDim2.new(0.75 , 0 , 0.5 , 0)})
			modulesValue.Value = true
			task.wait(0.6)
			debounce = false
		end
	end
end)

