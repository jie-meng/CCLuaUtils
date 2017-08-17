local Table = class('Table')

function Table.shallowCopy(t)
    local o = {}
    for k, v in pairs(t) do
        o[k] = v
    end
    return o
end

function Table.getSize(t)
    return #table.keys(t)
end

function Table.clear(t)
    for k, _ in pairs(t) do 
        t[k]=nil
    end
end

return Table
