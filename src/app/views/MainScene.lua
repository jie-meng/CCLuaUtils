local StringsImporter = import("app.values.StringsImporter")

local Strings = StringsImporter.import('app.values.Strings')

local MainScene = class("MainScene", cc.load("mvc").ViewBase)

function MainScene:onCreate()
    -- add background image
    display.newSprite("HelloWorld.png")
        :move(display.center)
        :addTo(self)

    -- add HelloWorld label
    cc.Label:createWithSystemFont(Strings.GameTitle, "Arial", 40)
        :move(display.cx, display.cy + 200)
        :addTo(self)
end

return MainScene
