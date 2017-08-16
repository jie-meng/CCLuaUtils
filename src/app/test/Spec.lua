local Table = import("app.utils.Table")

local Spec = class("Spec")

function Spec:ctor()
    self.success_ = 0
    self.fail_ = 0
    self.indent_ = 0
    self.before_funcs_ = {}
    self.after_funcs_ = {}
end

function Spec:describe(name, callable)
    self:addIndent()
    
    printInfo(self:getIndentWhiteSpace() .. name)
    callable()
    
    self:removeBeforeAfterFunc()
    self:removeIndent()
end

function Spec:it(name, callable)
    for i=1, self.indent_ do
        if self.before_funcs_[i] then
            self.before_funcs_[i]()
        end
    end

    printInfo(self:getIndentWhiteSpace() .. "  - ".. name)
    local ok, err = pcall(callable)
    if not ok then
        printError(err)
        self.fail_ = self.fail_ + 1
    else
        self.success_ = self.success_ + 1
    end
    
    for i=self.indent_, 1, -1 do
        if self.after_funcs_[i] then
            self.after_funcs_[i]()
        end
    end
end

function Spec:before(callable)
    if self.indent_ > 0 then
        self.before_funcs_[self.indent_] = callable    
    end
end

function Spec:after(callable)
    if self.indent_ > 0 then
        self.after_funcs_[self.indent_] = callable
    end
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
    self.indent_ = 0
    self.before_funcs_ = {}
    self.after_funcs_ = {}
end

function Spec:addIndent()
    self.indent_ = self.indent_ + 1
end

function Spec:removeIndent()
    if self.indent_ > 0 then
        self.indent_ = self.indent_ -1 
    end
end

function Spec:removeBeforeAfterFunc()
    self.before_funcs_[self.indent_] = nil
    self.after_funcs_[self.indent_] = nil
end

function Spec:getIndentWhiteSpace()
    local indent = ''
    for i=1, self.indent_ do
        indent = indent .. '  '
    end
    return indent
end

function Spec:print(fmt, ...)
    printInfo(self:getIndentWhiteSpace() .. fmt, ...)
end

return Spec
