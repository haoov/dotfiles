local wezterm = require("wezterm")

local config = wezterm.config_builder()

local haoov = require("colors/haoov");
config.font = wezterm.font 'MesloLGL Nerd Font'

config.font_size = 13

config.enable_tab_bar = false

config.window_decorations = "TITLE | RESIZE"

config.colors = haoov

return config
