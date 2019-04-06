--[[
    Planet.lua
    Written by Sublivion and gs_ck
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
    else
        copy = orig
    end
    return copy
end

function Planet.Class(tab, inheritClass)
    local class = Planet.copyTable(tab)
    class.new = function(...)
        local object = Planet.copyTable(class)
        local inherit = inheritClass and inheritClass.new and inheritClass.new(...)
        setmetatable(object, {
            __index = function(self, i)
                return rawget(self, i) or inherit and rawget(inherit, i)
            end
        })      
        if not object.constructor then
            object.constructor = (function() end)
        end
        object:constructor(...)
        object.constructor = nil
        return object
    end
    return class
end

-- Set global environment
env.Class = Planet.Class

return Planet