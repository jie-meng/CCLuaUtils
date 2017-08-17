local TimerHosterCollection = class('TimerHosterCollection')

function TimerHosterCollection:ctor()
    self.collection_ = {}
end

function TimerHosterCollection:clear()
    table.clear(self.collection_)
end

function TimerHosterCollection:addTimerHoster(timer_owner)
    table.insert(self.collection_, timer_owner)
end

function TimerHosterCollection:addTimerHosters(timer_owners)
    for _, v in pairs(timer_owners) do
        table.insert(self.collection_, v)
    end
end

function TimerHosterCollection:passTime(dt)
    table.walk(self.collection_, function (v)
        v:passTime(dt)
    end)
end

return TimerHosterCollection
