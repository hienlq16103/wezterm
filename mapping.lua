local wezterm = require "wezterm"
local act = wezterm.action

local mapping = {}

function mapping.add_custom_binding(config)
  config.keys = {
    { key = '1', mods = 'CTRL|ALT', action = act.ActivateTab(0) },
    { key = '2', mods = 'CTRL|ALT', action = act.ActivateTab(1) },
    { key = '3', mods = 'CTRL|ALT', action = act.ActivateTab(2) },
    { key = '4', mods = 'CTRL|ALT', action = act.ActivateTab(3) },
    { key = '5', mods = 'CTRL|ALT', action = act.ActivateTab(4) },
    { key = '6', mods = 'CTRL|ALT', action = act.ActivateTab(5) },
    { key = '7', mods = 'CTRL|ALT', action = act.ActivateTab(6) },
    { key = '8', mods = 'CTRL|ALT', action = act.ActivateTab(7) },
    { key = '9', mods = 'CTRL|ALT', action = act.ActivateTab(-1) },
  }
end

return mapping
