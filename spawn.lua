-- Original code by Rui: WTFPL


local time_min = 60
local time_hr = time_min * 60
local time_day = time_hr * 24

local spawn_chance = tonumber(minetest.settings:get("sneaker_spawn_chance")) or 18000
local spawn_interval = tonumber(minetest.settings:get("sneaker_spawn_interval")) or time_min * 40 -- Default interval is 40 minutes

minetest.register_abm({
	nodenames = {"default:dirt_with_grass","default:stone"},
	neighbors = {"air"},
	interval = spawn_interval,
	chance = spawn_chance,
	action = function(pos, node, _, active_object_count_wider)
		if active_object_count_wider > 5 then
			return
		end
		pos.y = pos.y+1
		if not minetest.get_node_light(pos) then
			return
		end
		if minetest.get_node_light(pos) > 5 then
			return
		end
		if minetest.get_node_light(pos) < -1 then
			return
		end
		if pos.y > 31000 then
			return
		end
		if minetest.get_node(pos).name ~= "air" then
			return
		end
		pos.y = pos.y+1
		if minetest.get_node(pos).name ~= "air" then
			return
		end
		minetest.add_entity(pos,"sneaker:sneaker")
	end
})
