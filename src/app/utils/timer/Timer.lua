local Timer = class("Timer")

function Timer:ctor(interval, start_after, trigger_times, on_time, on_time_obj)
    
    self.interval_ = interval
    self.start_after_ = start_after
    self.trigger_times_ = trigger_times
    self.on_time_ = on_time
    self.on_time_obj_ = on_time_obj
    
    self.times_ = 0
    self.interval_passed_time_ = 0
    self.stopped_ = false
end

function Timer:passTime(dt)
    if not self.stopped_ then
        
        if self.start_after_ > 0 then
            self.start_after_ = self.start_after_ - dt
        else
            self.interval_passed_time_ = self.interval_passed_time_ + dt
            if self.interval_passed_time_ >= self.interval_ then
                self.interval_passed_time_ = 0
                self.times_ = self.times_ + 1
                self.on_time_(self.on_time_obj_, dt, self.times_)
                
                if self.trigger_times_ > 0 then
                    if self.times_ >= self.trigger_times_ then
                        self.stopped_ = true
                    end
                end
            end
        end
    end
    
    return self.stopped_
end

function Timer:getState()
    return { interval_passed_time = self.interval_passed_time_, times = self.times_, interval = self.interval_, trigger_times = self.trigger_times_ }
end

function Timer:stop()
    self.stopped_ = true
end

function Timer:isStopped()
    return self.stopped_
end

return Timer
