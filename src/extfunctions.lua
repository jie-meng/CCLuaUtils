function table.size(t)
    local size = 0
    for k, _ in pairs(t) do 
        size = size + 1
    end
    return size
end

function table.clear(t)
    for k, _ in pairs(t) do 
        t[k]=nil
    end
end

function table.copy(t)
    local o = {}
    for k, v in pairs(t) do
        o[k] = v
    end
    
    return o
end

function table.filtercopy(t, fn)
    local o = {}
    for k, v in pairs(t) do
        if fn(v, k) then
            o[k] = v
        end
    end
    
    return o
end

function table.mapcopy(t, fn)
    local o = {}
    for k, v in pairs(t) do
        o[k] = fn(v, k)
    end

    return o
end

