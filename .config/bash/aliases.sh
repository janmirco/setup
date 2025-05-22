#          ___
#   ____ _/ (_)___ _________  _____
#  / __ `/ / / __ `/ ___/ _ \/ ___/    Jan Mirco Pfeifer
# / /_/ / / / /_/ (__  )  __(__  )     https://github.com/janmirco
# \__,_/_/_/\__,_/____/\___/____/

# --------------------------------------------------------------------
#   Config shortcuts

alias aa="$EDITOR $HOME/.config/alacritty/alacritty.toml"
alias ba="$EDITOR $HOME/.config/bash/aliases.sh"
alias bb="$EDITOR $HOME/.bashrc"
alias gg="$EDITOR $HOME/.config/git/config"
alias hh="$EDITOR $HOME/.config/ghostty/config"
alias jjc="$EDITOR $HOME/.config/jj/config.toml"
alias nd="$EDITOR $HOME/.todo-txt/todo.txt"
alias ndc="$EDITOR $HOME/.todo-txt/todo.cfg"
alias ndd="$EDITOR $HOME/.todo-txt/README.md"
alias nn="$EDITOR $HOME/.config/nvim/init.lua"
alias rr="$EDITOR $HOME/.config/rofi/config.rasi"
alias ss="$EDITOR $HOME/.config/starship/config.toml"
alias tt="$EDITOR $HOME/.config/tmux/tmux.conf"
alias vv="$EDITOR $HOME/.config/vim/config.vim"
alias ww="$EDITOR $HOME/.config/wezterm/wezterm.lua"
alias yy="$EDITOR $HOME/.config/yazi/yazi.toml"


# --------------------------------------------------------------------
#   General

alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias ......='cd ../../../../../'
alias .......='cd ../../../../../../'
alias abq='abaqus cae'
alias abql='abaqus licensing lmstat -A'
alias abqnogui='abaqus cae noGUI=main.py; cp abaqus.rpy abaqus_save.rpy'
alias abqscript='abaqus cae script=main.py; cp abaqus.rpy abaqus_save.rpy'
alias animGitHistory='$HOME/scripts/showAnimatedHistory.sh'
alias ascii='figlet -f big'
alias bat='bat --pager never'
alias bl='bluetooth toggle'
alias blexit='bluetooth toggle && exit'
alias c='clear'
alias calcurseExport='$HOME/scripts/calcurse_export.sh'
alias cc='calcurse'
alias ccExport='$HOME/scripts/calcurse_export.sh'
alias cdb='cd -'  # go to previous dir
alias cdn='cd $HOME/.config/nvim'  # go to nvim dir
alias change_git_access_token="$HOME/scripts/change_git_access_token.sh"
cheat() {
    curl --silent cht.sh/"$1"/"$2" | bat
}
alias checkNonAscii='grep --color="auto" -P -n "[\x80-\xFF]"'
alias chmoddirs='chmod 775'
alias chmodfiles='chmod 664'
cht() {
    curl --silent cht.sh/"$1"/"$2" | bat
}
alias cl='clear; ls -l --almost-all --human-readable --group-directories-first --color=always'
alias cm='clear; make'
alias crop='$HOME/scripts/crop.sh'
alias crop_png='$HOME/scripts/crop_png.sh'
alias ct='clear; tree -avAC --dirsfirst -I ".git|.jj|node_modules|venv|.venv|env"'
alias d='todo-txt -d $HOME/.todo-txt/todo.cfg'
alias da='todo-txt -d $HOME/.todo-txt/todo.cfg add'
alias dd='todo-txt -d $HOME/.todo-txt/todo.cfg del'
alias diff='diff --side-by-side --color=always --report-identical-files'
alias disk_free='df --human-readable | sort --human-numeric-sort --reverse'
alias disk_usage='$HOME/scripts/disk_usage.sh'
alias disk_usage_tui='ncdu'
alias dl='clear; todo-txt -d $HOME/.todo-txt/todo.cfg list'
alias dla='clear; todo-txt -d $HOME/.todo-txt/todo.cfg listall'
alias dlc='clear; todo-txt -d $HOME/.todo-txt/todo.cfg listcon'
alias dlh='clear; todo-txt -d $HOME/.todo-txt/todo.cfg list | head'
alias dlj='clear; todo-txt -d $HOME/.todo-txt/todo.cfg listproj'
alias dlp='clear; todo-txt -d $HOME/.todo-txt/todo.cfg listpri'
alias dlpa='clear; todo-txt -d $HOME/.todo-txt/todo.cfg listpri a'
alias dlpb='clear; todo-txt -d $HOME/.todo-txt/todo.cfg listpri b'
alias dlpc='clear; todo-txt -d $HOME/.todo-txt/todo.cfg listpri c'
alias dlpd='clear; todo-txt -d $HOME/.todo-txt/todo.cfg listpri d'
alias dlpe='clear; todo-txt -d $HOME/.todo-txt/todo.cfg listpri e'
alias doi='$HOME/scripts/doi_magic.sh'
alias dp='todo-txt -d $HOME/.todo-txt/todo.cfg pri'
alias dr='todo-txt -d $HOME/.todo-txt/todo.cfg replace'
alias dx='todo-txt -d $HOME/.todo-txt/todo.cfg do'
alias eza='eza --long --all --group-directories-first --sort Name'
alias ezat='eza --long --all --group-directories-first --sort Name --total-size'
alias ghosttime='npx ghosttime --no-focus-pause'
alias glow='glow --pager'
alias gmsh='/usr/bin/gmsh'
alias grep='grep --color=always'
helpgrep() {
    "$1" --help | grep --color=always -i "$2"
}
hextodec() {
    echo "ibase=16; $1" | bc
}
alias ip_address='hostname --all-ip-addresses | sed --expression "s/ .*//"'
alias l='ls -l --almost-all --human-readable --group-directories-first --color=always'
lb(){
    ls -l --almost-all --human-readable --group-directories-first --color=always "$1" | bat
}
alias ldpathlist='echo "$LD_LIBRARY_PATH" | tr ":" "\n"'
alias ll='ls -l --almost-all --human-readable --group-directories-first --color=always'
alias ls='ls --group-directories-first --color=always'
alias lsyearmd='ls *{1,2}???*.md'
alias m='make'
mansearch() {
    man -k "$1"
}
alias n='$HOME/scripts/notes.sh'
alias notes='$HOME/scripts/notes.sh'
alias nushell='nu'
alias nvidiaopen='__NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia'
alias nvidiawatch='watch -n 1 nvidia-smi'
alias o='$HOME/scripts/open.sh'
alias oo='octave'
alias open='$HOME/scripts/open.sh'
alias openall='$HOME/scripts/open.sh'
openexit() {
    $HOME/scripts/open.sh "$@"
    exit
}
alias openpdfs='$HOME/scripts/open.sh pdf'
alias p="$HOME/scripts/pass.sh && exit"
alias pa='$HOME/scripts/paste_to_note.sh'
alias paste_clipboard_to_note='$HOME/scripts/paste_to_note.sh'
alias pathlist='echo "$PATH" | tr ":" "\n"'
alias png2gif="$HOME/scripts/png2gif.sh"
alias pngtomp4='ffmpeg -framerate 25 -i image%04d.png movie.mp4'
alias pp='python3'
alias ppass="$HOME/scripts/pass.sh && exit"
prettiercheck() {
    prettier --tab-width 4 --check *."$1"
}
prettierwrite() {
    prettier --tab-width 4 --write *."$1"
}
alias pv='paraview'
alias pvnvidia='__NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia paraview'
pvvtu() {
    $HOME/scripts/create_pvd.py "$1" && paraview "$1"/run.pvd
}
qr() {
    qrencode --type PNG --output qr_code.png --size 10 --level H "$1"
}
qrsvg() {
    qrencode --type SVG --output qr_code.svg "$1"
}
alias renameAll='rename "s/\ /_/g" *; rename "s/(\(|\)|\[|\]|\{|\})//g" *; rename "y/A-Z/a-z/" *'
rg_glob="!{**/*egg-info/*,**/.*cache*/*,**/.byobu/*,**/.cache/*,**/.cargo/*,**/.config/abiword/*,**/.config/akonadi/*,**/.config/autostart/*,**/.config/BraveSoftware/*,**/.config/cat_installer/*,**/.config/cef_user_data/*,**/.config/coc/*,**/.config/Code/*,**/.config/dconf/*,**/.config/enchant/*,**/.config/fltk.org/*,**/.config/freerdp/*,**/.config/ghb/*,**/.config/GIMP/*,**/.config/google-chrome/*,**/.config/gtk-2.0/*,**/.config/gtk-3.0/*,**/.config/gtk-4.0/*,**/.config/htop/*,**/.config/ibus/*,**/.config/inkscape/*,**/.config/kde.org/*,**/.config/KDE/*,**/.config/kdeconnect/*,**/.config/kdedefaults/*,**/.config/khtml/*,**/.config/lazygit/*,**/.config/libaccounts-glib/*,**/.config/libreoffice/*,**/.config/menus/*,**/.config/microsoft-edge/*,**/.config/neofetch/*,**/.config/nvim/autoload/*,**/.config/nvim/undodir/*,**/.config/obs-studio/*,**/.config/obsidian/*,**/.config/octave/*,**/.config/ookla/*,**/.config/ParaView/*,**/.config/pavucontrol-qt/*,**/.config/pulse/*,**/.config/remmina/*,**/.config/sciebo/*,**/.config/session/*,**/.config/texstudio/*,**/.config/thefuck/*,**/.config/ticktick/*,**/.config/tmux/plugins*,**/.config/Unknown\ Organization/*,**/.config/VirtualBox/*,**/.config/vlc/*,**/.config/xm1/*,**/.config/xsettingsd/*,**/.dotnet/*,**/.fltk/*,**/.fonts/*,**/.git/*,**/.gnome/*,**/.gnupg/*,**/.imageio/*,**/.ipython/*,**/.java/*,**/.jj/*,**/.julia/*,**/.jupyter/*,**/.kde/*,**/.keras/*,**/.local/*,**/.Mathematica/*,**/.modular/*,**/.mozilla/*,**/.mplayer/*,**/.npm/*,**/.nv/*,**/.openjfx/cache/*,**/.org.jabref.gui.JabRefMain/*,**/.pki/*,**/.pulsesecure/*,**/.rpmdb/*,**/.rustup/*,**/.texlive2021/*,**/.thunderbird/*,**/.var/*,**/.Wolfram/*,**/.zoom/*,**/__pycache__/*,**/CATSettings/*,**/env/*,**/node_modules/*,**/snap/*,**/vbox/*,**/venv/*,**/.venv/*}"
rgi() {
  rg --hidden --no-ignore-vcs --glob "$rg_glob" --ignore-case --color=always "$@" | less -FRX
}
rgix() {
  rg --hidden --no-ignore-vcs --glob "$rg_glob" --ignore-case --glob "*.$2" "$1" --color=always | less -FRX
}
rgx() {
  rg --hidden --no-ignore-vcs --glob "$rg_glob" --glob "*.$2" "$1" --color=always | less -FRX
}
alias rm='rm -i'
search_replace() {
    sd "$1" "$2" **/*.$3
}
alias show_path='echo "$PATH" | tr ":" "\n"'
softlink() {
    ln -s "$1" "$2"  # 1: source with absolute path, 2: soft link
}
softlinkimplicit() {
    ln -s "$1" $(basename "$1")  # 1: source with absolute path
}
svg2png192() {
    inkscape --export-width=192 --export-height=192 --export-type="png" "$1"
}
svg2png() {
    inkscape --export-type="png" "$1"
}
svg2pngWH() {
    inkscape --export-width="$2" --export-height="$3" --export-type="png" "$1"
}
alias t='tree -avAC --dirsfirst -I ".git|.jj|node_modules|venv|.venv|env"'
alias tree1='tree -avAC --dirsfirst -I ".git|.jj|node_modules|venv|.venv|env" -L 1'
alias tree2='tree -avAC --dirsfirst -I ".git|.jj|node_modules|venv|.venv|env" -L 2'
alias tree3='tree -avAC --dirsfirst -I ".git|.jj|node_modules|venv|.venv|env" -L 3'
alias tree4='tree -avAC --dirsfirst -I ".git|.jj|node_modules|venv|.venv|env" -L 4'
alias tree5='tree -avAC --dirsfirst -I ".git|.jj|node_modules|venv|.venv|env" -L 5'
alias tree='tree -avAC --dirsfirst -I ".git|.jj|node_modules|venv|.venv|env"'
alias usbmount='udisksctl mount --block-device /dev/sda1'
alias usbntfsfix='ntfsfix --clear-bad-sectors /dev/sda1'
alias usbpoweroff='udisksctl power-off --block-device /dev/sda'
alias usbsaferemove='udisksctl unmount --block-device /dev/sda1 && udisksctl power-off --block-device /dev/sda'
alias usbsaferemoveexit='udisksctl unmount --block-device /dev/sda1 && udisksctl power-off --block-device /dev/sda && exit'
alias usbsaferemovereboot='udisksctl unmount --block-device /dev/sda1 && udisksctl power-off --block-device /dev/sda && reboot'
alias usbsaferemoveshutdown='udisksctl unmount --block-device /dev/sda1 && udisksctl power-off --block-device /dev/sda && shutdown now'
alias usbunmount='udisksctl unmount --block-device /dev/sda1'
alias vi="vim -u NONE"
alias vim="vim -u $HOME/.config/vim/config.vim"
alias wca='tokei'  # https://github.com/XAMPPRocky/tokei
wcx() {
    echo "lines, words, characters:"
    cat $(find ./ -type f -iname \*.$1) | wc -l -w -m
}
alias webcam='ffplay -fs -i /dev/video0'
alias xclip_copy='xclip -selection clipboard'  # cat README.md | xclip_copy
alias xclip_paste='xclip -selection clipboard -out'  # xclip_paste > README.md
alias y='yazi'
alias yank='yank-cli -- xsel -b'


# --------------------------------------------------------------------
#   flatpak

alias inkscape='flatpak run org.inkscape.Inkscape'
alias pikabackup='flatpak run org.gnome.World.PikaBackup'
alias zen='flatpak run io.github.zen_browser.zen'


# --------------------------------------------------------------------
#   klog

# Evaluate Files
#   print     Pretty-print records.
#   total     Evaluate the total time.
#   report    Print an aggregated calendar report.
#   tags      Print total times aggregated by tags.
#   today     Evaluate the current day.
#
# Manipulate Files
#   track         Add a new entry to a record.
#   start (in)    Start a new open time range.
#   stop (out)    Close the open time range.
#   pause         Pause the open time range.
#   switch        Close open range and starts a new one.
#   create        Create a new, empty record.

alias k='clear; klog print $HOME/.klog/worktimes.klg | tail && klog report $HOME/.klog/worktimes.klg --diff --now'
alias ka='$HOME/scripts/klog_archive.sh'
alias kd='klog today $HOME/.klog/worktimes.klg --diff --now'
alias kD='klog total $HOME/.klog/worktimes.klg --diff --now'
alias ki='klog start $HOME/.klog/worktimes.klg'
alias kk="$EDITOR $HOME/.klog/worktimes.klg"
alias ko='klog stop $HOME/.klog/worktimes.klg'
alias kp='klog print $HOME/.klog/worktimes.klg'
alias kr='klog report $HOME/.klog/worktimes.klg --diff --now'
alias kt='klog today $HOME/.klog/worktimes.klg --now'
alias kT='klog total $HOME/.klog/worktimes.klg --now'


# --------------------------------------------------------------------
#   Git

alias G='lazygit'
alias L='lazygit log'
alias S='lazygit status'

alias gd='git diff'
alias gb='git blame'
alias gw='git show'

alias gv='git difftool'
alias gm='git mergetool'

alias gc='$EDITOR -c "lua require(\"neogit\").open({ \"commit\" })"'

git_format="%C(bold blue)%h%C(reset) %C(bold green)%ci%C(reset) %C(dim white)%an%C(reset) -> %C(white)%s%C(reset) %C(bold yellow)%d%C(reset)"

alias gl='git log    -5 --date-order --branches --remotes --tags --graph --abbrev-commit --decorate --format=format:"$git_format"'
alias gll='git log  -15 --date-order --branches --remotes --tags --graph --abbrev-commit --decorate --format=format:"$git_format"'
alias gL='git log --all --date-order --branches --remotes --tags --graph --abbrev-commit --decorate --format=format:"$git_format"'

alias glbr='git log --all --simplify-by-decoration --oneline'
alias glistfiles='git ls-tree --full-tree -r --name-only HEAD'

alias cg='clear; git status --short'
alias g='git status --short'
alias gs='git status --short && echo && git diff --stat && echo && echo ${yellow}[STASH LIST]:${reset} && git stash list'
alias gss='git status        && echo && git diff --stat && echo && echo ${yellow}[STASH LIST]:${reset} && git stash list'

alias gfindrepos='find . -name .git -type d -prune'
alias gcountrepos='find . -name .git -type d -prune | wc --lines'

alias g.='cd "$(git rev-parse --show-toplevel)"'  # go to git root directory
alias gi='$EDITOR "$(git rev-parse --show-toplevel)"/.gitignore'

alias gcurrentstate='cd "$(git rev-parse --show-toplevel)" && git add . && git commit -m "feat: add current state"'
alias greadme='git restore --staged :/ && git add README.md && git commit -m "update readme" && git push'
alias glazylock='cd $HOME && git add $HOME/.config/nvim/lazy-lock.json && git commit -m "chore(nvim): update lazy-lock.json"'
alias gtodotxtdir='cd $HOME && git add $HOME/.todo-txt/ && git commit -m "chore(todo-txt): update entire dir"'
alias gworktimes='cd $HOME && $HOME/scripts/klog_archive.sh && git add $HOME/.klog/ && git commit -m "chore(klog): update work times"'


# --------------------------------------------------------------------
#   Jujutsu

alias j='jj'
alias ja='jj abandon'
alias jb='jj bookmark'
alias jbl='jj bookmark list'
alias jbla='jj bookmark list --all'
alias jC='jj commit'
alias jc='jj describe'
alias jd='jj diff'
alias je='jj edit'
alias jgi='jj git init --colocate'
alias jl='jj log --limit 5'
alias jlg='jj log --limit 5 --git'
alias jll='jj log --revisions ::'
alias jllg='jj log --revisions :: --git'
alias jlls='jj log --revisions :: --stat'
alias jls='jj log --limit 5 --stat'
alias jm='jj bookmark set main --revision @-'
alias jn='jj new'
alias jp='jj git fetch'
alias jP='jj git push'
alias jr='jj rebase'
alias js='jj status'
alias ju='jj undo'
alias jw='jj show'

alias j.='cd "$(jj root)"'  # go to jj workspace root directory
alias ji='$EDITOR "$(jj root)"/.gitignore'

alias jcurrentstate='cd "$(jj root)" && jj commit -m "feat: add current state"'
alias jreadme='jj commit README.md -m "update readme" && jj bookmark set main --revision @- && jj git push'
alias jlazylock='cd $HOME && jj commit ~/.config/nvim/lazy-lock.json -m "chore(nvim): update lazy-lock.json"'


# --------------------------------------------------------------------
#   fzf and fd

alias cD="source $HOME/scripts/change_directory.sh && change_directory"
alias cdd="source $HOME/scripts/change_directory.sh && change_directory current_dir"
alias cdg="source $HOME/scripts/change_directory.sh && change_directory git_repos"

alias fcp='$HOME/scripts/fcp.sh'
alias fdiff='$HOME/scripts/fdiff.sh'

alias fd='fd --hidden --no-ignore-vcs'

alias fgd='$HOME/scripts/fgd.sh'

alias f='$HOME/scripts/fopen.sh "" "" ""'
alias ff='$HOME/scripts/fopen.sh "" "" ""'
alias fh='$HOME/scripts/fopen.sh "$HOME" "" ""'
alias fc='$HOME/scripts/fopen.sh "$HOME/.config" "" ""'
alias fn='$HOME/scripts/fopen.sh "$HOME/.config/nvim" "" ""'
alias fmd='$HOME/scripts/fopen.sh "" "" "md"'
alias fx='$HOME/scripts/fopen.sh "" ""'

alias fo='$HOME/scripts/fopen.sh "" "xdg" ""'
alias fO='$HOME/scripts/fopen.sh "$HOME" "xdg" ""'

alias foexit='$HOME/scripts/fopen.sh "" "xdg" "" && exit'
alias fOexit='$HOME/scripts/fopen.sh "$HOME" "xdg" "" && exit'


# --------------------------------------------------------------------
#   Neovim

alias snv='sudo $HOME/bin/neovim/nvim-linux64/bin/nvim'

alias nv0='$HOME/scripts/nv0.sh'
alias nv1='$HOME/scripts/nv1.sh'
alias nv='$EDITOR'
alias nvS='$EDITOR -S'
alias nva='$HOME/scripts/nva.sh'
alias nvd='$EDITOR -d'
alias nvf='$HOME/scripts/nvf.sh'
alias nvg='$HOME/scripts/nvg.sh'
alias nvgi='$HOME/scripts/nvgi.sh'
alias nvgix='$HOME/scripts/nvgix.sh'
alias nvgx='$HOME/scripts/nvgx.sh'
alias nvl='$HOME/scripts/nvl.sh'
alias nvm='$HOME/scripts/nvm.sh'
alias nvp='$HOME/scripts/nvp.sh'
alias nvs='$EDITOR -S $HOME/.config/$EDITOR/sessions/last_session.vim'
alias nvt='$HOME/scripts/nvt.sh'
alias nvu='$HOME/scripts/nvu.sh'
alias nvx='$HOME/scripts/nvx.sh'
alias nvyearmd='nv *{1,2}???*.md'

nvgrid() {
    $EDITOR "$1" -c "vsplit "$2" | wincmd h | split "$3" | wincmd l | split "$4" | wincmd k | wincmd h | wincmd ="
}
nvmain() {
    $EDITOR "$1" -c "vsplit "$2" | split "$3" | split "$4" | wincmd h | wincmd ="
}

alias nvdiff='git difftool'
alias nvmerge='git mergetool'

alias nvsudo='sudo $HOME/bin/neovim/nvim-linux64/bin/nvim'


# --------------------------------------------------------------------
#   PDFs

alias combinepdfs='$HOME/scripts/combinepdfs.sh'
compresspdf() {
    name="$(basename "$1" .pdf)"
    ps2pdf "$name".pdf "$name"_compressed.pdf
}
convert2pdf() {
    name="$(basename "$1" .png)"
    convert "$name".png "$name".pdf
}
alias greppdf='$HOME/scripts/greppdf.sh'
alias greppdfmulti='$HOME/scripts/greppdfmulti.sh'
numpagespdf() {
    pdftk "$1" dump_data | grep NumberOfPages | awk "{print \$2}"
}
removepdfpassword() {
    name="$(basename "$1" .pdf)"
    pdftk "$name".pdf input_pw "$2" output "$name"_unprotected.pdf
}
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

alias uva='source .venv/bin/activate'
alias uvi='uv init --no-workspace --vcs none --author-from git'
alias uvupdate='uv lock --upgrade && uv sync'

alias conda_run_settings='export TERM=xterm-256color && run_conda_settings'
alias conda_deactivate='conda deactivate && export TERM=xterm-ghostty'

alias condafenicsx_activate='export TERM=xterm-256color && run_conda_settings && conda activate fenicsx-env'
alias condafenicsx_deactivate='conda deactivate && conda deactivate && export TERM=xterm-ghostty'
alias cfa='export TERM=xterm-256color && run_conda_settings && conda activate fenicsx-env'
alias cfd='conda deactivate && conda deactivate && export TERM=xterm-ghostty'


# --------------------------------------------------------------------
#   System and processes

alias batteryInfo='acpi -V'
alias hardwareInfo='sudo lshw'
alias systemInfo='sudo tlp-stat -b -c -d -e -g -p -r -s -t -u -w -v'
alias cpuTemp='sensors | grep -i "core "'

# get the ID of a process
alias plist='ps -A | less'
alias prg='ps -A | rg -i'
alias pgrep='ps -A | rg -i'

# stop a process
# kill <PROCESS_ID>
# pkill <PROGRAMM_NAME>
# e.g.: pkill nvim (kills ALL running nvim processes)


# --------------------------------------------------------------------
#   TMUX

alias ta='tmux -u attach'
alias tat='tmux -u attach -t'
alias td='tmux detach'
alias tkt='tmux kill-session -t'
alias tl='tmux list-sessions'
alias tlk='tmux list-keys'
alias tn='tmux -u'
alias tnew='tmux -u new -s "$(basename "$(pwd)")"'
alias trses='tmux rename-session'
alias trwin='tmux rename-window "$(basename "$(pwd)")"'
alias ts="$HOME/scripts/tmux_session.sh"


# --------------------------------------------------------------------
#   UMAN

alias uAlacritty='$HOME/uman/uAlacritty.sh'
alias uApt='$HOME/uman/uApt.sh'
alias uBios='$HOME/uman/uBios.sh'
alias uDaily='$HOME/uman/uDaily.sh'
alias uEditor='$HOME/uman/uEditor.sh'
alias uFlatpak='$HOME/uman/uFlatpak.sh'
alias uFonts='$HOME/uman/uFonts.sh'
alias uFzf='$HOME/uman/uFzf.sh'
alias uGhostty='$HOME/uman/uGhostty.sh'
alias uLazygit='$HOME/uman/uLazygit.sh'
alias uMarp='$HOME/uman/uMarp.sh'
alias uNeovim='$HOME/uman/uNeovim.sh'
alias uNodejs='$HOME/uman/uNodejs.sh'
alias uOdin='$HOME/uman/uOdin.sh'
alias uRust='$HOME/uman/uRust.sh'
alias uSlicer='$HOME/uman/uSlicer.sh'
alias uSnap='$HOME/uman/uSnap.sh'
alias uStarship='$HOME/uman/uStarship.sh'
alias uSystem='$HOME/uman/uSystem.sh'
alias uTldr='$HOME/uman/uTldr.sh'
alias uUv='$HOME/uman/uUv.sh'
alias uZig='$HOME/uman/uZig.sh'


# --------------------------------------------------------------------
#   Youtube-DL

alias ytdl='$HOME/scripts/downloadYoutubeVideo.sh'
alias ytdl22='yt-dlp --format 22'
alias ytdlList='yt-dlp --list-formats'
alias ytdlPlaylist='yt-dlp -o "%(playlist_index)s-%(title)s.%(ext)s"'
