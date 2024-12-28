local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.color_scheme = 'Night Owl (Gogh)'

config.enable_tab_bar = false

-- config.font = wezterm.font('CaskaydiaCove Nerd Font Propo', { weight = 'Medium' })
-- config.line_height = 1.54
-- config.font_size = 15
config.font = wezterm.font('RecMonoSmCasual Nerd Font', { weight = 'Medium' })
config.line_height = 1.5
config.font_size = 16

config.window_padding = {
  left = 3,
  right = 0,
  top = 5,
  bottom = 0
}

return config
