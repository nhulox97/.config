local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.color_scheme = 'Catppuccin Mocha'

config.enable_tab_bar = false

config.font = wezterm.font 'CaskaydiaCove Nerd Font Propo'
config.line_height = 1.65
config.font_size = 15

return config
