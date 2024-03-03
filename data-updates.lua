-- Mod compatability\
if mods["Krastorio2"] then
    table.insert(data.raw["equipment-grid"]["mini-equipment-grid"].equipment_categories, "universal-equipment")
    table.insert(data.raw["equipment-grid"]["mini-equipment-grid"].equipment_categories, "robot-interaction-equipment")
end

if mods["Krastorio2"] and mods["space-exploration"] then
    table.insert(data.raw["equipment-grid"]["mini-equipment-grid"].equipment_categories, "movement-improving")
end