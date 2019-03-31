require("Planet")

local dad = Class({
    height = "180";
    gender = "male";
    name = "daddy";
    address = "gay avenue";
})

local kid = Class({
    height = "100";
    gender = "male";
    name = "son";
}, dad)

local boi = kid.new()
local daddy = dad.new()
print(boi.address)
print(boi.height)
print(daddy.height)

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