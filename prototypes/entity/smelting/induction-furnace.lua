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
    icon_name = "induction-furnace",
    base_entity = "oil-refinery",
    directory = reskins.angels.directory,
    mod = "angels",
    particles = {["big-tint"] = 5, ["medium"] = 2},
    group = "smelting",
    make_remnants = false,
}

local tier_map = {
    ["induction-furnace"] = {tier = 1},
    ["induction-furnace-2"] = {tier = 2},
    ["induction-furnace-3"] = {tier = 3},
    ["induction-furnace-4"] = {tier = 4},
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
                filename = reskins.angels.directory.."/graphics/entity/smelting/induction-furnace/induction-furnace-base.png",
                priority = "high",
                width = 170,
                height = 192,
                line_length = 6,
                frame_count = 36,
                animation_speed = 0.5,
                shift = util.by_pixel(0.5, -5.5),
                hr_version = {
                    priority = "high",
                    width = 336,
                    height = 381,
                    frame_count = 36,
                    stripes = {
                        {
                            filename = reskins.angels.directory.."/graphics/entity/smelting/induction-furnace/hr-induction-furnace-base_01.png",
                            width_in_frames = 6,
                            height_in_frames = 3,
                        },
                        {
                            filename = reskins.angels.directory.."/graphics/entity/smelting/induction-furnace/hr-induction-furnace-base_02.png",
                            width_in_frames = 6,
                            height_in_frames = 3,
                        },
                    },
                    animation_speed = 0.5,
                    shift = util.by_pixel(0, -5),
                    scale = 0.5,
                }
            },
            -- Mask
            {
                filename = reskins.angels.directory.."/graphics/entity/smelting/induction-furnace/induction-furnace-mask.png",
                priority = "high",
                width = 170,
                height = 192,
                line_length = 6,
                frame_count = 36,
                animation_speed = 0.5,
                tint = inputs.tint,
                shift = util.by_pixel(0.5, -5.5),
                hr_version = {
                    priority = "high",
                    width = 336,
                    height = 381,
                    frame_count = 36,
                    stripes = {
                        {
                            filename = reskins.angels.directory.."/graphics/entity/smelting/induction-furnace/hr-induction-furnace-mask_01.png",
                            width_in_frames = 6,
                            height_in_frames = 3,
                        },
                        {
                            filename = reskins.angels.directory.."/graphics/entity/smelting/induction-furnace/hr-induction-furnace-mask_02.png",
                            width_in_frames = 6,
                            height_in_frames = 3,
                        },
                    },
                    animation_speed = 0.5,
                    tint = inputs.tint,
                    shift = util.by_pixel(0, -5),
                    scale = 0.5,
                }
            },
            -- Highlights
            {
                filename = reskins.angels.directory.."/graphics/entity/smelting/induction-furnace/induction-furnace-highlights.png",
                priority = "high",
                width = 170,
                height = 192,
                line_length = 6,
                frame_count = 36,
                animation_speed = 0.5,
                blend_mode = reskins.lib.blend_mode,
                shift = util.by_pixel(0.5, -5.5),
                hr_version = {
                    priority = "high",
                    width = 336,
                    height = 381,
                    frame_count = 36,
                    stripes = {
                        {
                            filename = reskins.angels.directory.."/graphics/entity/smelting/induction-furnace/hr-induction-furnace-highlights_01.png",
                            width_in_frames = 6,
                            height_in_frames = 3,
                        },
                        {
                            filename = reskins.angels.directory.."/graphics/entity/smelting/induction-furnace/hr-induction-furnace-highlights_02.png",
                            width_in_frames = 6,
                            height_in_frames = 3,
                        },
                    },
                    animation_speed = 0.5,
                    blend_mode = reskins.lib.blend_mode,
                    shift = util.by_pixel(0, -5),
                    scale = 0.5,
                }
            },
            -- Shadow
            {
                filename = reskins.angels.directory.."/graphics/entity/smelting/induction-furnace/induction-furnace-shadow.png",
                priority = "high",
                width = 216,
                height = 170,
                line_length = 6,
                frame_count = 36,
                animation_speed = 0.5,
                draw_as_shadow = true,
                shift = util.by_pixel(24, 9),
                hr_version = {
                    priority = "high",
                    width = 429,
                    height = 336,
                    frame_count = 36,
                    stripes = {
                        {
                            filename = reskins.angels.directory.."/graphics/entity/smelting/induction-furnace/hr-induction-furnace-shadow_01.png",
                            width_in_frames = 3,
                            height_in_frames = 6,
                        },
                        {
                            filename = reskins.angels.directory.."/graphics/entity/smelting/induction-furnace/hr-induction-furnace-shadow_02.png",
                            width_in_frames = 3,
                            height_in_frames = 6,
                        },
                    },
                    animation_speed = 0.5,
                    draw_as_shadow = true,
                    shift = util.by_pixel(23, 8.5),
                    scale = 0.5,
                }
            },
        }
    }

    entity.working_visualisations = {
        -- Ingots
        {
            apply_recipe_tint = "primary",
            always_draw = true,
            animation = {
                filename = reskins.angels.directory.."/graphics/entity/smelting/induction-furnace/induction-furnace-working-recipe-tint-mask.png",
                priority = "high",
                width = 170,
                height = 192,
                line_length = 6,
                frame_count = 36,
                animation_speed = 0.5,
                shift = util.by_pixel(0.5, -5.5),
                hr_version = {
                    priority = "high",
                    width = 336,
                    height = 381,
                    frame_count = 36,
                    stripes = {
                        {
                            filename = reskins.angels.directory.."/graphics/entity/smelting/induction-furnace/hr-induction-furnace-working-recipe-tint-mask_01.png",
                            width_in_frames = 6,
                            height_in_frames = 3,
                        },
                        {
                            filename = reskins.angels.directory.."/graphics/entity/smelting/induction-furnace/hr-induction-furnace-working-recipe-tint-mask_02.png",
                            width_in_frames = 6,
                            height_in_frames = 3,
                        },
                    },
                    animation_speed = 0.5,
                    shift = util.by_pixel(0, -5),
                    scale = 0.5,
                }
            }
        },

        -- Vertical Pipe Shadow Patch
        {
            always_draw = true,
            north_animation = reskins.angels.vertical_pipe_shadow({2, -2})
        },

        -- Glow
        {
            draw_as_sprite = false,
            draw_as_light = true,
            always_draw = true,
            animation = {
                filename = reskins.angels.directory.."/graphics/entity/smelting/induction-furnace/induction-furnace-working-lights.png",
                priority = "high",
                width = 170,
                height = 192,
                line_length = 6,
                frame_count = 36,
                animation_speed = 0.5,
                shift = util.by_pixel(0.5, -5.5),
                hr_version = {
                    priority = "high",
                    width = 336,
                    height = 379,
                    frame_count = 36,
                    stripes = {
                        {
                            filename = reskins.angels.directory.."/graphics/entity/smelting/induction-furnace/hr-induction-furnace-working-lights_01.png",
                            width_in_frames = 6,
                            height_in_frames = 3,
                        },
                        {
                            filename = reskins.angels.directory.."/graphics/entity/smelting/induction-furnace/hr-induction-furnace-working-lights_02.png",
                            width_in_frames = 6,
                            height_in_frames = 3,
                        },
                    },
                    animation_speed = 0.5,
                    shift = util.by_pixel(0, -6),
                    scale = 0.5,
                }
            }
        }
    }

    -- Label to skip to next iteration
    ::continue::
end