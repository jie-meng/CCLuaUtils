local Geometry = class('Geometry')

function Geometry.line(x1, y1, x2, y2)
        if not x2 and not y2 then
            return { x1 = x1.x, y1 = x1.y, x2 = y1.x, y2 = y1.y }
        end
        
        return { x1 = x1, y1 = y1, x2 = x2, y2 = y2 }
end
    
function Geometry.lineIntersectsRect(line, rect)
    local minX = rect.x
    local minY = rect.y
    local maxX = rect.x + rect.width
    local maxY = rect.y + rect.height
    
    if (line.x1 <= minX and line.x2 <= minX) or (line.y1 <= minY and line.y2 <= minY) or (line.x1 >= maxX and line.x2 >= maxX) or (line.y1 >= maxY and line.y2 >= maxY) then
            return false
    end

        local m = (line.y2 - line.y1) / (line.x2 - line.x1)

        local y = m * (minX - line.x1) + line.y1
        if y > minY and y < maxY then
            return true
        end

        y = m * (maxX - line.x1) + line.y1
        if y > minY and y < maxY then
            return true
        end

        local x = (minY - line.y1) / m + line.x1
        if x > minX and x < maxX then
            return true
        end

        x = (maxY - line.y1) / m + line.x1
        if x > minX and x < maxX then
            return true
        end

        return false
end
    
return Geometry
