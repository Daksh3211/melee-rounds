local crates = game.ReplicatedStorage:WaitForChild("Crates")
local gui = game.StarterGui.CrateGui.CratesGui
local confirm = game.StarterGui.CrateGui.CONFIRM
game.ReplicatedStorage.CrateRE.OnServerEvent:Connect(function(plr, crateType, crateTime)
    
    
    if crates:FindFirstChild(crateType) then
        
 
        local price = crates[crateType].Price.Value
        
        if plr.leaderstats.Cash.Value >= price then
            confirm.Visible = true
            plr.leaderstats.Cash.Value = plr.leaderstats.Cash.Value - price
            
            
            local unboxableWeapons = crates[crateType]:GetChildren()
            
            local chosenWeapon 
            repeat chosenWeapon = unboxableWeapons[math.random(#unboxableWeapons)]; wait() until chosenWeapon:IsA("Tool")
            
            
            game.ReplicatedStorage.CrateRE:FireClient(plr, chosenWeapon)
            
            
            wait(crateTime)
            --local player = game:GetService("Players")
            --local plr = player.PlayerAdded
            chosenWeapon:Clone().Parent = plr.Backpack
            
            if chosenWeapon.Name == "Axe" then
                local legendlock = plr.PlayerGui.MainMenu.Inventory.ScrollingFrame.Legend.AxeButton
                local image = plr.PlayerGui.MainMenu.LegendShop.BuyButton.AxeButton
                    legendlock.Image = image.Image
            
 
            elseif chosenWeapon.Name == "BlueSword" then
                local legendlock = plr.PlayerGui.MainMenu.Inventory.ScrollingFrame.Legend.BlueButton
                local image = plr.PlayerGui.MainMenu.LegendShop.BuyButton.BlueButton
                if  legendlock.Image ~= image.Image then
                legendlock.Image = image.Image
                print("bluesword")
            end
 
            elseif chosenWeapon.Name == "Laser" then
                local legendlock = plr.PlayerGui.MainMenu.Inventory.ScrollingFrame.Legend.LaserButton
                local image = plr.PlayerGui.MainMenu.LegendShop.BuyButton.LaserButton
                if  legendlock.Image ~= image.Image then
                legendlock.Image = image.Image
                print("Laser")
        end
 
            elseif chosenWeapon.Name == "RedSword" then
                local legendlock = plr.PlayerGui.MainMenu.Inventory.ScrollingFrame.Legend.RedButton
                local image = plr.PlayerGui.MainMenu.LegendShop.BuyButton.RedButton
                if  legendlock.Image ~= image.Image then
                legendlock.Image = image.Image
                print("RedSword")
            end
 
            elseif chosenWeapon.Name == "TwoHandSword" then
                local legendlock = plr.PlayerGui.MainMenu.Inventory.ScrollingFrame.Legend.DoubleButton
                local image = plr.PlayerGui.MainMenu.LegendShop.BuyButton.TwoHandButton
                if  legendlock.Image ~= image.Image then
                legendlock.Image = image.Image
                    print("Twohandsword")
                end
            end
        end
    end
end)