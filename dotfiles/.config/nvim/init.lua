-- =============================================================================
--      _   _                 _              _____             __ _
--     | \ | |               (_)            / ____|           / _(_)
--     |  \| | ___  _____   ___ _ __ ___   | |     ___  _ __ | |_ _  __ _
--     | . ` |/ _ \/ _ \ \ / / | '_ ` _ \  | |    / _ \| '_ \|  _| |/ _` |
--     | |\  |  __/ (_) \ V /| | | | | | | | |___| (_) | | | | | | | (_| |
--     |_| \_|\___|\___/ \_/ |_|_| |_| |_|  \_____\___/|_| |_|_| |_|\__, |
--                                                                   __/ |
--                                                                  |___/
-- =============================================================================

-- Keyboard repeat recommendation:
--   Delay: 400 ms
--   Rate: 40 repeats/s

vim.g.python3_host_prog = "/bin/python3"
vim.g.mapleader = " "

require("plugins")
require("syntax")
require("options")
require("maps")
require("format")
require("rulers")
