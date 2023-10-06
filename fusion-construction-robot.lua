local fusion_robot = table.deepcopy(data.raw['construction-robot']['construction-robot'])
local graphics_path = "__FasterStartRedux__/graphics"

fusion_robot.energy_per_move = "0kJ"
fusion_robot.energy_per_tick = "0kJ"
fusion_robot.icon = graphics_path .. "/icons/fusion-construction-robot.png"
fusion_robot.idle.filename = graphics_path .. "/entity/fusion-construction-robot.png"
fusion_robot.idle.hr_version.filename = graphics_path .. "/entity/hr-fusion-construction-robot.png"
fusion_robot.in_motion.filename = graphics_path .. "/entity/fusion-construction-robot.png"
fusion_robot.in_motion.hr_version.filename = graphics_path .. "/entity/hr-fusion-construction-robot.png"
fusion_robot.max_speed = 0.3
fusion_robot.minable.result = "fusion-construction-robot"
fusion_robot.name = "fusion-construction-robot"
fusion_robot.shadow_idle.filename = graphics_path .. "/entity/fusion-construction-robot-shadow.png"
fusion_robot.shadow_idle.hr_version.filename = graphics_path .. "/entity/hr-fusion-construction-robot-shadow.png"
fusion_robot.shadow_in_motion.filename = graphics_path .. "/entity/fusion-construction-robot-shadow.png"
fusion_robot.shadow_in_motion.hr_version.filename = graphics_path .. "/entity/hr-fusion-construction-robot-shadow.png"
fusion_robot.speed = 0.2
fusion_robot.working.filename = graphics_path .. "/entity/fusion-construction-robot-working.png"
fusion_robot.working.hr_version.filename = graphics_path .. "/entity/hr-fusion-construction-robot-working.png"

data:extend({ fusion_robot })
