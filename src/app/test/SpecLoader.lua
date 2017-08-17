local CalculationSpec = import('app.test.spec.utils.CalculationSpec')
local GeometrySpec = import('app.test.spec.utils.GeometrySpec')
local TimerSpec = import('app.test.spec.utils.timer.TimerSpec')
local TimerHosterSpec = import('app.test.spec.utils.timer.TimerHosterSpec')

local SpecLoader = class('SpecLoader')

function SpecLoader:ctor()
    self.specs_ = {}
    self:load()
end

function SpecLoader:getSpecs()
    return self.specs_
end

-- add spec class instance here
function SpecLoader:load()
    table.insert(self.specs_, CalculationSpec:create())
    table.insert(self.specs_, GeometrySpec:create())
    table.insert(self.specs_, TimerSpec:create())
    table.insert(self.specs_, TimerHosterSpec:create())
end

return SpecLoader
