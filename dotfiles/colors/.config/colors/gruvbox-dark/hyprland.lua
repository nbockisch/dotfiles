local M = {
    -- Surfaces, darkest to lightest
    bg_dim     = "#1d2021",
    bg         = "#282828",
    bg_raised  = "#3c3836",
    surface    = "#504945",
    surface_hi = "#665c54",
    overlay    = "#7c6f64",

    -- Text, brightest to dimmest
    fg_hi      = "#fbf1c7",
    fg         = "#ebdbb2",
    fg_dim     = "#bdae93",
    fg_faint   = "#a89984",

    -- Special
    cursor     = "#fe8019",
    sel_bg     = "#504945",
    sel_fg     = "#fbf1c7",
    border     = "#504945",

    -- Accents
    red        = "#cc241d",
    orange     = "#d65d0e",
    yellow     = "#d79921",
    green      = "#98971a",
    cyan       = "#689d6a",
    blue       = "#458588",
    magenta    = "#b16286",
    gray       = "#928374",

    -- Accents, bright
    red_br     = "#fb4934",
    orange_br  = "#fe8019",
    yellow_br  = "#fabd2f",
    green_br   = "#b8bb26",
    cyan_br    = "#8ec07c",
    blue_br    = "#83a598",
    magenta_br = "#d3869b",
    gray_br    = "#a89984",
}

--- "#1d2021" -> "rgb(1d2021)"
function M.rgb(hex)
    return string.format("rgb(%s)", (hex:gsub("^#", "")))
end

--- "#1d2021", "cc" -> "rgba(1d2021cc)"
function M.rgba(hex, alpha)
    return string.format("rgba(%s%s)", (hex:gsub("^#", "")), alpha)
end

return M
