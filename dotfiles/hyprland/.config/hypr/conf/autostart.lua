-- Not started: kanshi (conf/monitors.lua handles outputs natively) and
-- xwayland-satellite (niri needs it, Hyprland has XWayland built in).

hl.on("hyprland.start", function()
    hl.exec_cmd("waybar")
    hl.exec_cmd("mako")
    hl.exec_cmd("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")
    hl.exec_cmd("swaybg -m fill -i " .. os.getenv("HOME") .. "/pictures/wallpapers/current")
end)
