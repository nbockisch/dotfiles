-- Zenbones Dark — zenbones-theme/zenbones.nvim

local M = {
    bg_dim     = "#110f0e",
    bg         = "#1c1917",
    bg_raised  = "#403833",
    surface    = "#504b48",
    surface_hi = "#5e5d5c",
    overlay    = "#6d6e6f",

    fg_hi      = "#c4cacf",
    fg         = "#b4bdc3",
    fg_dim     = "#9ea6ac",
    fg_faint   = "#888f94",

    cursor     = "#c4cacf",
    sel_bg     = "#403833",
    sel_fg     = "#b4bdc3",
    border     = "#504b48",

    red        = "#de6e7c",
    orange     = "#b77e64",
    yellow     = "#b77e64",
    green      = "#819b69",
    cyan       = "#66a5ad",
    blue       = "#6099c0",
    magenta    = "#b279a7",
    gray       = "#403833",

    red_br     = "#e8838f",
    orange_br  = "#d68c67",
    yellow_br  = "#d68c67",
    green_br   = "#8bae68",
    cyan_br    = "#65b8c1",
    blue_br    = "#61abda",
    magenta_br = "#cf86c1",
    gray_br    = "#888f94",
}

function M.rgb(hex)
    return string.format("rgb(%s)", (hex:gsub("^#", "")))
end

function M.rgba(hex, alpha)
    return string.format("rgba(%s%s)", (hex:gsub("^#", "")), alpha)
end

return M
