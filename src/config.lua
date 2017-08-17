
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

SWITCH_TEST = true
SWITCH_CHAPTER_JUMP_TO = 1
SWITCH_SHOW_ROLE_BODY_RANGE = false
SWITCH_SHOW_OBJECT_RECT = false
SWITCH_SHOW_TILEDMAP_META = false
SWITCH_SHOW_TILEDMAP_OBJECTS = false
SWITCH_CHEAT_SUPER_GUN = false
SWITCH_OPEN_EXTRA_MODE = false
SWITCH_SHOW_AD = false
