require("Planet")

local someClass = Class({
    constructor = function(self, ...)
        self.hello = {...}
    end;
    Print = function(self)
        print(unpack(self.hello))
    end;
})

local newClass = someClass.new("Hello")
local aNewClass = someClass.new("Hello aaa", "asdasdas")
newClass:Print()
aNewClass:Print()