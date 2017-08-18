local Spec = import('app.test.Spec')
local Role = import('app.models.base.Role')

local RoleSpec = class('RoleSpec', Spec)

function RoleSpec:run()
    self:describe('RoleSpec', function ()
        self:describe('given Role with HP (75/100), SP (18/30), MP (5/20)', function ()
            local role = nil
            
            self:beforeEach(function ()
                role = Role:create()
                role:setHPMax(100)
                    :setHP(75)
                    :setSPMax(30)
                    :setSP(18)
                    :setMPMax(20)
                    :setMP(5)
            end)
            
            self:describe('getHP', function ()
                self:it('should return 85 after setHP(85)', function ()
                    role:setHP(85)
                    self:assertEquals(85, role:getHP())
                end)
                
                self:it('should return 0 after setHP(-1)', function ()
                    role:setHP(-1)
                    self:assertEquals(0, role:getHP())
                end)

                self:it('should return 100 after setHP(120)', function ()
                    role:setHP(120)
                    self:assertEquals(100, role:getHP())
                end)
                
                self:it('should return 80 after increateHP(5)', function ()
                    role:increaseHP(5)
                    self:assertEquals(80, role:getHP())
                end)
                
                self:it('should return 100 after increateHP(50)', function ()
                    role:increaseHP(50)
                    self:assertEquals(100, role:getHP())
                end)
                
                self:it('should return 70 after decreaseHP(5)', function ()
                    role:decreaseHP(5)
                    self:assertEquals(70, role:getHP())
                end)
                
                self:it('should return 0 after decreaseHP(100)', function ()
                    role:decreaseHP(100)
                    self:assertEquals(0, role:getHP())
                end)
            end)
            
            self:describe('getSP', function ()
                self:it('should return 12 after setSP(12)', function ()
                    role:setSP(12)
                    self:assertEquals(12, role:getSP())
                end)
                
                self:it('should return 0 after setSP(-1)', function ()
                    role:setSP(-1)
                    self:assertEquals(0, role:getSP())
                end)

                self:it('should return 30 after setSP(120)', function ()
                    role:setSP(120)
                    self:assertEquals(30, role:getSP())
                end)

                self:it('should return 23 after increateSP(5)', function ()
                    role:increaseSP(5)
                    self:assertEquals(23, role:getSP())
                end)
                
                self:it('should return 30 after increateSP(50)', function ()
                    role:increaseSP(50)
                    self:assertEquals(30, role:getSP())
                end)
                
                self:it('should return 15 after decreaseSP(3)', function ()
                    role:decreaseSP(3)
                    self:assertEquals(15, role:getSP())
                end)
                
                self:it('should return 0 after decreaseSP(100)', function ()
                    role:decreaseSP(100)
                    self:assertEquals(0, role:getSP())
                end)
            end)
            
            self:describe('getMP', function ()
                self:it('should return 12 after setMP(12)', function ()
                    role:setMP(12)
                    self:assertEquals(12, role:getMP())
                end)
                
                self:it('should return 0 after setMP(-1)', function ()
                    role:setMP(-1)
                    self:assertEquals(0, role:getMP())
                end)

                self:it('should return 20 after setMP(120)', function ()
                    role:setMP(120)
                    self:assertEquals(20, role:getMP())
                end)
                
                self:it('should return 10 after increateMP(5)', function ()
                    role:increaseMP(5)
                    self:assertEquals(10, role:getMP())
                end)
                
                self:it('should return 20 after increateMP(50)', function ()
                    role:increaseMP(50)
                    self:assertEquals(20, role:getMP())
                end)
                
                self:it('should return 2 after decreaseMP(3)', function ()
                    role:decreaseMP(3)
                    self:assertEquals(2, role:getMP())
                end)
                
                self:it('should return 0 after decreaseMP(100)', function ()
                    role:decreaseMP(100)
                    self:assertEquals(0, role:getMP())
                end)
            end)
        end)
    end)
end

return RoleSpec
