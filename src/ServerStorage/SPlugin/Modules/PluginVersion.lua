local pluginVersionModule = {}
local marketPlaceService = game:GetService("MarketplaceService")
local modules = script.Parent
local pluginInfoModule = require(modules.PluginInfo)

function pluginVersionModule.CheckVersion()
	local isUpdated = true
	local success, err = pcall(function()
		local pluginProduct = marketPlaceService:GetProductInfo(6657084311)
		if not string.find(pluginProduct.Description, pluginInfoModule.pluginInfo.pluginVersion) then
			isUpdated = false
		end
	end)
	return isUpdated
end
return pluginVersionModule
