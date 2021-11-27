

local gmt = getrawmetatable(game)
setreadonly(gmt, false)
local oldindex = gmt.__index
gmt.__index = newcclosure(function(self,v)
if v == 'WalkSpeed' then
    return 16
end
return oldindex(self,v)
end)


repeat
    wait()
until game:IsLoaded()

-- // Locals \\ -- 

local client = game.Players.LocalPlayer

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/muzrblx/nanocore/main/NanoLoader/Settings/Library.lua",true))()

local Window = Library:Create("Nanocore V2","A Universal Time S2")

-- // Tabs \\ -- 
local Main = Window:Tab("Main",true)
local Farming = Window:Tab("Farming",true)
local Misc = Window:Tab("Misc",true)
local AS = Window:Tab("Auto Skill",true)


-- // Toggles / Buttons \\ --

Main:Slider("Walkspeed (Chance of Kick)",16,50, function(t)
    client.Character.Humanoid.WalkSpeed = t
end)

Main:Button("Invisible", function()
    originalCFrame  = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(655.790344, 251.294586, 330.062439, -0.703922033, -0.0754781961, 0.706255674, -0.0841908902, 0.996194422, 0.0225515272, -0.705270052, -0.0435857773, -0.707597733)
    wait(0.5)
    game.Players.LocalPlayer.Character.HumanoidRootPart.RootJoint:Destroy()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = originalCFrame
end)

Main:Toggle("Item Farm", function(p)
    getgenv().itemfarm = p
end)

spawn(function()
    while wait() do
        if itemfarm then
            for i,v in pairs(game:GetService("Workspace").ItemSpawns.StandardItems:GetChildren()) do
                if v:IsA("Tool") and v:FindFirstChild("Handle") then
                    repeat
                        client.Character.HumanoidRootPart.CFrame = v.Handle.CFrame
                    until not itemfarm or v.Parent
                end
            end
        end
    end
end)

Main:Button("Anti AFk", function()
    local VirtualUser= game:GetService('VirtualUser')
    game:GetService('Players').LocalPlayer.Idled:connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
    end)
end)



Main:Toggle("Take Damage Farm", function(e)
    getgenv().damagefarm = e
end)

spawn(function()
    while wait() do
        if damagefarm then
            repeat
                wait(0.5)
                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Living["Akira_DEV Dummy"].HumanoidRootPart.CFrame
            until not damagefarm
        end
    end
end)





AS:Label("Might only work on synapse")

AS:Toggle("Auto Skill E", function(e)
    getgenv().autoskille = e
end)

AS:Toggle("Auto Skill R", function(e)
    getgenv().autoskillr = e
end)

AS:Toggle("Auto Skill F", function(e)
    getgenv().autoskillf = e
end)

AS:Toggle("Auto Skill T", function(e)
    getgenv().autoskillt = e
end)

AS:Toggle("Auto Skill Y", function(e)
    getgenv().autoskilly = e
end)


spawn(function()
    pcall(function()
        while wait() do
            if autoskille then
                repeat
                    pcall(function()
                        keypress(0x45)
                        wait(1)
                        keyrelease(0x45)
                    end)
                until not autoskille
            end
        end
    end)
end)

spawn(function()
    pcall(function()
        while wait() do
            if autoskillf then
                repeat
                    pcall(function()
                        keypress(0x46)
                        wait(1)
                        keyrelease(0x46)
                    end)
                until not autoskillf
            end
        end
    end)
end)

spawn(function()
    pcall(function()
        while wait() do
            if autoskillr then
                repeat
                    pcall(function()
                        keypress(0x52)
                        wait(1)
                        keyrelease(0x52)
                    end)
                until not autoskillr
            end
        end
    end)
end)

spawn(function()
    pcall(function()
        while wait() do
            if autoskillt then
                repeat
                    pcall(function()
                        keypress(0x54)
                        wait(1)
                        keyrelease(0x54)
                    end)
                until not autoskillt
            end
        end
    end)
end)

spawn(function()
    pcall(function()
        while wait() do
            if autoskilly then
                repeat
                    pcall(function()
                        keypress(0x59)
                        wait(1)
                        keyrelease(0x59)
                    end)
                until not autoskilly
            end
        end
    end)
end)



Farming:Toggle("DIO Farm", function(x)
    getgenv().diofarm = x
end)

spawn(function()
    pcall(function()
        while wait() do
            if diofarm then 
                for i,v in pairs(game.Workspace:GetChildren()) do
                    if v:IsA("Model") and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Name == "DIO [BOSS]" then
                        repeat
                            pcall(function()
                                client.Character.Humanoid:ChangeState(11)
                                client.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
                            end)
                        until v.Humanoid.Health <= 0 or not v.Parent or not diofarm
                    end
                end
            end
        end
    end)
end)



Farming:Toggle("Thug Farm", function(k)
    getgenv().thugfarm = k
end)

spawn(function()
    pcall(function()
        while wait() do
            if thugfarm then
                for i,v in pairs(game:GetService("Workspace").Living:GetDescendants()) do
                    if v.Name == "Thug" and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                        repeat wait()
                            client.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame
                        until not thugfarm or v.Humanoid.Health <= 0
                    end
                end
            end
        end
    end)
end)


local Teleport = Window:Tab("Teleports",true)

local islands = {
    ["City"] = CFrame.new(-483, 5, -187),
    ["DIO Spawn Area"] = CFrame.new(-199.400146, 2.55000401, -2044.8501)
}

local island = {}
for i,v in pairs(islands) do
    table.insert(island, i)
end

Teleport:Dropdown("Place Teleport", island, function(u)
    getgenv().islandchoosed = u
end)


Teleport:Button("Teleport To Place", function()
    client.Character.HumanoidRootPart.CFrame = islands[getgenv().islandchoosed]
end)


local npcs = {
    ["Killua"] = CFrame.new(-297, 10, -187),
    ["Enrico Pucci"] = CFrame.new(-579, 5, -273),
    ["DIO"] = CFrame.new(-29.9057178, 3.15068793, -2036.92163),
    ["Daily Quest"] = CFrame.new(-521.687866, 4.57013416, -179.820007),
    ["Umbra"] = CFrame.new(-463.074005, 4.55200052, -282.139984),
    ["Jotaro Kujo"] = CFrame.new(-695.018066, 4.46699858, -239.198227),
    ["Shop"] = CFrame.new(-698.950012, 4.49999571, -195.649994),
    ["Stand Store"] = CFrame.new(-543.313293, 5.84424591, -187.773712),
    ["Gyro"] = CFrame.new(-973.294373, 4.00684834, -998.46106),
    ["Shadow Figure"] = CFrame.new(-793.557922, 4.2014389, 331.849518),
    ["B0N"] = CFrame.new(-861.410156, 4.06187391, 335.547607),
    ["Goku"] = CFrame.new(-945.58551, -1.42252398, 843.719299),
    ["Gojo"] = CFrame.new(-702.141907, 4.0998311, 971.946594)
}

local npc = {}
for i,v in pairs(npcs) do
    table.insert(npc, i)
end

Teleport:Dropdown("NPC Select", npc, function(x)
    getgenv().npctp = x
end)

Teleport:Button("NPC Teleport", function()
    client.Character.HumanoidRootPart.CFrame = npcs[getgenv().npctp]
end)

local Credits = Window:Tab("Credits",true)
Credits:Label(" Nanocore V2")
Credits:Label(" Scripter | ! muz#6666, L Human")
Credits:Label(" Tester | Carter")

-- // Funcs // ETC \\ --
