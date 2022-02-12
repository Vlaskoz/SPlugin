local pluginInfoModule = {}

local pluginTitle = script:GetAttribute("pluginTitle")
local pluginVersion = script:GetAttribute("pluginVersion")

function pluginInfoModule.RetrievePluginTitle()
	return pluginTitle
end

function pluginInfoModule.RetrievePluginVersion()
	return pluginVersion
end


return pluginInfoModule