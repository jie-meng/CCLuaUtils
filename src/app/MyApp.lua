
local MyApp = class("MyApp", cc.load("mvc").AppBase)

function MyApp:onCreate()
    math.randomseed(os.time())
    cc.Director:getInstance():setProjection(cc.DIRECTOR_PROJECTION2_D)
end

return MyApp
