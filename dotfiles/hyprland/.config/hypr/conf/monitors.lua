local internal = "eDP-1"

hl.monitor({ output = "", mode = "preferred", position = "auto", scale = "auto" })

-- Home desk. Matched on description so it survives port changes and does not
-- fire at the other desk, which has a U3821DW rather than a U3824DW.
hl.monitor({
    output = "desc:Dell Inc. DELL U3824DW",
    mode = "3840x1600@59.994",
    position = "0x0",
    scale = 1,
})

-- Rotated 90 (transform 1), sitting to the right of the ultrawide.
hl.monitor({
    output = "desc:Dell Inc. DELL S2725QS",
    mode = "3840x2160@60",
    position = "3840x-1515",
    transform = 1,
    scale = 1,
})

local wide = "desc:Dell Inc. DELL U3824DW"
local tall = "desc:Dell Inc. DELL S2725QS"

-- No persistent: it forces 1-10 into existence up front, which reserves the IDs
-- and pushes new windows onto a fresh workspace (11/12) at desks where neither
-- of these monitors is present. It also kept empty workspaces in waybar.
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
