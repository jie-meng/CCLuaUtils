local Spec = import("app.test.Spec")
local Geometry = import("app.utils.Geometry")

local GeometrySpec = class("GeometrySpec", Spec)

function GeometrySpec:ctor()
    GeometrySpec.super.ctor(self)
end

function GeometrySpec:run()
    self:describe('Geometry', function ()
        self:describe('line', function ()
            self:it('should return { x1: 1, y1: 2, x2: 3, y2: 4 } when arguments are (1, 2, 3, 4)', function ()
                local line = Geometry.line(1, 2, 3, 4)
                assert(line.x1 == 1)
                assert(line.y1 == 2)
                assert(line.x2 == 3)
                assert(line.y2 == 4)
            end)
            
            self:it('should return { x1: 100, y1: 200, x2: 300, y2: 400 } when arguments are (cc.p(100, 200), cc.p(300, 400))', function ()
                local line = Geometry.line(cc.p(100, 200), cc.p(300, 400))
                assert(line.x1 == 100)
                assert(line.y1 == 200)
                assert(line.x2 == 300)
                assert(line.y2 == 400)
            end)
        end)
    end)
end

return GeometrySpec