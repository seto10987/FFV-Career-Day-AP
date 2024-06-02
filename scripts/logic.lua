function W2()
    return
    has ("Adamantite") or has ("world2")
end
function ExDeath()
    return
    has ("Bracelet") and has ("Anti_Barrier")
end
function W3()
    return
    has ("exdeathw2") or has ("world3")
end

function has(item, amount)
    local count = Tracker:ProviderCountForCode(item)
    amount = tonumber(amount)
    if not amount then
      return count > 0
    else
      return count == amount
    end
end

function piano_count_tule()
    if Tracker:FindObjectForCode("piano_tule").Active then
        Tracker:FindObjectForCode("piano_counter").AcquiredCount = Tracker:FindObjectForCode("piano_counter").AcquiredCount + 1
    end
end

function piano_count_carwen()
    if Tracker:FindObjectForCode("piano_tule").Active then
        Tracker:FindObjectForCode("piano_counter").AcquiredCount = Tracker:FindObjectForCode("piano_counter").AcquiredCount + 1
    end
end

function piano_count_karnak()
    if Tracker:FindObjectForCode("piano_tule").Active then
        Tracker:FindObjectForCode("piano_counter").AcquiredCount = Tracker:FindObjectForCode("piano_counter").AcquiredCount + 1
    end
end

function piano_count_jacole()
    if Tracker:FindObjectForCode("piano_tule").Active then
        Tracker:FindObjectForCode("piano_counter").AcquiredCount = Tracker:FindObjectForCode("piano_counter").AcquiredCount + 1
    end
end

function piano_count_crescent()
    if Tracker:FindObjectForCode("piano_tule").Active then
        Tracker:FindObjectForCode("piano_counter").AcquiredCount = Tracker:FindObjectForCode("piano_counter").AcquiredCount + 1
    end
end

function piano_count_mua()
    if Tracker:FindObjectForCode("piano_tule").Active then
        Tracker:FindObjectForCode("piano_counter").AcquiredCount = Tracker:FindObjectForCode("piano_counter").AcquiredCount + 1
    end
end

function piano_count_rugor()
    if Tracker:FindObjectForCode("piano_tule").Active then
        Tracker:FindObjectForCode("piano_counter").AcquiredCount = Tracker:FindObjectForCode("piano_counter").AcquiredCount + 1
    end
end

function piano_count_mirage()
    if Tracker:FindObjectForCode("piano_tule").Active then
        Tracker:FindObjectForCode("piano_counter").AcquiredCount = Tracker:FindObjectForCode("piano_counter").AcquiredCount + 1
    end
end

ScriptHost:AddWatchForCode("pianocounter_tule", "piano_tule", piano_count_tule)
ScriptHost:AddWatchForCode("pianocounter_carwen", "piano_carwen", piano_count_carwen)
ScriptHost:AddWatchForCode("pianocounter_karnak", "piano_karnak", piano_count_karnak)
ScriptHost:AddWatchForCode("pianocounter_jacole", "piano_jacole", piano_count_jacole)
ScriptHost:AddWatchForCode("pianocounter_crescent", "piano_crescent", piano_count_crescent)
ScriptHost:AddWatchForCode("pianocounter_mua", "piano_mua", piano_count_mua)
ScriptHost:AddWatchForCode("pianocounter_rugor", "piano_rugor", piano_count_rugor)
ScriptHost:AddWatchForCode("pianocounter_mirage", "piano_mirage", piano_count_mirage)