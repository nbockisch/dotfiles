local internal = "eDP-1"

hl.monitor({ output = "", mode = "preferred", position = "auto", scale = "auto" })

hl.monitor({
    output = "desc:Dell Inc. DELL U3824DW",
    mode = "3840x1600@59.994",
    position = "0x0",
    scale = 1,
})

hl.monitor({
    output = "desc:Dell Inc. DELL S2725QS",
    mode = "3840x2160@60",
    position = "3840x-1515",
    transform = 1,
    scale = 1,
})

local wide = "desc:Dell Inc. DELL U3824DW"
local tall = "desc:Dell Inc. DELL S2725QS"

for i = 1, 10 do
    hl.workspace_rule({
        workspace = tostring(i),
        monitor = i <= 5 and wide or tall,
        default = (i == 1 or i == 6),
    })
end

local function sync(removed)
    local external = false

    for _, m in ipairs(hl.get_monitors()) do
        if m.name ~= internal and m.name ~= removed then
            external = true
        end
    end

    hl.monitor({ output = internal, disabled = external })
end

local function restartBar()
    hl.exec_cmd(
        "flock -n /tmp/waybar-restart.lock -c "
            .. "'pkill -x waybar; sleep 0.5; setsid waybar >/dev/null 2>&1 &'"
    )
end

sync()

hl.on("monitor.added", function()
    sync()
    restartBar()
end)

hl.on("monitor.removed", function(m)
    sync(type(m) == "table" and m.name or m)
    restartBar()
end)
