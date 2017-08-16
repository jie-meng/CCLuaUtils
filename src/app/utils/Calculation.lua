local Calculation = class("Calculation")

function Calculation.trimDeg(direction)
    local d = direction % 360
    if d < 0 then
        d =  d + 360
    end
    return d
end

function Calculation.distance(position1, position2)
    return math.sqrt(math.pow(position1.x - position2.x, 2) + math.pow(position1.y - position2.y, 2))
end

function Calculation.calcNewPosition(position, direction, distance)
    local deg = Calculation.trimDeg(direction)
    local offset_x = distance * math.cos(math.rad(deg))
    local offset_y = distance * math.sin(math.rad(deg))
    
    return cc.p(position.x + offset_x, position.y - offset_y)
end

function Calculation.targetDirection(self_position, target_position)
    if self_position and target_position then
        local degree = math.abs(math.deg(math.atan((target_position.y - position.y) / (target_position.x - position.x))))
        
        if target_position.y - self_position.y >= 0 and target_position.x - self_position.x >= 0 then
            return Calculation.trimDeg(360 - degree)
        elseif target_position.y - self_position.y >= 0 and target_position.x - self_position.x < 0 then
            return Calculation.trimDeg(180 + degree)
        elseif target_position.y - self_position.y < 0 and target_position.x - self_position.x < 0 then
            return Calculation.trimDeg(180 - degree)
        elseif target_position.y - self_position.y < 0 and target_position.x - self_position.x >= 0 then
            return Calculation.trimDeg(degree)
        end
    else
        return nil
    end
end

return Calculation
