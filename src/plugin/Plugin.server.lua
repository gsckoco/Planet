--[[
    Plugin.lua
    Written by Sublivion
--]]

MOD_TEMPLATE = [[planet = require(3044032874)
exports = {}

return exports]]

SCRIPT_TEMPLATE = [[planet = require(3044032874)
print("Hello planet!")
]]

DEF_MOD = [[local module = {}

return module
]]

DEF_SCRIPT = [[print("Hello world!")
]]

game.DescendantAdded:Connect(function(newScript)
    if newScript:IsA('LuaSourceContainer') then
        newScript:GetPropertyChangedSignal('Parent'):wait()
        if newScript.Source == DEF_SCRIPT then
            newScript.Source = SCRIPT_TEMPLATE
        elseif newScript.Source == DEF_MOD then
            newScript.Source = MOD_TEMPLATE
        end
    end
end)

warn('Default scripts are now being replaced by Planet')