require("lib")

function Init()
    global = {}
    global.FasterStartReduxPlayerList = {}
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

function OnPlayerSpawned(event)
    local player = game.get_player(event.player_index)
    GiveArmor(player)
end

function OnCutsceneEnd(event)
    CheckAllPlayers()
end

script.on_event({ defines.events.on_player_joined_game, defines.events.on_player_created }, OnPlayerSpawned)
script.on_event({ defines.events.on_cutscene_cancelled, defines.events.on_cutscene_finished }, OnCutsceneEnd)

function GiveArmor(player)
    if Contains(global.FasterStartReduxPlayerList, player) then return end

    player.insert { name = "fusion-construction-robot", count = 50 }
    player.insert { name = "mini-power-armor", count = 1 }

    local armor_inventory = player.character.get_inventory(defines.inventory.character_armor)
    if armor_inventory.get_item_count("mini-power-armor") == 0 then return end

    local armor = armor_inventory.find_item_stack("mini-power-armor")
    if not armor then return end

    local a_grid = armor.grid

    a_grid.put({ name = "exoskeleton-equipment" })
    a_grid.put({ name = "personal-roboport-mk2-equipment" })
    a_grid.put({ name = "personal-roboport-mk2-equipment" })
    a_grid.put({ name = "mini-fusion-reactor-equipment" })
    a_grid.put({ name = "night-vision-equipment" })

    table.insert(global.FasterStartReduxPlayerList, player)
end
