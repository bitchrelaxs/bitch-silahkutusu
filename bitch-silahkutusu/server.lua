ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
 
print('[^bitch-silahkutusu^0] - Baslatildi!')

ESX.RegisterUsableItem("silahkutusu", function(source)
    local xPlayer = ESX.GetPlayerFromId(source)

    TriggerClientEvent('bitchdev:silahkutusuac', source)
    TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Silah kutusu kullandın'})
end)

RegisterServerEvent("bitchdev:silahkutusu")
AddEventHandler("bitchdev:silahkutusu", function(itemname)
    local xPlayer = ESX.GetPlayerFromId(source)
    local yilbasi = xPlayer.getInventoryItem('silahkutusu').count

    if yilbasi > 0 then
        xPlayer.removeInventoryItem('silahkutusu', Config.Kutu)
        xPlayer.addInventoryItem(RandomItem(), Config.KacTaneCiksin)
    else
        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'Üzerinde silah kutusu yok!'})
    end
end)

Items = { -- Burdan çıkabilcek itemleri ayarlayabilirsiniz.
    'WEAPON_PISTOL',
    'WEAPON_HEAVYPISTOL',
    'WEAPON_APPISTOL',
    'WEAPON_SNSPISTOL',
    'WEAPON_VINTAGEPISTOL',
    'WEAPON_KNIFE',
    'WEAPON_PISTOL50',
    'WEAPON_COMBATPISTOL',
    'WEAPON_BAT',
    'WEAPON_COMPACTRIFLE',
    'WEAPON_SMG_MK2',
    'WEAPON_SNIPERRIFLE',
    'WEAPON_BAT',
    'water'
}

function RandomItem()
    return Items[math.random(#Items)]
end

ESX.RegisterServerCallback('bitch-checkitem', function(source, cb, item, output)
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer ~= nil then
		local items = xPlayer.getInventoryItem(item)
		if items == nil then
			cb(0)
		else
			cb(items.count)
		end
	end
end)