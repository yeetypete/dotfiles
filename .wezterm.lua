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
-- config.initial_cols = 89
-- config.initial_rows = 26
-- For example, changing the color scheme:
use_fancy_tab_bar = false
--config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true
window_decorations = "INTEGRATED_BUTTONS"
config.color_scheme = 'Dark+'
config.font = wezterm.font('MesloLGS NF')
config.keys = {
  -- Turn off the default CMD-m Hide action, allowing CMD-m to
  -- be potentially recognized and handled by the tab
  {key = 'h', mods = 'CTRL|SHIFT', action = wezterm.action.SplitHorizontal {domain = 'CurrentPaneDomain'}},
  {key = 'g', mods = 'CTRL|SHIFT', action = wezterm.action.SplitVertical {domain = 'CurrentPaneDomain'}},
 }
-- and finally, return the configuration to wezterm
return config
