-- // Open Source -- \\
local gmt = getrawmetatable(game)
setreadonly(gmt, false)
local oldindex = gmt.__index
gmt.__index = newcclosure(function(self,v)
if v == 'WalkSpeed' then
    return 16
end
return oldindex(self,v)
end)

local client = game.Players.LocalPlayer

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/muzrblx/nanocore/main/NanoLoader/Settings/Library.lua",true))()

local Window = Library:Create("Nanocore V2","Ass Jojo Game")


local Main = Window:Tab("Item Notifier",true)
local Misc2 = Window:Tab("Misc",true)
local Misc = Window:Tab("Info",true)

Main:Label("Enter your discord webhook URL and just wait")
Main:Label("Toggle fruit sniper if you want to snipe the fruit first")
Main:Label("Server hop makes you switch servers / it may rejoin the same")
Main:Label("It pings when camera or pot diary spawns")

Misc:Label(" ! muz#6666 ")
Misc:Label("https://discord.gg/EGwQdWPG3y")

Main:Toggle(
    "Item Sniper (COLLECTS ALL ITEMS LOL)",
    function(t)
        getgenv().fruitsniper = t
        while getgenv().fruitsniper do
            wait()
            for i, v in pairs(game.Workspace:GetChildren()) do
                if v:IsA("Tool") then
                    game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
                end
            end
        end
    end
)


Main:Textbox("Item Notifier", "Enter Here", function(x)
    getgenv().webhookurl = x
end)



--\\ webhook info //
game.Workspace.ChildAdded:Connect(function(part)
    if part:IsA("Tool") and string.find(part.Name, "Pot Platinum Diary") then
        wait()
        msg = {
            ["content"] = "@everyone",
            ["embeds"] = {{
                    ["color"] = 000000,
                    ["description"] = part.Name .. "Has spawned!",
                    ["author"] = {
                        ["name"] = "RARE ITEM Nanocore V2 Notifier"
                    }
            }}
        }

        local response =
        syn.request({
            Url = getgenv().webhookurl,
            Method = "POST",
            Headers = {
                ["Content-Type"] = "application/json"

            },
            Body = game:GetService("HttpService"):JSONEncode(msg)
        })
    end
end)

--\\ webhook info //
game.Workspace.ChildAdded:Connect(function(part)
    if part:IsA("Tool") then
        wait()
        msg = {
            ["content"] = "Hello",
            ["embeds"] = {{
                    ["color"] = 000000,
                    ["description"] = part.Name .. "Has spawned!",
                    ["author"] = {
                        ["name"] = " Nanocore V2 Notifier"
                    }
            }}
        }

        local response =
        syn.request({
            Url = getgenv().webhookurl,
            Method = "POST",
            Headers = {
                ["Content-Type"] = "application/json"

            },
            Body = game:GetService("HttpService"):JSONEncode(msg)
        })
    end
end)


game.Workspace.ChildAdded:Connect(function(part)
    if part:IsA("Tool") and string.find(part.Name, "Camera") then
        wait()
        msg = {
            ["content"] = "@everyone",
            ["embeds"] = {{
                    ["color"] = 000000,
                    ["description"] = part.Name .. "Has spawned!",
                    ["author"] = {
                        ["name"] = "RARE ITEM Nanocore V2 Notifier"
                    }
            }}
        }

        local response =
        syn.request({
            Url = getgenv().webhookurl,
            Method = "POST",
            Headers = {
                ["Content-Type"] = "application/json"

            },
            Body = game:GetService("HttpService"):JSONEncode(msg)
        })
    end
end)


Main:Toggle("Anti Afk", function(t)
    getgenv().antiafk = t
end)

spawn(function()
    pcall(function()
        while wait() do
            if antiafk then
                repeat wait()
                    game:GetService("Players").LocalPlayer.Idled:connect(function()
                        vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
                        wait(1)
                        vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
                    end)
                until not antiafk
            end
        end
    end)
end)
    
    
Main:Button("Teleport To Farming Island", function()
    client.Character.HumanoidRootPart.CFrame = CFrame.new(-304.452637, 454.831818, -1496.2793, 0.469467044, 0, 0.882950008, 0, 1, 0, -0.882950008, 0, 0.469467044)
end)

local tele = {
    ["Bank"] = CFrame.new(1342.17285, 581.127197, -559.703247, 1, 0, 0, 0, 1, 0, 0, 0, 1),
    ["Farming Area"] = CFrame.new(-304.452637, 454.831818, -1496.2793, 0.469467044, 0, 0.882950008, 0, 1, 0, -0.882950008, 0, 0.469467044),
    ["Stand Storage"] = CFrame.new(1373.03894, 577.863708, -235.570786, 0.177171573, 0.00952419639, -0.984134018, -0.114301734, 0.993385553, -0.0109637622, 0.977520108, 0.114430688, 0.17708829),
    ["Tim"] = CFrame.new(1381.0293, 579.138, -228.963791, 0.158064902, 0.982015133, -0.103254795, -0.293705463, -0.0530786812, -0.954421043, -0.942736685, 0.181187063, 0.280033261),
    ["Arena"] = CFrame.new(1247.96289, 574.957214, -280.388306, 0, 0, 1, 0, 1, -0, -1, 0, 0)
}

local teleports = {}
for i,v in pairs(tele) do
    table.insert(teleports, i)
end

Misc2:Dropdown("Teleport Select", teleports, function(x)
    getgenv().selectedplace = x
end)

Misc2:Button("Teleport", function()
    client.Character.HumanoidRootPart.CFrame = tele[getgenv().selectedplace]
end)

Misc2:Slider("Walkspeed", 16, 60, function(t)
    client.Character.Humanoid.WalkSpeed = t
end)

Misc2:Toggle("Auto Equip Banknotes", function(t)
    getgenv().autobank = t
end)

spawn(function()
    while wait() do
        if autobank then
            for i, v in pairs(game.Players.LocalPlayer.Backpack:GetDescendants()) do
                if v:IsA("Tool") and string.find(v.Name, "Banknote") then
                    repeat wait()
                    game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
                    until not autobank
                end
            end
        end
    end
end)

game.Workspace.ChildAdded:Connect(function(part)
    if part:IsA("Tool") and string.find(part.Name, "Aja Mask") then
        wait()
        msg = {
            ["content"] = "@here",
            ["embeds"] = {{
                    ["color"] = 000000,
                    ["description"] = part.Name .. "Has spawned!",
                    ["author"] = {
                        ["name"] = "Medium Rare Nanocore V2 Notifier"
                    }
            }}
        }

        local response =
        syn.request({
            Url = getgenv().webhookurl,
            Method = "POST",
            Headers = {
                ["Content-Type"] = "application/json"

            },
            Body = game:GetService("HttpService"):JSONEncode(msg)
        })
    end
end)


Misc2:Toggle("Auto Use Arrow", function(y)
    getgenv().ans = y
end)

Misc2:Toggle("Auto Use Roka", function(y)
    getgenv().ansf = y
end)


spawn(function()
    while wait() do
        if ans then
            repeat wait()
                for i, v in pairs(game.Players.LocalPlayer.Backpack:GetDescendants()) do
                    if v:IsA("Tool") and string.find(v.Name, "Arrow") then
                        wait(5)
                        game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
                        wait()
                        game:GetService("ReplicatedStorage").ItemEvents.Arrow:FireServer()
                        wait(5)
                    end
                end
            until not ans
        end
    end
end)
        
spawn(function()
    while wait() do
        if ansf then
            repeat wait()
                for i, v in pairs(game.Players.LocalPlayer.Backpack:GetDescendants()) do
                    if v:IsA("Tool") and string.find(v.Name, "Rokakaka Fruit") then
                        game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
                        wait(10)
                        game:GetService("ReplicatedStorage").ItemEvents.Roka:FireServer()
                        wait(5)
                    end
                end
            until not ansf
        end
    end
end)
        
                    
            

        
