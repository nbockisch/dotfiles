local c = dofile(os.getenv("HOME") .. "/.config/colors/current/hyprland.lua")

hl.config({
    general = {
        gaps_in = 4,
        gaps_out = 6,
        border_size = 3,

        layout = "dwindle",

        col = {
            active_border = c.rgb(c.orange_br),
            inactive_border = c.rgb(c.surface),
        },
    },

    decoration = {
        rounding = 0,

        shadow = {
            enabled = false,
        },

        blur = {
            enabled = false,
        },

        dim_inactive = true,
        dim_strength = 0.15,

        -- screen_shader = os.getenv("HOME") .. "/.config/hypr/shaders/in-game-crt.glsl",
    },

    group = {
        col = {
            border_active = c.rgb(c.orange_br),
            border_inactive = c.rgb(c.surface),
        },

        groupbar = {
            enabled = true,
            font_family = "Terminess Nerd Font",
            font_size = 11,
            height = 16,
            gradients = false,
            rounding = 0,
            text_color = c.rgb(c.bg_dim),
            text_color_inactive = c.rgb(c.fg_faint),
            col = {
                active = c.rgb(c.orange_br),
                inactive = c.rgb(c.bg_raised),
            },
        },
    },

    animations = {
        enabled = true,
    },

    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo = true,
    },
})

hl.curve("clunk", { type = "bezier", points = { { 0.25, 1 }, { 0.5, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })

hl.animation({ leaf = "windows", enabled = true, speed = 3, bezier = "clunk", style = "popin 80%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 2, bezier = "clunk", style = "popin 90%" })
hl.animation({ leaf = "border", enabled = true, speed = 2, bezier = "linear" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 3, bezier = "clunk", style = "slide" })

-- Opacity ramp on new windows; inherits global (0.8s) if left unset
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.5, bezier = "clunk" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1, bezier = "clunk" })

-- Layer surfaces: rofi, waybar, mako
hl.animation({ leaf = "layers", enabled = true, speed = 1.5, bezier = "clunk" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 1, bezier = "clunk", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 0.8, bezier = "clunk", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1, bezier = "clunk" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 0.8, bezier = "clunk" })
