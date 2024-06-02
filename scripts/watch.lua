HOSTED_ITEMS =
{
  "byblos",
  "wingraptor",
  "karlibos",
  "siren",
  "magisa",
  "galura",
  "liquidflame",
  "ironclaw",
  "sandworm",
  "adamant",
  "solcannon",
  "archaeavis",
  "chimbrain",
  "puroboros",
  "titan",
  "ifrit",
  "shiva",
  "crayclaw",
  "gilga1",
  "gilga2",
  "tyrasaurus",
  "abductor",
  "hiryuuplant",
  "gilgaenki",
  "atomos",
  "guardian",
  "carbunkle",
  "gilga4",
  "antlion",
  "merugene",
  "odin",
  "triton",
  "omniscient",
  "minotaurus",
  "leviathan",
  "stalker",
  "gogo",
  "bahamut",
  "exdeath",
  "exdeathw2",
  "piano_tule",
  "piano_carwen",
  "piano_karnak",
  "piano_jacole",
  "piano_crescent",
  "piano_mua",
  "piano_rugor",
  "piano_mirage"
}

function initialize_watch_items()
  for _, code in pairs(HOSTED_ITEMS) do
    ScriptHost:AddWatchForCode(code, code, toggle_item)
    ScriptHost:AddWatchForCode(code.."_hosted", code.."_hosted", toggle_hosted_item)
  end
end