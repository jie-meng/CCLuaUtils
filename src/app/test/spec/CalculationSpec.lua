local Spec = import("app.test.Spec")

local CalculationSpec = class("CalculationSpec", Spec)

function CalculationSpec:ctor()
    CalculationSpec.super.ctor(self)
end

function CalculationSpec:run()
    self:describe('Calculation started', function ()
        self:it('go on to', function ()
            assert(1 == 1)
        end)
        
        self:it('co co', function ()
            assert(3 == 3)
        end)
        
        self:it('ma ta', function ()
            assert(0 == 0)
        end)
    end)
end

return CalculationSpec