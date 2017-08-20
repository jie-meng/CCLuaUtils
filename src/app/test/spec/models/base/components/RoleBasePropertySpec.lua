local Spec = import('app.test.Spec')
local RoleBaseProperty = import('app.models.base.components.RoleBaseProperty')

local RoleBasePropertySpec = class('RoleBasePropertySpec', Spec)

function RoleBasePropertySpec:run()
    self:describe('RoleBasePropertySpec', function ()
        self:describe('given RoleBaseProperty with STR = 5, DEF = 4, INT = 3, MND = 6, DEX = 8, AGL = 7, LUK = 9', function ()
            local role_base_property = nil
            
            self:beforeEach(function ()
                role_base_property = RoleBaseProperty:create()
                    :setStrength(5)
                    :setDefense(4)
                    :setIntelligence(3)
                    :setMind(6)
                    :setDexterity(8)
                    :setAgility(7)
                    :setLuck(9)
            end)
            
            self:describe('getProperty', function ()
                self:it('should return 5 with argument "STR"', function ()
                    self:assertEquals(5, role_base_property:getProperty(RoleBaseProperty.STR))
                end)
                
                self:it('should return 4 with argument "DEF"', function ()
                    self:assertEquals(4, role_base_property:getProperty(RoleBaseProperty.DEF))
                end)
                
                self:it('should return 3 with argument "INT"', function ()
                    self:assertEquals(3, role_base_property:getProperty(RoleBaseProperty.INT))
                end)

                self:it('should return 6 with argument "MND"', function ()
                    self:assertEquals(6, role_base_property:getProperty(RoleBaseProperty.MND))
                end)

                self:it('should return 8 with argument "DEX"', function ()
                    self:assertEquals(8, role_base_property:getProperty(RoleBaseProperty.DEX))
                end)

                self:it('should return 7 with argument "AGL"', function ()
                    self:assertEquals(7, role_base_property:getProperty(RoleBaseProperty.AGL))
                end)
                
                self:it('should return 9 with argument "LUK"', function ()
                    self:assertEquals(9, role_base_property:getProperty(RoleBaseProperty.LUK))
                end)
            end)
        end)
        
        self:describe('given RoleBaseProperty set STR = 50, DEF = 40, INT = 30, MND = 60, DEX = 80, AGL = 70, LUK = 90 with setProperty method', function ()
            local role_base_property = nil
            
            self:beforeEach(function ()
                role_base_property = RoleBaseProperty:create()
                    :setProperty(RoleBaseProperty.STR, 50)
                    :setProperty(RoleBaseProperty.DEF, 40)
                    :setProperty(RoleBaseProperty.INT, 30)
                    :setProperty(RoleBaseProperty.MND, 60)
                    :setProperty(RoleBaseProperty.DEX, 80)
                    :setProperty(RoleBaseProperty.AGL, 70)
                    :setProperty(RoleBaseProperty.LUK, 90)
            end)
            
            self:it('should return 50 when call getStrength', function ()
                self:assertEquals(50, role_base_property:getStrength())
            end)
            
            self:it('should return 40 when call getDefense', function ()
                self:assertEquals(40, role_base_property:getDefense())
            end)
            
            self:it('should return 30 when call getIntelligence', function ()
                self:assertEquals(30, role_base_property:getIntelligence())
            end)

            self:it('should return 60 when call getMind', function ()
                self:assertEquals(60, role_base_property:getMind())
            end)

            self:it('should return 80 when call getDexterity', function ()
                self:assertEquals(80, role_base_property:getDexterity())
            end)

            self:it('should return 70 when call getAgility', function ()
                self:assertEquals(70, role_base_property:getAgility())
            end)
            
            self:it('should return 90 when call getLuck', function ()
                self:assertEquals(90, role_base_property:getLuck())
            end)
        end)
    end)
end

return RoleBasePropertySpec
