local util = require("data-util")

if not mods["Krastorio2"] then
  -- Source: https://youtu.be/tsDa_Qz3LF0?si=4sG11dFGr8eALM_H&t=1300
  -- Go through every furnace and convert to assembling machine
  for key, value in pairs(data.raw.furnace) do
    -- Only Furnaces that do smelting
    if util.helper.table_contains(value.crafting_categories, "smelting") then
      local furnace = table.deepcopy(value)
      -- Except stone-furnace
      if not (value.name == "stone-furnace") then
        furnace.type = "assembling-machine"
        table.insert(furnace.crafting_categories, "intermediate-smelting")

        data.raw.furnace[key] = nil
        data:extend({furnace})
      end
    end
  end
end

-- MARK: Change item subgroups
data.raw.item["sulfur"].subgroup = "processed-resource"
data.raw.item["uranium-238"].subgroup = "processed-resource"
data.raw.item["uranium-235"].subgroup = "processed-resource"

data.raw.item["low-density-structure"].subgroup = "advanced-raw-material"

data.raw.item["plastic-bar"].subgroup = "chemical-product"

data.raw.item["copper-cable"].subgroup = "mechanical-component"
data.raw.item["iron-stick"].subgroup = "mechanical-component"
data.raw.item["iron-gear-wheel"].subgroup = "mechanical-component"
data.raw.item["low-density-structure"].subgroup = "mechanical-component"

data.raw.item["electronic-circuit"].subgroup = "electronic-optical-component"
data.raw.item["advanced-circuit"].subgroup = "electronic-optical-component"
data.raw.item["processing-unit"].subgroup = "electronic-optical-component"  -- idea: use this as processor and change icon
data.raw.item["battery"].subgroup = "electronic-optical-component"

data.raw.item["rocket-control-unit"].subgroup = "advanced-intermediate-product"

data.raw.item["solid-fuel"].subgroup = "fuel-processing"
data.raw.item["rocket-fuel"].subgroup = "fuel-processing"
data.raw.item["nuclear-fuel"].subgroup = "fuel-processing"
data.raw.item["uranium-fuel-cell"].subgroup = "fuel-processing"
data.raw.item["used-up-uranium-fuel-cell"].subgroup = "fuel-processing"

data.raw.item["explosives"].subgroup = "ammo"
data.raw.item["explosives"].order = "a-a"

-- Change order of items
data.raw.item["copper-plate"].order = "a-plate-[copper]"
data.raw.item["iron-plate"].order = "a-plate-[iron]"

data.raw.item["copper-cable"].order = "cable-[copper-cable]"

data.raw.item["iron-gear-wheel"].order = "gear-[iron-gear-wheel]"
data.raw.item["iron-stick"].order = "frame-[iron-stick]"

data.raw.item["low-density-structure"].order = "ceramic-[low-density-structure]"  -- I know its not supposed to be ceramics, but its my mod so i do whatever i want.

-- change stack sizes
data.raw.item["copper-cable"].stack_size = 400
data.raw.item["chemical-plant"].stack_size = 50

-- change recipe subgroups
data.raw.recipe["uranium-processing"].subgroup = "processed-resource"
data.raw.recipe["kovarex-enrichment-process"].subgroup = "processed-resource"

-- Assing subgroup to science items
data.raw.tool["automation-science-pack"].subgroup = "basic-science"
data.raw.tool["logistic-science-pack"].subgroup = "basic-science"
data.raw.tool["military-science-pack"].subgroup = "basic-science"
data.raw.tool["chemical-science-pack"].subgroup = "basic-science"
data.raw.tool["production-science-pack"].subgroup = "intermediate-science"
data.raw.tool["utility-science-pack"].subgroup = "intermediate-science"
data.raw.tool["space-science-pack"].subgroup = "advanced-science"

-- add crafting categories
table.insert(data.raw["assembling-machine"]["centrifuge"].crafting_categories, "high-energy-physics")
table.insert(data.raw["furnace"]["electric-furnace"].crafting_categories, "intermediate-smelting")

-- MARK: Changes to rocket silo
data.raw["rocket-silo"]["rocket-silo"].rocket_parts_required = 1
