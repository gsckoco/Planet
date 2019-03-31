require("Planet")

local someClass = Class({
    constructor = function(...)
        hello = {...}
    end;
    Print = function()
        print(unpack(hello))
    end;
})

local newClass = someClass.new("Hello")
local aNewClass = someClass.new("Hello aaa", "asdasdas")

newClass:Print()
aNewClass:Print()