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
config.font = wezterm.font("Bitstream Vera Sans Mono Nerd Font")
config.check_for_updates = false
config.font_size = 12.0
config.colors = {
  foreground = "#CBCCC6",
  background = "#1F2430",
  cursor_bg = "#BFBAB0",
  cursor_fg = "#FF3333",
  cursor_border = "#BFBAB0",
  ansi = {
    "#1F2430",
    "#FF3333",
    "#A6CC70",
    "#FFD580",
    "#77A8D9",
    "#B48EAD",
    "#95E6CB",
    "#CBCCC6",
  },
  brights = {
    "#BFBAB0",
    "#FF3333",
    "#BAE67E",
    "#FFE6B3",
    "#73D0FF",
    "#D4BFFF",
    "#5CCFE6",
    "#FFFFFF",
  },
}

config.keys = {
  -- Turn off the default CMD-m Hide action, allowing CMD-m to
  -- be potentially recognized and handled by the tab
  { key = 'o', mods = 'CTRL|SHIFT', action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' } },
  { key = 'e', mods = 'CTRL|SHIFT', action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' } },
}
-- and finally, return the configuration to wezterm
return config
