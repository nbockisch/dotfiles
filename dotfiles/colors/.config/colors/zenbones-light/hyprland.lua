-- Zenbones Light — zenbones-theme/zenbones.nvim

local M = {
    bg_dim     = "#f6f4f4",
    bg         = "#f0edec",
    bg_raised  = "#cfc1ba",
    surface    = "#b3aba8",
    surface_hi = "#999798",
    overlay    = "#808487",

    fg_hi      = "#222a2f",
    fg         = "#2c363c",
    fg_dim     = "#3e4a52",
    fg_faint   = "#4f5e68",

    cursor     = "#2c363c",
    sel_bg     = "#cfc1ba",
    sel_fg     = "#2c363c",
    border     = "#b3aba8",

    red        = "#a8334c",
    orange     = "#944927",
    yellow     = "#944927",
    green      = "#4f6c31",
    cyan       = "#3b8992",
    blue       = "#286486",
    magenta    = "#88507d",
    gray       = "#cfc1ba",

    red_br     = "#94253e",
    orange_br  = "#803d1c",
    yellow_br  = "#803d1c",
    green_br   = "#3f5a22",
    cyan_br    = "#2b747c",
    blue_br    = "#1d5573",
    magenta_br = "#7b3b70",
    gray_br    = "#4f5e68",
}

function M.rgb(hex)
    return string.format("rgb(%s)", (hex:gsub("^#", "")))
end

function M.rgba(hex, alpha)
    return string.format("rgba(%s%s)", (hex:gsub("^#", "")), alpha)
end

return M
