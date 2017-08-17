local Spec = import("app.test.Spec")
local Calculation = import("app.utils.Calculation")

local CalculationSpec = class("CalculationSpec", Spec)

function CalculationSpec:run()
    self:describe('Calculation', function ()
        
        self:describe('trimDeg', function ()
        
            self:it('should return 0 when value is 0', function ()
                self:assertEquals(0, Calculation.trimDeg(0))
            end)
        
            self:it('should return -45 when value is 315', function ()
                self:assertEquals(315, Calculation.trimDeg(-45))
            end)

            self:it('should return 359 when value is 359', function ()
                self:assertEquals(359, Calculation.trimDeg(359))
            end)

            self:it('should return 0 when value is 360', function ()
                self:assertEquals(0, Calculation.trimDeg(360))
            end)

            self:it('should return 90 when value is 450', function ()
                self:assertEquals(90, Calculation.trimDeg(450))
            end)
        end)
    
        self:describe('calcNewPosition', function ()
            self:it('should return cc.p(220, 200) when position is cc.p(200, 200), direction is 0 and dist is 20', function ()
                local p = Calculation.calcNewPosition(cc.p(200, 200), 0, 20);
                
                self:assertEquals(220, p.x)
                self:assertEquals(200, p.y)
            end)
            
            self:it('should return cc.p(214, 185) when position is cc.p(200, 200), direction is 45 and dist is 20', function ()
                local p = Calculation.calcNewPosition(cc.p(200, 200), 45, 20);

                self:assertEquals(214, math.floor(p.x))
                self:assertEquals(185, math.floor(p.y))
            end)
            
            self:it('should return cc.p(200, 180) when position is cc.p(200, 200), direction is 90 and dist is 20', function ()
                local p = Calculation.calcNewPosition(cc.p(200, 200), 90, 20);

                self:assertEquals(200, math.floor(p.x))
                self:assertEquals(180, math.floor(p.y))
            end)
            
            self:it('should return cc.p(185, 185) when position is cc.p(200, 200), direction is 135 and dist is 20', function ()
                local p = Calculation.calcNewPosition(cc.p(200, 200), 135, 20);

                self:assertEquals(185, math.floor(p.x))
                self:assertEquals(185, math.floor(p.y))
            end)
            
            self:it('should return cc.p(180, 200) when position is cc.p(200, 200), direction is 180 and dist is 20', function ()
                local p = Calculation.calcNewPosition(cc.p(200, 200), 180, 20);

                self:assertEquals(180, math.floor(p.x))
                self:assertEquals(200, math.floor(p.y))
            end)
            
            self:it('should return cc.p(185, 214) when position is cc.p(200, 200), direction is 225 and dist is 20', function ()
                local p = Calculation.calcNewPosition(cc.p(200, 200), 225, 20);

                self:assertEquals(185, math.floor(p.x))
                self:assertEquals(214, math.floor(p.y))
            end)
            
            self:it('should return cc.p(200, 220) when position is cc.p(200, 200), direction is 270 and dist is 20', function ()
                local p = Calculation.calcNewPosition(cc.p(200, 200), 270, 20);

                self:assertEquals(200, math.floor(p.x))
                self:assertEquals(220, math.floor(p.y))
            end)
            
            self:it('should return cc.p(214, 214) when position is cc.p(200, 200), direction is 315 and dist is 20', function ()
                local p = Calculation.calcNewPosition(cc.p(200, 200), 315, 20);

                self:assertEquals(214, math.floor(p.x))
                self:assertEquals(214, math.floor(p.y))
            end)
        end)
        
        self:describe('distance', function ()
            self:it('should return 100 when given (100, 100), (200, 100)', function ()
                self:assertEquals(100, Calculation.distance(cc.p(100, 100), cc.p(200, 100)))
            end)
            
            self:it('should return 100 when given (100, 100), (100, 200)', function ()
                self:assertEquals(100, Calculation.distance(cc.p(100, 100), cc.p(100, 200)))
            end)
            
            self:it('should return 141 when given (100, 100), (200, 200)', function ()
                self:assertEquals(141, math.floor(Calculation.distance(cc.p(100, 100), cc.p(200, 200))))
            end)
        end)
        
        self:describe('targetDirection', function ()
            self:describe('given invalid argument', function ()
                self:it('should return null when self_position not given', function ()
                    self:assertNil(Calculation.targetDirection(undefined, cc.p(100, 100)))
                end)
                
                self:it('should return null when targetPos not given', function ()
                    self:assertNil(Calculation.targetDirection(cc.p(100, 100)))
                end)
            end)

            self:describe('given self_position (100, 100)', function ()
                local self_position = cc.p(100, 100);

                self:it('should return 0 when targetPos is (200, 100)', function ()
                   self:assertEquals(0, Calculation.targetDirection(self_position, cc.p(200, 100)))
                end)

                self:it('should return 45 when targetPos is (200, 0)', function ()
                    self:assertEquals(45, Calculation.targetDirection(self_position, cc.p(200, 0)))
                end)

                self:it('should return 90 when targetPos is (100, 0)', function ()
                    self:assertEquals(90, Calculation.targetDirection(self_position, cc.p(100, 0)))
                end)

                self:it('should return 135 when targetPos is (0, 0)', function ()
                    self:assertEquals(135, Calculation.targetDirection(self_position, cc.p(0, 0)))
                end)

                self:it('should return 180 when targetPos is (0, 100)', function ()
                    self:assertEquals(180, Calculation.targetDirection(self_position, cc.p(0, 100)))
                end)

                self:it('should return 225 when targetPos is (0, 200)', function ()
                    self:assertEquals(225, Calculation.targetDirection(self_position, cc.p(0, 200)))
                end)

                self:it('should return 270 when targetPos is (100, 200)', function ()
                    self:assertEquals(270, Calculation.targetDirection(self_position, cc.p(100, 200)))
                end)

                self:it('should return 315 when targetPos is (200, 200)', function ()
                    self:assertEquals(315, Calculation.targetDirection(self_position, cc.p(200, 200)))
                end)
            end)
        end)
    end)
end

return CalculationSpec
