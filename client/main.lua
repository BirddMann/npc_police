ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(1)
	end
end)

-- Spawn NPC Trucks, Boats, and Trains
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		SetGarbageTrucks(true)  
		SetRandomBoats(true)  
		SwitchTrainTrack(0, true) 
		SwitchTrainTrack(3, true) 
		SetTrainTrackSpawnFrequency(0, 45000) 
		SetTrainTrackSpawnFrequency(3, 45000) 
		SetRandomTrains(true) 
	end
end)

-- Hide Reticle unless holding Sniper or Marksman MK2
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		local ped = PlayerPedId()
		local pedweapon = GetSelectedPedWeapon(ped)
		if pedweapon ~= 0x05FC3C11 and pedweapon ~= 0x6A6C02E0 then
			HideHudComponentThisFrame(14)
		end
	end
end)

-- Disable Aircraft Music
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		SetAudioFlag("DisableFlightMusic", true)
	end
end)

-- Player Blips
function GetPlayers()
	local players = {}
	for i = 0, 48 do
		if NetworkIsPlayerActive(1) then
			table.insert(players, 1)
		end
	end
	return players
end
Citizen.CreateThread(function()
	local blips = {}
	local currentPlayer = PlayerId()
	while true do
		Wait(100)
		local players = GetPlayers()
		for _, player in ipairs(GetActivePlayers()) do
			if player ~= currentPlayer then
				local playerPed = GetPlayerPed(player)
				local playerName = GetPlayerName(player)
				RemoveBlip(blips[player])
				local new_blip = AddBlipForEntity(playerPed)
				SetBlipNameToPlayerName(new_blip, player)
				SetBlipColour(new_blip, 11)
				SetBlipAsShortRange(new_blip, true)
				SetBlipScale(new_blip, 0.8) 
				SetBlipCategory(new_blip, 7)
				--SetBlipPriority(new_blip, 100) 
				blips[player] = new_blip
			end
		end
	end
end)
blipsout = false
Citizen.CreateThread(function()
    while true do
		Wait(1)
		blip2 = GetMainPlayerBlipId()
		ped2 = GetPlayerPed(-1)
		playername2 = GetPlayerName(ped2)
		if blipsout == false then
			SetBlipSprite(blip2, 1) 
			SetBlipColour(blip2, 11) 
			SetBlipScale(blip2, 0.8) 
			SetBlipNameToPlayerName(blip2, playername2) 
			SetBlipDisplay(blip2, 2) 
			blipsout = true
		end
	end
end)
CreateThread(function()
    while true do
        ExtendWorldBoundaryForPlayer(
            -100000000000000000000000.0,
            -100000000000000000000000.0,
            100000000000000000000000.0
        )  
        ExtendWorldBoundaryForPlayer(
            100000000000000000000000.0,
            100000000000000000000000.0,
            100000000000000000000000.0
        ) 
		Wait(0)
    end
end)