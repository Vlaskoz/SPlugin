local tweenModule = require(script.Parent.Parent.Parent.Parent.Modules.TweenModule)
local pageButtons = script.Parent
local pageFrames = pageButtons.Parent.Parent.PageFrames
local homeButton = pageButtons.HomeButton
local presetsButton = pageButtons.PresetsButton
local onHoverColour = Color3.fromRGB(150,150,150)
local regularColour = Color3.fromRGB(100,100,100)
local onClickedColor = Color3.fromRGB(200,200,200)
local homeIsClicked = false
local presetsIsClicked = false
local debounce = false

-- homeButton functions

homeButton.MouseEnter:Connect(function()
	if homeIsClicked then return end
	tweenModule.Tween(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, homeButton, {TextColor3 = onHoverColour})
end)

homeButton.MouseLeave:Connect(function()
	if homeIsClicked then return end
	tweenModule.Tween(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, homeButton, {TextColor3 = regularColour})
end)

homeButton.MouseButton1Down:Connect(function()
	if not debounce then
		debounce = true
		homeIsClicked = true
		presetsIsClicked = false
		pageFrames.HomeFrame.Visible = true
		tweenModule.Tween(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, homeButton, {TextColor3 = onClickedColor})
		tweenModule.Tween(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, presetsButton, {TextColor3 = regularColour})
		tweenModule.Tween(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut, pageFrames.PresetsFrame, {Position = UDim2.new(1.5,0,1,0)})
		tweenModule.Tween(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut, pageFrames.HomeFrame, {Position = UDim2.new(0.5,0,1,0)})
		task.wait(0.5)
		pageFrames.PresetsFrame.Visible = false
		debounce = false
	end
end)


-- presetsButton functions

presetsButton.MouseEnter:Connect(function()
	if presetsIsClicked then return end
	tweenModule.Tween(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, presetsButton, {TextColor3 = onHoverColour})
end)

presetsButton.MouseLeave:Connect(function()
	if presetsIsClicked then return end
	tweenModule.Tween(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, presetsButton, {TextColor3 = regularColour})
end)

presetsButton.MouseButton1Down:Connect(function()
	if not debounce then
		debounce = true
		presetsIsClicked = true
		homeIsClicked = false
		pageFrames.PresetsFrame.Visible = true
		tweenModule.Tween(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, presetsButton, {TextColor3 = onClickedColor})
		tweenModule.Tween(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, homeButton, {TextColor3 = regularColour})
		tweenModule.Tween(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut, pageFrames.HomeFrame, {Position = UDim2.new(-1.5,0,1,0)})
		tweenModule.Tween(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.InOut, pageFrames.PresetsFrame, {Position = UDim2.new(0.5,0,1,0)})
		task.wait(0.5)
		pageFrames.HomeFrame.Visible = false
		debounce = false
	end
end)




