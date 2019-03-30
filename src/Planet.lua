--[[



--]]

local Planet = {}
local env = {}

local function copyTable(inT)
    return {unpack(inT)}
end

if _VERSION > "Lua 5.1" then
    env = copyTable(_ENV)
else
    env = copyTable(_G)
end

local env = getfenv(1)

-- Planet API

function Planet.class(class)
    return {class = class, 
        new = function(class) 
            if class.constructor then
                class.constructor()
            end
            -- TO DO: SET METATABLE
            return class
        end}
end

return Planet