
---------------------------------------------------
-- Applications and commands used by keybindings
---------------------------------------------------

local terminal    = "kitty"
local fileManager = "dolphin"
local menu        = "hyprlauncher"
local browser     = "helium-browser"
local launcher    = "dms ipc call spotlight toggle"
local github      = browser .. " --app=https://github.com/Dark-van02/"
local code        = "vscodium"
local vpn         = "protonvpn-app"
local social      = "telegram-desktop"

-------------------------------------------------
-- Modifiers
-------------------------------------------------

local mainMod = "SUPER"
local hyprMod = "SUPER + SHIFT"

-------------------------------------------------
-- Application launchers
-------------------------------------------------



hl.bind(mainMod .. " + T",     hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + E",     hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd(launcher))

hl.bind(hyprMod .. " + B", hl.dsp.exec_cmd(browser))
hl.bind(hyprMod .. " + G", hl.dsp.exec_cmd(github))
hl.bind(hyprMod .. " + C", hl.dsp.exec_cmd(code))
hl.bind(hyprMod .. " + X", hl.dsp.exec_cmd("vscodium ~/.config/hypr/"))
hl.bind(hyprMod .. " + P", hl.dsp.exec_cmd(vpn))
hl.bind(hyprMod .. " + 1", hl.dsp.exec_cmd(social))

---
hl.bind(hyprMod .. " + V", hl.dsp.exec_raw("~/G_Themes/Sexy_Dark_theme/Theme_generator.sh")) 

-------------------------------------------------
-- DMS panels and utilities -- Quick access panels
-------------------------------------------------

hl.bind(mainMod .. " + V",     hl.dsp.exec_cmd("dms ipc call clipboard toggle"))
hl.bind(mainMod .. " + M",     hl.dsp.exec_cmd("dms ipc call processlist focusOrToggle"))
hl.bind(mainMod .. " + COMMA", hl.dsp.exec_cmd("dms ipc call settings focusOrToggle"))
hl.bind(mainMod .. " + N",     hl.dsp.exec_cmd("dms ipc call notifications toggle"))
hl.bind(hyprMod .. " + N",     hl.dsp.exec_cmd("dms ipc call notepad toggle"))
hl.bind(mainMod .. " + Y",     hl.dsp.exec_cmd("dms ipc call dash toggle wallpaper"))
hl.bind(mainMod .. " + TAB",   hl.dsp.exec_cmd("dms ipc call hypr toggleOverview"))
hl.bind(mainMod .. " + X",     hl.dsp.exec_cmd("dms ipc call powermenu toggle"))



-------------------------------------------------
-- Screenshots
-------------------------------------------------
hl.bind("Print",        hl.dsp.exec_cmd("dms screenshot"))
hl.bind("CTRL + Print", hl.dsp.exec_cmd("dms screenshot full"))
hl.bind("ALT + Print",  hl.dsp.exec_cmd("dms screenshot window"))

-------------------------------------------------
-- Close windows and exit session
-------------------------------------------------

hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(hyprMod .. " + E", hl.dsp.exec_cmd(
    "command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"
))

-------------------------------------------------
-- Fullscreen, floating, groups and layout
-------------------------------------------------

hl.bind(mainMod .. " + F",     hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }))
hl.bind(hyprMod .. " + F",     hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))
hl.bind(hyprMod .. " + T",     hl.dsp.window.float({ action = "toggle" })) -- DUPLICATE: conflicts with Telegram launcher
hl.bind(mainMod .. " + W",     hl.dsp.group.toggle())
hl.bind(hyprMod .. " + W",     hl.dsp.exec_cmd("dms ipc call window-rules toggle"))
hl.bind(mainMod .. " + P",     hl.dsp.window.pseudo())
hl.bind(mainMod .. " + R",     hl.dsp.layout("togglesplit"))
hl.bind(mainMod .. " + CTRL + F", hl.dsp.window.fullscreen({ mode = "maximized", action = "set" })) ----no diffrent with the first one

-------------------------------------------------
-- Move keyboard focus between windows
-------------------------------------------------+++++++++++++

hl.bind(mainMod .. " + LEFT",  hl.dsp.focus({ direction = "l" }))
hl.bind(mainMod .. " + DOWN",  hl.dsp.focus({ direction = "d" }))
hl.bind(mainMod .. " + UP",    hl.dsp.focus({ direction = "u" }))
hl.bind(mainMod .. " + RIGHT", hl.dsp.focus({ direction = "r" }))

hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "l" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "d" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "u" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "r" }))


-------------------------------------------------
-- Window movement   -- Move windows between positions
-------------------------------------------------

hl.bind(hyprMod .. " + LEFT",  hl.dsp.window.move({ direction = "l" }))
hl.bind(hyprMod .. " + DOWN",  hl.dsp.window.move({ direction = "d" }))
hl.bind(hyprMod .. " + UP",    hl.dsp.window.move({ direction = "u" }))
hl.bind(hyprMod .. " + RIGHT", hl.dsp.window.move({ direction = "r" }))

hl.bind(hyprMod .. " + H", hl.dsp.window.move({ direction = "l" }))
hl.bind(hyprMod .. " + J", hl.dsp.window.move({ direction = "d" }))
hl.bind(hyprMod .. " + K", hl.dsp.window.move({ direction = "u" }))
hl.bind(hyprMod .. " + L", hl.dsp.window.move({ direction = "r" }))

-------------------------------------------------
-- Workspace management   -- Workspace switching and moving windows
-------------------------------------------------

for i = 1, 10 do
    local key = i % 10
    hl.bind(mainMod .. " + " .. key,         hl.dsp.focus({ workspace = i }))
    hl.bind(hyprMod .. " + " .. key,         hl.dsp.window.move({ workspace = i }))
end

hl.bind(mainMod .. " + Page_Down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + Page_Up",   hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + U",         hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + I",         hl.dsp.focus({ workspace = "e-1" }))


-------------------------------------------------
-- Column management
-------------------------------------------------

hl.bind(mainMod .. " + bracketleft",  hl.dsp.layout("preselect l"))
hl.bind(mainMod .. " + bracketright", hl.dsp.layout("preselect r"))
hl.bind(mainMod .. " + Home", hl.dsp.focus({ window = "first" }))
hl.bind(mainMod .. " + End", hl.dsp.focus({ window = "last" }))


-------------------------------------------------
-- Mouse actions    -- Drag and resize windows with the mouse
-------------------------------------------------

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind(mainMod .. " + code:20", hl.dsp.window.resize({ x = -100, y = 0, relative = true }), { description = "Expand window left" })
hl.bind(mainMod .. " + code:21", hl.dsp.window.resize({ x = 100, y = 0, relative = true }), { description = "Shrink window left" })

hl.bind(mainMod .. " + minus", hl.dsp.window.resize({ x = -100, y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + equal", hl.dsp.window.resize({ x = 100, y = 0, relative = true }), { repeating = true })
hl.bind(hyprMod .. " + minus", hl.dsp.window.resize({ x = 0, y = -100, relative = true }), { repeating = true })
hl.bind(hyprMod .. " + equal", hl.dsp.window.resize({ x = 0, y = 100, relative = true }), { repeating = true })



-------------------------------------------------
-- Multimedia keys   -- Audio and brightness controls
-------------------------------------------------


hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"))
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"))

hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"))
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"))

hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"))

----------------------------------------------------------
-- Session & security -- Lock screen and emergency actions
---------------------------------------------------------

hl.bind(mainMod .. " + ALT + L", hl.dsp.exec_cmd("dms ipc call lock lock"))
hl.bind(hyprMod .. " + CTRL + E",       hl.dsp.exit())

------------------------------------------------------------
-- Monitor Navigation  --  Move to Monitor
---------------------------------------------------------------



hl.bind(mainMod .. "+ CTRL + left", hl.dsp.focus({ monitor = "l" }))
hl.bind(mainMod .. "+ CTRL + right", hl.dsp.focus({ monitor = "r" }))
hl.bind(mainMod .. "+ CTRL + up", hl.dsp.focus({ monitor = "u" }))
hl.bind(mainMod .. "+ CTRL + down", hl.dsp.focus({ monitor = "d" }))

hl.bind(mainMod .. "+ CTRL + H", hl.dsp.focus({ monitor = "l" }))
hl.bind(mainMod .. "+ CTRL + J", hl.dsp.focus({ monitor = "d" }))
hl.bind(mainMod .. "+ CTRL + K", hl.dsp.focus({ monitor = "u" }))
hl.bind(mainMod .. "+ CTRL + L", hl.dsp.focus({ monitor = "r" }))


hl.bind(mainMod .. "+ SHIFT + CTRL + left", hl.dsp.window.move({ monitor = "l" }))
hl.bind(mainMod .. "+ SHIFT + CTRL + down", hl.dsp.window.move({ monitor = "d" }))
hl.bind(mainMod .. "+ SHIFT + CTRL + up", hl.dsp.window.move({ monitor = "u" }))
hl.bind(mainMod .. "+ SHIFT + CTRL + right", hl.dsp.window.move({ monitor = "r" }))
hl.bind(mainMod .. "+ SHIFT + CTRL + H", hl.dsp.window.move({ monitor = "l" }))
hl.bind(mainMod .. "+ SHIFT + CTRL + J", hl.dsp.window.move({ monitor = "d" }))
hl.bind(mainMod .. "+ SHIFT + CTRL + K", hl.dsp.window.move({ monitor = "u" }))
hl.bind(mainMod .. "+ SHIFT + CTRL + L", hl.dsp.window.move({ monitor = "r" }))




-------------------------------------------------------------------
--Optional
-------------------------------------------------------------------

hl.bind("CTRL + SHIFT + R", hl.dsp.exec_cmd("dms ipc call workspace-rename open"))


hl.bind(mainMod .. "+ O", hl.dsp.exec_cmd("dms ipc outputs cycleProfile"))


hl.bind(mainMod .. "+ SHIFT + O", hl.dsp.dpms({ action = "toggle" }))

----Last edit 14/8/2026