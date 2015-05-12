
local ladders_mat = {
{"_black", "Black", 		"^[colorize:black:240"},
{"_blue", "Blue", 		"^[colorize:#0404B4:100"},
{"_brown", "Brown", 		"^[colorize:#190B07:160"},
{"_cyan", "Cyan",		"^[colorize:cyan:120"},
{"_dark_green", "Dark Green",	"^[colorize:#071907:200"},
{"_dark_grey", "Dark Grey",	"^[colorize:black:200"},
{"_green", "Green", 		"^[colorize:green:160"},
{"_grey", "Grey", 		"^[colorize:black:150"},
{"_magenta", "Magenta",		"^[colorize:magenta:160"},
{"_orange", "Orange",		"^[colorize:orange:220"},
{"_pink", "Pink",		"^[colorize:#FE2E9A:200"},
{"_red", "Red",			"^[colorize:#B40404:200"},
{"_violet", "Violet",		"^[colorize:#2F0B3A:220"},
{"_white", "White",		"^[colorize:white:200"},
{"_yellow", "Yellow",		"^[colorize:yellow:200"},
{"_wood", "Wood",		""},
}

for i in ipairs(ladders_mat) do
	local mat = ladders_mat[i][1]
	local desc = ladders_mat[i][2]
	local alpha = ladders_mat[i][3]

local ladders_type = {   --Material , Description
	{"myladders:treehouse", "Treehouse", "myladders_tree.obj","myladders_treewood.png^[transformR90"},
	{"myladders:heavy", "Heavy Duty", "myladders_heavy.obj","myladders_heavy.png"},
	{":default:ladder", "Default", "myladders_default.obj","default_wood.png"},
}

for i in ipairs(ladders_type) do
	local typ = ladders_type[i][1]
	local desct = ladders_type[i][2]
	local mesht = ladders_type[i][3]
	local img = ladders_type[i][4]
----------------------------------------------------------------------------------------

minetest.register_node(typ..mat, {
	description = desc.." "..desct.." Ladder",
	drawtype = "mesh",
	mesh = mesht,
        tiles = {img..alpha},
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = true,
	climbable = true,
	is_ground_content = false,
	groups = {choppy=2,flammable=1},
--        legacy_wallmounted = true,
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.375, -0.5, 0.375, 0.375, 0.5, 0.5},
		}
	},
        sounds = default.node_sound_wood_defaults(),

})
end
end


--[[
minetest.register_craft({
	type = "shapeless",
	output = "myladders:treehouse_ladder_wood 2",
	recipe = {"default:ladder"}
})
minetest.register_craft({
	type = "shapeless",
	output = "myladders:treehouse_ladder_steel",
	recipe = {"myladders:treehouse_ladder_wood","dye:grey"}
})
minetest.register_craft({
	type = "shapeless",
	output = "myladders:treehouse_ladder_black",
	recipe = {"myladders:treehouse_ladder_wood","dye:black"}
})

--Heavy Duty
minetest.register_node("myladders:heavy_ladder_"..mat, {
	description = desc.."Heavy Duty ladder",
	drawtype = "mesh",
	mesh = "myladders_heavy.obj",
        tiles = {"default_wood.png"},
	paramtype = "light",
--	tiles = {
--		"myladders_wood_front3.png"..alpha,
--		"myladders_wood_side2.png"..alpha,
--		"myladders_wood_side2.png"..alpha,
--		"myladders_wood_side2.png"..alpha,
--		"myladders_wood_front3.png"..alpha,
--		"myladders_wood_front3.png"..alpha,
--		},
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = true,
	climbable = true,
	is_ground_content = false,
	groups = {choppy=2,flammable=1},
        legacy_wallmounted = true,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.375, -0.5, 0.3125, -0.25, 0.5, 0.5},
			{0.25, -0.5, 0.3125, 0.375, 0.5, 0.5}, 
			{-0.25, -0.125, 0.375, 0.25, -0.0625, 0.4375}, 
			{-0.25, 0.125, 0.375, 0.25, 0.1875, 0.4375}, 
			{-0.25, 0.375, 0.375, 0.25, 0.4375, 0.4375}, 
			{-0.25, -0.375, 0.375, 0.25, -0.3125, 0.4375}, 
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.375, -0.5, 0.3125, 0.375, 0.5, 0.5},
		}
	},
        sounds = default.node_sound_wood_defaults(),

})

minetest.register_craft({
	type = "shapeless",
	output = "myladders:heavy_ladder_wood 1",
	recipe = {"default:ladder","default:ladder"}
})
minetest.register_craft({
	type = "shapeless",
	output = "myladders:heavy_ladder_steel",
	recipe = {"myladders:heavy_ladder_wood","dye:grey"}
})
minetest.register_craft({
	type = "shapeless",
	output = "myladders:heavy_ladder_black",
	recipe = {"myladders:heavy_ladder_wood","dye:black"}
})

end
minetest.register_node(":default:ladder", {
        description = "Ladder",
        drawtype = "mesh",
	mesh = "myladders_default.obj",
        tiles = {"default_ladder_mesh.png"},
        inventory_image = "default_ladder.png",
        wield_image = "default_ladder.png",
        paramtype = "light",
        paramtype2 = "facedir",
		  sunlight_propagates = true,
        walkable = true,
        climbable = true,

	selection_box = {
		type = "fixed",
		fixed = {
			{-0.375, -0.5, 0.375, 0.375, 0.5, 0.5},
		}
	},
        groups = {choppy=2,flammable=1},
        legacy_wallmounted = true,
        sounds = default.node_sound_wood_defaults(),
})
--[[
minetest.register_node("myladders:ladder_tin", {
        description = "Tin Ladder",
        drawtype = "nodebox",
        tiles = {"myladders_ladder_tin_top.png",
                "myladders_ladder_tin_bottom.png",
                "myladders_ladder_tin_right.png",
                "myladders_ladder_tin_left.png",
                "myladders_ladder_tin_back.png",
                "myladders_ladder_tin.png"},
        inventory_image = "myladders_ladder_tin.png",
        wield_image = "myladders_ladder_tin.png",
        paramtype = "light",
        paramtype2 = "facedir",
		  sunlight_propagates = true,
        walkable = true,
        climbable = true,
        node_box = {
                type = "fixed",
                fixed = {
                        {-0.375000,-0.500000,0.375000,-0.250000,0.500000,0.500000}, --NodeBox 1
                        {0.250000,-0.500000,0.375000,0.375000,0.500000,0.500000}, --NodeBox 2
                        {-0.250000,0.437500,0.375000,0.250000,0.312500,0.500000}, --NodeBox 3
                        {-0.250000,0.062500,0.375000,0.250000,0.187500,0.500000}, --NodeBox 4
                        {-0.250000,-0.187500,0.375000,0.250000,-0.062500,0.500000}, --NodeBox 5
                        {-0.250000,-0.437500,0.375000,0.250000,-0.312500,0.500000}, --NodeBox 6
                },
        },
        selection_box = {
                type = "fixed",
                fixed = {
                {-0.375,-0.5,0.375,0.375,0.5,0.5},
        },
        },
        groups = {cracky = 3},
        legacy_wallmounted = true,
        sounds = default.node_sound_wood_defaults(),
})
minetest.register_craft({
	output = "myladders:ladder_tin 5",
	recipe = {
		{'moreores:tin_ingot', '', 'moreores:tin_ingot'},
		{'moreores:tin_ingot', 'moreores:tin_ingot', 'moreores:tin_ingot'},
		{'moreores:tin_ingot', '', 'moreores:tin_ingot'}
	}
})
--]]
