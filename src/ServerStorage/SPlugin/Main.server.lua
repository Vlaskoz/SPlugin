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
local pluginVersionModule = require(Modules.PluginVersion)
local pluginInfo = pluginInfoModule.pluginInfo
local pluginButtonInfo = pluginInfo.pluginButtonInfo
local widgetInfo = pluginInfoModule.widgetInfo

-- \\ Setting the version text

versionLabel.Text = pluginInfo.pluginVersion

-- \\ Setting up the plugin

local toolBar = plugin:CreateToolbar(pluginInfo.pluginName)
local pluginButton = toolBar:CreateButton(pluginButtonInfo.buttonName, pluginButtonInfo.buttonDescription, pluginButtonInfo.buttonID)

local pluginWidgetInfo = widgetInfo.widgetGuiInfo
local pluginWidget = plugin:CreateDockWidgetPluginGui(pluginInfo.pluginName, pluginWidgetInfo)
pluginWidget.Title = pluginInfo.pluginName .. " (" .. pluginInfo.pluginVersion .. ")"
pluginWidget.Name = pluginInfo.pluginName
sPluginUI.Parent = pluginWidget

pluginButton.Click:Connect(function()
	pluginWidget.Enabled = not pluginWidget.Enabled
end)

createButton.MouseButton1Down:Connect(createButtonModule.OnCreateButtonClicked)

if not pluginVersionModule.CheckVersion() then
	sPluginUI.PageFrames.PresetsFrame.OutdatedFrame.Visible = true
end