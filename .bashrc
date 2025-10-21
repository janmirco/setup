#     __               __
#    / /_  ____ ______/ /_  __________
#   / __ \/ __ `/ ___/ __ \/ ___/ ___/    Jan Mirco Pfeifer
#  / /_/ / /_/ (__  ) / / / /  / /__      https://github.com/janmirco
# /_.___/\__,_/____/_/ /_/_/   \___/

# set encoding explicitly
export LANG="en_US.UTF-8"

# set editor and pager
export EDITOR="nvim"
export VISUAL="$EDITOR"
export PAGER="less -FRX"
export MANPAGER="$EDITOR +Man!"

# If not running interactively, don't do anything
case $- in
    *i*) ;;
    *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# enable completion
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi

# search your argument history with arrow keys up/down
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

# enable color support of ls
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

# define colors
reset=$(tput sgr0)
bold=$(tput bold)
black=$(tput setaf 0)
red=$(tput setaf 1)
green=$(tput setaf 2)
yellow=$(tput setaf 3)
blue=$(tput setaf 4)
magenta=$(tput setaf 5)
cyan=$(tput setaf 6)
white=$(tput setaf 7)

# set prompt
source "$HOME/.config/bash/git-prompt.sh"
GIT_PS1_SHOWDIRTYSTATE=true  # for showing staged/unstaged files
GIT_PS1_SHOWUNTRACKEDFILES=true  # for showing untracked files
GIT_PS1_SHOWUPSTREAM=auto  # for showing if ahead/behind of remote
PS1=''
if [[ "$USER" != "jan" ]]; then
    PS1+='${bold}${green} \u ${bold}${red} \h\n'
fi
PS1+='${bold}${blue} \W${reset} $(__git_ps1 "%s")${reset}\n '

# source additional configs
source "$HOME/.bash_secrets"
source "$HOME/.config/bash/aliases.sh"
source "$HOME/.config/bash/path.sh"

# abaqus settings
export ABQ_USUB_GFORTRAN=1

# bat settings
export BAT_THEME="Catppuccin Mocha"

# conda settings
function run_conda_settings() {
    __conda_setup="$($HOME/miniconda3/bin/conda shell.bash hook 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ]; then
            . "$HOME/miniconda3/etc/profile.d/conda.sh"
        else
            export PATH="$HOME/miniconda3/bin:$PATH"
        fi
    fi
    unset __conda_setup
}

# fzf settings
eval "$(fzf --bash)"  # set up fzf key bindings and fuzzy completion
export FZF_CATPPUCCIN_FRAPPE=" \
    --color=bg+:#414559,bg:#303446,spinner:#F2D5CF,hl:#E78284 \
    --color=fg:#C6D0F5,header:#E78284,info:#CA9EE6,pointer:#F2D5CF \
    --color=marker:#BABBF1,fg+:#C6D0F5,prompt:#CA9EE6,hl+:#E78284 \
    --color=selected-bg:#51576D \
    --color=border:#737994,label:#C6D0F5"
export FZF_KEY_BINDS=" \
    --bind 'tab:down' \
    --bind 'shift-tab:up' \
    --bind 'alt-j:preview-page-down' \
    --bind 'alt-k:preview-page-up'"
export FZF_DEFAULT_OPTS="--layout=reverse --border $FZF_KEY_BINDS $FZF_CATPPUCCIN_FRAPPE"
export MY_FZF_EXCLUDES="--exclude .env --exclude .venv --exclude env --exclude venv --exclude node_modules --exclude .git --exclude .jj --exclude __pycache__"
export FZF_DEFAULT_COMMAND="fd --hidden --no-ignore-vcs $MY_FZF_EXCLUDES --type file"

## jj settings
source <(COMPLETE=bash jj)

# starship settings
eval "$(starship init bash)"
export STARSHIP_CONFIG="$HOME/.config/starship/config.toml"

# uv settings
eval "$(uv generate-shell-completion bash)"

# zoxide settings
eval "$(zoxide init bash)"
