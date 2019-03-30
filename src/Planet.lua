--[[



--]]
local Planet = {}
local env = getfenv(1)

-- Planet API

function Planet.copyTable(inTable)
    return {unpack(inTable)}
end

function Planet.class(class, inheritance)
    local inherit = getfenv(
        function()
            local x = Planet.copyTable(inheritance)
            return inheritance~=nil and x or {}
        end
    )
    local object = Planet.copyTable(class)
    object = setmetatable(object, inherit)
    rawset(inherit, "self", inherit)
    rawset(inherit, "this", inherit)
    local new = function(...)
        if class.constructor then
            class.constructor(...)
        end
        return class
    end
    setmetatable({class = class, new = new}, inherit)
    return {class = class, new = new}
end

env.Class = Planet.class -- Add it to the current environment because for easier use.

return Planet
