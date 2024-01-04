#     __                        __
#    / /___  ____ _____  __  __/ /_
#   / / __ \/ __ `/ __ \/ / / / __/    Jan Mirco Pfeifer
#  / / /_/ / /_/ / /_/ / /_/ / /_      https://github.com/janmirco
# /_/\____/\__, /\____/\__,_/\__/
#         /____/

# ~/.bash_logout: executed by bash(1) when login shell exits.

# when leaving the console clear the screen to increase privacy

if [ "$SHLVL" = 1 ]; then
    [ -x /usr/bin/clear_console ] && /usr/bin/clear_console -q
fi
