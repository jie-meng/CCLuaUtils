local Spec = class("Spec")

function Spec:ctor()
    self.success_ = 0
    self.fail_ = 0
    self.indent_ = ''
end

function Spec:describe(name, callable)
    self:addIndent()
    
    printInfo(self.indent_ .. name)
    callable()
    
    self:removeIndent()
end

function Spec:it(name, callable)
    self:addIndent()

    printInfo(self.indent_ .. " - ".. name)
    local ok, err = pcall(callable)
    if not ok then
        printError(err)
        self.fail_ = self.fail_ + 1
    else
        self.success_ = self.success_ + 1
    end

    self:removeIndent()
end

function Spec:before(callable)
    callable()
end

function Spec:after(callable)
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

function Spec:addIndent()
    self.indent_ = self.indent_ .. '  '
end

function Spec:removeIndent()
    local len = string.len(self.indent_)
    if len >= 2 then
        self.indent_ = string.sub(self.indent_, 1, len - 2)
    end
end

return Spec
