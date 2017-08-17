local Spec = import('app.test.Spec')
local Timer = import('app.utils.timer.Timer')
local TimerHoster = import('app.utils.timer.TimerHoster')

local TimerHosterSpec = class('TimerHostSpec', Spec)

function TimerHosterSpec:run()
    self:describe('TimerHoster', function ()
        self:describe('given TimerHoster add 2 timers: Timer(1, 0, 3), Timer(1, 0, 5)', function ()
            local timer_hoster = nil
            local timer1 = nil
            local timer2 = nil
            
            self:beforeEach(function ()
                timer_hoster = TimerHoster:create()
                timer1 = Timer:create(1, 0, 3)
                timer2 = Timer:create(1, 0, 5)
                timer_hoster:addTimer(timer1)
                timer_hoster:addTimer(timer2)
            end)
            
            self:it('should get timer1 with id = tostring(timer1)', function ()
                self:assertEquals(timer1, timer_hoster:getTimer(tostring(timer1)))
            end)
            
            self:it('should get timer2 with id = tostring(timer2)', function ()
                self:assertEquals(timer2, timer_hoster:getTimer(tostring(timer2)))
            end)
            
            self:it('should get timer2 after remove timer1', function ()
                timer_hoster:removeTimer(tostring(timer1))
                self:assertEquals(timer2, timer_hoster:getTimer(tostring(timer2)))
            end)
            
            self:it('should not get timer1 after remove timer1', function ()
                timer_hoster:removeTimer(tostring(timer1))
                self:assertNil(timer_hoster:getTimer(tostring(timer1)))
            end)
            
            self:it('should not get timer1 and timer2 after TimerHoster clear', function ()
                timer_hoster:clearTimers()
                self:assertNil(timer_hoster:getTimer(tostring(timer1)))
                self:assertNil(timer_hoster:getTimer(tostring(timer2)))
            end)
            
            self:it('should get timer1 state (trigger_times == 3) with id = tostring(timer1)', function ()
                self:assertEquals(3, timer_hoster:getTimerState(tostring(timer1)).trigger_times)
            end)
            
            self:it('should get timer2 state (trigger_times == 5) with id = tostring(timer2)', function ()
                self:assertEquals(5, timer_hoster:getTimerState(tostring(timer2)).trigger_times)
            end)
            
            self:it('should keep timer1 and timer2 after 2.9 seconds passed', function ()
                self:timerHosterPassTime(timer_hoster, 2.9)
                self:assertNotNil(timer_hoster:getTimer(tostring(timer1)))
                self:assertNotNil(timer_hoster:getTimer(tostring(timer2)))
            end)
            
            self:it('should only keep timer2 after 3.1 seconds passed', function ()
                self:timerHosterPassTime(timer_hoster, 3.1)
                self:assertNil(timer_hoster:getTimer(tostring(timer1)))
                self:assertNotNil(timer_hoster:getTimer(tostring(timer2)))
            end)
            
            self:it('should neither keep timer1 nor timer2 after 5.1 seconds passed', function ()
                self:timerHosterPassTime(timer_hoster, 5.1)
                self:assertNil(timer_hoster:getTimer(tostring(timer1)))
                self:assertNil(timer_hoster:getTimer(tostring(timer2)))
            end)
        end)
        
        self:describe('given TimerHoster add 2 timers: Timer(1, 0, 3), Timer(1, 0, 5), add timers with same id and fail_if_exist == false', function ()
            local timer_hoster = nil
            local timer1 = nil
            local timer2 = nil
            
            self:beforeEach(function ()
                timer_hoster = TimerHoster:create()
                timer1 = Timer:create(1, 0, 3)
                timer2 = Timer:create(1, 0, 5)
                timer_hoster:addTimer(timer1, 'timer')
                timer_hoster:addTimer(timer2, 'timer')
            end)
            
            self:it('should add timer2 success with same id as timer1 and timer1 would be replaced by timer2', function ()
                self:assertNotEquals(timer1, timer_hoster:getTimer('timer'))
                self:assertEquals(timer2, timer_hoster:getTimer('timer'))
            end)
        end)
        
        self:describe('given TimerHoster add 2 timers: Timer(1, 0, 3), Timer(1, 0, 5), add timers with same id and fail_if_exist == true', function ()
            local timer_hoster = nil
            local timer1 = nil
            local timer2 = nil
            
            self:beforeEach(function ()
                timer_hoster = TimerHoster:create()
                timer1 = Timer:create(1, 0, 3)
                timer2 = Timer:create(1, 0, 5)
                timer_hoster:addTimer(timer1, 'timer', true)
                timer_hoster:addTimer(timer2, 'timer', true)
            end)
            
            self:it('should add timer2 failed with same id as timer1', function ()
                self:assertEquals(timer1, timer_hoster:getTimer('timer'))
                self:assertNotEquals(timer2, timer_hoster:getTimer('timer'))
            end)
        end)
    end)
end

function TimerHosterSpec:timerHosterPassTime(timer_host, seconds)
    local dt = 0
    while dt < seconds do
        timer_host:passTime(0.1)
        dt = dt + 0.1
    end
end

return TimerHosterSpec
