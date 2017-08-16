local Spec = import("app.test.Spec")
local Geometry = import("app.utils.Geometry")

local GeometrySpec = class("GeometrySpec", Spec)

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
        
        self:describe('rectIntersectsLine', function ()
            self:describe('given rect(100, 100, 200, 100)', function ()
                local rect = cc.rect(100, 100, 200, 100)
                
                --line in rect
                self:it('should return true when line is (150, 150, 150, 151)', function ()
                    assert(Geometry.lineIntersectsRect(Geometry.line(150, 150, 150, 151), rect))
                end)
                
                self:it('should return true when line is (200, 150, 220, 180)', function ()
                    assert(Geometry.lineIntersectsRect(Geometry.line(200, 150, 220, 180), rect))
                end)
                
                --line intersect with rect
                self:it('should return true when line is (200, 150, 500, 600)', function ()
                    assert(Geometry.lineIntersectsRect(Geometry.line(200, 150, 500, 600), rect));
                end)
                
                --line touch border of rect
                self:it('should return false when line is (300, 200, 301, 201)', function ()
                    assert(not Geometry.lineIntersectsRect(Geometry.line(300, 200, 301, 201), rect))
                end)
                
                --line outside rect
                self:it('should return false when line is (400, 300, 500, 600)', function ()
                    assert(not Geometry.lineIntersectsRect(Geometry.line(400, 300, 500, 600), rect))
                end)
                
                self:it('should return false when line is (90, 105, 105, 90)', function ()
                    assert(not Geometry.lineIntersectsRect(Geometry.line(90, 105, 105, 90), rect))
                end)
            end)
        end)
    end)
end

return GeometrySpec
