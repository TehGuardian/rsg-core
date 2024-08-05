CreateThread(function()
    while true do
        local sleep = 0
        if LocalPlayer.state.isLoggedIn then
            sleep = (1000 * 60) * RSGCore.Config.UpdateInterval
            TriggerServerEvent('RSGCore:UpdatePlayer')
        end
        Wait(sleep)
    end
end)

CreateThread(function()
    while true do
        if LocalPlayer.state.isLoggedIn then
            if (RSGCore.PlayerData.metadata['hunger'] <= 0 or RSGCore.PlayerData.metadata['thirst'] <= 0) and not RSGCore.PlayerData.metadata['isdead'] then
                local currentHealth = GetEntityHealth(cache.ped)
                if currentHealth < 5 then
                    local decreaseThreshold = 1
                    SetEntityHealth(cache.ped, currentHealth - decreaseThreshold)
                else
                    local decreaseThreshold = math.random(5, 10)
                    SetEntityHealth(cache.ped, currentHealth - decreaseThreshold)
                end
            end
        end
        Wait(RSGCore.Config.StatusInterval)
    end
end)
