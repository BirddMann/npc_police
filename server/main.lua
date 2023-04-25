ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

--Citizen.CreateThread(function()
--	while true do
--		Citizen.Wait(1)
--		SetGarbageTrucks(true)  
--		SetRandomBoats(true)  
--		StopAnyPedModelBeingSuppressed()
--		SetScenarioTypeEnabled(WORLD_VEHICLE_POLICE_CAR, true)  
--		SetScenarioTypeEnabled(WORLD_VEHICLE_POLICE_BIKE, true)  
--		SetScenarioTypeEnabled(WORLD_VEHICLE_POLICE_NEXT_TO_CAR, true)  
--		SetCreateRandomCops(true)  
--		SetCreateRandomCopsNotOnScenarios(true)
--		SetCreateRandomCopsOnScenarios(true) 		
--		SetVehicleModelIsSuppressed(GetHashKey("police"), false)  
--		SetVehicleModelIsSuppressed(GetHashKey("police2"), false)  
--		SetVehicleModelIsSuppressed(GetHashKey("police3"), false)  
--		SetVehicleModelIsSuppressed(GetHashKey("police4"), false)  
--		SetVehicleModelIsSuppressed(GetHashKey("policeb"), false)  
--		SetVehicleModelIsSuppressed(GetHashKey("sheriff"), false) 
--	end
--end)