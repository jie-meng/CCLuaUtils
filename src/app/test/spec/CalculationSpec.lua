local Spec = import("app.test.Spec")
local Calculation = import("app.utils.Calculation")

local CalculationSpec = class("CalculationSpec", Spec)

function CalculationSpec:ctor()
    CalculationSpec.super.ctor(self)
end

function CalculationSpec:run()
    self:describe('Calculation', function ()
    
        self:describe('trimDeg', function ()
            self:it('should return 0 when value is 0', function ()
                assert(Calculation.trimDeg(0) == 0)
            end)
        
            self:it('should return -45 when value is 315', function ()
                assert(Calculation.trimDeg(-45) == 315)
            end)

            self:it('should return 359 when value is 359', function ()
                assert(Calculation.trimDeg(359) == 359)
            end)

            self:it('should return 0 when value is 360', function ()
                assert(Calculation.trimDeg(360) == 0)
            end)

            self:it('should return 90 when value is 450', function ()
                assert(Calculation.trimDeg(450) == 90)
            end)
        end)
    
        self:describe('calcNewPosition', function ()
            self:it('should return cc.p(220, 200) when position is cc.p(200, 200), direction is 0 and dist is 20', function ()
                local p = Calculation.calcNewPosition(cc.p(200, 200), 0, 20);
                
                assert(p.x == 220)
                assert(p.y == 200)
            end)
            
            self:it('should return cc.p(214, 185) when position is cc.p(200, 200), direction is 45 and dist is 20', function ()
                local p = Calculation.calcNewPosition(cc.p(200, 200), 45, 20);

                assert(math.floor(p.x) ==  214)
                assert(math.floor(p.y) == 185)
            end)
            
            self:it('should return cc.p(200, 180) when position is cc.p(200, 200), direction is 90 and dist is 20', function ()
                local p = Calculation.calcNewPosition(cc.p(200, 200), 90, 20);

                assert(math.floor(p.x) == 200)
                assert(math.floor(p.y) == 180)
            end)
            
            self:it('should return cc.p(185, 185) when position is cc.p(200, 200), direction is 135 and dist is 20', function ()
                local p = Calculation.calcNewPosition(cc.p(200, 200), 135, 20);

                assert(math.floor(p.x) == 185)
                assert(math.floor(p.y) == 185)
            end)
            
            self:it('should return cc.p(180, 200) when position is cc.p(200, 200), direction is 180 and dist is 20', function ()
                local p = Calculation.calcNewPosition(cc.p(200, 200), 180, 20);

                assert(math.floor(p.x) == 180)
                assert(math.floor(p.y) == 200)
            end)
            
            self:it('should return cc.p(185, 214) when position is cc.p(200, 200), direction is 225 and dist is 20', function ()
                local p = Calculation.calcNewPosition(cc.p(200, 200), 225, 20);

                assert(math.floor(p.x) == 185)
                assert(math.floor(p.y) == 214)
            end)
            
            self:it('should return cc.p(200, 220) when position is cc.p(200, 200), direction is 270 and dist is 20', function ()
                local p = Calculation.calcNewPosition(cc.p(200, 200), 270, 20);

                assert(math.floor(p.x) == 200)
                assert(math.floor(p.y) == 220)
            end)
            
            self:it('should return cc.p(214, 214) when position is cc.p(200, 200), direction is 315 and dist is 20', function ()
                local p = Calculation.calcNewPosition(cc.p(200, 200), 315, 20);

                assert(math.floor(p.x) == 214)
                assert(math.floor(p.y) == 214)
            end)
        end)
        
        self:describe('distance', function ()
            self:it('should return 100 when given (100, 100), (200, 100)', function ()
                assert(Calculation.distance(cc.p(100, 100), cc.p(200, 100)) == 100)
            end)
            
            self:it('should return 100 when given (100, 100), (100, 200)', function ()
                assert(Calculation.distance(cc.p(100, 100), cc.p(100, 200)) == 100)
            end)
            
            self:it('should return 100 when given (100, 100), (200, 200)', function ()
                assert(math.floor(Calculation.distance(cc.p(100, 100), cc.p(200, 200))) == 141)
            end)
        end)
        
        self:describe('targetDirection', function ()
            self:describe('with invalid argument', function ()
                self:it('should return null when self_position not given', function ()
                    assert(Calculation.targetDirection(undefined, cc.p(100, 100)) == nil)
                end)
                
                self:it('should return null when targetPos not given', function ()
                    assert(Calculation.targetDirection(cc.p(100, 100)) == nil)
                end)
            end)

            self:describe('with self_position (100, 100)', function ()
                local self_position = cc.p(100, 100);

                self:it('should return 0 when targetPos is (200, 100)', function ()
                   assert(Calculation.targetDirection(self_position, cc.p(200, 100)) == 0)
                end)

                self:it('should return 45 when targetPos is (200, 0)', function ()
                    assert(Calculation.targetDirection(self_position, cc.p(200, 0)) == 45)
                end)

                self:it('should return 90 when targetPos is (100, 0)', function ()
                    assert(Calculation.targetDirection(self_position, cc.p(100, 0)) == 90)
                end)

                self:it('should return 135 when targetPos is (0, 0)', function ()
                    assert(Calculation.targetDirection(self_position, cc.p(0, 0)) == 135)
                end)

                self:it('should return 180 when targetPos is (0, 100)', function ()
                    assert(Calculation.targetDirection(self_position, cc.p(0, 100)) == 180)
                end)

                self:it('should return 225 when targetPos is (0, 200)', function ()
                    assert(Calculation.targetDirection(self_position, cc.p(0, 200)) == 225)
                end)

                self:it('should return 270 when targetPos is (100, 200)', function ()
                    assert(Calculation.targetDirection(self_position, cc.p(100, 200)) == 270)
                end)

                self:it('should return 315 when targetPos is (200, 200)', function ()
                    assert(Calculation.targetDirection(self_position, cc.p(200, 200)) == 315)
                end)
            end)
        end)
    end)
end

return CalculationSpec
