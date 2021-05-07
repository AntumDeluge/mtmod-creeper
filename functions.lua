-- Functions for sneeker mod


local log_mods = minetest.settings:get_bool("log_mods", false)


-- Displays a message in log output
function sneeker.log(message)
	if log_mods then
		minetest.log('action', '[' .. sneeker.modname .. '] ' .. message)
	end
end

-- Displays a message in log output only if 'sneeker.debug' is set to 'true'
function sneeker.log_debug(message)
	if sneeker.debug then
		sneeker.log('DEBUG: ' .. message)
	end
end

-- Spawns a sneaker entity
function sneeker.spawn(pos)
	minetest.add_entity(pos, sneeker.mob_name)
	sneeker.log_debug('Spawned entity "' .. sneeker.mob_name .. '" at ' .. tostring(pos.x) .. ',' .. tostring(pos.y))
end
