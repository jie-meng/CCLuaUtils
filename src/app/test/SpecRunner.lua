local CalculationSpec = import("app.test.spec.CalculationSpec")

local SpecRunner = class("SpecRunner")

function SpecRunner:ctor()
    self.specs_ = nil
    self:loadSpec()
    
    self.success_ = 0
    self.fail_ = 0
end

function SpecRunner:loadSpec()
    self.specs_ = {}
    table.insert(self.specs_, CalculationSpec:create())
end

function SpecRunner:start()
    printInfo('\n\n****************************\n      SpecRunner start\n****************************\n\n')

    self:clear()

    for i, v in ipairs(self.specs_) do
        v:clear()
        v:run()
        self.success_ =  self.success_ + v:getSuccess()
        self.fail_ = self.fail_ + v:getFail()
    end
    
    self:summary()
    
    printInfo('\n\n****************************\n      SpecRunner end\n****************************\n\n')
end

function SpecRunner:clear()
    self.success_ = 0
    self.fail_ = 0
end

function SpecRunner:summary()
    local print_func = printInfo
    if self.fail_ > 0 then
        print_func = printError
    end
    print_func('\n\n  Run %d tests totally, %d success, %d fail.\n', self.success_ + self.fail_, self.success_, self.fail_)
end
    
return SpecRunner
