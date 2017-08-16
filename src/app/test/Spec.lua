local Spec = class("Spec")

function Spec:ctor()
    self.success_ = 0
    self.fail_ = 0
end

function Spec:describe(name, callable)
    printInfo(name)
    callable()
end

function Spec:it(name, callable)
    printInfo("  - ".. name)
    local ok, err = pcall(callable)
    if not ok then
        printError(err)
        self.fail_ = self.fail_ + 1
    else
        self.success_ = self.success_ + 1
    end
end

function Spec:before(callable)
    callable()
end

function Spec:run()
end

function Spec:getSuccess()
    return self.success_
end

function Spec:getFail()
     return self.fail_
end

function Spec:clear()
    self.success_ = 0
    self.fail_ = 0
end

return Spec