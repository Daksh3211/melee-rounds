script.Parent.Touched:Connect(function(hit)
    local tp2 = game.Workspace.Teleporters.TP2
    if hit and hit.Parent:FindFirstChild("Humanoid") then
        hit.Parent.HumanoidRootPart.CFrame = tp2.CFrame
    end
end)

git config --global user.email "you@example.com"
git config --global user.name "Your Name"