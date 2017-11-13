local StringsImporter = class('StringsImporter')

function StringsImporter.import(path)
    if device.language == 'cn' then
        return import(path .. string.upper(device.language))
    else
        return import(path)
    end
end

return StringsImporter
