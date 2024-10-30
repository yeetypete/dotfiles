-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
    config = wezterm.config_builder()
end

-- This is where you actually apply your config choices
-- For example, changing the color scheme:
config.use_fancy_tab_bar = false
config.warn_about_missing_glyphs = false
config.window_decorations = "RESIZE"
config.enable_tab_bar = false
config.check_for_updates = false
config.font_size = 12.0
config.color_scheme = "Dark+"
config.default_prog = {"/usr/bin/fish", "-l"}

config.keys = {}
-- and finally, return the configuration to wezterm
return config
