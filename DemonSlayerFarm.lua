if game.Players.LocalPlayer.PlayerScripts:FindFirstChild("Anti Exploit") then
    game.Players.LocalPlayer.PlayerScripts:FindFirstChild("Anti Exploit").Disabled = true
end
if game.Players.LocalPlayer.PlayerScripts:FindFirstChild("client") then
    game.Players.LocalPlayer.PlayerScripts:FindFirstChild("client").Disabled = true
end

 
local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wall%20v3')))()
local g = library:CreateWindow("Main")
local w = library:CreateWindow("Grinding") -- Creates the window
local s = library:CreateWindow("PVP")
local a = library:CreateWindow("Player")
local b = w:CreateFolder("Locations") -- Creates the folder(U will put here your buttons,etc)

local c = s:CreateFolder("PVP Helper")
local f = a:CreateFolder("Player Settings")
local z = g:CreateFolder("Main Functions")
local Players = {

}

for _,v in pairs(game:GetService("Players"):GetChildren()) do -- LOOPS THROUGH ALL MOBS
    insert = true -- VALUE TO CHECK THE MOB
    for _,v2 in pairs(Players) do if v2 == v.Name then insert = false end end -- CHECKS IF MOB IS ALREADY IN THE TABLE
    if insert then table.insert(Players, v.Name) end -- IF THE MOB ISNT INSERTED THEN INSERT IT
end
 


 local Dropdown = b:Dropdown("Locations",{"Location 1","Location 2", "Location 3", "Location 4", "Location 5" },true,function(mob) --true/false, replaces the current title "Dropdown" with the option that t
    if mob == "Location 1"  then
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-682.81366, 824.79425, -250.742798, -0.691493928, -1.86948927e-08, -0.722382247, -8.06019642e-08, 1, 5.1276011e-08, 0.722382247, 9.36824804e-08, -0.691493928)
    else if mob == "Location 2" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2251.50562, 507.591919, 373.699127, -0.969405234, 1.00814795e-07, -0.245465904, 9.33936022e-08, 1, 4.1873637e-08, 0.245465904, 1.76675776e-08, -0.969405234)
    else if mob == "Location 3" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(494.945007, 751.393433, 868.513245, -0.873669922, 0, 0.486519098, 0, 1, 0, -0.486519098, 0, -0.873669922)
    else if mob == "Location 4" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(336.508148, 821.093018, 1758.25159, -0.64525789, 3.26321015e-08, -0.763964832, -5.48865806e-08, 1, 8.90722944e-08, 0.763964832, 9.9406023e-08, -0.64525789)
    else if mob == "Location 5" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new()
    end  
    end  
    end  
    end    
end
end)


local Dropdown1 = c:Dropdown("TP To Player",Players,true,function(mob) --true/false, replaces the current title "Dropdown" with the option that t
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = mob.Character.HumanoidRootPart.CFrame
    end)
    

z:Button("Server Hop",function()
    game:GetService("TeleportService"):Teleport(2483973525, game:GetService("Players").LocalPlayer)
end)
z:Button("Reload Gui",function()
game.Players.LocalPlayer:Kick("Unexpected Client Behavior")
end)
f:Button("Force Reset",function()
game.Players.LocalPlayer.Character.Humanoid:TakeDamage(game.Players.LocalPlayer.Character.Humanoid.MaxHealth)
end)

game:GetService("Players").ChildAdded:Connect(function() -- WHEN MOB SPAWNS
    for _,v2 in pairs(Players) do table.remove(Players, _) end -- REMOVES ALL THE OLD MOBS
    -- ADDS THE NEW MOBS
    for _,v in pairs(game:GetService("Players"):GetChildren()) do -- LOOPS THROUGH ALL MOBS
        insert = true -- VALUE TO CHECK THE MOB
        for _,v2 in pairs(Players) do if v2 == v.Name then insert = false end end -- CHECKS IF MOB IS ALREADY IN THE TABLE
        if insert then table.insert(Players, v.Name) end -- IF THE MOB ISNT INSERTED THEN INSERT IT
    end
    Dropdown1:Refresh(Players)
end)
 


game:GetService("Players").ChildRemoved:Connect(function() -- WHEN MOB DIES / GETS REMOVED
    for _,v2 in pairs(Players) do table.remove(Players, _) end -- REMOVES ALL THE OLD MOBS
    -- ADDS THE NEW MOBS
    for _,v in pairs(game:GetService("Players"):GetChildren()) do -- LOOPS THROUGH ALL MOBS
        insert = true -- VALUE TO CHECK THE MOB
        for _,v2 in pairs(Players) do if v2 == v.Name then insert = false end end -- CHECKS IF MOB IS ALREADY IN THE TABLE
        if insert then table.insert(Players, v.Name) end -- IF THE MOB ISNT INSERTED THEN INSERT IT
    end
  Dropdown1:Refresh(Players)
end)

f:Slider("WalkSpeed",{
    min = 16; -- min value of the slider
    max = 120; -- max value of the slider
    precise = true; -- max 2 decimals
},function(value)
    game.Players.LocalPlayer.Character.WalkSpeed = value
end)