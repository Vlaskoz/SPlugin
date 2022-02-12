--[[ Developed by Vlaskos.
 To contact me, please DM me about issues or bugs on the DevForum. 
 My code is a mess.
 --]]



-- // Variables

local sPluginFolder = script.Parent
local sPluginUI = sPluginFolder.SPluginUI
local Modules = sPluginFolder.Modules
local createButton = sPluginUI.PageFrames.HomeFrame.CreateButtonFolder.CreateButton
local versionLabel = sPluginUI.Version
local pluginInfoModule = require(Modules.PluginInfo)
local createButtonModule = require(Modules.CreateButton)

-- // Retrieve plugin info

local pluginTitle = pluginInfoModule.RetrievePluginTitle()
local pluginVersion = pluginInfoModule.RetrievePluginVersion()

-- // Setting up the plugin

local toolBar = plugin:CreateToolbar("SPlugin")
local sPlugin = toolBar:CreateButton("Simplify","Simplifying plugin design","rbxassetid://8808286030")

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

-- // Changing Version Text

versionLabel.Text = pluginVersion

-- // Opening of the plugin

sPlugin.Click:Connect(function()
    sPluginWidget.Enabled = not sPluginWidget.Enabled
end)

-- // Create button clicked

createButton.MouseButton1Down:Connect(createButtonModule.OnCreateButtonClicked)
