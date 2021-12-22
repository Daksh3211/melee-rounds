local tweendoor = game.Workspace.TweeningPart
local endtween = game.Workspace.EndTween
local endingtween = game.Workspace.Endingtween
local tween = game:GetService("TweenService")

local tween1 = tween:Create(tweendoor,
	TweenInfo.new(2,
		Enum.EasingStyle.Quint,
		Enum.EasingDirection.InOut),
	{CFrame= endtween.CFrame},true )

local tween2 = tween:Create(tweendoor,
	TweenInfo.new(2, 
		Enum.EasingStyle.Quint,
		Enum.EasingDirection.InOut),
	{CFrame = endingtween.CFrame})
script.Parent.Touched:Connect(function(hit)
	
	if hit.Parent:FindFirstChild("Humanoid")then
		tween1:Play()
	end
	
end)

script.Parent.TouchEnded:Connect(function()
	tween2:Play()
end)