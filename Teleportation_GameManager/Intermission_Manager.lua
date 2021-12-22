local gMgr = {}
local sessionData = {}
local mSpawns = workspace.Map.Spawns:GetChildren()
local lSpawns = workspace.Lobbys.Spawns:GetChildren()
local numOfPlayers = 0
local declareWinnerTime = 3
local rs = game:GetService("ReplicatedStorage")
local winnerRe = rs:WaitForChild("WinnerRe")
local intermissionRe = rs:WaitForChild("IntermissionRe")
local intermissionTime = 50
local gui = game.StarterGui.WaitingToStart.TextLabel
 
function gMgr:isEnoughPlayers()
    if numOfPlayers >= 2 then
        return true
    end
    if numOfPlayers < 2 then
        return false
end
end
 
function gMgr:declareWinner(player)
    -- remote event to UI
    winnerRe:FireAllClients(player, declareWinnerTime)
    wait(declareWinnerTime)
    sessionData[player]["isWinner"] = true
    sessionData[player]["wins"] = sessionData[player]["wins"] + 1
    for ply, data in pairs(sessionData) do
        local spawnPnt = lSpawns[math.random(1, #lSpawns)]
        ply.Character.HumanoidRootPart.CFrame = spawnPnt.CFrame + Vector3.new(0, 3, 0)
        data["isPlaying"] = false
    end
end
 
function gMgr:checkForLastPlayerStanding()
    local num = 0
    local aPlayer = nil
    for player, data in pairs(sessionData) do
        if data["isPlaying"] then
            num = num + 1
            aPlayer = player
        end
    end
    if num == 1 then
        return aPlayer
    end
    return nil
end
function gMgr:intermission()
    intermissionRe:FireAllClients(intermissionTime)
    wait(intermissionTime)
end
 
local function teleportPlayers()
    for ply, data in pairs(sessionData) do
        local spawnPnt = mSpawns[math.random(1, #mSpawns)]
        ply.Character.HumanoidRootPart.CFrame = spawnPnt.CFrame + Vector3.new(0, 3, 0)
        data["isWinner"] = false
        data["isPlaying"] = true 
    end
end
 
local function checkIfAnyoneIsPlaying()
    for ply, data in pairs(sessionData) do
        if data["isPlaying"] then
            return true
        end
    end
    return false
end
 
function gMgr:playGame()
    local stillPlaying = true
    teleportPlayers()
    while stillPlaying do
        stillPlaying = checkIfAnyoneIsPlaying()
        wait(1)
    end  
 
end
 
local function addChar(char)
    local player = game.Players:GetPlayerFromCharacter(char)
    sessionData[player]["isPlaying"] = false
end
 
local function addPlayer(player)
    sessionData[player] = { isPlaying=false, isWinner=false, wins=0 }
    numOfPlayers = numOfPlayers + 1
    player.CharacterAdded:Connect(addChar)
end
 
local function removePlayer(player)
    sessionData[player] = nil
    numOfPlayers = numOfPlayers - 1
end
 
game.Players.PlayerAdded:Connect(addPlayer)
game.Players.PlayerRemoving:Connect(removePlayer)
 
return gMgr