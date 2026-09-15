-- Gruvbox Light

local M = {
    bg_dim     = "#f9f5d7",
    bg         = "#fbf1c7",
    bg_raised  = "#ebdbb2",
    surface    = "#d5c4a1",
    surface_hi = "#bdae93",
    overlay    = "#a89984",

    fg_hi      = "#282828",
    fg         = "#3c3836",
    fg_dim     = "#504945",
    fg_faint   = "#665c54",

    cursor     = "#d65d0e",
    sel_bg     = "#d5c4a1",
    sel_fg     = "#3c3836",
    border     = "#bdae93",

    red        = "#cc241d",
    orange     = "#d65d0e",
    yellow     = "#d79921",
    green      = "#98971a",
    cyan       = "#689d6a",
    blue       = "#458588",
    magenta    = "#b16286",
    gray       = "#7c6f64",

    red_br     = "#9d0006",
    orange_br  = "#af3a03",
    yellow_br  = "#b57614",
    green_br   = "#79740e",
    cyan_br    = "#427b58",
    blue_br    = "#076678",
    magenta_br = "#8f3f71",
    gray_br    = "#928374",
}

function M.rgb(hex)
    return string.format("rgb(%s)", (hex:gsub("^#", "")))
end

function M.rgba(hex, alpha)
    return string.format("rgba(%s%s)", (hex:gsub("^#", "")), alpha)
end

return M
