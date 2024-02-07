local wezterm = require("wezterm")
local config = {}

-- window
config.initial_rows = 30
config.initial_cols = 150
config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }
config.window_decorations = "NONE"
config.hide_tab_bar_if_only_one_tab = true
config.adjust_window_size_when_changing_font_size = false

-- font
config.font = wezterm.font("JetBrains Mono")
config.font_size = 12.75

-- color schemes
config.color_scheme = "Konsolas"
-- TODO: Set colors to ~/.config/alacritty/colors/linux.toml. This is not the same as 'Konsolas'. For example, dim colors are not the same. See when comparing alias `g`.

return config

-- ISSUE:
-- On startup, cursor missing and window in background, depending on other open windows.
-- See https://github.com/wez/wezterm/issues/4224.
