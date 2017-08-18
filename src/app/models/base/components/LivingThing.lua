local LivingThing = class('LivingThing')

LivingThing.LIFE_ALIVE = 1
LivingThing.LIFE_DEAD = 0
LivingThing.LIFE_DISAPPEAR = -1

function LivingThing:ctor()
    self.life_ = LivingThing.LIFE_ALIVE
end

function LivingThing:getLife()
    return self.life_
end

function LivingThing:setLife(life)
    self.life_ = life
end

function LivingThing:isAlive()
    return self.life_ == LivingThing.LIFE_ALIVE
end

function LivingThing:isDead()
    return self.life_ == LivingThing.LIFE_DEAD
end

function LivingThing:isDisappear()
    return self.life_ == LivingThing.LIFE_DISAPPEAR
end

function LivingThing:setAlive()
    self.life_ = LivingThing.LIFE_ALIVE
end

function LivingThing:setDead()
    self.life_ = LivingThing.LIFE_DEAD
end

function LivingThing:setDisappear()
    self.life_ = LivingThing.LIFE_DISAPPEAR
end

return LivingThing
