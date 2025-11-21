print("Starting reactor control")
local component = require("component")
local term = require("term")
local reactor = component.br_reactor or component.react

local activity = reactor.getActive()
if activity == true then reactor.setActive(false) end
reactor.setAllControlRodLevels(95.0)
reactor.setActive(false)
local max_energy = 10000000
local curr_energy = reactor.getEnergyStored()
local energy_per = curr_energy / max_energy * 100
local top_energy = 60
local bottom_energy = 30

local running = true
while running do 
    curr_energy = reactor.getEnergyStored()
    energy_per = curr_energy / max_energy * 100
    if energy_per < 10 then
        reactor.setAllControlRodLevels(0.0)
    elseif energy_per < 80 then
        reactor.setAllControlRodLevels(energy_per + 10)
    else
        reactor.setAllControlRodLevels(energy_per)
    end
    if energy_per < bottom_energy then
        reactor.setActive(true)
    elseif energy_per > top_energy then
        reactor.getActive(false)
    end
end