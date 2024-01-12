
ENABLE_DEBUG_LOG = true
local variant = Tracker.ActiveVariantUID

ScriptHost:LoadScript("scripts/utils.lua")
ScriptHost:LoadScript("scripts/logic/logic.lua")
ScriptHost:LoadScript("scripts/logic.lua")

if PopVersion and PopVersion >= "0.18.0" then
    ScriptHost:LoadScript("scripts/autotracking.lua")
end

Tracker:AddItems("items/items.json")
Tracker:AddItems("items/bosses.json")
Tracker:AddItems("items/jobs.json")


Tracker:AddMaps("maps/maps.json")

Tracker:AddLocations("locations/locations.json")
Tracker:AddLocations("locations/settings.json")

Tracker:AddLayouts("layouts/item_grids.json")
Tracker:AddLayouts("layouts/settings.json")
Tracker:AddLayouts("layouts/tracker_layouts.json")
Tracker:AddLayouts("layouts/broadcast.json")


