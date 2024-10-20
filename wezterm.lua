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
config.colors = {
  cursor_bg = '#52ad70',
  cursor_fg = 'black'
}
config.integrated_title_button_style = "Gnome"
config.tab_bar_at_bottom = false
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

-- Date and battery.
wezterm.on('update-right-status', function(window, pane)
  -- "Wed Mar 3 08:14"
  local date = wezterm.strftime '%a %b %-d %H:%M '

  local bat = ''
  for _, b in ipairs(wezterm.battery_info()) do
    bat = '🔋 ' .. string.format('%.0f%%', b.state_of_charge * 100)
  end

  window:set_right_status(wezterm.format {
    { Text = bat .. '   ' .. date },
  })
end)

mapping.add_custom_binding(config)

wezterm.on("gui-startup", function(cmd)
	local tab, pane, window = mux.spawn_window(cmd or {})
	window:gui_window():maximize()
end)

-- and finally, return the configuration to wezterm
return config
