script.Parent.Touched:Connect(function(hit)
    local tp2 = game.Workspace.Teleporters.TP2
    if hit and hit.Parent:FindFirstChild("Humanoid") then
        hit.Parent.HumanoidRootPart.CFrame = tp2.CFrame
    end
end)

