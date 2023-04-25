ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(1)
	end
end)

--NPC Police Spawns
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		StopAnyPedModelBeingSuppressed()
		SetScenarioTypeEnabled(WORLD_VEHICLE_POLICE_CAR, true)  
		SetScenarioTypeEnabled(WORLD_VEHICLE_POLICE_BIKE, true)  
		SetScenarioTypeEnabled(WORLD_VEHICLE_POLICE_NEXT_TO_CAR, true)  
		SetCreateRandomCops(true)  
		SetCreateRandomCopsNotOnScenarios(true)
		SetCreateRandomCopsOnScenarios(true) 	
		SetVehicleModelIsSuppressed(GetHashKey("police"), false)  
		SetVehicleModelIsSuppressed(GetHashKey("police2"), false)  
		SetVehicleModelIsSuppressed(GetHashKey("police3"), false)  
		SetVehicleModelIsSuppressed(GetHashKey("police4"), false)  
		SetVehicleModelIsSuppressed(GetHashKey("policeb"), false)  
		SetVehicleModelIsSuppressed(GetHashKey("policet"), false)  
		SetVehicleModelIsSuppressed(GetHashKey("pranger"), false)  
		SetVehicleModelIsSuppressed(GetHashKey("sheriff"), false)	
		SetVehicleModelIsSuppressed(GetHashKey("sheriff2"), false)	
		EnableDispatchService(2, false)	
		if IsPedInAnyVehicle(PlayerPedId(), false) then
			SetDispatchIdealSpawnDistance(500.0) --Ensure no pop-ins while driving fast
		else
			SetDispatchIdealSpawnDistance(250.0)
		end
	end
end)
