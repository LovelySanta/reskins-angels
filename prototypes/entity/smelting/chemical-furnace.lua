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
    icon_name = "chemical-furnace",
    base_entity = "oil-refinery",
    directory = reskins.angels.directory,
    mod = "angels",
    particles = {["big-tint"] = 5, ["medium"] = 2},
    group = "smelting",
    make_remnants = false,
}

local tier_map = {
    ["angels-chemical-furnace"] = {tier = 1},
    ["angels-chemical-furnace-2"] = {tier = 2},
    ["angels-chemical-furnace-3"] = {tier = 3},
    ["angels-chemical-furnace-4"] = {tier = 4},
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
                filename = reskins.angels.directory.."/graphics/entity/smelting/chemical-furnace/chemical-furnace-base.png",
                priority = "high",
                width = 168,
                height = 189,
                line_length = 6,
                frame_count = 36,
                animation_speed = 0.5,
                shift = util.by_pixel(-1, -12),
                hr_version = {
                    priority = "high",
                    width = 332,
                    height = 374,
                    frame_count = 36,
                    stripes = {
                        {
                            filename = reskins.angels.directory.."/graphics/entity/smelting/chemical-furnace/hr-chemical-furnace-base_01.png",
                            width_in_frames = 6,
                            height_in_frames = 3,
                        },
                        {
                            filename = reskins.angels.directory.."/graphics/entity/smelting/chemical-furnace/hr-chemical-furnace-base_02.png",
                            width_in_frames = 6,
                            height_in_frames = 3,
                        },
                    },
                    animation_speed = 0.5,
                    shift = util.by_pixel(-1, -11.5),
                    scale = 0.5,
                }
            },
            -- Mask
            {
                filename = reskins.angels.directory.."/graphics/entity/smelting/chemical-furnace/chemical-furnace-mask.png",
                priority = "high",
                width = 168,
                height = 189,
                line_length = 6,
                frame_count = 36,
                animation_speed = 0.5,
                tint = inputs.tint,
                shift = util.by_pixel(-1, -12),
                hr_version = {
                    priority = "high",
                    width = 332,
                    height = 374,
                    frame_count = 36,
                    stripes = {
                        {
                            filename = reskins.angels.directory.."/graphics/entity/smelting/chemical-furnace/hr-chemical-furnace-mask_01.png",
                            width_in_frames = 6,
                            height_in_frames = 3,
                        },
                        {
                            filename = reskins.angels.directory.."/graphics/entity/smelting/chemical-furnace/hr-chemical-furnace-mask_02.png",
                            width_in_frames = 6,
                            height_in_frames = 3,
                        },
                    },
                    animation_speed = 0.5,
                    tint = inputs.tint,
                    shift = util.by_pixel(-1, -11.5),
                    scale = 0.5,
                }
            },
            -- Highlights
            {
                filename = reskins.angels.directory.."/graphics/entity/smelting/chemical-furnace/chemical-furnace-highlights.png",
                priority = "high",
                width = 168,
                height = 189,
                line_length = 6,
                frame_count = 36,
                animation_speed = 0.5,
                blend_mode = reskins.lib.blend_mode,
                shift = util.by_pixel(-1, -12),
                hr_version = {
                    priority = "high",
                    width = 332,
                    height = 374,
                    frame_count = 36,
                    stripes = {
                        {
                            filename = reskins.angels.directory.."/graphics/entity/smelting/chemical-furnace/hr-chemical-furnace-highlights_01.png",
                            width_in_frames = 6,
                            height_in_frames = 3,
                        },
                        {
                            filename = reskins.angels.directory.."/graphics/entity/smelting/chemical-furnace/hr-chemical-furnace-highlights_02.png",
                            width_in_frames = 6,
                            height_in_frames = 3,
                        },
                    },
                    animation_speed = 0.5,
                    blend_mode = reskins.lib.blend_mode,
                    shift = util.by_pixel(-1, -11.5),
                    scale = 0.5,
                }
            },
            -- Shadow
            {
                filename = reskins.angels.directory.."/graphics/entity/smelting/chemical-furnace/chemical-furnace-shadow.png",
                priority = "high",
                width = 224,
                height = 141,
                line_length = 6,
                frame_count = 36,
                animation_speed = 0.5,
                draw_as_shadow = true,
                shift = util.by_pixel(28, 13),
                hr_version = {
                    priority = "high",
                    width = 448,
                    height = 280,
                    frame_count = 36,
                    stripes = {
                        {
                            filename = reskins.angels.directory.."/graphics/entity/smelting/chemical-furnace/hr-chemical-furnace-shadow_01.png",
                            width_in_frames = 4,
                            height_in_frames = 7,
                        },
                        {
                            filename = reskins.angels.directory.."/graphics/entity/smelting/chemical-furnace/hr-chemical-furnace-shadow_02.png",
                            width_in_frames = 4,
                            height_in_frames = 2,
                        },
                    },
                    animation_speed = 0.5,
                    draw_as_shadow = true,
                    shift = util.by_pixel(28, 12.5),
                    scale = 0.5,
                }
            },
        }
    }

    entity.working_visualisations = {
        -- Glow
        {
            draw_as_sprite = false,
            draw_as_light = true,
            always_draw = true,
            animation = {
                filename = reskins.angels.directory.."/graphics/entity/smelting/chemical-furnace/chemical-furnace-light.png",
                priority = "high",
                width = 168,
                height = 189,
                line_length = 6,
                frame_count = 36,
                animation_speed = 0.5,
                shift = util.by_pixel(-1, -12),
                hr_version = {
                    priority = "high",
                    width = 332,
                    height = 374,
                    frame_count = 36,
                    stripes = {
                        {
                            filename = reskins.angels.directory.."/graphics/entity/smelting/chemical-furnace/hr-chemical-furnace-light_01.png",
                            width_in_frames = 6,
                            height_in_frames = 3,
                        },
                        {
                            filename = reskins.angels.directory.."/graphics/entity/smelting/chemical-furnace/hr-chemical-furnace-light_02.png",
                            width_in_frames = 6,
                            height_in_frames = 3,
                        },
                    },
                    animation_speed = 0.5,
                    shift = util.by_pixel(-1, -11.5),
                    scale = 0.5,
                }
            }
        }
    }

    -- Label to skip to next iteration
    ::continue::
end