local planet = require("Planet")

local vehicle = Class({
    topSpeed = 60;
    name = "";
    value = 100;
    manufacturer = "";
    engineStatus = "off";
    start = function(self) self.engineStatus = "on" end;
    stop = function(self) self.engineStatus = "off" end;
})

local car = Class({
    value = 200;
    horn = function(self)
        print("beep")
    end;
    constructor = function(self, spd, name, manu)
        self.topSpeed = spd
        self.name = name
        self.manufacturer = manu
    end;
}, vehicle)

local myCar = car.new(2015, "DeLorean", "DMC")
myCar:horn()
myCar:start()
print(myCar.name, myCar.value, myCar.engineStatus)