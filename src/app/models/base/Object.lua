local Time = import('app.definitions.Time')
local Calculation = import('app.utils.Calculation')
local Timer = import('app.utils.timer.Timer')
local TimerHoster = import('app.utils.timer.TimerHoster')
local LivingThing = import('.components.LivingThing')
local ObjectImage = import('.components.ObjectImage')
local ObjectAnimation = import('.components.ObjectAnimation')

local Object = class('Object', LivingThing, TimerHoster)

function Object:ctor()
    LivingThing.ctor(self)
    TimerHoster.ctor(self)

    self.model_type_ = 'Object'
    self.position_ = cc.p(0, 0)
    self.move_direction_ = nil
    self.face_direction_ = 0
    self.speed_ = 0
    self.distance_ = 0
    self.image_ = ObjectImage:create('')
end

function Object:getModelType()
    return self.model_type_
end

function Object:_setModelType(model_type)
    self.model_type_ = model_type
    return self
end

function Object:getPosition()
    return self.position_
end

function Object:getMoveDirection()
    return self.move_direction_
end

function Object:getFaceDirection()
    return self.face_direction_
end

function Object:getSpeed()
    return self.speed_
end

function Object:getDistance()
    return self.distance_
end

function Object:getImage()
    return self.image_
end

function Object:getAnimation()
    return nil
end

return Object
