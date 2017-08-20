local RoleBaseProperty = class('RoleBaseProperty')

RoleBaseProperty.STR = 'STR'
RoleBaseProperty.DEF = 'DEF'
RoleBaseProperty.INT = 'INT'
RoleBaseProperty.MND = 'MND'
RoleBaseProperty.DEX = 'DEX'
RoleBaseProperty.AGL = 'AGL'
RoleBaseProperty.LUK = 'LUK'

function RoleBaseProperty:ctor()
    -- dict
    self.property_function_dict_ = {}
    -- properties
    self.strength_ = 1
    self.defense_ = 1
    self.intelligence_ = 1
    self.mind_ = 1
    self.dexterity_ = 1
    self.agility_ = 1
    self.luck_ = 1
    
    self:__initPropertyFunctionDict()
end

function RoleBaseProperty:getStrength()
    return self.strength_
end

function RoleBaseProperty:setStrength(strength)
    self.strength_ = strength
    return self
end

function RoleBaseProperty:getDefense()
    return self.defense_
end

function RoleBaseProperty:setDefense(defense)
    self.defense_ = defense
    return self
end

function RoleBaseProperty:getIntelligence()
    return self.intelligence_
end

function RoleBaseProperty:setIntelligence(intelligence)
    self.intelligence_ = intelligence
    return self
end

function RoleBaseProperty:getMind()
    return self.mind_
end

function RoleBaseProperty:setMind(mind)
    self.mind_ = mind
    return self
end

function RoleBaseProperty:getDexterity()
    return self.dexterity_
end

function RoleBaseProperty:setDexterity(dexterity)
    self.dexterity_ = dexterity
    return self
end

function RoleBaseProperty:getAgility()
    return self.agility_
end

function RoleBaseProperty:setAgility(agility)
    self.agility_ = agility
    return self
end

function RoleBaseProperty:getLuck()
    return self.luck_
end

function RoleBaseProperty:setLuck(luck)
    self.luck_ = luck
    return self
end

function RoleBaseProperty:getProperty(property)
    return self.property_function_dict_[property].get(self)
end

function RoleBaseProperty:setProperty(property, value)
    self.property_function_dict_[property].set(self, value)
    return self
end

function RoleBaseProperty:__initPropertyFunctionDict()
    self.property_function_dict_[RoleBaseProperty.STR] = { get = RoleBaseProperty.getStrength, set = RoleBaseProperty.setStrength }
    self.property_function_dict_[RoleBaseProperty.DEF] = { get = RoleBaseProperty.getDefense, set = RoleBaseProperty.setDefense }
    self.property_function_dict_[RoleBaseProperty.INT] = { get = RoleBaseProperty.getIntelligence, set = RoleBaseProperty.setIntelligence }
    self.property_function_dict_[RoleBaseProperty.MND] = { get = RoleBaseProperty.getMind, set = RoleBaseProperty.setMind }
    self.property_function_dict_[RoleBaseProperty.DEX] = { get = RoleBaseProperty.getDexterity, set = RoleBaseProperty.setDexterity }
    self.property_function_dict_[RoleBaseProperty.AGL] = { get = RoleBaseProperty.getAgility, set = RoleBaseProperty.setAgility }
    self.property_function_dict_[RoleBaseProperty.LUK] = { get = RoleBaseProperty.getLuck, set = RoleBaseProperty.setLuck }
end

return RoleBaseProperty
