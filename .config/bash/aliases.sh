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
alias nd="$EDITOR $HOME/.todo-txt/todo.txt"
alias ndc="$EDITOR $HOME/.todo-txt/todo.cfg"
alias ndd="$EDITOR $HOME/.todo-txt/README.md"
alias nn="$EDITOR $HOME/.config/nvim/init.lua"
alias ss="$EDITOR $HOME/.config/starship/config.toml"
alias tt="$EDITOR $HOME/.config/tmux/tmux.conf"
alias vv="$EDITOR $HOME/.config/vim/config.vim"
alias ww="$EDITOR $HOME/.config/wezterm/wezterm.lua"


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
alias cheat='f(){ curl --silent cht.sh/"$1"/"$2" | bat; unset -f f; }; f'
alias checkNonAscii='grep --color="auto" -P -n "[\x80-\xFF]"'
alias chmoddirs='chmod 775'
alias chmodfiles='chmod 664'
alias cht='f(){ curl --silent cht.sh/"$1"/"$2" | bat; unset -f f; }; f'
alias cl='clear; ls -l --almost-all --human-readable --group-directories-first --color=always'
alias cm='clear; make'
alias crop='$HOME/scripts/crop.sh'
alias crop_png='$HOME/scripts/crop_png.sh'
alias ct='clear; tree -avAC --dirsfirst -I ".git|node_modules|venv|.venv|env"'
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
alias dp='todo-txt -d $HOME/.todo-txt/todo.cfg pri'
alias dr='todo-txt -d $HOME/.todo-txt/todo.cfg replace'
alias du='f(){ du --human-readable --max-depth=1 "$1" | sort --human-numeric-sort --reverse; unset -f f; }; f'
alias dx='todo-txt -d $HOME/.todo-txt/todo.cfg do'
alias expand='f(){ expand --initial --tabs=4 "$1" > tmp.txt; rm -f "$1"; mv tmp.txt "$1"; unset -f f; }; f'
alias eza='eza --long --all --group-directories-first --sort Name'
alias ezat='eza --long --all --group-directories-first --sort Name --total-size'
alias glow='glow --pager'
alias gmsh='/usr/bin/gmsh'
alias grep='grep --color=always'
alias helpgrep='f() { "$1" --help | grep --color=always -i "$2"; unset -f f; }; f'
alias hexToDec='f(){ echo "ibase=16; $1" | bc; unset -f f; }; f'
alias ip_address='hostname --all-ip-addresses | sed --expression "s/ .*//"'
alias jupyter-convert='f(){ jupyter nbconvert --to script "$1"; unset -f f; }; f'
alias l='ls -l --almost-all --human-readable --group-directories-first --color=always'
alias lb='f(){ ls -l --almost-all --human-readable --group-directories-first --color=always $1 | bat; unset -f f; }; f'
alias ldpathlist='echo "$LD_LIBRARY_PATH" | tr ":" "\n"'
alias ll='ls -l --almost-all --human-readable --group-directories-first --color=always'
alias ls='ls --group-directories-first --color=always'
alias m='make'
alias mansearch='f(){ man -k "$1"; unset -f f; }; f'
alias n='$HOME/scripts/notes.sh'
alias notes='$HOME/scripts/notes.sh'
alias nushell='nu'
alias nvidiaopen='__NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia'
alias nvidiawatch='watch -n 1 nvidia-smi'
alias o='$HOME/scripts/open.sh'
alias oo='octave'
alias open='$HOME/scripts/open.sh'
alias openall='$HOME/scripts/open.sh'
alias openexit='f(){ $HOME/scripts/open.sh "$@"; exit; }; f'
alias openpdfs='$HOME/scripts/open.sh pdf'
alias p="$HOME/scripts/pass.sh && exit"
alias pa='$HOME/scripts/paste_to_note.sh'
alias paste_clipboard_to_note='$HOME/scripts/paste_to_note.sh'
alias pathlist='echo "$PATH" | tr ":" "\n"'
alias png2gif="$HOME/scripts/png2gif.sh"
alias pngtomp4='ffmpeg -framerate 25 -i image%04d.png movie.mp4'
alias pp='python3'
alias ppass="$HOME/scripts/pass.sh && exit"
alias pv='paraview'
alias pvnvidia='__NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia paraview'
alias pvvtu='f(){ $HOME/scripts/create_pvd.py "$1" && paraview "$1"/run.pvd; unset -f f; }; f'
alias qr='f(){ qrencode --type PNG --output qr_code.png --size 10 --level H "$1"; unset -f f; }; f'
alias qrsvg='f(){ qrencode --type SVG --output qr_code.svg "$1"; unset -f f; }; f'
alias renameAll='rename "s/\ /_/g" *; rename "s/(\(|\)|\[|\]|\{|\})//g" *; rename "y/A-Z/a-z/" *'
rg_glob="!{**/*egg-info/*,**/.*cache*/*,**/.byobu/*,**/.cache/*,**/.cargo/*,**/.config/abiword/*,**/.config/akonadi/*,**/.config/autostart/*,**/.config/BraveSoftware/*,**/.config/cat_installer/*,**/.config/cef_user_data/*,**/.config/coc/*,**/.config/Code/*,**/.config/dconf/*,**/.config/enchant/*,**/.config/fltk.org/*,**/.config/freerdp/*,**/.config/ghb/*,**/.config/GIMP/*,**/.config/google-chrome/*,**/.config/gtk-2.0/*,**/.config/gtk-3.0/*,**/.config/gtk-4.0/*,**/.config/htop/*,**/.config/ibus/*,**/.config/inkscape/*,**/.config/kde.org/*,**/.config/KDE/*,**/.config/kdeconnect/*,**/.config/kdedefaults/*,**/.config/khtml/*,**/.config/lazygit/*,**/.config/libaccounts-glib/*,**/.config/libreoffice/*,**/.config/menus/*,**/.config/microsoft-edge/*,**/.config/neofetch/*,**/.config/nvim/autoload/*,**/.config/nvim/undodir/*,**/.config/obs-studio/*,**/.config/obsidian/*,**/.config/octave/*,**/.config/ookla/*,**/.config/ParaView/*,**/.config/pavucontrol-qt/*,**/.config/pulse/*,**/.config/remmina/*,**/.config/sciebo/*,**/.config/session/*,**/.config/texstudio/*,**/.config/thefuck/*,**/.config/ticktick/*,**/.config/tmux/plugins*,**/.config/Unknown\ Organization/*,**/.config/VirtualBox/*,**/.config/vlc/*,**/.config/xm1/*,**/.config/xsettingsd/*,**/.dotnet/*,**/.fltk/*,**/.fonts/*,**/.git/*,**/.gnome/*,**/.gnupg/*,**/.imageio/*,**/.ipython/*,**/.java/*,**/.julia/*,**/.jupyter/*,**/.kde/*,**/.keras/*,**/.local/*,**/.Mathematica/*,**/.modular/*,**/.mozilla/*,**/.mplayer/*,**/.npm/*,**/.nv/*,**/.openjfx/cache/*,**/.org.jabref.gui.JabRefMain/*,**/.pki/*,**/.pulsesecure/*,**/.rpmdb/*,**/.rustup/*,**/.texlive2021/*,**/.thunderbird/*,**/.var/*,**/.Wolfram/*,**/.zoom/*,**/__pycache__/*,**/CATSettings/*,**/env/*,**/node_modules/*,**/snap/*,**/vbox/*,**/venv/*,**/.venv/*}"
alias rg='rg --hidden --no-ignore-vcs --glob "$rg_glob"'
alias rgi='rg --hidden --no-ignore-vcs --glob "$rg_glob" --ignore-case'
alias rgix='f(){ rg --hidden --no-ignore-vcs --glob "$rg_glob" --ignore-case --glob "*.$2" "$1"; unset -f f; }; f'
alias rgx='f(){ rg --hidden --no-ignore-vcs --glob "$rg_glob" --glob "*.$2" "$1"; unset -f f; }; f'
alias rm='rm -i'
alias show_path='echo "$PATH" | tr ":" "\n"'
alias softlink='f(){ ln -s "$1" "$2"; unset -f f; }; f'  # 1: source with absolute path, 2: soft link
alias softlinkimplicit='f(){ ln -s "$1" $(basename "$1"); unset -f f; }; f'  # 1: source with absolute path
alias svg2png192='f(){ inkscape --export-width=192 --export-height=192 --export-type="png" "$1"; unset -f f; }; f'
alias svg2png='f(){ inkscape --export-type="png" "$1"; unset -f f; }; f'
alias svg2pngWH='f(){ inkscape --export-width="$2" --export-height="$3" --export-type="png" "$1"; unset -f f; }; f'
alias t='tree -avAC --dirsfirst -I ".git|node_modules|venv|.venv|env"'
alias tree1='tree -avAC --dirsfirst -I ".git|node_modules|venv|.venv|env" -L 1'
alias tree2='tree -avAC --dirsfirst -I ".git|node_modules|venv|.venv|env" -L 2'
alias tree3='tree -avAC --dirsfirst -I ".git|node_modules|venv|.venv|env" -L 3'
alias tree4='tree -avAC --dirsfirst -I ".git|node_modules|venv|.venv|env" -L 4'
alias tree5='tree -avAC --dirsfirst -I ".git|node_modules|venv|.venv|env" -L 5'
alias tree='tree -avAC --dirsfirst -I ".git|node_modules|venv|.venv|env"'
alias unexpand='f(){ unexpand --first-only --tabs=4 "$1" > tmp.txt; rm -f "$1"; mv tmp.txt "$1"; unset -f f; }; f'
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
alias wcx='f(){ echo "lines, words, characters:"; cat $(find ./ -type f -iname \*.$1) | wc -l -w -m; unset -f f; }; f'
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
alias gs='git status --short && echo && git diff --stat && echo && echo ${bold}${black}[STASH LIST]:${reset} && git stash list'
alias gss='git status        && echo && git diff --stat && echo && echo ${bold}${black}[STASH LIST]:${reset} && git stash list'

alias gfindrepos='find . -name .git -type d -prune'
alias gcountrepos='find . -name .git -type d -prune | wc --lines'

alias g.='cd "$(git rev-parse --show-toplevel)"'  # go to git root directory
alias gi='$EDITOR "$(git rev-parse --show-toplevel)"/.gitignore'

alias gupdatelazylock='cd $HOME && git add $HOME/.config/nvim/lazy-lock.json && git commit -m "chore(nvim): update lazy-lock.json"'
alias gupdatetodotxtdir='cd $HOME && git add $HOME/.todo-txt/ && git commit -m "chore(todo-txt): update entire dir"'
alias gupdateworktimes='cd $HOME && $HOME/scripts/klog_archive.sh && git add $HOME/.klog/ && git commit -m "chore(klog): update work times"'


# --------------------------------------------------------------------
#   fzf and fd

alias cD="source $HOME/scripts/change_directory.sh && change_directory"
alias cdd="source $HOME/scripts/change_directory.sh && change_directory current_dir"
alias cdg="source $HOME/scripts/change_directory.sh && change_directory git_repos"

alias fcp='$HOME/scripts/fcp.sh'
alias fdiff='$HOME/scripts/fdiff.sh'

alias f='fzf'
alias fd='fd --hidden --no-ignore-vcs'

alias fgd='$HOME/scripts/fgd.sh'

alias ff='$HOME/scripts/fopen.sh "" ""'
alias fh='$HOME/scripts/fopen.sh "$HOME" ""'
alias fc='$HOME/scripts/fopen.sh "$HOME/.config" ""'
alias fn='$HOME/scripts/fopen.sh "$HOME/.config/nvim" ""'

alias fo='$HOME/scripts/fopen.sh "" "xdg"'
alias fO='$HOME/scripts/fopen.sh "$HOME" "xdg"'

alias foexit='$HOME/scripts/fopen.sh "" "xdg" && exit'
alias fOexit='$HOME/scripts/fopen.sh "$HOME" "xdg" && exit'


# --------------------------------------------------------------------
#   Neovim

alias snv='sudo $HOME/bin/neovim/nvim-linux64/bin/nvim'

alias nv0='$HOME/scripts/nv0.sh'
alias nv1='$HOME/scripts/nv1.sh'
alias nv='$EDITOR'
alias nvS='$EDITOR -S'
alias nva='$HOME/scripts/nva.sh'
alias nvd='$EDITOR -d'
alias nvdiff='$EDITOR -d'
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

alias uva='source .venv/bin/activate'
alias uvi='uv init --no-workspace --vcs none'

alias condafenicsx_activate='run_conda_settings && conda activate fenicsx-env'
alias condafenicsx_deactivate='conda deactivate && conda deactivate'

alias cfa='run_conda_settings && conda activate fenicsx-env'
alias cfd='conda deactivate && conda deactivate'


# --------------------------------------------------------------------
#   Rofi

alias r='rofi -show combi'
alias rr='rofi -show run'
alias ra='rofi -show drun'
alias rw='rofi -show window'


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
