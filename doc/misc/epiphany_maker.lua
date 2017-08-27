-- Legend of Hondo
-- Generate the combinations of stats used when determining rewards while experimenting.
-- R. Bassett Jr.
-- Aug 27th, 2017
-- Output Example:
-- idea = (cr + fl + ma) / 3;
-- control = oq;

local params = {...}
local count = tonumber(params[1])

if (count) then 
	local rt = {"cr","cd","dr","hr","fl","ma","pe","oq","sr","ut"}
	
	math.randomseed( os.time() )

	for i = 1, count do
		-- get 4 random values that aren't the same
		local a = math.random(10)
		local b = math.random(10)
		local c = math.random(10)
		local d = math.random(10)
		
		
		while a == b or a == c or a == d do
			a = math.random(10)
		end
		
		while b == a or b == c or b == d do
			b = math.random(10)
		end
		
		while c == a or c == b or c == d do
			c = math.random(10)
		end
		
		while d == a or d == b or d == c do
			d = math.random(10)
		end
		
		print("idea = (" .. rt[a] .. " + " .. rt[b] .. " + " .. rt[c] .. ") / 3;")
		print("control = " .. rt[d] .. ";\n" )
	end
else 
	print("Usage: lua combos.lua [number]")
end
