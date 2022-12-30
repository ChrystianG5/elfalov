


wait(29)
if (game.PlaceId ~= 5151400895) then
    repeat
        wait()
    until game.Players.LocalPlayer.CharacterAdded and
        game.ReplicatedStorage.Datas:WaitForChild(game.Players.LocalPlayer.UserId)

    wait(5)

    game.ReplicatedStorage.Package.Events.Start:InvokeServer()
    game.ReplicatedStorage.Package.Events.Start:InvokeServer()
    game.ReplicatedStorage.Package.Events.Start:InvokeServer()

    game.Players.LocalPlayer.Character.Humanoid.Health = 100
end

wait()
_G.rebirthed = false;
local HttpService = game:GetService("HttpService")
local player = game:GetService("Players").LocalPlayer
repeat
    wait()
until player.CharacterAdded
local userId = player.UserId

local character = player.Character
local stats = character:WaitForChild("Stats")
local playerHumanoid = character:WaitForChild("Humanoid")
local hasQuest = player.PlayerGui.Main.MainFrame.Frames.Quest.Nop.Visible

local RunService = game:GetService('RunService')
local questRemote = game:GetService("ReplicatedStorage").Package.Events.Qaction
local punchRemote = game:GetService("ReplicatedStorage").Package.Events.p
local equipRemote = game:GetService("ReplicatedStorage").Package.Events.equipskill
local rebirthRemote = game:GetService("ReplicatedStorage").Package.Events.reb
local npcPosition = CFrame.new(0, 0, 2)

local Forms = {'Ultra Ego', 'SSJB4', 'True God of Creation', 'True God of Destruction', 'Super Broly', 'LSSJG', 'LSSJ4',
               'SSJG4', 'LSSJ3', 'SSJ5', 'Mystic Kaioken', 'LSSJ Kaioken', 'SSJ2 Kaioken', 'SSJR3', 'SSJB3',
               'God Of Destruction', 'God Of Creation', 'Jiren Ultra Instinct', 'Mastered Ultra Instinct', 'Godly SSJ2',
               'Ultra Instinct Omen', 'Evil SSJ', 'Blue Evolution', 'Dark Rose', 'Kefla SSJ2', 'SSJ Berserker',
               'True Rose', 'SSJB Kaioken', 'SSJ Rose', 'SSJ Blue', 'Corrupt SSJ', 'SSJ Rage', 'SSJG', 'SSJ4', 'Mystic',
               'LSSJ', 'SSJ3', 'Spirit SSJ', 'SSJ2 Majin', 'SSJ2', 'SSJ Kaioken', 'SSJ', 'FSSJ', 'Kaioken'}

local function returnQuest(boolean)

    local quest = getrenv()._G.x.GetRecommendedQuest(game.Players.LocalPlayer)
    if (game.ReplicatedStorage.Datas[userId]) then
        if (quest == "Vis (Vills Planet)") then
            if (game.ReplicatedStorage.Datas[userId].Zeni.Value < 15000) then
                print("Che wachin, no te alcanzan los zeni, pa. Farmea mas aca.")
                return ("SSJG Kakata")
            else
                print("Vamos pa' Bills papu.")
                local args = {
                    [1] = "Vills Planet"
                }
                
                game:GetService("ReplicatedStorage").Package.Events.TP:InvokeServer(unpack(args))
                
                return "SSJG Kakata"
            end
        end
        if (quest == 'Kito') then
            print("Vamos pa'casa papu.")
            local args = {
                [1] = "Earth"
            }
            
            game:GetService("ReplicatedStorage").Package.Events.TP:InvokeServer(unpack(args))
            return 'X Fighter Trainer'
        end
    end
    if game.Players.LocalPlayer.PlayerGui.Main.MainFrame.Frames.Quest.Nop.Visible == true then

        local quest = getrenv()._G.x.GetRecommendedQuest(game.Players.LocalPlayer)
        _G.quest = quest
        if (boolean) and quest:find('Bills Planet') then
            _G.quest = "SSJG Kakata"
            return 'SSJG Kakata'
        else
            _G.quest = quest
            return quest

        end
    end
    local noFilteredTextA = game.Players.LocalPlayer.PlayerGui.Main.MainFrame.Frames.Quest.Yas.Description.text
    local tstring1 = string.split(noFilteredTextA, "Defeat")
    local length1 = table.getn(tstring1)
    local tstring2 = string.split(tstring1[length1], "!")

    local npc = tstring2[1]:sub(2)

    if (npc == "3 Kaio Students") then
        npc = "Kaio Student"
    elseif (npc == "the Kai-fist Master") then
        npc = npc:sub(5, 19)
        print(npc)
    elseif (npc == "ntertain the greatest fusion") then
        npc = "SSJG Kakata"
    elseif (npc == "Vegetable in his destroyer form") then
        npc = "Vegetable (GoD in-training)"
    elseif (npc == "3 X Fighters") then
        npc = "X Fighter"
    elseif (npc == "5 Evil Sayas") then
        npc = "Citizen"
    elseif (npc == "the destroyer: Vills (50%)") then
        npc = "Vills (50%)"
    elseif (npc == "the Vis at 20%") then
        npc = "Vis (20%)"
    elseif (npc == "X Fighter Master") then
        npc = "Top X Fighter"
    elseif (npc == "3 Turtle Students") then
        npc = "Turtle Student"

    end

    return npc
end

local function transform()
    pcall(function()
        for i, v in pairs(Forms) do
            if equipRemote:InvokeServer(v) then
                break
            end
        end
        repeat
            wait()
            if player.Status.SelectedTransformation.Value ~= player.Status.Transformation.Value then
                game:GetService("ReplicatedStorage").Package.Events.ta:InvokeServer()
            end
        until game.Players.LocalPlayer.Status.SelectedTransformation.Value ==
            game.Players.LocalPlayer.Status.Transformation.Value
    end)
end

local RunService = game:GetService("RunService")
RunService.RenderStepped:Connect(function()
    playerHumanoid.Health = math.huge
end)

while true and wait() do
    if (stats.Strength.Value > 5000 and stats.Defense.Value > 5000 and stats.Energy.Value > 5000 and stats.Speed.Value >
        5000) then
        transform()

    end
    coroutine.resume(coroutine.create(function()
        game.ReplicatedStorage.Package.Events.cha:InvokeServer("Blacknwhite27")
        wait()
        game.ReplicatedStorage.Package.Events.cha:InvokeServer("Blacknwhite27")
        wait()
        game.ReplicatedStorage.Package.Events.cha:InvokeServer("Blacknwhite27")
        wait()
        game:GetService("ReplicatedStorage").Package.Events.reb:InvokeServer()

    end))
    if (not player.PlayerGui.Main.MainFrame.Frames.Quest.Nop.Visible) then
        transform()
        for i, v in next, workspace.Living:GetChildren() do
            if (v.Name == returnQuest(true) or v.Name ==
                game:GetService("ReplicatedStorage").Package.Quests[returnQuest(true)].Objective.Value) and
                not player.PlayerGui.Main.MainFrame.Frames.Quest.Nop.Visible and v:FindFirstChild('Humanoid') and
                v:FindFirstChild('HumanoidRootPart') and v.Humanoid.Health > 0 then
                repeat
                    coroutine.resume(coroutine.create(function()
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.HumanoidRootPart.CFrame *
                                                                                         npcPosition
                    end))

                    coroutine.resume(coroutine.create(function()
                        if (game.ReplicatedStorage.Datas[userId].Strength.Value > 1000000) then
                            game.ReplicatedStorage.Package.Events.mel:InvokeServer("Mach Kick", "Blacknwhite27")
                            game.ReplicatedStorage.Package.Events.mel:InvokeServer("Meteor Crash", "Blacknwhite27")
                            game.ReplicatedStorage.Package.Events.mel:InvokeServer("God Slicer", "Blacknwhite27")
                            game.ReplicatedStorage.Package.Events.mel:InvokeServer("Meteor Strike", "Blacknwhite27")
                            game.ReplicatedStorage.Package.Events.mel:InvokeServer("Wolf Fang Fist", "Blacknwhite27")
                            game.ReplicatedStorage.Package.Events.mel:InvokeServer("Spirit Breaking Cannon", "Blacknwhite27")
                            game.ReplicatedStorage.Package.Events.mel:InvokeServer("Meteor Punch ", "Blacknwhite27")
                            game.ReplicatedStorage.Package.Events.mel:InvokeServer("Super Dragon Fist ", "Blacknwhite27")
                            game.ReplicatedStorage.Packasge.Events.mel:InvokeServer("Flash Kick ", "Blacknwhite27")
                            game.ReplicatedStorage.Package.Events.mel:InvokeServer("Mach Kick", "Blacknwhite27")
                                local A_1 = "High Power Rush"
                                local A_2 = "\66\108\97\99\107\110\119\104\105\116\101\50\55"
                                local Event = game:GetService("ReplicatedStorage").Package.Events.mel
                                Event:InvokeServer(A_1, A_2)
                            wait()
                        end
                    end))

                    game.ReplicatedStorage.Package.Events.cha:InvokeServer("Blacknwhite27")
                     coroutine.resume(coroutine.create(function()
                         local args = {
                            [1] = "Destruction Orb",
                            [2] = true,
                             [4] = {
                                ["MouseHit"] = v.HumanoidRootPart.CFrame,
                                 ["FaceMouse"] = true
                             }
                         }

                         game:GetService("ReplicatedStorage").Package.Events.BigBall:InvokeServer(unpack(args))

                        local args = {
                            [1] = "Destruction Orb",
                          [2] = false,
                             [3] = true,
                        [4] = {
                                ["MouseHit"] = v.HumanoidRootPart.CFrame
                             }
                         }

                        game:GetService("ReplicatedStorage").Package.Events.BigBall:InvokeServer(unpack(args))

                         -- Script generated by SimpleSpy - credits to exx#9394

                         local args = {
                            [1] = "Destruction Orb",
                             [2] = v.HumanoidRootPart.CFrame
                        }

                        game:GetService("ReplicatedStorage").Package.Events.bigboom:InvokeServer(unpack(args))
                       wait(8)
                    end))

                    coroutine.resume(coroutine.create(function()

                        local args = {
                            [1] = "Energy Volley",
                            [2] = {
                                ["MouseHit"] = v.HumanoidRootPart.CFrame,
                                ["FaceMouse"] = true
                            },
                            [3] = "Blacknwhite27"
                        }
                        game:GetService("ReplicatedStorage").Package.Events.voleys:InvokeServer(unpack(args))

                        wait()
                    end))


                    coroutine.resume(coroutine.create(function()

                     
                    local args = {
                     [1] = "Destruction",
                     [2] = {
                     ["MouseHit"] = CFrame.new(769.5426025390625, 381.1517639160156, 5188.787109375) * CFrame.Angles(-0.5092707276344299, -0.14579109847545624, -0.08094464242458344),
                     ["FaceMouse"] = false
                 },
                    [3] = "Blacknwhite27"
        }

game:GetService("ReplicatedStorage").Package.Events.Hak:InvokeServer(unpack(args))

                    end))

                    coroutine.resume(coroutine.create(function()
                        if (game.ReplicatedStorage.Datas[userId].Strength.Value > 1000000) then
                            local args = {
                                [1] = "Energy Volley",
                                [2] = {
                                    ["MouseHit"] = v.HumanoidRootPart.CFrame,
                                    ["FaceMouse"] = true
                                },
                                [3] = "Blacknwhite27"
                            }
                            game:GetService("ReplicatedStorage").Package.Events.voleys:InvokeServer(unpack(args))
                        end
                        wait()
                    end))

                    punchRemote:FireServer("Blacknwhite27", 1)

                    punchRemote:FireServer("Blacknwhite27", 2)

                    punchRemote:FireServer("Blacknwhite27", 3)

                    punchRemote:FireServer("Blacknwhite27", 4)
                    wait()
                until not v or not v:FindFirstChild('Humanoid') or not v:FindFirstChild('HumanoidRootPart') or
                    v.Humanoid.Health <= 0 or player.PlayerGui:WaitForChild('Main').MainFrame.Frames.Quest.Nop.Visible
            end
        end
    else
        pcall(function()
            questRemote:InvokeServer(workspace.Others.NPCs[returnQuest(true)])
        end)
    end
end


