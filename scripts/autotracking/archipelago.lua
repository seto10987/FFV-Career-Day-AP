ScriptHost:LoadScript("scripts/autotracking/item_mapping.lua")
ScriptHost:LoadScript("scripts/autotracking/location_mapping.lua")
ScriptHost:LoadScript("scripts/autotracking/flag_mapping.lua")
ScriptHost:LoadScript("scripts/autotracking/tab_mapping.lua")

CUR_INDEX = -1
SLOT_DATA = nil
LOCAL_ITEMS = {}
GLOBAL_ITEMS = {}

PLAYER_ID = -1
TEAM_NUMBER = 0

EVENT_ID = ""
TAB_ID = ""

function onClear(slot_data)
    if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
        print(string.format("called onClear, slot_data:\n%s", dump_table(slot_data)))
    end
	PLAYER_NUMBER = Archipelago.PlayerNumber or -1
    SLOT_DATA = slot_data
    CUR_INDEX = -1
    -- reset locations
    for _, location_array in pairs(LOCATION_MAPPING) do
        for _, location in pairs(location_array) do
            if location then
                local obj = Tracker:FindObjectForCode(location)
                if obj then
                    if location:sub(1, 1) == "@" then
                        obj.AvailableChestCount = obj.ChestCount
                    else
                        obj.Active = false
                    end
                end
            end
        end
    end
    -- reset items
    for _, v in pairs(ITEM_MAPPING) do
        if v[1] and v[2] then
            if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
                -- print(string.format("onClear: clearing item %s of type %s", v[1], v[2]))
            end
            local obj = Tracker:FindObjectForCode(v[1])
            if obj then
                if v[2] == "toggle" then
                    obj.Active = false
                elseif v[2] == "progressive" then
                    obj.CurrentStage = 0
                    obj.Active = false
                elseif v[2] == "consumable" then
                    obj.AcquiredCount = 0
                elseif AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
                    print(string.format("onClear: unknown item type %s for code %s", v[2], v[1]))
                end
            elseif AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
                print(string.format("onClear: could not find object for code %s", v[1]))
            end
        end
    end
    -- reset piano counter
    if Tracker:FindObjectForCode("piano_counter").CurrentStage <= 0 then
        Tracker:FindObjectForCode("piano_counter").AcquiredCount = 0
    end

    print(dump_table(SLOT_DATA))
    if SLOT_DATA == nil then
        return
    end

	PLAYER_NUMBER = Archipelago.PlayerNumber or -1
	TEAM_NUMBER = Archipelago.TeamNumber or 0

    if slot_data["world_lock"] then
        Tracker:FindObjectForCode("worlds").CurrentStage = tonumber(slot_data["world_lock"])
    end
    if slot_data["progression_checks"] then
        Tracker:FindObjectForCode("chests").CurrentStage = tonumber(slot_data["progression_checks"])
    end

    local starting_crystals = slot_data["starting crystals"]
    
    for i, crystal in ipairs(starting_crystals) do
        if crystal == "Knight Crystal" then
            Tracker:FindObjectForCode("Knight_Crystal").Active = true
        elseif crystal == "Monk Crystal" then
            Tracker:FindObjectForCode("Monk_Crystal").Active = true
        elseif crystal == "Thief Crystal" then
            Tracker:FindObjectForCode("Thief_Crystal").Active = true
        elseif crystal == "Dragoon Crystal" then
            Tracker:FindObjectForCode("Dragoon_Crystal").Active = true
        elseif crystal == "Ninja Crystal" then
            Tracker:FindObjectForCode("Ninja_Crystal").Active = true
        elseif crystal == "Samurai Crystal" then
            Tracker:FindObjectForCode("Samurai_Crystal").Active = true
        elseif crystal == "Berserker Crystal" then
            Tracker:FindObjectForCode("Berserker_Crystal").Active = true
        elseif crystal == "Hunter Crystal" then
            Tracker:FindObjectForCode("Hunter_Crystal").Active = true
        elseif crystal == "MysticKnight Crystal" then
            Tracker:FindObjectForCode("MysticKnight_Crystal").Active = true
        elseif crystal == "WhiteMage Crystal" then
            Tracker:FindObjectForCode("WhiteMage_Crystal").Active = true
        elseif crystal == "BlackMage Crystal" then
            Tracker:FindObjectForCode("BlackMage_Crystal").Active = true
        elseif crystal == "TimeMage Crystal" then
            Tracker:FindObjectForCode("TimeMage_Crystal").Active = true
        elseif crystal == "Summoner Crystal" then
            Tracker:FindObjectForCode("Summoner_Crystal").Active = true
        elseif crystal == "BlueMage Crystal" then
            Tracker:FindObjectForCode("BlueMage_Crystal").Active = true
        elseif crystal == "RedMage Crystal" then
            Tracker:FindObjectForCode("RedMage_Crystal").Active = true
        elseif crystal == "Trainer Crystal" then
            Tracker:FindObjectForCode("Trainer_Crystal").Active = true
        elseif crystal == "Chemist Crystal" then
            Tracker:FindObjectForCode("Chemist_Crystal").Active = true
        elseif crystal == "Geomancer Crystal" then
            Tracker:FindObjectForCode("Geomancer_Crystal").Active = true
        elseif crystal == "Bard Crystal" then
            Tracker:FindObjectForCode("Bard_Crystal").Active = true
        elseif crystal == "Dancer Crystal" then
            Tracker:FindObjectForCode("Dancer_Crystal").Active = true
        elseif crystal == "Mimic Crystal" then
            Tracker:FindObjectForCode("Mimic_Crystal").Active = true
        elseif crystal == "Freelancer Crystal" then
            Tracker:FindObjectForCode("Freelancer_Crystal").Active = true
        end
    end

    local starting_abilities = slot_data["starting abilities"]

    for i, ability in ipairs(starting_abilities) do
        if ability == "Guard" then
            Tracker:FindObjectForCode("Cover_Ability").Active = true
        elseif ability == "Kick" then
            Tracker:FindObjectForCode("Kick_Ability").Active = true
        elseif ability == "Escape" then
            Tracker:FindObjectForCode("Escape_Ability").Active = true
        elseif ability == "Jump" then
            Tracker:FindObjectForCode("Jump_Ability").Active = true
        elseif ability == "Smoke" then
            Tracker:FindObjectForCode("Smoke_Ability").Active = true
        elseif ability == "SwdSlap" then
            Tracker:FindObjectForCode("SwdSlap_Ability").Active = true
        elseif ability == "Animals" then
            Tracker:FindObjectForCode("Animals_Ability").Active = true
        elseif ability == "MgcSwrd Lv. 1" then
            Tracker:FindObjectForCode("MgcSwrd_Lv.1_Ability").Active = true
        elseif ability == "White Lv. 1" then
            Tracker:FindObjectForCode("White_Lv.1_Ability").Active = true
        elseif ability == "Black Lv. 1" then
            Tracker:FindObjectForCode("Black_Lv.1_Ability").Active = true
        elseif ability == "Time Lv. 1" then
            Tracker:FindObjectForCode("Time_Lv.1_Ability").Active = true
        elseif ability == "Summon Lv. 1" then
            Tracker:FindObjectForCode("Summon_Lv.1_Ability").Active = true
        elseif ability == "Blue" then
            Tracker:FindObjectForCode("Blue_Ability").Active = true
        elseif ability == "Red Lv. 1" then
            Tracker:FindObjectForCode("Red_Lv.1_Ability").Active = true
        elseif ability == "Tame" then
            Tracker:FindObjectForCode("Tame_Ability").Active = true
        elseif ability == "Mix" then
            Tracker:FindObjectForCode("Mix_Ability").Active = true
        elseif ability == "Terrain" then
            Tracker:FindObjectForCode("Terrain_Ability").Active = true
        elseif ability == "Hide" then
            Tracker:FindObjectForCode("Hide_Ability").Active = true
        elseif ability == "Flirt" then
            Tracker:FindObjectForCode("Flirt_Ability").Active = true
        elseif ability == "Mimic" then
            Tracker:FindObjectForCode("Mimic_Ability").Active = true
        end
    end

	if PLAYER_NUMBER > -1 then
        updateEvents(0)
        EVENT_ID = "FFVCD_EVENTS_"..TEAM_NUMBER.."_".. PLAYER_NUMBER
        Archipelago:SetNotify({EVENT_ID})
        Archipelago:Get({EVENT_ID})
    end
    print(string.format("SET NOTIFY %s",EVENT_ID))

    if PLAYER_NUMBER > -1 then
        updateTabs(0)
        TAB_ID = "FFVCD_WORLD_"..TEAM_NUMBER.."_".. PLAYER_NUMBER
        Archipelago:SetNotify({TAB_ID})
        Archipelago:Get({TAB_ID})
    end
    print(string.format("SET NOTIFY %s",TAB_ID))

    Tracker:FindObjectForCode("tab_switch").Active = 1

end

-- called when an item gets collected
function onItem(index, item_id, item_name, player_number)
    if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
        print(string.format("called onItem: %s, %s, %s, %s, %s", index, item_id, item_name, player_number, CUR_INDEX))
    end
    if not AUTOTRACKER_ENABLE_ITEM_TRACKING then
        return
    end
    if index <= CUR_INDEX then
        return
    end
    local is_local = player_number == Archipelago.PlayerNumber
    CUR_INDEX = index;
    local v = ITEM_MAPPING[item_id]
    if not v then
        if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
            print(string.format("onItem: could not find item mapping for id %s", item_id))
        end
        return
    end
    if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
        print(string.format("onItem: code: %s, type %s", v[1], v[2]))
    end
    if not v[1] then
        return
    end
    local obj = Tracker:FindObjectForCode(v[1])
    if obj then
        if v[2] == "toggle" then
            obj.Active = true
        elseif v[2] == "progressive" then
            if obj.Active then
                obj.CurrentStage = obj.CurrentStage + 1
            else
                obj.Active = true
            end
        elseif v[2] == "consumable" then
            obj.AcquiredCount = obj.AcquiredCount + obj.Increment
        elseif AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
            print(string.format("onItem: unknown item type %s for code %s", v[2], v[1]))
        end
    elseif AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
        print(string.format("onItem: could not find object for code %s", v[1]))
    end
end

-- called when a location gets cleared
function onLocation(location_id, location_name)
    local location_array = LOCATION_MAPPING[location_id]
    if not location_array or not location_array[1] then
        print(string.format("onLocation: could not find location mapping for id %s", location_id))
        return
    end
    
    for _, location in pairs(location_array) do
        local obj = Tracker:FindObjectForCode(location)
        -- print(location, obj)
        if obj then

            if location:sub(1, 1) == "@" then
                obj.AvailableChestCount = obj.AvailableChestCount - 1
            else
                obj.Active = true
            end
        else
            print(string.format("onLocation: could not find object for code %s", location))
        end
    end
end

-- called when a locations is scouted
function onScout(location_id, location_name, item_id, item_name, item_player)
    if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
        print(string.format("called onScout: %s, %s, %s, %s, %s", location_id, location_name, item_id, item_name,
            item_player))
    end
end

-- called when a bounce message is received 
function onBounce(json)
    if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
        print(string.format("called onBounce: %s", dump_table(json)))
    end
end

function onNotify(key, value, old_value)
    if value ~= old_value then
        if key == EVENT_ID then
            updateEvents(value)
        end
        if key == TAB_ID then
            updateTabs(value)
        end
	end
end

function onNotifyLaunch(key, value)
	if key == EVENT_ID then
		updateEvents(value)
    end
    if key == TAB_ID then
        updateTabs(value)
    end
end

function updateEvents(value)
    if value ~= nil then
        print(string.format("updateEvents: Value - %s", value))
            for _, event in pairs(EVENT_FLAG_MAPPING) do
            local bitmask = 2 ^ event.bit
            for _, code in pairs(event.codes) do
                if code.setting == nil or has(code.setting) then
                    Tracker:FindObjectForCode(code.code).Active = value & bitmask ~= 0
                end
            end
        end
    end
end

  function updateTabs(value)
    if value ~= nil then
        print(string.format("updateTabs %x", value))
        local tabswitch = Tracker:FindObjectForCode("tab_switch")
        Tracker:FindObjectForCode("cur_level_id").CurrentStage = value
        if tabswitch.Active then
            local tab_mapping_value = TAB_MAPPING[value]
            if tab_mapping_value then
                if type(tab_mapping_value) == "table" then
                    for _, tab in ipairs(tab_mapping_value) do
                        print(string.format("Updating ID %x to Tab %s", value, tab))
                        Tracker:UiHint("ActivateTab", tab)
                    end
                end
            end
        end
    end
end

Archipelago:AddClearHandler("clear handler", onClear)
Archipelago:AddItemHandler("item handler", onItem)
Archipelago:AddLocationHandler("location handler", onLocation)
Archipelago:AddSetReplyHandler("notify handler", onNotify)
Archipelago:AddRetrievedHandler("notify launch handler", onNotifyLaunch)