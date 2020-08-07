-- Copyright (c) 2020 Kirazy
-- Part of Artisanal Reskins: Angel's Mods
--     
-- See LICENSE.md in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not mods["angelssmelting"] then return end
-- if reskins.lib.setting("reskins-bobs-do-angelssmelting") == false then return end

-- Set input parameters
local inputs = {
    type = "assembling-machine",
    icon_name = "strand-casting-machine",
    base_entity = "oil-refinery",
    directory = reskins.angels.directory,
    mod = "angels",
    particles = {["big-tint"] = 5, ["medium"] = 2},
    group = "smelting",
    icon_layers = 1,
    make_remnants = false,
}

local tier_map = {
    ["strand-casting-machine"] = {tier = 1},
    ["strand-casting-machine-2"] = {tier = 2},
    ["strand-casting-machine-3"] = {tier = 3},
    ["strand-casting-machine-4"] = {tier = 4},
}

-- Reskin entities, create and assign extra details
for name, map in pairs(tier_map) do
    -- Fetch entity
    local entity = data.raw[inputs.type][name]

    -- Check if entity exists, if not, skip this iteration
    if not entity then goto continue end
      
    -- Determine what tint we're using
    inputs.tint = map.tint or reskins.lib.tint_index["tier-"..map.tier]

    reskins.lib.setup_standard_entity(name, map.tier, inputs)

    -- Reskin entities
    entity.animation = {
        layers = {
            -- Base
            {
                filename = inputs.directory.."/graphics/entity/smelting/strand-casting-machine/strand-casting-machine-base.png",
                priority = "high",
                width = 167,
                height = 197,
                line_length = 6,
                frame_count = 24,
                animation_speed = 0.5,
                shift = util.by_pixel(0, -16.5),
                hr_version = {
                    filename = inputs.directory.."/graphics/entity/smelting/strand-casting-machine/hr-strand-casting-machine-base.png",
                    priority = "high",
                    width = 329,
                    height = 392,
                    line_length = 6,
                    frame_count = 24,
                    animation_speed = 0.5,
                    shift = util.by_pixel(0, -16.5),
                    scale = 0.5,
                }
            },
            -- Shadow
            {
                filename = inputs.directory.."/graphics/entity/smelting/strand-casting-machine/strand-casting-machine-shadow.png",
                priority = "high",
                width = 206,
                height = 157,
                repeat_count = 24,
                animation_speed = 0.5,
                draw_as_shadow = true,
                shift = util.by_pixel(21.5, 4.5),
                hr_version = {
                    filename = inputs.directory.."/graphics/entity/smelting/strand-casting-machine/hr-strand-casting-machine-shadow.png",
                    priority = "high",
                    width = 410,
                    height = 311,
                    repeat_count = 24,
                    animation_speed = 0.5,
                    draw_as_shadow = true,
                    shift = util.by_pixel(21.5, 4.5),
                    scale = 0.5,
                }
            },
        }
    }

    entity.working_visualisations = {
        {
            draw_as_sprite = false,
            draw_as_light = true,
            animation = {
                filename = inputs.directory.."/graphics/entity/smelting/strand-casting-machine/strand-casting-machine-light.png",
                priority = "high",
                width = 167,
                height = 197,
                shift = util.by_pixel(0, -16.5),
                hr_version = {
                    filename = inputs.directory.."/graphics/entity/smelting/strand-casting-machine/hr-strand-casting-machine-light.png",
                    priority = "high",
                    width = 329,
                    height = 392,
                    shift = util.by_pixel(0, -16.5),
                    scale = 0.5,
                }
            }
        }
    }

    -- Label to skip to next iteration
    ::continue::    
end