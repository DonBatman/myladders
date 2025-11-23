
--Rope

core.register_node("myladders:rope", {
	description = "Rope",
	paramtype = "light",
	walkable = false,
	climbable = true,
	groups = {choppy=2,oddly_breakable_by_hand=3,flammable=2},
	sounds = default.node_sound_wood_defaults(),

	tiles = {
		"wool_yellow.png",
		"wool_yellow.png",
		"wool_yellow.png",
		"wool_yellow.png",
		"wool_yellow.png",
		"wool_yellow.png"
	},
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.0625, -0.5, -0.0625, 0.0625, 0.5, 0.0625},
		}
	}
})

core.register_craft({
	output = 'myladders:rope 3',
	recipe = {
		{"", "wool:yellow", ""},
		{"", "wool:yellow", ""},
		{"", "wool:yellow", ""}
	}
})

--Rope Box
------------------------------------------------------------------------------


core.register_node("myladders:rope_for_box", {
    description = "Rope for Ropebox",
    drawtype = "nodebox",
    paramtype = "light",
    sunlight_propagates = true,
	tiles = {
		"wool_yellow.png",
		"wool_yellow.png",
		"wool_yellow.png",
		"wool_yellow.png",
		"wool_yellow.png",
		"wool_yellow.png"
	},
    groups = {not_in_creative_inventory=1},
    climbable = true,
    walkable = false,
    diggable = false,
	node_box = {
		type = "fixed",
		fixed = {
			{-0.0625, -0.5, -0.0625, 0.0625, 0.5, 0.0625},
		}
	},
    after_destruct = function(pos,oldnode)
        local node = core.get_node({x=pos.x,y=pos.y-1,z=pos.z})
        if node.name == "myladders:rope_for_box" then 
            core.remove_node({x=pos.x,y=pos.y-1,z=pos.z})
        end
    end,
})

core.register_node("myladders:ropebox", {
    description = "Ropebox Block",
    drawtype = "nodebox",
    sunlight_propagates = true,
    tiles = {"default_coal_block.png",
             "default_coal_block.png",
             "default_coal_block.png",
             "default_coal_block.png",
             "default_coal_block.png",
             "default_coal_block.png"},
    paramtype = "light",
    paramtype2 = "facedir",
    groups = {choppy=3},
	node_box = {
		type = "fixed",
		fixed = {
			{-2/16, -2/16, -4/16, 2/16, 2/16, 4/16}, 
			{-2/16, -4/16, -2/16, 2/16, 4/16, 2/16}, 
			{-2/16, -3/16, -3/16, 2/16, 3/16, 3/16}, 
			{-3/16, -2/16, -2/16, -2/16, 8/16, 2/16},
			{2/16, -2/16, -2/16, 3/16, 8/16, 2/16},
			{-1/16, -8/16, -1/16, 1/16, -4/16, 1/16},    
		},
	},
    after_destruct = function(pos,oldnode)
        local node = core.get_node({x=pos.x,y=pos.y-1,z=pos.z})
        if node.name == "myladders:rope_for_box" then 
            core.remove_node({x=pos.x,y=pos.y-1,z=pos.z})
        end
    end,
})

core.register_abm({
	nodenames = {"myladders:ropebox"},
	interval = 1,
	chance = 1,
	action = function(pos, node)
	if core.get_node({x=pos.x,y=pos.y-1,z=pos.z}).name ~= 'air'  then return end
	        core.add_node({x=pos.x,y=pos.y-1,z=pos.z}, {name="myladders:rope_for_box"})
	end
})

core.register_abm({
	nodenames = {"myladders:rope_for_box"},
	interval = 1,
	chance = 1,
	action = function(pos, node)
	if core.get_node({x=pos.x,y=pos.y-1,z=pos.z}).name ~= 'air'  then return end
	        core.add_node({x=pos.x,y=pos.y-1,z=pos.z}, {name="myladders:rope_for_box"})
	end
})

core.register_craft({
	output = "myladders:ropebox",
	recipe = {
		{"default:steel_ingot","","default:steel_ingot"},
		{"default:steel_ingot","default:steel_ingot","default:steel_ingot"},
		{"","default:steel_ingot",""},
	}
})
