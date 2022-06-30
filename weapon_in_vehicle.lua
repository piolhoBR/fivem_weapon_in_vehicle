-----------------------------------------------------------------------------------------------------------------------------------------
-- GUN HANDLING IN THE CAR - MANUSEIO DE ARMA NO CARRO
-----------------------------------------------------------------------------------------------------------------------------------------

Citizen.CreateThread(function()
	while true do
		local stepNumber = 500
		local ped = PlayerPedId()
		if IsPedInAnyVehicle(ped) then
			stepNumber = 4
			local veh = GetVehiclePedIsUsing(ped)
			local vehspeed = GetEntitySpeed(veh) * 3.6 -- Configured for Km/h - Configurado para Km/h
			if math.ceil(vehspeed) >= 5 --[[and not IsEntityInAir(veh)]] then -- You can choose that this script doesn't work if player is flying in a vehicles, just takinoff comment in (--[[and not IsEntityInAir(veh)]]) - Você pode retirar o comentário de (--[[and not IsEntityInAir(veh)]]) para que este script não funcione se o player estiver em um veículo que esteja voando
				if GetPedInVehicleSeat(veh,-1) == ped then
					DisablePlayerFiring(ped, true)
				else
					local shot = IsPedShooting(ped)
					if shot == 1 then
						ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.06) -- You can change the value for change the effect - Pode alterar o valor para mudar o efeito -- 
					end
				end
			end
		end
	Citizen.Wait(stepNumber)
	end
end)