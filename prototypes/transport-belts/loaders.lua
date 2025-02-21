local sounds = require("__base__/prototypes/entity/sounds")

function convert_color(red, green, blue, alpha)
  return { r = red / 255, g = green / 255, b = blue / 255, a = (alpha or 255) / 255 }
end

-- Variable utils
local loader_names = {
  [1] = "sp-kr-loader",
  [2] = "sp-kr-fast-loader",
  [3] = "sp-kr-express-loader",
  [4] = "sp-kr-turbo-loader",
  [5] = "sp-kr-superior-loader",
}

local loader_icons = {
  [1] = "__Spaghetorio__/graphics/krastorio/icons/entities/loaders/kr-loader.png",
  [2] = "__Spaghetorio__/graphics/krastorio/icons/entities/loaders/kr-fast-loader.png",
  [3] = "__Spaghetorio__/graphics/krastorio/icons/entities/loaders/kr-express-loader.png",
  [4] = "__Spaghetorio__/graphics/krastorio/icons/entities/loaders/kr-advanced-loader.png",
  [5] = "__Spaghetorio__/graphics/krastorio/icons/entities/loaders/kr-superior-loader.png",
}

-- ENTITY

function createKrastorioLoader(data)
  local name = data.name
  local speed = data.speed
  local icon = data.icon
  local icon_size = data.icon_size or 64
  local icon_mipmaps = data.icon_mipmaps or 4
  local belt_animation_set = data.belt_animation_set
  local order = data.order
  local upgrade = data.upgrade or nil
  local loader_tint = data.tint or { r = 1.0, g = 1.0, b = 1.0 }
  local rust_layer_direction_in, rust_layer_direction_out = nil, nil
  if data.apply_rust ~= false then
    rust_layer_direction_in = {
      filename = "__Spaghetorio__/graphics/krastorio/entities/loader/kr-loader-rust.png",
      priority = "extra-high",
      shift = { 0.15625, 0.0703125 },
      width = 53,
      height = 43,
      y = 43,
    }
    rust_layer_direction_out = {
      filename = "__Spaghetorio__/graphics/krastorio/entities/loader/kr-loader-rust.png",
      priority = "extra-high",
      shift = { 0.15625, 0.0703125 },
      width = 53,
      height = 43,
    }
  end

  return {
    type = "loader-1x1",
    name = name,
    localised_name = data.localised_name,
    icon = icon,
    icon_size = icon_size,
    icon_mipmaps = icon_mipmaps,
    flags = {"placeable-neutral", "player-creation"},
    minable = { mining_time = 0.25, result = data.result or name },
    placeable_by = { item = data.result or name, count = 1 },
    max_health = 300,
    filter_count = 5,
    corpse = "small-remnants",
    resistances = {
      {
        type = "fire",
        percent = 90,
      },
    },
    collision_box = { { -0.4, -0.45 }, { 0.4, 0.45 } },
    selection_box = { { -0.5, -0.5 }, { 0.5, 0.5 } },
    drawing_box = { { -0.4, -0.4 }, { 0.4, 0.4 } },
    animation_speed_coefficient = 32,
    container_distance = 0.75, --Default: 1.5
    -- belt_distance = 0.0, --Default1x1: 0.0  --Default2x1: 0.5
    belt_length = 0.20, -- Default: 0.5
    structure_render_layer = "object",
    -- structure_render_layer = "transport-belt-circuit-connector", --Default:"lower-object"
    belt_animation_set = belt_animation_set,
    fast_replaceable_group = "loader",
    next_upgrade = upgrade,
    speed = speed,
    -- for space exploration compatibility
    se_allow_in_space = data.se_allow_in_space,

    open_sound = sounds.machine_open,
    close_sound = sounds.machine_close,

    structure = {
      direction_in = {
        sheets = {
          {
            filename = "__Spaghetorio__/graphics/krastorio/entities/loader/kr-loader.png",
            priority = "extra-high",
            shift = { 0.15625, 0.0703125 },
            width = 53,
            height = 43,
            y = 43,
          },
          {
            filename = "__Spaghetorio__/graphics/krastorio/entities/loader/kr-loader-mask.png",
            priority = "extra-high",
            shift = { 0.15625, 0.0703125 },
            width = 53,
            height = 43,
            y = 43,
            tint = loader_tint,
          },
          rust_layer_direction_in,
        },
      },
      direction_out = {
        sheets = {
          {
            filename = "__Spaghetorio__/graphics/krastorio/entities/loader/kr-loader.png",
            priority = "extra-high",
            shift = { 0.15625, 0.0703125 },
            width = 53,
            height = 43,
          },
          {
            filename = "__Spaghetorio__/graphics/krastorio/entities/loader/kr-loader-mask.png",
            priority = "extra-high",
            shift = { 0.15625, 0.0703125 },
            width = 53,
            height = 43,
            tint = loader_tint,
          },
          rust_layer_direction_out,
        },
      },
    },
    order = order,
  }
end

local entities = {
  createKrastorioLoader({
    name = loader_names[1],
    icon = loader_icons[1],
    speed = data.raw["transport-belt"]["transport-belt"].speed,
    upgrade = loader_names[2],
    belt_animation_set = data.raw["transport-belt"]["transport-belt"].belt_animation_set,
    tint = convert_color(249, 207, 70),
  }),
  createKrastorioLoader({
    name = loader_names[2],
    icon = loader_icons[2],
    speed = data.raw["transport-belt"]["fast-transport-belt"].speed,
    upgrade = loader_names[3],
    belt_animation_set = data.raw["transport-belt"]["fast-transport-belt"].belt_animation_set,
    tint = convert_color(228, 24, 38),
  }),
  createKrastorioLoader({
    name = loader_names[3],
    icon = loader_icons[3],
    speed = data.raw["transport-belt"]["express-transport-belt"].speed,
    upgrade = loader_names[4],
    belt_animation_set = data.raw["transport-belt"]["express-transport-belt"].belt_animation_set,
    tint = convert_color(90, 190, 220),
  }),
  createKrastorioLoader({
    name = loader_names[4],
    icon = loader_icons[4],
    speed = data.raw["transport-belt"]["turbo-transport-belt"].speed,
    upgrade = loader_names[5],
    belt_animation_set = data.raw["transport-belt"]["turbo-transport-belt"].belt_animation_set,
    tint = convert_color(76, 232, 48),
  }),
  createKrastorioLoader({
    name = loader_names[5],
    icon = loader_icons[5],
    speed = data.raw["transport-belt"]["sp-kr-superior-transport-belt"].speed,
    belt_animation_set = data.raw["transport-belt"]["sp-kr-superior-transport-belt"].belt_animation_set,
    tint = convert_color(151, 34, 191),
  }),
}
data:extend(entities)
