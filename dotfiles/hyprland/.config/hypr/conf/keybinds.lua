-- Keybinds
--
-- Follows Hyprland's own conventions (SUPER as mod, SHIFT to move, digits for
-- workspaces) with vim hjkl in place of the arrow keys. Arrows are kept as
-- aliases everywhere hjkl is bound.

local mod = "SUPER"

local terminal = "ghostty"
local fileManager = "ghostty -e yazi"
local menu = "rofi -show drun"
local locker = "hyprlock"

-- Directions, shared by the focus / move / monitor loops below
local dirs = {
    { key = "H", arrow = "left", dir = "left" },
    { key = "J", arrow = "down", dir = "down" },
    { key = "K", arrow = "up", dir = "up" },
    { key = "L", arrow = "right", dir = "right" },
}

------------------------
---- APPLICATIONS ------
------------------------

hl.bind(mod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mod .. " + D", hl.dsp.exec_cmd(menu))

-- Not mod + L: that is focus-right.
hl.bind("SUPER + ALT + L", hl.dsp.exec_cmd(locker))

------------------------
---- SCREENSHOTS -------
------------------------

local shotDir = os.getenv("HOME") .. "/Pictures/Screenshots"
local shot = "hyprshot -o " .. shotDir .. " -m "

hl.bind("Print", hl.dsp.exec_cmd(shot .. "region --freeze"))
hl.bind("SHIFT + Print", hl.dsp.exec_cmd(shot .. "output"))
hl.bind(mod .. " + Print", hl.dsp.exec_cmd(shot .. "window --freeze"))
hl.bind("CTRL + Print", hl.dsp.exec_cmd(shot .. "region --freeze --clipboard-only"))

------------------------
---- WINDOW STATE ------
------------------------

hl.bind(mod .. " + SHIFT + Q", hl.dsp.window.close())
hl.bind(mod .. " + M", hl.dsp.exit())
hl.bind(mod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mod .. " + F", hl.dsp.window.fullscreen())
hl.bind(mod .. " + P", hl.dsp.window.pseudo())

-- Hyprland's default puts togglesplit on mod + J; moved here so J stays vim-down.
hl.bind(mod .. " + Backslash", hl.dsp.layout("togglesplit"))

------------------------
---- FOCUS / MOVE ------
------------------------

for _, d in ipairs(dirs) do
    -- Focus
    hl.bind(mod .. " + " .. d.key, hl.dsp.focus({ direction = d.dir }))
    hl.bind(mod .. " + " .. d.arrow, hl.dsp.focus({ direction = d.dir }))

    -- Move the window within the layout
    hl.bind(mod .. " + SHIFT + " .. d.key, hl.dsp.window.move({ direction = d.dir }))
    hl.bind(mod .. " + SHIFT + " .. d.arrow, hl.dsp.window.move({ direction = d.dir }))
end

------------------------
---- WORKSPACES --------
------------------------

-- Five to match the CH01..CH05 readout in waybar. Extend the range here and the
-- format-icons map in waybar/config together.
for i = 1, 5 do
    hl.bind(mod .. " + " .. i, hl.dsp.focus({ workspace = i }))
    hl.bind(mod .. " + SHIFT + " .. i, hl.dsp.window.move({ workspace = i }))
end

-- Cycle through populated workspaces
hl.bind(mod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Scratchpad
hl.bind(mod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

------------------------
---- GROUPS ------------
------------------------

-- Groups render as the tabbed bar styled in appearance.lua
hl.bind(mod .. " + G", hl.dsp.group.toggle())
hl.bind(mod .. " + bracketleft", hl.dsp.group.prev())
hl.bind(mod .. " + bracketright", hl.dsp.group.next())

------------------------
---- MOUSE -------------
------------------------

hl.bind(mod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

------------------------
---- MEDIA KEYS --------
------------------------

-- locked = works on the lock screen, repeating = auto-repeats when held
local media = { locked = true, repeating = true }

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), media)
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), media)
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), media)
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), media)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), media)
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), media)

hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
