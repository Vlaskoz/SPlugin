--[[ Developed by Vlaskos.
 To contact me, please DM me about issues or bugs on the DevForum. 
 My code is a mess.
 --]]



-- // Variables

local sPluginFolder = script.Parent
local sPluginUI = sPluginFolder.SPluginUI
local Modules = sPluginFolder.Modules
local createButton = sPluginUI.CreateButtonFolder.CreateButton
local versionLabel = sPluginUI.Version
local pluginInfoModule = require(Modules.PluginInfo)
local createButtonModule = require(Modules.CreateButton)

-- // Retrieve plugin info

local pluginTitle = pluginInfoModule.RetrievePluginTitle()
local pluginVersion = pluginInfoModule.RetreievePluginVersion()

-- // Setting up the plugin

local toolBar = plugin:CreateToolbar("SPlugin")
local sPlugin = toolBar:CreateButton("Simplify","Simplifying plugin design","rbxassetid://7072706536")

-- // Setting up the widget
local sPluginWidgetInfo = DockWidgetPluginGuiInfo.new(
   Enum.InitialDockState.Float, -- State of which the plugin is in
   false, -- Inital Enable
   false, -- Override/s
   500, -- Defaults
   500,
   300, -- Minimums
   300
) 

local sPluginWidget = plugin:CreateDockWidgetPluginGui("SPlugin", sPluginWidgetInfo)
sPluginWidget.Title = pluginTitle
sPluginWidget.Name = "SPlugin"
sPluginUI.Parent = sPluginWidget

-- // Opening of the plugin

sPlugin.Click:Connect(function()
	versionLabel.Text = pluginVersion
    sPluginWidget.Enabled = not sPluginWidget.Enabled
end)

-- // Create button clicked

createButton.MouseButton1Down:Connect(createButtonModule.OnCreateButtonClicked)
