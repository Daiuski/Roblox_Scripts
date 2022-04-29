local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Souls Of Jar", "Sentinel")
local  Main = Window:NewTab("Main")
local Player = Window:NewTab("Player")
local Settings = Window:NewTab("Settings")
local SectionSettings = Settings:NewSection("Settings")
local SectionSettingsThemes = Settings:NewSection("Themes")
local SectionMainMove = Main:NewSection("Move")
SectionSettings:NewButton("Leave", "Leaves The Game Fast As Possible", function()
game.Players.LocalPlayer:Kick("Succes.")
end)

local TweenSpeed = 80
local MoveToPlayer
local Players = {

}
for _,v in pairs(game:GetService("Players"):GetChildren()) do 
    insert = true
    for _,v2 in pairs(Players) do if v2 == v.Name then insert = false end end
    if insert then table.insert(Players, v.Name) end
end
SectionMainMove:NewDropdown("Move To A Player", "Moves You To Selected Player", Players, function(currentOption)
    MoveToPlayer = currentOption
end)

SectionMainMove:NewSlider("Tweening Speed", "Changes Your Tweening Speed [Default 80]", 120, 50, function(s)
    TweenSpeed = s
end)
SectionMainMove:NewButton("Execute", "Executes The Function", function()
    print(MoveToPlayer)
    print(game.Players:FindFirstChild(MoveToPlayer))
    local TweenService = game:GetService("TweenService")
    local NewPosition = game.Players:FindFirstChild(MoveToPlayer).Character.HumanoidRootPart.Position
    local OldPosition = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
    local TimeShouldTake = 	((NewPosition - OldPosition) * Vector3.new(1, 0, 1)).Magnitude / TweenSpeed

							local tweenInfo = TweenInfo.new(TimeShouldTake)
                            print("TweenInfo Acquired")
							local tween1 = TweenService:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, tweenInfo, {CFrame = game.Players:FindFirstChild(MoveToPlayer).Character.HumanoidRootPart.CFrame})
                            print("Tween Acquired")

							tween1:Play()
                            print("Function Acquired")
end)
local SectionMainExtra = Main:NewSection("Extra")
SectionMainExtra:NewDropdown("Teleport To A Player", "Teleports You To Selected Player", Players, function(currentOption)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players:FindFirstChild(currentOption).Character.HumanoidRootPart.CFrame
end)


local SectionPlayer = Player:NewSection("Player")
local WalkSpeed = 16
SectionPlayer:NewSlider("WalkSpeed Speed [RISKY!]", "Changes Your Character's WalkSpeed [RISKY!]", 123, 16, function(s)
   WalkSpeed = s
end)
SectionPlayer:NewButton("Update Speed", "Changes Player Speed", function()
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = WalkSpeed
end)

local AttachBackTo
local SectionMainAttachBack = Main:NewSection("Attach Back")
SectionMainAttachBack:NewDropdown("Attach Back", "Attaches You To Back Of Selected Player", Players, function(currentOption)
    AttachBackTo = currentOption
end)
SectionMainAttachBack:NewButton("Execute", "Executes The Function", function()
    print(MoveToPlayer)
    print(game.Players:FindFirstChild(MoveToPlayer))
    local TweenService = game:GetService("TweenService")
    local NewPosition = game.Players:FindFirstChild(AttachBackTo).Character.HumanoidRootPart.Position
    local OldPosition = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
    local TimeShouldTake = 	((NewPosition - OldPosition) * Vector3.new(1, 0, 1)).Magnitude / 120

							local tweenInfo = TweenInfo.new(TimeShouldTake)
                            print("TweenInfo Acquired")
                            
							local tween1 = TweenService:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, tweenInfo, {CFrame = game.Players:FindFirstChild(AttachBackTo).Character.HumanoidRootPart.CFrame})
                            print("Tween Acquired")

							tween1:Play()
   
                            print("Function Acquired")
                        
end)