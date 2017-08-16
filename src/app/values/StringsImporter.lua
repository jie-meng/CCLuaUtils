local StringsImporter = class("StringsImporter")

function StringsImporter.importPlatformStrings()
    if device.language == "cn" then
        return import("app.values.StringsCN")
    else
        return import("app.values.Strings")
    end
end

return StringsImporter