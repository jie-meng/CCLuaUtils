local Spec = import("app.test.Spec")
local Timer = import("app.utils.timer.Timer")

local TimerSpec = class("TimerSpec", Spec)

function TimerSpec:run()
    self:describe('Timer', function ()
        self:describe('given Timer:create(1, 0, 3, on_time)', function ()
            local timer = nil
            local times = 0
        
            self:before(function ()
                times = 0
                timer = Timer:create(1, 0, 3, 
                    function (o)
                        times = times + 1
                    end)
            end)
            
            self:it('should on time 0 times after 0.9 seconds', function ()
                self:passSeconds(timer, 0.9)
                assert(times == 0)
            end)
           
            self:it('should on time 1 times after 1.9 seconds', function ()
                self:passSeconds(timer, 1.9)
                assert(times == 1)
            end) 
          
            self:it('should on time 2 times after 2.1 seconds', function ()
                self:passSeconds(timer, 2.1)
                assert(times == 2)
            end)

            self:it('should on time 3 times after 3.1 seconds', function ()
                self:passSeconds(timer, 3.1)
                assert(times == 3)
            end)
          
            self:it('should on time 3 times after 10 seconds', function ()
                self:passSeconds(timer, 10)
                assert(times == 3)
            end)
            
            self:it('should running after 2.9 seconds', function()
                self:passSeconds(timer, 2.9)
                assert(not timer:isStopped())
            end)
            
            self:it('should stop after 3.1 seconds', function()
                self:passSeconds(timer, 3.1)
                assert(timer:isStopped())
            end)
        end)
        
        self:describe('given Timer:create(1, 2, 3, on_time)', function ()
            local timer = nil
            local times = 0
        
            self:before(function ()
                times = 0
                timer = Timer:create(1, 2, 3, 
                    function (o)
                        times = times + 1
                    end)
            end)
            
            self:it('should on time 0 times after 2.9 seconds', function ()
                self:passSeconds(timer, 2.9)
                assert(times == 0)
            end)
           
            self:it('should on time 1 times after 3.9 seconds', function ()
                self:passSeconds(timer, 3.9)
                assert(times == 1)
            end) 
          
            self:it('should on time 2 times after 4.1 seconds', function ()
                self:passSeconds(timer, 4.1)
                assert(times == 2)
            end)

            self:it('should on time 3 times after 5.1 seconds', function ()
                self:passSeconds(timer, 5.1)
                assert(times == 3)
            end)
          
            self:it('should on time 3 times after 10 seconds', function ()
                self:passSeconds(timer, 10)
                assert(times == 3)
            end)
            
            self:it('should running after 4.9 seconds', function()
                self:passSeconds(timer, 2.9)
                assert(not timer:isStopped())
            end)
            
            self:it('should stop after 5.1 seconds', function()
                self:passSeconds(timer, 5.1)
                assert(timer:isStopped())
            end)
        end)
        
        self:describe('given Timer:create(1, 0, 1, on_time, { a = 1, b = 2 })', function ()
            local timer = nil
            local receiver = nil
        
            self:before(function ()
                receiver = nil
                timer = Timer:create(1, 0, 1, 
                    function (o)
                        receiver = o
                    end, { a = 1, b = 2 })
            end)
            
            self:it('should not receive object after 0.9 seconds', function ()
                self:passSeconds(timer, 0.9)
                assert(not receiver)
            end)
            
            self:it('should receive object after 1.1 seconds', function ()
                self:passSeconds(timer, 1.1)
                assert(receiver)
                assert(receiver.a == 1)
                assert(receiver.b == 2)
            end)
        end)
        
        self:describe('given Timer:create(1, 0, 1, on_time) and call Timer:stop() on 0.5 second', function ()
            local timer = nil
            local on_time = false
        
            self:before(function ()
                timer = Timer:create(1, 0, 3, 
                    function (o)
                        on_time = true
                    end)
                
                --stop timer
                self:passSeconds(timer, 0.5)
                timer:stop()
            end)

            self:it('should not on time after 20 seconds', function ()
                assert(not on_time)
            end)
        end)
        
    end)
end

function TimerSpec:passSeconds(timer, seconds)
    local dt = 0
    while dt < seconds do
        timer:passTime(0.1)
        dt = dt + 0.1
    end
end

return TimerSpec
