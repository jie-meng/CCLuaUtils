local Table = import("app.utils.Table")

local TimerHoster = class("TimerHoster")

function TimerHoster:ctor()
    self.timers_ = {}
end

function TimerHoster:addTimer(timer, id, fail_if_exists)
    if not id then
        id = tostring(timer)
    end
    
    if self.timers_[id] then
        if not fail_if_exists then
            self.timers_[id] = timer
        end
    else
        self.timers_[id] = timer
    end
    return self
end

function TimerHoster:removeTimer(id)
    if id then
        self.timers_[id] = nil
    end
    return self
end

function TimerHoster:getTimer(id)
    return self.timers_[id]
end

function TimerHoster:getTimerState(id)
    if not self.timers_[id] then
        return nil
    end
    
    return self.timers_[id]:getState()
end

function TimerHoster:updateTimers(dt)
    local timers = Table.shallowCopy(self.timers_)
    for k, v in pairs(timers) do
        if v:passTime(dt) then
            v.discard = true
        end
    end
    
    local timers_tmp = {}
    for k, v in pairs(self.timers_) do
        if not v.discard then
            timers_tmp[k] = v
        end
    end
    self.timers_ = timers_tmp
    return self
end

function TimerHoster:clearTimers()
    self.timers_ = {}
    return self
end

return TimerHoster