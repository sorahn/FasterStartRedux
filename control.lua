require("lib")

local modName = "FasterStart"

function Init()
    global = {}
    global.PlayerList = {}
end

function CheckAllPlayers()
    for _, player in pairs(game.players) do
        if player and player.connected then
            GiveArmor(player)
        end
    end
end

function OnInit()
    Init()
    CheckAllPlayers()

    if remote.interfaces["freeplay"] then
        remote.call("freeplay", "set_disable_crashsite", settings.startup['disable-crashsite'].value)
        remote.call("freeplay", "set_skip_intro", settings.startup['skip-intro'].value)
    end
end

script.on_init(OnInit)

function OnConfigurationChanged(data)
    if IsModChanged(data, modName) then
        local oldVersion = GetOldVersion(data, modName)
        -- if oldVersion < "00.17.05" or data.mod_changes[modName].old_version == "0.17.201" then
        -- Init()
        -- CheckAllPlayers()
        -- end	
    end
end

-- script.on_configuration_changed(OnConfigurationChanged)

function OnPlayerSpawned(event)
    local player = game.get_player(event.player_index)
    GiveArmor(player)
end

function OnCutsceneEnd(event)
    CheckAllPlayers()
end

script.on_event({ defines.events.on_player_joined_game, defines.events.on_player_created }, OnPlayerSpawned)
script.on_event({ defines.events.on_cutscene_cancelled, defines.events.on_cutscene_finished}, OnCutsceneEnd)

function GiveArmor(player)
    if Contains(global.PlayerList, player) then
        return
    end
    if (player.controller_type ~= defines.controllers.character) then
        return
    end

    player.insert{ name = "fusion-construction-robot", count = 50 }
    player.insert{ name = "mini-power-armor", count = 1 }

    local armor_inventory = player.character.get_inventory(defines.inventory.character_armor)
    local player_inventory = player.character.get_inventory(defines.inventory.character_main)
    local contents = armor_inventory.get_contents()
        
    if contents["mini-power-armor"] == 1 then
        local armor = armor_inventory.find_item_stack("mini-power-armor")
        local a_grid = armor.grid

        a_grid.put({
            name = "exoskeleton-equipment"
        })
        a_grid.put({
            name = "personal-roboport-mk2-equipment"
        })
        a_grid.put({
            name = "personal-roboport-mk2-equipment"
        })
        a_grid.put({
            name = "mini-fusion-reactor-equipment"
        })
        a_grid.put({
            name = "night-vision-equipment"
        })
    end

    table.insert(global.PlayerList, player)
end
