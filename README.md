# Planet ![GitHub All Releases](https://img.shields.io/github/downloads/gsckoco/Planet/total.svg) ![GitHub contributors](https://img.shields.io/github/contributors/gsckoco/Planet.svg) ![GitHub](https://img.shields.io/github/license/gsckoco/Planet.svg) ![GitHub issues](https://img.shields.io/github/issues/gsckoco/Planet.svg) ![GitHub closed issues](https://img.shields.io/github/issues-closed/gsckoco/Planet.svg)
Object-orientated scripting for Lua made easier.
# Description
Lua doesn't have built in OOP, which makes developers have to make their own manually. Planet is aimed to make using OOP within Lua a lot easier, and faster.

# Usage
Firstly, require the module. In Roblox, you can use the ID 3044032874:
```lua
planet = require(3044032874)
```
To create a class you use the ```Class```, this is put into the current environment by default.
```lua
Class( ClassTable )
-- Returns the class. To create a new class you run the `new` function,
-- this is part of the table that is returned.
```
```lua
local vehicle = Class({
    topSpeed = 60;
    name = "";
    manufacturer = "";
    value = 100;
    constructor = function(self, name, manufacturer, topSpeed)
        self.name = name
        self.topSpeed = topSpeed
        self.manufacturer = manufacturer
    end
})
```
If you can't access ```Class``` its most likely not been put into your environment, if thats the case you can just do
```lua
planet.Class( ... )
```
instead.

Inheritance can be done by adding the class you are inheriting from.
```lua
Class({}, InheritedClass)
```
An example would be;
```lua
local car = Class({
    value = 200;
    horn = function(self)
        print("beep")
    end;
}, vehicle)
```
Now when you call `car.new("DeLorean","DMC",85)` that will now have all of the functions and variables from the `vehicle` class, unless you override them.

[Look here for more examples](https://github.com/gsckoco/Planet/tree/master/examples)
