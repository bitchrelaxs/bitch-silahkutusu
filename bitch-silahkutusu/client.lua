ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(100)
	end
end)

RegisterNetEvent('bitchdev:silahkutusuac')
AddEventHandler('bitchdev:silahkutusuac', function()
    kutuac()
end)

function kutuac()
    ESX.TriggerServerCallback("bitch-checkitem", function(output)
        if output then
            TriggerEvent('mythic_progbar:client:progress', {
                name = 'kutu',
                duration = 5000,
                label = 'Silah Kutusu Açılıyor...',
                useWhileDead = false,
                canCancel = false,
                controlDisables = {
                    disableMovement = true,
                    disableCarMovement = false,
                    disableMouse = false,
                    disableCombat = true,
                },
                animation = {
                    animDict = "missheistdockssetup1clipboard@idle_a",
                    anim = "idle_a",
                },
            }, function(status)
                if not status then
                    TriggerServerEvent('bitchdev:silahkutusu')
                end
            end)
        elseif not output then 
            TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Üzerinde Yeterli Miktarda Silah Kutusu Yok'})
        end
    end, "silahkutusu")
end