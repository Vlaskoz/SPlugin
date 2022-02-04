local createButtonModule = {}

local Selection = game:GetService("Selection")
local changeHistoryService = game:GetService("ChangeHistoryService")
local sPluginUI = script.Parent.Parent.SPluginUI
local widgetOptionBool = sPluginUI.WidgetSelection.Main.WidgetButtonFrame.Option
local modulesOptionBool = sPluginUI.WidgetSelection.Main.ModulesButtonFrame.Option
local textInputs = sPluginUI.TextInputs
local toolBarInput = textInputs.ToolbarInput
local pluginNameInput = textInputs.PluginNameInput
local pluginDescriptionInput = textInputs.PluginDescriptionInput
local pluginDecalInput = textInputs.PluginDecalInput
local Debounce = false

function createButtonModule.OnCreateButtonClicked()
	if not Debounce then
		Debounce = true
		local selectedObjects = Selection:Get()
		local Parent = game:GetService("ServerScriptService")
		if #selectedObjects > 0 then
			Parent = selectedObjects[1]

			local pluginFolder = Instance.new("Folder")
			pluginFolder.Name = pluginNameInput.Text
			pluginFolder.Parent = Parent

			local Script = Instance.new("Script")
			Script.Source = "-- You can customise the toolbar name, plugin name, plugin description, plugin decal id, etc. \n\nlocal toolBar = plugin:CreateToolbar('" .. toolBarInput.Text .."') \nlocal pluginButton = toolBar:CreateButton('".. pluginNameInput.Text .."','".. pluginDescriptionInput.Text .."','rbxassetid://".. pluginDecalInput.Text .."')"
			Script.Name = "Main"
			Script.Parent = pluginFolder

			if modulesOptionBool.Value == true then
				local modulesFolder = Instance.new("Folder")
				modulesFolder.Name = "Modules"
				modulesFolder.Parent = pluginFolder
			end

			if widgetOptionBool.Value == true then 
				local pluginFrame = Instance.new("Frame")
				pluginFrame.Name = "PluginUI"
				pluginFrame.Parent = pluginFolder
				Script.Source = "-- You can customise the toolbar name, plugin name, plugin description, plugin decal id, etc. \n\nlocal toolBar = plugin:CreateToolbar('" .. toolBarInput.Text .."')\nlocal pluginButton = toolBar:CreateButton('".. pluginNameInput.Text .."','".. pluginDescriptionInput.Text .."','rbxassetid://".. pluginDecalInput.Text .."') \n\n -- Setting up the widget \n\nlocal pluginWidgetInfo = DockWidgetPluginGuiInfo.new( \n Enum.InitialDockState.Float, -- State of which the plugin is in \n false, -- Inital Enable \n false, -- Override/s \n 500, -- Defaults \n 500, \n 300, -- Minimums	\n 300) \n\nlocal pluginWidget = plugin:CreateDockWidgetPluginGui('" .. pluginNameInput.Text .. "', pluginWidgetInfo) \nlocal pluginUI = script.Parent.PluginUI \npluginWidget.Title = '".. pluginNameInput.Text .."' \npluginWidget.Name = '".. pluginNameInput.Text .."' \npluginUI.Parent = pluginWidget \n\npluginButton.Click:Connect(function() \npluginWidget.Enabled = not pluginWidget.Enabled \nend)"
			end
		end
	end
	task.wait(0.5)
	Debounce = false
end	

return createButtonModule

