local DataStoreService = game:GetService("DataStoreService")
local myDataStore = DataStoreService:GetDataStore("myDataStore")    
game.Players.PlayerAdded:Connect(function(Player)
    local leaderstats = Instance.new("Folder")
    leaderstats.Parent = Player
    leaderstats.Name = "leaderstats"
    
    local wins = Instance.new("IntValue")
    wins.Parent = leaderstats
    wins.Name = "Wins"
    wins.Value = 0
    
    local cash = Instance.new("IntValue")   
    cash.Name = "Cash"
    cash.Value = 0
    cash.Parent = leaderstats
    
 
    local data
    local success, errormessage = pcall(function()
        data = myDataStore:GetAsync(Player.UserId.."-cash")
    end)
 
    local data1
    local success, errormessage = pcall(function()
        data1 = myDataStore:GetAsync(Player.UserId.."-wins")
    end)
 
    if success then 
        cash.Value = data
        wins.Value = data1
 
    end
    print("There was an error")
    warn(errormessage)
end)
 
 
game.Players.PlayerRemoving:Connect(function(Player)
    local success, errormessage = pcall(function()
        myDataStore:SetAsync(Player.UserId.."-cash",Player.leaderstats.Cash.Value )
        myDataStore:SetAsync(Player.UserId.."-wins",Player.leaderstats.Wins.Value)
    end)
 
    if success then 
        print("player data success")
    else
        print("there was an error")
        warn(errormessage)
    end
end)