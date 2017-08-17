local TimerHoster = class('TimerHoster')

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

function TimerHoster:passTime(dt)
    table.map(self.timers_, function(v)
        if v:passTime(dt) then
            v.discard = true
        end
        return v
    end)
    
    table.filter(self.timers_, function(v, k)
        return not v.discard
    end)
    
    return self
end

function TimerHoster:clearTimers()
    table.clear(self.timers_)
    return self
end

return TimerHoster
