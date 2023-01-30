local deliveryLocations = {
    {x = -1223.96, y = -906.97, z = 12.32, package = "package1"},
    {x = -1116.53, y = -2675.83, z = 13.95, package = "package2"},
    {x = 1173.57, y = 2703.19, z = 38.16, package = "package3"},
}
local deliveryReward = 1000
local oxyChance = 0.1 -- 10% chance to receive oxy
local oxyItem = "oxy"

-- Event to start a delivery job
RegisterNetEvent("startDeliveryJob")
AddEventHandler("startDeliveryJob", function()
    local player = source
    local playerPed = GetPlayerPed(player)
    local playerCoords = GetEntityCoords(playerPed)

    -- Check if the player is near a delivery location
    for i, location in ipairs(deliveryLocations) do
        local distance = #(playerCoords - vector3(location.x, location.y, location.z))
        if distance <= 10.0 then
            TriggerClientEvent("startDeliveryJob", player, location.package)
            break
        end
    end
end)

-- Event to complete a delivery job
RegisterNetEvent("completeDeliveryJob")
AddEventHandler("completeDeliveryJob", function(package)
    local player = source

    -- Give the player cash as a reward
    TriggerEvent("qb:addCash", player, deliveryReward)

    -- Give the player oxy as a reward (random chance)
    local chance = math.random()
    if chance <= oxyChance then
        exports["qb-inventory"]:addItem(player, oxyItem, 1)
    end
end)
