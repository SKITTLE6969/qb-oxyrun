-- Event to start a delivery job
RegisterNetEvent("startDeliveryJob")
AddEventHandler("startDeliveryJob", function(package)
    -- Display a message to the player
    exports.pNotify:SendNotification({
        text = "You have started a delivery job for " .. package,
        type = "success",
        timeout = 5000,
        layout = "centerLeft"
    })
end)
