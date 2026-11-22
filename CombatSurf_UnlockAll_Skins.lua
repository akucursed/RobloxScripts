--[[
    Skinchanger made by aku_cursed on discord also it have auto skin equip and its saves to config so you dont needa to reequip on evenry inject
    skids, enjoy!
    Also it bypasses afk check so you can change ur skins in any time you want
]]--
local plr = game:GetService("Players").LocalPlayer
local rps = game:GetService("ReplicatedStorage")
local https = game:GetService("HttpService")
local rs = game:GetService("RunService")

local localplrinvent = require(rps:WaitForChild("ClientInventory"))
local Skinchiki = require(rps:WaitForChild("BaseItems"))
local itemmodul = require(rps:WaitForChild("Item")).Item
local gameInfo = require(rps:WaitForChild("GameInfo"))
local Cevents = rps:WaitForChild("Client-Events")
local add = Cevents:WaitForChild("AddButton")
local aku = getconnections(add.OnClientEvent)

local bruh = nil
local nigger = {Primary = nil, Secondary = nil, Knife = nil}
local configName = "aku_skinchanger.json"
local origTradeID = gameInfo.TradingServerID

local function fuckall(itemName, baseName, subType)
    local serial = itemName
    if bruh and bruh[serial] then return end
    
    local customItem = itemmodul.new(
        itemName:gsub("_", " "), baseName, subType, math.random(1, 1000), nil, nil, false, 0, serial
    )
    localplrinvent.AddItem(customItem)
    for _, connection in ipairs(aku) do
        connection.Function(customItem, true)
    end
end

local function spoofSet(slot, serial)
    pcall(function()
        setreadonly(gameInfo, false)
        gameInfo.TradingServerID = game.PlaceId
        setreadonly(gameInfo, true)
    end)
    
    plr:SetAttribute(slot, serial)
    
    task.delay(0.5, function()
        pcall(function()
            setreadonly(gameInfo, false)
            gameInfo.TradingServerID = origTradeID
            setreadonly(gameInfo, true)
        end)
    end)
end

task.spawn(function()
    print("waiting for data")
    repeat
        bruh = localplrinvent.getInv()
        if not bruh then task.wait(0.5) end
    until bruh
    print("got inv", #bruh)

    for id, data in pairs(bruh) do
        if type(data) == "table" and data.Base and not Skinchiki.SubItem[id] and not Skinchiki.BaseItems[id] then
            local bData = Skinchiki.BaseItems[data.Base]
            if bData and bData.Slot then
                if bData.Slot == "Primary" and not nigger.Primary then nigger.Primary = data end
                if bData.Slot == "Secondary" and not nigger.Secondary then nigger.Secondary = data end
                if bData.Slot == "Knife" and not nigger.Knife then nigger.Knife = data end
            end
        end
    end

    local pId, sId, kId = plr:GetAttribute("Primary"), plr:GetAttribute("Secondary"), plr:GetAttribute("Knife")
    if pId and bruh[pId] and not Skinchiki.SubItem[pId] and not Skinchiki.BaseItems[pId] then nigger.Primary = bruh[pId] end
    if sId and bruh[sId] and not Skinchiki.SubItem[sId] and not Skinchiki.BaseItems[sId] then nigger.Secondary = bruh[sId] end
    if kId and bruh[kId] and not Skinchiki.SubItem[kId] and not Skinchiki.BaseItems[kId] then nigger.Knife = bruh[kId] end

    if isfile and isfile(configName) then
        print("cfg found")
        local success, decoded = pcall(function() return https:JSONDecode(readfile(configName)) end)
        if success and type(decoded) == "table" then
            for slot, serial in pairs(decoded) do
                if serial and serial ~= "" then
                    if Skinchiki.SubItem[serial] then
                        fuckall(serial, Skinchiki.SubItem[serial].Base or serial, serial)
                    elseif Skinchiki.BaseItems[serial] then
                        fuckall(serial, serial, nil)
                    end
                    if bruh[serial] then spoofSet(slot, serial) end
                end
            end
            print("cfg ok")
        end
    end

    local queue = {}
    for name, data in pairs(Skinchiki.SubItem) do table.insert(queue, {name, data.Base or name, name}) end
    for name, data in pairs(Skinchiki.BaseItems) do table.insert(queue, {name, name, nil}) end

    local total, current = #queue, 0
    print("queue size", total)

    local loop
    loop = rs.Heartbeat:Connect(function()
        for i = 1, 10 do
            if current >= total then
                loop:Disconnect()
                print("done")
                return
            end
            current = current + 1
            local d = queue[current]
            fuckall(d[1], d[2], d[3])
        end
    end)
end)

local function saveConfig()
    local curr = {
        Primary = plr:GetAttribute("Primary") or "",
        Secondary = plr:GetAttribute("Secondary") or "",
        Knife = plr:GetAttribute("Knife") or ""
    }
    if writefile then writefile(configName, https:JSONEncode(curr)) end
end

plr:GetAttributeChangedSignal("Primary"):Connect(saveConfig)
plr:GetAttributeChangedSignal("Secondary"):Connect(saveConfig)
plr:GetAttributeChangedSignal("Knife"):Connect(saveConfig)

local old
old = hookmetamethod(game, "__namecall", function(self, ...)
    local m = getnamecallmethod()
    
    if m == "InvokeServer" and self.Name == "SwitchWpns" then
        local a1 = ...
        if type(a1) == "table" and a1.Base then
            local bData = Skinchiki.BaseItems[a1.Base]
            if bData and bData.Slot and nigger[bData.Slot] then
                return old(self, nigger[bData.Slot])
            end
        end
        return old(self, ...)
    end

    if m == "FireServer" and self.Name == "Shoot" then
        local a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13 = ...
        if type(a7) == "table" and a7.Base then
            local bData = Skinchiki.BaseItems[a7.Base]
            if bData and bData.Slot and nigger[bData.Slot] then
                return old(self, a1, a2, a3, a4, a5, a6, nigger[bData.Slot], a8, a9, a10, a11, a12, a13)
            end
        end
        return old(self, ...)
    end

    if m == "InvokeServer" and self.Name == "ChangeLoadout" then
        local a1, a2 = ...
        if type(a2) == "table" and a2.Serial and (Skinchiki.SubItem[a2.Serial] or Skinchiki.BaseItems[a2.Serial]) then
            spoofSet(a1, a2.Serial)
            return true
        end
    end
    
    return old(self, ...)
end)
