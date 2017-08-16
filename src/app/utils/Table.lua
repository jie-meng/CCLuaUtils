local Table = class("Table")

function Table.shallowCopy(t)
    local o = {}
    for k, v in pairs(t) do
        o[k] = v
    end
    return o
end

return Table