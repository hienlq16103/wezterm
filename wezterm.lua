-- Pull in the wezterm API
local wezterm = require("wezterm")
local mapping = require("mapping")
local mux = wezterm.mux

-- This will hold the configuration.
local config = wezterm.config_builder()

config.color_scheme = "Brogrammer"
config.window_background_opacity = 0.7
config.win32_system_backdrop = "Acrylic"
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.font = wezterm.font("Iosevka Nerd Font", { weight = "Regular", stretch = "Normal", style = "Normal" })
config.default_prog = { "pwsh.exe" }
config.enable_scroll_bar = true

mapping.add_custom_binding(config)

wezterm.on("gui-startup", function(cmd)
	local tab, pane, window = mux.spawn_window(cmd or {})
	window:gui_window():maximize()
end)

-- and finally, return the configuration to wezterm
return config
