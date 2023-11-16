# ==============================================================================
#            ____            _                _ _
#           |  _ \          | |         /\   | (_)
#           | |_) | __ _ ___| |__      /  \  | |_  __ _ ___  ___  ___
#           |  _ < / _` / __| '_ \    / /\ \ | | |/ _` / __|/ _ \/ __|
#           | |_) | (_| \__ \ | | |  / ____ \| | | (_| \__ \  __/\__ \
#           |____/ \__,_|___/_| |_| /_/    \_\_|_|\__,_|___/\___||___/
#
# ==============================================================================

# --------------------------------------------------------------------
#   Information

# disable alias temporarily by using backslash:
#   black --version  --> with    alias: __main__.py, version 20.8b1
#   \black --version --> without alias: black, version 20.8b1


# --------------------------------------------------------------------
#   Config shortcuts

alias ba='$EDITOR $HOME/.bash_aliases'
alias bb='$EDITOR $HOME/.bashrc'
alias gg='$EDITOR $HOME/.gitconfig'
alias gi='$EDITOR $HOME/.gitignore'
alias nn='$EDITOR $HOME/.config/nvim/init.lua'
alias nt='$EDITOR $HOME/README.md'
alias tt='$EDITOR $HOME/.tmux.conf'


# --------------------------------------------------------------------
#   General

alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias ......='cd ../../../../../'
alias .......='cd ../../../../../../'
alias animGitHistory='$HOME/scripts/showAnimatedHistory.sh'
alias ascii='figlet -f big'
alias bat='batcat'
alias batless='bat --pager "less -RF"'
alias bl='bluetooth toggle'
alias calcurseExport='$HOME/scripts/calcurse_export.sh'
alias cc='calcurse'
alias ccExport='$HOME/scripts/calcurse_export.sh'
alias cdb='cd -'  # go to previous dir
alias cheat='f(){ curl --silent cht.sh/"$1"/"$2" | bat; unset -f f; }; f'
alias checkNonAscii='grep --color='auto' -P -n "[\x80-\xFF]"'
alias chmoddirs='chmod 775'
alias chmodfiles='chmod 664'
alias cht='f(){ curl --silent cht.sh/"$1"/"$2" | bat; unset -f f; }; f'
alias diff='diff --side-by-side --color=always --report-identical-files'
alias disk_free='df --human-readable | sort --human-numeric-sort --reverse'
alias disk_usage='$HOME/scripts/disk_usage.sh'
alias disk_usage_tui='ncdu'
alias du='f(){ du --human-readable --max-depth=1 "$1" | sort --human-numeric-sort --reverse; unset -f f; }; f'
alias expand='f(){ expand --initial --tabs=4 "$1" > tmp.txt; rm -f "$1"; mv tmp.txt "$1"; unset -f f; }; f'
alias fd='fdfind --hidden --no-ignore'
alias grep='grep --color=always'
alias helpgrep='f() { "$1" --help | grep --color=always -i "$2"; unset -f f; }; f'
alias hexToDec='f(){ echo "ibase=16; $1" | bc; unset -f f; }; f'
alias ip_address='hostname --all-ip-addresses | sed --expression "s/ .*//"'
alias jupyter-convert='f(){ jupyter nbconvert --to script "$1"; unset -f f; }; f'
alias l='ls -lAhv --group-directories-first --color=always'
alias lb='f(){ ls -lahFv --group-directories-first --color=always $1 | bat; unset -f f; }; f'
alias ldpathlist='echo "$LD_LIBRARY_PATH" | tr ":" "\n"'
alias ll='ls -lAhv --group-directories-first --color=always'
alias mansearch='f(){ man -k "$1"; unset -f f; }; f'
alias n='$HOME/scripts/notes.sh'
alias notes='$HOME/scripts/notes.sh'
alias nvidiaopen='__NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia'
alias nvidiawatch='watch -n 1 nvidia-smi'
alias oo='octave'
alias open='xdg-open'
alias pa='$HOME/scripts/paste_to_note.sh'
alias paste_clipboard_to_note='$HOME/scripts/paste_to_note.sh'
alias pathlist='echo "$PATH" | tr ":" "\n"'
alias pngtomp4='ffmpeg -framerate 25 -i image%04d.png movie.mp4'
alias pp='python3'
alias pv='paraview'
alias pvnvidia='__NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia paraview'
alias pvvtu='f(){ $HOME/scripts/create_pvd.py "$1" && paraview "$1"/run.pvd; unset -f f; }; f'
alias renameAll='rename "s/\ /_/g" *; rename "s/(\(|\)|\[|\]|\{|\})//g" *; rename "y/A-Z/a-z/" *'
alias rm='rm -i'
alias rr='ranger'
alias show_path='echo "$PATH" | tr ":" "\n"'
alias softlink='f(){ ln -s "$1" "$2"; unset -f f; }; f'  # 1: source, 2: soft link
alias t='tree -avA --dirsfirst -I ".git|node_modules|env"'
alias tree1='tree -avA --dirsfirst -I ".git|node_modules|env" -L 1'
alias tree2='tree -avA --dirsfirst -I ".git|node_modules|env" -L 2'
alias tree3='tree -avA --dirsfirst -I ".git|node_modules|env" -L 3'
alias tree4='tree -avA --dirsfirst -I ".git|node_modules|env" -L 4'
alias tree5='tree -avA --dirsfirst -I ".git|node_modules|env" -L 5'
alias tree='tree -avA --dirsfirst -I ".git|node_modules|env"'
alias unexpand='f(){ unexpand --first-only --tabs=4 "$1" > tmp.txt; rm -f "$1"; mv tmp.txt "$1"; unset -f f; }; f'
alias vim='vi'
alias wca='echo "lines, words, characters:"; cat $(find ./ -type f) | wc -l -w -m'
alias wcx='f(){ echo "lines, words, characters:"; cat $(find ./ -type f -iname \*.$1) | wc -l -w -m; unset -f f; }; f'
alias webcam='ffplay -fs -i /dev/video0'
alias xclip_copy='xclip -selection clipboard'  # cat README.md | xclip_copy
alias xclip_paste='xclip -selection clipboard -out'  # xclip_paste > README.md
alias yank='yank-cli -- xsel -b'


# --------------------------------------------------------------------
#   Git

alias gv='git difftool'
alias gm='git mergetool'

git_format="%C(bold blue)%h%C(reset) %C(bold green)[%ci]%C(reset) %C(dim white)%an%  ->%C(reset) %C(white)%s%C(reset) %C(bold yellow)%d%C(reset)"

alias gl='git log    -15 --date-order --branches --remotes --tags --graph --abbrev-commit --decorate --format=format:"$git_format"'
alias gll='git log --all --date-order --branches --remotes --tags --graph --abbrev-commit --decorate --format=format:"$git_format"'
alias gbr='git log --all --date-order --branches --remotes --tags --graph --abbrev-commit --decorate --simplify-by-decoration --oneline'
alias glist='git ls-tree --full-tree -r --name-only HEAD'

alias gs='clear   && git status --short && echo                    && echo && git log  -5 --date-order --branches --remotes --tags --graph --abbrev-commit --decorate --format=format:"$git_format" && echo && echo "${bold}${yellow}[STASH LIST]:${reset}" && git stash list'
alias gss='clear  && git status         && echo && git diff --stat && echo && git log -15 --date-order --branches --remotes --tags --graph --abbrev-commit --decorate --format=format:"$git_format" && echo && echo "${bold}${yellow}[STASH LIST]:${reset}" && git stash list'
alias gsss='clear && git status && echo && echo "${bold}${yellow}[STASH LIST]:${reset}" && git stash list'

alias gfindrepos='find . -name .git -type d -prune'
alias gcountrepos='find . -name .git -type d -prune | wc --lines'

alias g.='cd "$(git rev-parse --show-toplevel)"'  # go to git root directory

alias gupdatetodos='cd $HOME && git add $HOME/README.md && git commit -m "[readme] Update todos"'
alias gupdatelazylock='cd $HOME && git add $HOME/.config/nvim/lazy-lock.json && git commit -m "[nvim/lazy] Update lazy-lock.json"'


# --------------------------------------------------------------------
#   Neovim and fzf

alias fcd='dir_name="$(find ./ -type d -not -path "*/\.git*" -not -path "*/node_modules*" | fzf)"; if ! [ "$dir_name" == "" ]; then cd "$dir_name"; fi; unset -v dir_name;'
alias fcdHome='dir_name="$(find ~/ -type d -not -path "*/\.git*" -not -path "*/node_modules*" | fzf)"; if ! [ "$dir_name" == "" ]; then cd "$dir_name"; fi; unset -v dir_name;'

alias fO='$HOME/scripts/fOpen.sh'
alias fOexit='$HOME/scripts/fOpen.sh && exit'
alias fOnvim='$HOME/scripts/fOpenNeovim.sh'
alias fOnvimHome='$HOME/scripts/fOpenNeovimHome.sh'
alias fOpic='$HOME/scripts/fOpic.sh'
alias fOpicdir='$HOME/scripts/fOpicdir.sh'
alias fo='$HOME/scripts/fOpenNeovim.sh'
alias fopen='$HOME/scripts/fOpen.sh'

alias nv='$EDITOR'
alias nvs='$EDITOR -S $HOME/.config/$EDITOR/sessions/last_session.vim'
alias nvS='$EDITOR -S'
alias fnv='$EDITOR $(fzf)'
alias nvdiff='$EDITOR -d'
alias nvg='$HOME/scripts/nvg.sh'
alias nvgx='$HOME/scripts/nvgx.sh'
alias nvgi='$HOME/scripts/nvgi.sh'
alias nvgix='$HOME/scripts/nvgix.sh'
alias nvx='$HOME/scripts/nvx.sh'
alias nvf='$HOME/scripts/nvf.sh'
alias nvm='$HOME/scripts/nvm.sh'
alias nvu='$HOME/scripts/nvu.sh'
alias nva='$HOME/scripts/nva.sh'
alias nvt='$HOME/scripts/nvt.sh'
alias nv1='f(){ nv $(ls | head --lines "$1"); unset -f f; }; f'
alias nv0='f(){ nv $(ls | tail --lines "$1"); unset -f f; }; f'

alias nvgrid='f(){ $EDITOR "$1" -c "vsplit "$2" | wincmd h | split "$3" | wincmd l | split "$4" | wincmd k | wincmd h | wincmd ="; unset -f f; }; f'
alias nvmain='f(){ $EDITOR "$1" -c "vsplit "$2" | split "$3" | split "$4" | wincmd h | wincmd ="; unset -f f; }; f'

alias nvsudo='sudo $HOME/bin/neovim/nvim-linux64/bin/nvim'


# --------------------------------------------------------------------
#   PDFs

alias combinepdfs='$HOME/scripts/combinepdfs.sh'
alias compresspdf='f(){ name="$(basename "$1" .pdf)"; ps2pdf "$name".pdf "$name"_compressed.pdf; unset -v name; unset -f f; }; f'
alias convert2pdf='f(){ name="$(basename "$1" .png)"; convert "$name".png "$name".pdf; unset -v name; unset -f f; }; f'
alias greppdf='$HOME/scripts/greppdf.sh'
alias greppdfmulti='$HOME/scripts/greppdfmulti.sh'
alias numPagespdf='f(){ pdftk "$1" dump_data | grep NumberOfPages | awk "{print \$2}"; unset -f f; }; f'
alias removepdfpassword='f(){ name="$(basename "$1" .pdf)"; pdftk "$name".pdf input_pw "$2" output "$name"_unprotected.pdf; unset -v name; unset -f f; }; f'
alias renamepdfs='rename "s/\ /_/g" *.pdf; rename "s/(\(|\)|\[|\]|\{|\})//g" *.pdf; rename "y/A-Z/a-z/" *.pdf'
alias rotatepdfclock='$HOME/scripts/rotatepdf.sh'
alias rotatepdfanti='$HOME/scripts/rotatepdfanti.sh'
alias scan2pdf='$HOME/scripts/scan2pdf.sh'
alias separatepdf='$HOME/scripts/separatepdf.sh'


# --------------------------------------------------------------------
#   Python

alias activate='source */*/activate'
alias black='python3 -m black'
alias blackcheck='python3 -m black --color --check --diff'
alias pip='python3 -m pip'


# --------------------------------------------------------------------
#   System and processes

alias batteryInfo='acpi -V'
alias hardwareInfo='sudo lshw'
alias systemInfo='sudo tlp-stat -b -c -d -e -g -p -r -s -t -u -w -v'
alias cpuTemp='sensors | grep -i "core "'

# get the ID of a process
alias plist='ps -A | less'
alias pgrepc='ps -A | grep -i' # or simply use `pgrep`

# stop a process
# kill <PROCESS_ID>
# pkill <PROGRAMM_NAME>
# e.g.: pkill nvim (kills ALL running nvim processes)


# --------------------------------------------------------------------
#   TMUX

alias tn='tmux -u'
alias tnew='tmux -u new -s "$(basename "$(pwd)")"'  # -s SESSION_NAME
alias ta='tmux -u attach'  # -t TARGET_SESSION
alias td='tmux detach'  # -t TARGET_SESSION
alias trses='tmux rename-session'  # -t TARGET_SESSION NEW_NAME (unfortunately, `tr` is the name of a GNU program)
alias trwin='tmux rename-window "$(basename "$(pwd)")"'  # -t TARGET_SESSION NEW_NAME (unfortunately, `tr` is the name of a GNU program)
alias tls='tmux list-sessions'
alias tlk='tmux list-keys'

# kill commands to dangerous as an alias! Do it manually by:
# tmux kill-session  # to kill last attached session
# tmux kill-session -t TARGET_SESSION
# tmux kill-server


# --------------------------------------------------------------------
#   UMAN

alias uApt='$HOME/uman/uApt.sh'
alias uBios='$HOME/uman/uBios.sh'
alias uDaily='$HOME/uman/uDaily.sh'
alias uEditor='$HOME/uman/uEditor.sh'
alias uNeovim='$HOME/uman/uNeovim.sh'
alias uNodejs='$HOME/uman/uNodejs.sh'
alias uSnap='$HOME/uman/uSnap.sh'
alias uSystem='$HOME/uman/uSystem.sh'
alias uTldr='$HOME/uman/uTldr.sh'
