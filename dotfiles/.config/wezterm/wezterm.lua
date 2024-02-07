local wezterm = require("wezterm")
local config = {}

-- window
config.window_decorations = "NONE"
config.adjust_window_size_when_changing_font_size = false
config.hide_tab_bar_if_only_one_tab = true
config.window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
}
-- TODO: Set window size at launch similar to alacritty

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
