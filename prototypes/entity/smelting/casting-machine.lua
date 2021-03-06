-- Copyright (c) 2020 Kirazy
-- Part of Artisanal Reskins: Angel's Mods
--
-- See LICENSE.md in the project directory for license information.

-- Check to see if reskinning needs to be done.
if not mods["angelssmelting"] then return end
if reskins.lib.setting("reskins-angels-do-angelssmelting") == false then return end

-- Set input parameters
local inputs = {
    type = "assembling-machine",
    icon_name = "casting-machine",
    base_entity = "chemical-plant",
    directory = reskins.angels.directory,
    mod = "angels",
    particles = {["big"] = 1, ["medium"] = 2},
    group = "smelting",
    make_remnants = false,
}

local tier_map = {
    ["casting-machine"] = {tier = 1},
    ["casting-machine-2"] = {tier = 2},
    ["casting-machine-3"] = {tier = 3},
    ["casting-machine-4"] = {tier = 4},
}

-- Reskin entities, create and assign extra details
for name, map in pairs(tier_map) do
    -- Fetch entity
    local entity = data.raw[inputs.type][name]

    -- Check if entity exists, if not, skip this iteration
    if not entity then goto continue end

    -- Handle tier
    local tier = map.tier
    if reskins.lib.setting("reskins-lib-tier-mapping") == "progression-map" then
        tier = map.prog_tier or map.tier
    end

    -- Determine what tint we're using
    inputs.tint = map.tint or reskins.lib.tint_index["tier-"..tier]

    reskins.lib.setup_standard_entity(name, tier, inputs)

    -- Reskin entities
    entity.animation = {
        layers = {
            -- Base
            {
                filename = reskins.angels.directory.."/graphics/entity/smelting/casting-machine/casting-machine-base.png",
                priority = "high",
                width = 104,
                height = 123,
                line_length = 7,
                frame_count = 49,
                animation_speed = 0.5,
                shift = util.by_pixel(1, -2),
                hr_version = {
                    filename = reskins.angels.directory.."/graphics/entity/smelting/casting-machine/hr-casting-machine-base.png",
                    priority = "high",
                    width = 205,
                    height = 244,
                    line_length = 7,
                    frame_count = 49,
                    animation_speed = 0.5,
                    shift = util.by_pixel(0, -2),
                    scale = 0.5,
                }
            },
            -- Mask
            {
                filename = reskins.angels.directory.."/graphics/entity/smelting/casting-machine/casting-machine-mask.png",
                priority = "high",
                width = 104,
                height = 123,
                line_length = 7,
                frame_count = 49,
                animation_speed = 0.5,
                shift = util.by_pixel(1, -2),
                tint = inputs.tint,
                hr_version = {
                    filename = reskins.angels.directory.."/graphics/entity/smelting/casting-machine/hr-casting-machine-mask.png",
                    priority = "high",
                    width = 205,
                    height = 244,
                    line_length = 7,
                    frame_count = 49,
                    animation_speed = 0.5,
                    shift = util.by_pixel(0, -2),
                    tint = inputs.tint,
                    scale = 0.5,
                }
            },
            -- Highlights
            {
                filename = reskins.angels.directory.."/graphics/entity/smelting/casting-machine/casting-machine-highlights.png",
                priority = "high",
                width = 104,
                height = 123,
                line_length = 7,
                frame_count = 49,
                animation_speed = 0.5,
                shift = util.by_pixel(1, -2),
                blend_mode = reskins.lib.blend_mode,
                hr_version = {
                    filename = reskins.angels.directory.."/graphics/entity/smelting/casting-machine/hr-casting-machine-highlights.png",
                    priority = "high",
                    width = 205,
                    height = 244,
                    line_length = 7,
                    frame_count = 49,
                    animation_speed = 0.5,
                    shift = util.by_pixel(0, -2),
                    blend_mode = reskins.lib.blend_mode,
                    scale = 0.5,
                }
            },
            -- Shadow
            {
                filename = reskins.angels.directory.."/graphics/entity/smelting/casting-machine/casting-machine-shadow.png",
                priority = "high",
                width = 125,
                height = 104,
                line_length = 7,
                frame_count = 49,
                animation_speed = 0.5,
                draw_as_shadow = true,
                shift = util.by_pixel(12, 9),
                hr_version = {
                    filename = reskins.angels.directory.."/graphics/entity/smelting/casting-machine/hr-casting-machine-shadow.png",
                    priority = "high",
                    width = 248,
                    height = 206,
                    line_length = 7,
                    frame_count = 49,
                    animation_speed = 0.5,
                    draw_as_shadow = true,
                    shift = util.by_pixel(11.5, 8.5),
                    scale = 0.5,
                }
            }
        }
    }

    entity.working_visualisations = {
        -- Light
        {
            draw_as_sprite = false,
            draw_as_light = true,
            always_draw = true,
            animation = {
                filename = reskins.angels.directory.."/graphics/entity/smelting/casting-machine/casting-machine-light.png",
                priority = "high",
                width = 111,
                height = 104,
                shift = util.by_pixel(1, -2),
                hr_version = {
                    filename = reskins.angels.directory.."/graphics/entity/smelting/casting-machine/hr-casting-machine-light.png",
                    priority = "high",
                    width = 205,
                    height = 244,
                    shift = util.by_pixel(0, -2),
                    scale = 0.5,
                }
            }
        },
    }

    -- Label to skip to next iteration
    ::continue::
end