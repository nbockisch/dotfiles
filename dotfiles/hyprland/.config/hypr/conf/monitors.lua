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

hl.monitor({
    output = "desc:Dell Inc. DELL U3821DW",
    mode = "3840x1600@59.994",
    position = "0x0",
    scale = 1,
})

hl.monitor({
    output = "desc:Samsung Electric Company Odyssey G40B",
    mode = "1920x1080@60",
    position = "-1080x-160",
    transform = 1,
    scale = 1,
})

local desks = {
    { wide = "desc:Dell Inc. DELL U3824DW", tall = "desc:Dell Inc. DELL S2725QS" },
    { wide = "desc:Dell Inc. DELL U3821DW", tall = "desc:Samsung Electric Company Odyssey G40B" },
}

local rules = {}

local function present(desc, removed)
    local want = desc:gsub("^desc:", "")

    for _, m in ipairs(hl.get_monitors()) do
        if m.name ~= removed and m.description and m.description:find(want, 1, true) then
            return true
        end
    end

    return false
end

-- Hyprland keys workspace rules by number, so registering every desk would
-- leave only the last one. Register the matching desk; disable when none match.
local function applyDeskRules(removed)
    local desk

    for _, d in ipairs(desks) do
        if present(d.wide, removed) or present(d.tall, removed) then
            desk = d
            break
        end
    end

    if not desk then
        for _, r in ipairs(rules) do
            r:set_enabled(false)
        end
        return
    end

    rules = {}

    for i = 1, 10 do
        rules[i] = hl.workspace_rule({
            workspace = tostring(i),
            monitor = i <= 5 and desk.wide or desk.tall,
            default = (i == 1 or i == 6),
        })
    end
end

local function sync(removed)
    local external = false

    for _, m in ipairs(hl.get_monitors()) do
        if m.name ~= internal and m.name ~= removed then
            external = true
        end
    end

    hl.monitor({ output = internal, disabled = external })

    applyDeskRules(removed)
end

local function restartBar()
    hl.exec_cmd(
        "flock -n /tmp/waybar-restart.lock -c "
            .. "'pgrep -x waybar >/dev/null && { pkill -x waybar; sleep 0.5; setsid waybar >/dev/null 2>&1 & }'"
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
