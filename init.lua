dofile(core.get_modpath("myladders").."/rope.lua")

myladders = {}

myladders.colors = {
		{"black",		"Black", 		"^[colorize:#000000:240"},
		{"blue",		"Blue", 		"^[colorize:#272dc8:200"},
		{"brown",		"Brown", 		"^[colorize:#190B07:160"},
		{"cyan",		"Cyan",			"^[colorize:#00ffff:120"},
		{"darkgreen",	"Dark Green",	"^[colorize:#071907:200"},
		{"darkgrey",	"Dark Grey",	"^[colorize:#000000:200"},
		{"green",		"Green", 		"^[colorize:#00ff00:160"},
		{"grey",		"Grey", 		"^[colorize:#000000:160"},
		{"magenta",		"Magenta",		"^[colorize:#ff00ff:160"},
		{"orange",		"Orange",		"^[colorize:#ff7700:220"},
		{"pink",		"Pink",			"^[colorize:#FE2E9A:200"},
		{"red",			"Red",			"^[colorize:#B40404:200"},
		{"violet",		"Violet",		"^[colorize:#2F0B3A:220"},
		{"white",		"White",		"^[colorize:#ffffff:200"},
		{"yellow",		"Yellow",		"^[colorize:#ffff00:200"},
		}

if core.get_modpath("mydye") then
	myladders.colors = {
		{"black",		"Black", 		"^[colorize:#000000:240"},
		{"blue",		"Blue", 		"^[colorize:#272dc8:200"},
		{"brown",		"Brown", 		"^[colorize:#190B07:160"},
		{"cyan",		"Cyan",			"^[colorize:#00ffff:120"},
		{"darkgreen",	"Dark Green",	"^[colorize:#071907:200"},
		{"darkgrey",	"Dark Grey",	"^[colorize:#000000:200"},
		{"green",		"Green", 		"^[colorize:#00ff00:160"},
		{"grey",		"Grey", 		"^[colorize:#000000:160"},
		{"magenta",		"Magenta",		"^[colorize:#ff00ff:160"},
		{"orange",		"Orange",		"^[colorize:#ff7700:220"},
		{"pink",		"Pink",			"^[colorize:#FE2E9A:200"},
		{"red",			"Red",			"^[colorize:#B40404:200"},
		{"violet",		"Violet",		"^[colorize:#2F0B3A:220"},
		{"white",		"White",		"^[colorize:#ffffff:200"},
		{"yellow",		"Yellow",		"^[colorize:#ffff00:200"},
		{"peachpuff",	"Peachpuff", 	"^[colorize:#FFDAB9:200"},
		{"navy",		"Navy", 		"^[colorize:#000080:200"},
		{"coral",		"Coral", 		"^[colorize:#FF7F50:200"},
		{"khaki",		"Khaki", 		"^[colorize:#F0E68C:200"},
		{"lime",		"Lime", 		"^[colorize:#00FF00:200"},
		{"light_pink",	"Light Pink", 	"^[colorize:#FFB6C1:200"},
		{"light_grey",	"Light Grey", 	"^[colorize:#D3D3D3:200"},
		{"purple",		"Purple", 		"^[colorize:#800080:200"},
		{"maroon",		"Maroon", 		"^[colorize:#800000:200"},
		{"aquamarine",	"Aqua Marine", 	"^[colorize:#7FFFD4:200"},
		{"chocolate",	"Chocolate", 	"^[colorize:#D2691E:200"},
		{"crimson",		"Crimson", 		"^[colorize:#DC143C:200"},
		{"olive",		"Olive", 		"^[colorize:#808000:200"},
		{"white_smoke",	"White Smoke", 	"^[colorize:#F5F5F5:200"},
		{"mistyrose",	"Misty Rose", 	"^[colorize:#FFE4E1:200"},
		{"orchid",		"Orchid", 		"^[colorize:#DA70D6:200"},
	}
end

local paintables = {
	"myladders:treehouse", "myladders:heavy", "myladders:ladder", "myladders:ladder_center"
	}

for _, entry in ipairs(myladders.colors) do
	local mat = entry[1]
	local desc = entry[2]
	local alpha = entry[3]

local ladders_type = {   --Material , Description
	{"myladders:treehouse", "Treehouse", "myladders_tree.obj","myladders_treewood.png^[transformR90","myladders_treehouse_inv.png",{-0.375, -0.5, 0.375, 0.375, 0.5, 0.5}},
	{"myladders:heavy", "Heavy Duty", "myladders_heavy.obj","myladders_heavy.png","myladders_heavy_inv.png",{-0.375, -0.5, 0.375, 0.375, 0.5, 0.5}},
	{"myladders:ladder", "Default", "myladders_default.obj","default_wood.png","myladders_default_inv.png",{-0.375, -0.5, 0.375, 0.375, 0.5, 0.5}},
	{"myladders:ladder_center", "Default Center", "myladders_default2.obj","default_wood.png","myladders_default_inv.png",{-0.375, -0.5, -0.05, 0.375, 0.5, 0.05}},
	{"myladders:wall_ladder", "Wall Ladder", "myladders_wall_ladder.obj","default_coal_block.png","myladders_wall_ladder_inv.png",{-0.375, -0.5, 0.175, 0.375, 0.5, 0.5}},
	{"myladders:aluminum_ladder", "Aluminum Ladder", "myladders_aluminum_ladder.obj", "default_clay.png", "myladders_aluminum_ladder_inv.png",{-0.375, -0.5, 0.375, 0.375, 0.5, 0.5}},
}

for i in ipairs(ladders_type) do
	local typ = ladders_type[i][1]
	local desct = ladders_type[i][2]
	local mesht = ladders_type[i][3]
	local img = ladders_type[i][4]
	local inim = ladders_type[i][5]
	local sel = ladders_type[i][6]
----------------------------------------------------------------------------------------

core.register_node(typ.."_"..mat, {
	description = desc.." "..desct.." Ladder",
	drawtype = "mesh",
	mesh = mesht,
	tiles = {img..alpha},
	inventory_image = inim..alpha,
	wield_image = inim..alpha,
	paramtype = "light",
	paramtype2 = "facedir",
	climbable = true,
	is_ground_content = false,
	groups = {choppy=2,flammable=1, not_in_creative_inventory = 1},
	selection_box = {
		type = "fixed",
		fixed = {
			sel,
		}
	},
	collision_box = {
		type = "fixed",
		fixed = {
			sel,
		}
	},
	sounds = default.node_sound_wood_defaults(),

})
core.register_node(typ, {
	description = desct.." Ladder",
	drawtype = "mesh",
	mesh = mesht,
	tiles = {img},
	inventory_image = inim,
	wield_image = inim,
	paramtype = "light",
	paramtype2 = "facedir",
	climbable = true,
	is_ground_content = false,
	groups = {choppy=2,flammable=1},
	selection_box = {
		type = "fixed",
		fixed = {
			sel,
		}
	},
	collision_box = {
		type = "fixed",
		fixed = {
			sel,
		}
	},
	sounds = default.node_sound_wood_defaults(),

})
end
end

core.register_craft({
	type = "shapeless",
	output = "myladders:ladder",
	recipe = {"default:ladder_wood"}
})

core.register_craft({
	type = "shapeless",
	output = "myladders:treehouse",
	recipe = {"myladders:ladder","default:stick"}
})

core.register_craft({
	type = "shapeless",
	output = "myladders:heavy",
	recipe = {"myladders:ladder","myladders:ladder"}
})

if core.get_modpath("mypaint") then
local colors = {}
for _, entry in ipairs(myladders.colors) do
	table.insert(colors, entry[1])
end

mypaint.register(paintables, colors)
end
