function prnt(text)
	if Config.Debug then
	print(text)
	end
end

local Keys = {
    ["ESC"] = 322,
    ["F1"] = 288,
    ["F2"] = 289,
    ["F3"] = 170,
    ["F5"] = 166,
    ["F6"] = 167,
    ["F7"] = 168,
    ["F8"] = 169,
    ["F9"] = 56,
    ["F10"] = 57,
    ["~"] = 243,
    ["1"] = 157,
    ["2"] = 158,
    ["3"] = 160,
    ["4"] = 164,
    ["5"] = 165,
    ["6"] = 159,
    ["7"] = 161,
    ["8"] = 162,
    ["9"] = 163,
    ["-"] = 84,
    ["="] = 83,
    ["BACKSPACE"] = 177,
    ["TAB"] = 37,
    ["Q"] = 44,
    ["W"] = 32,
    ["E"] = 38,
    ["R"] = 45,
    ["T"] = 245,
    ["Y"] = 246,
    ["U"] = 303,
    ["P"] = 199,
    ["["] = 39,
    ["]"] = 40,
    ["ENTER"] = 18,
    ["CAPS"] = 137,
    ["A"] = 34,
    ["S"] = 8,
    ["D"] = 9,
    ["F"] = 23,
    ["G"] = 47,
    ["H"] = 74,
    ["K"] = 311,
    ["L"] = 182,
    ["LEFTSHIFT"] = 21,
    ["Z"] = 20,
    ["X"] = 73,
    ["C"] = 26,
    ["V"] = 0,
    ["B"] = 29,
    ["N"] = 249,
    ["M"] = 244,
    [","] = 82,
    ["."] = 81,
    ["-"] = 84,
    ["LEFTCTRL"] = 36,
    ["LEFTALT"] = 19,
    ["SPACE"] = 22,
    ["RIGHTCTRL"] = 70,
    ["HOME"] = 213,
    ["PAGEUP"] = 10,
    ["PAGEDOWN"] = 11,
    ["DELETE"] = 178,
    ["LEFT"] = 174,
    ["RIGHT"] = 175,
    ["TOP"] = 27,
    ["DOWN"] = 173,
    ["NENTER"] = 201,
    ["N4"] = 108,
    ["N5"] = 60,
    ["N6"] = 107,
    ["N+"] = 96,
    ["N-"] = 97,
    ["N7"] = 117,
    ["N8"] = 61,
    ["N9"] = 118
}

ESX = nil
local bin = nil
local OpenMenu = false
Citizen.CreateThread( function()
        while ESX == nil do 
		TriggerEvent("esx:getSharedObject", function(obj) ESX = obj 
		end)
        Citizen.Wait(0)
    end
end)

local localobj
local BigDumps = Config.Dumps.BigDumps
local NormalDumps = Config.Dumps.NormalDumps
local SmallDumps = Config.Dumps.SmallDumps
local objects = Config.AllObject
	

function getmenear()
	local objectId
	for i = 1, #objects do 
		localobj = GetClosestObjectOfType(GetEntityCoords(GetPlayerPed(-1)), 5.0, GetHashKey(objects[i]), false)
		if DoesEntityExist(localobj) then -- Use localobj here instead of GetHashKey(objects[i])
			localobj = localobj
			return objects[i] -- Return the object name, not objectId[i]
		end
	end
end

function openmenuvehicle()
    local playerPed = PlayerPedId()
    local bin = nil
	 bin = getmenear()
    if not IsPedInAnyVehicle(playerPed, true) then
        bin = getmenear()
        if not DoesEntityExist(localobj) then
            bin = getmenear()
        end
    end
    if bin and DoesEntityExist(localobj) then
        local trunkpos = GetEntityCoords(localobj)
        local playerPed = PlayerPedId()
        local coords = GetEntityCoords(playerPed)
        local distanceToTrunk = GetDistanceBetweenCoords(coords, trunkpos, 1)

        if distanceToTrunk <= 3.0 then
			OpenMenu = true
			if Config.CustomLoading then
            TriggerEvent("hud:taskBar", 750, Config.Text[Config.Lang].OpenBin)
            Wait(750)
			end
            local dumpWeight = {max = 0, binType = nil}
            dumpWeight.binType = localobj

            for i = 1, #objects do
                if bin == BigDumps[i] and dumpWeight.binType == localobj then
                    dumpWeight.max = Config.Dumpweight.Big
                elseif bin == NormalDumps[i] and dumpWeight.binType == localobj then
                    dumpWeight.max = Config.Dumpweight.Normal
                elseif bin == SmallDumps[i] and dumpWeight.binType == localobj then
                    dumpWeight.max = Config.Dumpweight.Small
                end
            end
			if dumpWeight.max then
            OpenCoffreInventoryMenu(localobj, dumpWeight.max)
			end
        else
			OpenMenu = false
            exports.pNotify:SendNotification({text = Config.Text[Config.Lang].NoBinNear, type = "error", timeout = 5000})
        end
    else
		OpenMenu = false
        exports.pNotify:SendNotification({text = Config.Text[Config.Lang].NoBinNear, type = "error", timeout = 5000})
    end
end

Citizen.CreateThread(function()
    while true do
        Wait(1)
        if IsControlJustReleased(0, Keys["Y"]) then
            openmenuvehicle()
        end
    end
end)

function OpenCoffreInventoryMenu(plate, max)
    ESX.TriggerServerCallback( "esx_inventoryhud_trunk:getInventoryV", function(inventory)
            text = Config.Text[Config.Lang].BinText, plate, (inventory.weight), (max)
            data = {plate = plate, max = max, text = text}
			print(plate, max, text)
            TriggerEvent("esx_inventoryhud:openTrunkInventory", data, inventory.blackMoney, inventory.items, inventory.weapons)
    end,plate)
end

RegisterNetEvent("esx_inventoryhud:onClosedInventory")
AddEventHandler( "esx_inventoryhud:onClosedInventory", function(type)
        if type == "trunk" then
            closeTrunk()
        end
end)

function closeTrunk()
	OpenMenu = false
    bin = nil
end

if Config.CheckIfDistanceIsOk then
Citizen.CreateThread(function()
        while true do
            Citizen.Wait(100)
			if OpenMenu then
			bin = getmenear()
            if bin ~= nil and DoesEntityExist(localobj) then
                local playerPed = PlayerPedId()
                local coords = GetEntityCoords(playerPed)
                local dumpsterCoords = GetEntityCoords(localobj)
                local distance = GetDistanceBetweenCoords(coords, dumpsterCoords, 1)
                if distance > 4.0 then
                    TriggerEvent("esx_inventoryhud:closeInventory")
                end
            end
			end
        end
end)
end