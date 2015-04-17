local ladders_mat = {   --Material , Description, Alpha
	{"wood", "Wood",""},
	{"steel", "Steel","^myladders_alpha_grey.png"},
	{"black", "Black","^myladders_alpha_black.png"},
}

for i in ipairs(ladders_mat) do
	local mat = ladders_mat[i][1]
	local desc = ladders_mat[i][2]
	local alpha = ladders_mat[i][3]
----------------------------------------------------------------------------------------

minetest.register_node("myladders:treehouse_ladder_"..mat, {
	description = desc.."Treehouse ladder",
	drawtype = "nodebox",
	paramtype = "light",
	tiles = {
		"myladders_wood_top.png"..alpha,
		"myladders_wood_top.png"..alpha,
		"myladders_wood_side.png"..alpha,
		"myladders_wood_side.png"..alpha,
		"myladders_wood_back.png"..alpha,
		"myladders_wood_front.png"..alpha,
		},
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = true,
	climbable = true,
	is_ground_content = false,
	groups = {choppy=2,oddly_breakable_by_hand=3,flammable=2},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.375, -0.5, 0.375, -0.25, 0.5, 0.5},
			{0.25, -0.5, 0.375, 0.375, 0.5, 0.5},
			{-0.5, 0.3125, 0.3125, 0.5, 0.375, 0.375},
			{-0.5, -0.4375, 0.3125, 0.5, -0.375, 0.375},
			{-0.5, 0.0625, 0.3125, 0.5, 0.125, 0.375},
			{-0.5, -0.1875, 0.3125, 0.5, -0.125, 0.375},
		}
	},
        sounds = default.node_sound_wood_defaults(),

})
minetest.register_craft({
	type = "shapeless",
	output = "myladders:treehouse_ladder_"..mat.." 2",
	recipe = {"default:ladder"}
})

--Heavy Duty
minetest.register_node("myladders:heavy_ladder_"..mat, {
	description = desc.."Heavy Duty ladder",
	drawtype = "nodebox",
	paramtype = "light",
	tiles = {
		"myladders_wood_front3.png"..alpha,
		"myladders_wood_front3.png"..alpha,
		"myladders_wood_side2.png"..alpha,
		"myladders_wood_side2.png"..alpha,
		"myladders_wood_front3.png"..alpha,
		"myladders_wood_front3.png"..alpha,
		},
	paramtype = "light",
	paramtype2 = "facedir",
	walkable = true,
	climbable = true,
	is_ground_content = false,
	groups = {choppy=2,oddly_breakable_by_hand=3,flammable=2},
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
        sounds = default.node_sound_wood_defaults(),

})

minetest.register_craft({
	type = "shapeless",
	output = "myladders:heavy_ladder_"..mat.." 1",
	recipe = {"default:ladder","default:ladder"}
})

end
minetest.register_node(":default:ladder", {
        description = "Ladder",
        drawtype = "nodebox",
        tiles = {"default_ladder_top.png",
                "default_ladder_bottom.png",
                "default_ladder_right.png",
                "default_ladder_left.png",
                "default_ladder_back.png",
                "default_ladder.png"},
        inventory_image = "default_ladder.png",
        wield_image = "default_ladder.png",
        paramtype = "light",
        paramtype2 = "facedir",
		  sunlight_propagates = true,
        walkable = true,
        climbable = true,
        node_box = {
                type = "fixed",
                fixed = {
                        {-0.375,-0.5,0.375,-0.25,0.5,0.5}, 
                        {0.25,-0.5,0.375,0.375,0.5,0.5}, 
                        {-0.25,0.4375,0.375,0.25,0.3125,0.5}, 
                        {-0.25,0.0625,0.375,0.25,0.1875,0.5}, 
                        {-0.25,-0.1875,0.375,0.25,-0.0625,0.5},
                        {-0.25,-0.4375,0.375,0.25,-0.3125,0.5},
                },
        },
        selection_box = {
                type = "fixed",
                fixed = {
                {-0.375,-0.5,0.375,0.375,0.5,0.5},
        },
        },
        groups = {choppy=2,oddly_breakable_by_hand=3,flammable=2},
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
