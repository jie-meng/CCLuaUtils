local Object = import('.Object')
local RoleBaseProperty = import('.components.RoleBaseProperty')

local Role = class('Role', Object, RoleBaseProperty)

function Role:ctor()
    Object.ctor(self)
    RoleBaseProperty.ctor(self)
    
    self:_setModelType('Role')
    self.hp_max_ = 1
    self.hp_ = 1
    self.sp_max_ = 0
    self.sp_ = 0
    self.mp_max_ = 1
    self.mp_ = 0
end

function Role:getHPMax()
    return self.hp_max_
end

function Role:setHPMax(hp_max)
    self.hp_max_ = hp_max
    return self
end

function Role:getHP()
    return self.hp_
end

function Role:setHP(hp)
    self.hp_ = hp
    self:__adjustHP()
    return self
end

function Role:increaseHP(value)
    self.hp_ = self.hp_ + value
    self:__adjustHP()
    return self
end

function Role:decreaseHP(value)
    return self:increaseHP(-value)
end

function Role:getSPMax()
    return self.sp_max_
end

function Role:setSPMax(sp_max)
    self.sp_max_ = sp_max
    return self
end

function Role:getSP()
    return self.sp_
end

function Role:setSP(sp)
    self.sp_ = sp
    self:__adjustSP()
    return self
end

function Role:increaseSP(value)
    self.sp_ = self.sp_ + value
    self:__adjustSP()
    return self
end

function Role:decreaseSP(value)
    return self:increaseSP(-value)
end

function Role:getMPMax()
    return self.mp_max_
end

function Role:setMPMax(mp_max)
    self.mp_max_ = mp_max
    return self
end

function Role:getMP()
    return self.mp_
end

function Role:setMP(mp)
    self.mp_ = mp
    self:__adjustMP()
    return self
end

function Role:increaseMP(value)
    self.mp_ = self.mp_ + value
    self:__adjustMP()
    return self
end

function Role:decreaseMP(value)
    return self:increaseMP(-value)
end

function Role:__adjustHP()
    if self.hp_ > self.hp_max_ then
        self.hp_ = self.hp_max_
    elseif self.hp_ < 0 then
        self.hp_ = 0
    end
    
    return self
end

function Role:__adjustSP()
    if self.sp_ > self.sp_max_ then
        self.sp_ = self.sp_max_
    elseif self.sp_ < 0 then
        self.sp_ = 0
    end
    
    return self
end

function Role:__adjustMP()
    if self.mp_ > self.mp_max_ then
        self.mp_ = self.mp_max_
    elseif self.mp_ < 0 then
        self.mp_ = 0
    end
    
    return self
end

return Role
