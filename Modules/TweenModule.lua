local TweenModule = {}
local TweenService = game:GetService("TweenService")

function TweenModule.Tween(Duration: number, EasingStyle, EasingDirection, Object: Instance, Goal)
	local tween = TweenService:Create(Object, TweenInfo.new(Duration, EasingStyle, EasingDirection), Goal)
	tween:Play()
	task.spawn(function()
		tween.Completed:Wait()
		tween:Destroy()
	end)
end

return TweenModule
