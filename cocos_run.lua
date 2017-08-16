if util.strContains(util.platformInfo(), "unix", false) then
    if util.strContains(util.platformInfo(), "macos", false) then
        os.execute("cocos run -p mac")
    else
        os.execute("cocos run -p linux")
    end
elseif util.strContains(util.platformInfo(), "windows", false) then
    os.execute("cocos run -p win32")
else
    print("run failed")
end

print("run finished")
