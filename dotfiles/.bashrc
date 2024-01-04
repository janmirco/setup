#     __               __
#    / /_  ____ ______/ /_  __________
#   / __ \/ __ `/ ___/ __ \/ ___/ ___/    Jan Mirco Pfeifer
#  / /_/ / /_/ (__  ) / / / /  / /__      https://github.com/janmirco
# /_.___/\__,_/____/_/ /_/_/   \___/

# set encoding explicitly
export LANG="en_US.UTF-8"

# set editor and pager
export EDITOR="nvim"
export VISUAL="nvim"
export PAGER="less"

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



# ==============================================================================
#   Prompt and coloring

# define color variables
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

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
    xterm-kitty) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=yes
    else
        color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    GIT_PS1_SHOWDIRTYSTATE=true  # for showing staged/unstaged files
    GIT_PS1_SHOWUNTRACKEDFILES=true  # for showing untracked files
    GIT_PS1_SHOWUPSTREAM='auto'  # for showing if head/behind of remote
    PS1='${debian_chroot:+($debian_chroot)}'
    PS1+='${bold}${blue}\W${reset}'
    PS1+=' $(__git_ps1 "%s")${reset}'
    PS1+='\n\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# if this is an xterm set the title to user@host:dir
case "$TERM" in
    xterm*|rxvt*)
        PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
        ;;
    *)
        ;;
esac

# enable color support of ls
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi



# ==============================================================================
#   Enable programmable completion

# you don't need to enable this, if it's already enabled in /etc/bash.bashrc
# and /etc/profile sources /etc/bash.bashrc
# on Win10 with WSL, first: sudo apt-get install bash-completion
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



# ==============================================================================
#   Imports

source "$HOME/.bash_aliases"
source "$HOME/.bash_path"
source "$HOME/.git-prompt.sh"
source "$HOME/.config/fzf/shell/completion.bash"
source "$HOME/.config/fzf/shell/key-bindings.bash"

# https://github.com/nvbn/thefuck#installation
eval $(thefuck --alias)

# https://www.rust-lang.org/tools/install
source "$HOME/.cargo/env"

# modular
export MODULAR_HOME="$HOME/.modular"
export PATH="$MODULAR_HOME/pkg/packages.modular.com_mojo/bin:$PATH"
