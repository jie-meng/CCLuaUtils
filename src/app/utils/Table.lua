local Table = class("Table")

function Table.shallowCopy(t)
    local o = {}
    for k, v in pairs(t) do
        o[k] = v
    end
    return o
end

function Table.getSize(t)
    local size = 0
    for k, v in pairs(t) do
        size = size + 1
    end
    return size
end

return Table
