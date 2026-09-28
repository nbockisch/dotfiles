-- Zenburn — jnurmine/Zenburn, default (non high-contrast) variant

local M = {
    bg_dim     = "#2c2e2e",
    bg         = "#3f3f3f",
    bg_raised  = "#434443",
    surface    = "#464646",
    surface_hi = "#5b605e",
    overlay    = "#5d6262",

    fg_hi      = "#dfe4cf",
    fg         = "#dcdccc",
    fg_dim     = "#9f9f9f",
    fg_faint   = "#8f8f8f",

    cursor     = "#8faf9f",
    sel_bg     = "#284f28",
    sel_fg     = "#ffffe0",
    border     = "#5b605e",

    red        = "#cc9393",
    orange     = "#dfaf8f",
    yellow     = "#f0dfaf",
    green      = "#7f9f7f",
    cyan       = "#8cd0d3",
    blue       = "#8c8cbc",
    magenta    = "#bc8cbc",
    gray       = "#8f8f8f",

    red_br     = "#dca3a3",
    orange_br  = "#ffcfaf",
    yellow_br  = "#efef8f",
    green_br   = "#9ece9e",
    cyan_br    = "#71d3b4",
    blue_br    = "#9fafaf",
    magenta_br = "#bc8cbc",
    gray_br    = "#9f9f9f",
}

function M.rgb(hex)
    return string.format("rgb(%s)", (hex:gsub("^#", "")))
end

function M.rgba(hex, alpha)
    return string.format("rgba(%s%s)", (hex:gsub("^#", "")), alpha)
end

return M
