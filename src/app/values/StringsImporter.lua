local StringsImporter = class('StringsImporter')

function StringsImporter.import(path)
    if device.language == 'en' then
        return import(path)
    else
        return import(path .. string.upper(device.language))
    end
end

return StringsImporter