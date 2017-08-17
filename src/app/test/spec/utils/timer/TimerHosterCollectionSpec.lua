local Spec = import('app.test.Spec')
local Timer = import('app.utils.timer.Timer')
local TimerHoster = import('app.utils.timer.TimerHoster')
local TimerHosterCollection = import('app.utils.timer.TimerHosterCollection')

local TimerHosterCollectionSpec = class('TimerHosterCollectionSpec', Spec)

function TimerHosterCollectionSpec:run()
    self:describe('TimerHosterCollectionSpec', function ()
        self:describe('given TimerHosterCollection, TimerHoster1 with 2 timers, TimerHoster2 with 1 timer', function ()
            local timer_host_collection = nil
            local timer_hoster1 = nil
            local timer_hoster2 = nil            
            local timer1 = nil
            local timer2 = nil
            local timer3 = nil
            
            self:beforeEach(function ()
                timer1 = Timer:create(1, 0, 3)
                timer2 = Timer:create(1, 0, 4)
                timer3 = Timer:create(1, 0, 5)
                timer_hoster1 = TimerHoster:create()
                timer_hoster2 = TimerHoster:create()
                timer_host_collection = TimerHosterCollection:create()
                timer_hoster1:addTimer(timer1)
                timer_hoster1:addTimer(timer2)
                timer_hoster2:addTimer(timer3)
                timer_host_collection:addTimerHoster(timer_hoster1)
                timer_host_collection:addTimerHoster(timer_hoster2)
            end)
            
            self:it('should all 3 timers triggered 2 times after2.5 seconds', function ()
                self:timerHosterCollectionPassTime(timer_host_collection, 2.5)
                self:assertEquals(2, timer1:getState().times)
                self:assertEquals(2, timer2:getState().times)
                self:assertEquals(2, timer3:getState().times)
            end)
        end)
        
        self:describe('given TimerHosterCollection, and TimerHoster1 with 2 timers, TimerHoster2 with 1 timer in a TimerHostTable', function ()
            local timer_host_collection = nil
            local timer_hoster1 = nil
            local timer_hoster2 = nil            
            local timer1 = nil
            local timer2 = nil
            local timer3 = nil
            
            self:beforeEach(function ()
                timer1 = Timer:create(1, 0, 3)
                timer2 = Timer:create(1, 0, 4)
                timer3 = Timer:create(1, 0, 5)
                timer_hoster1 = TimerHoster:create()
                timer_hoster2 = TimerHoster:create()
                timer_host_collection = TimerHosterCollection:create()
                timer_hoster1:addTimer(timer1)
                timer_hoster1:addTimer(timer2)
                timer_hoster2:addTimer(timer3)
                timer_host_collection:addTimerHosters({ timer_hoster1, timer_hoster2 })
            end)
            
            self:it('should all 3 timers triggered 2 times after2.5 seconds', function ()
                self:timerHosterCollectionPassTime(timer_host_collection, 2.5)
                self:assertEquals(2, timer1:getState().times)
                self:assertEquals(2, timer2:getState().times)
                self:assertEquals(2, timer3:getState().times)
            end)
        end)
    end)
end

function TimerHosterCollectionSpec:timerHosterCollectionPassTime(timer_host_collection, seconds)
    local dt = 0
    while dt < seconds do
        timer_host_collection:passTime(0.1)
        dt = dt + 0.1
    end
end

return TimerHosterCollectionSpec
