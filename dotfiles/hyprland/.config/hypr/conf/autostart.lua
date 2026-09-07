-- Autostart
--
-- hl.exec_cmd here is the plain launcher (hl.dsp.exec_cmd is the keybind
-- dispatcher version). Everything runs once, on compositor start.
--
-- Deliberately NOT started: xwayland-satellite, which the niri config needs
-- because niri has no XWayland of its own. Hyprland ships XWayland built in,
-- so running it here would just duplicate the server.

hl.on("hyprland.start", function()
    -- Display layout daemon (wlr-output-management)
    hl.exec_cmd("kanshi")

    -- Status bar and notification daemon
    hl.exec_cmd("waybar")
    hl.exec_cmd("mako")

    -- Authentication prompts for anything asking polkit for privileges
    hl.exec_cmd("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")

    -- Wallpaper. ~/pictures/wallpapers/current is a symlink to the active
    -- image; swaybg exits silently if it cannot be resolved.
    hl.exec_cmd("swaybg -m fill -i " .. os.getenv("HOME") .. "/pictures/wallpapers/current")
end)
