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

        local items = remote.call("freeplay", "get_created_items")
        items["fusion-construction-robot"] = 50
        items["mini-power-armor"] = 1
        items["mini-fusion-reactor-equipment"] = 1
        items["night-vision-equipment"] = 1
        items["exoskeleton-equipment"] = 1
        items["personal-roboport-mk2-equipment"] = 2
        remote.call("freeplay", "set_created_items", items)
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

function OnNthTick(event)
    local deregister = true

    for _, player in pairs(game.players) do
        if not Contains(global.PlayerList, player) then
            GiveArmor(player)
            deregister = false
        end
    end

    if deregister then
        script.on_nth_tick(69, nil)
    end
end

function OnPlayerSpawned(event)
    local player = game.get_player(event.player_index)
    GiveArmor(player)
end

script.on_event({ defines.events.on_player_joined_game, defines.events.on_player_created }, OnPlayerSpawned)
script.on_nth_tick(69, OnNthTick)

function GiveArmor(player)
    if Contains(global.PlayerList, player) then
        return
    end
    if (player.controller_type ~= defines.controllers.character) then
        return
    end

    local armor_inventory = player.character.get_inventory(defines.inventory.character_armor)
    local contents = armor_inventory.get_contents()

    if contents["mini-power-armor"] == 1 then
        local armor = armor_inventory.find_item_stack("mini-power-armor")
        local a_grid = armor.grid

        for _, category in ipairs(a_grid.prototype.equipment_categories) do
            print(category)
        end

        a_grid.put({
            name = "mini-fusion-reactor-equipment"
        })
        a_grid.put({
            name = "night-vision-equipment"
        })
        a_grid.put({
            name = "exoskeleton-equipment"
        })
        a_grid.put({
            name = "personal-roboport-mk2-equipment"
        })
        a_grid.put({
            name = "personal-roboport-mk2-equipment"
        })
    end

    table.insert(global.PlayerList, player)
end
