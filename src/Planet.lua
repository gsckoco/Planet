--[[



--]]
local Planet = {}
local env = getfenv(1)

-- Planet API

function Planet.copyTable(orig, copies)
    copies = copies or {}
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        if copies[orig] then
            copy = copies[orig]
        else
            copy = {}
            for orig_key, orig_value in next, orig, nil do
                copy[Planet.copyTable(orig_key, copies)] = Planet.copyTable(orig_value, copies)
            end
            copies[orig] = copy
            setmetatable(copy, Planet.copyTable(getmetatable(orig), copies))
        end
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
end

function Planet.Class(tab)
    local new = function(...)
        -- Create object
        local object = Planet.copyTable(tab)

        -- Run constructor
        if not object.constructor then
            object.constructor = (function() end)
        end
        object.constructor(...)
        object.constructor = nil

        -- Return object
        return object
    end
    return {new=new}
end

-- Set global environment
env.Class = Planet.Class

return Planet