local SpecRunner = import("app.test.SpecRunner")

local MyApp = class("MyApp", cc.load("mvc").AppBase)

function MyApp:onCreate()
    math.randomseed(os.time())
    cc.Director:getInstance():setProjection(cc.DIRECTOR_PROJECTION2_D)
    
    if SWITCH_TEST then
        local spec_runner = SpecRunner:create()
        spec_runner:start()
    end
end

return MyApp