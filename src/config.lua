
-- 0 - disable debug info, 1 - less debug info, 2 - verbose debug info
DEBUG = 2

-- use framework, will disable all deprecated API, false - use legacy API
CC_USE_FRAMEWORK = true

-- show FPS on screen
CC_SHOW_FPS = true

-- disable create unexpected global variable
CC_DISABLE_GLOBAL = true

-- for module display
CC_DESIGN_RESOLUTION = {
    width = 960,
    height = 640,
    autoscale = "SHOW_ALL",
    --callback = function(framesize)
    --    local ratio = framesize.width / framesize.height
    --    if ratio <= 1.34 then
    --        -- iPad 768*1024(1536*2048) is 4:3 screen
    --        return {autoscale = "FIXED_WIDTH"}
    --    end
    --end
}

STUB_TEST = true
STUB_CHAPTER_JUMP_TO = 1
STUB_SHOW_ROLE_BODY_RANGE = false
STUB_SHOW_OBJECT_RECT = false
STUB_SHOW_TILEDMAP_META = false
STUB_SHOW_TILEDMAP_OBJECTS = false
STUB_CHEAT_SUPER_GUN = false
STUB_OPEN_EXTRA_MODE = false
STUB_SHOW_AD = false