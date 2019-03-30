local e = require("Planet")

local someClass = Class({
    input = {};
    constructor = function( ... )
        input = {...}
    end;
    Print = function()
        print("I havent done anything")
    end;
})

local exampleClass = Class({
    constructor = function( ... )
        input = {...}
    end;
    --[[Print = function()
        print(unpack(this.input))
    end;]]
},someClass)

local newClass = exampleClass.new("Hello","World")
for k,v in pairs(newClass) do
    print(k,v)
end