.PHONY: update install add_missing_dirs

update:
	@rm -rf .config/alacritty && cp -r ~/.config/alacritty .config
	@rm -rf .config/bash      && cp -r ~/.config/bash .config
	@rm -rf .config/bat       && cp -r ~/.config/bat .config
	@rm -rf .config/fd        && cp -r ~/.config/fd .config
	@rm -rf .config/glow      && cp -r ~/.config/glow .config
	@rm -rf .config/nvim      && cp -r ~/.config/nvim .config
	@rm -rf .config/rofi      && cp -r ~/.config/rofi .config
	@rm -rf .config/starship  && cp -r ~/.config/starship .config
	@rm -rf .config/uv        && cp -r ~/.config/uv .config
	@rm -rf .config/vim       && cp -r ~/.config/vim .config
	@rm -rf .config/wezterm   && cp -r ~/.config/wezterm .config
	@rm -rf .config/yazi      && cp -r ~/.config/yazi .config
	@rm -rf iman              && cp -r ~/iman .
	@rm -rf scripts           && cp -r ~/scripts .
	@rm -rf uman              && cp -r ~/uman .
	@cp ~/.bash_login .
	@cp ~/.bash_logout .
	@cp ~/.bashrc .
	@make add_missing_dirs --silent
	@cp ~/.config/calcurse/conf ~/.config/calcurse/keys .config/calcurse
	@cp ~/.config/git/config ~/.config/git/delta_themes ~/.config/git/public .config/git
	@cp ~/.config/lazygit/config.yml .config/lazygit/config.yml
	@cp ~/.config/nushell/config.nu ~/.config/nushell/env.nu .config/nushell
	@cp ~/.config/tmux/tmux.conf .config/tmux
	@cp ~/.gitignore .

install:
	@rm -rf ~/.config/alacritty && cp -r .config/alacritty ~/.config
	@rm -rf ~/.config/bash      && cp -r .config/bash ~/.config
	@rm -rf ~/.config/bat       && cp -r .config/bat ~/.config
	@rm -rf ~/.config/fd        && cp -r .config/fd ~/.config
	@rm -rf ~/.config/glow      && cp -r .config/glow ~/.config
	@rm -rf ~/.config/nvim      && cp -r .config/nvim ~/.config
	@rm -rf ~/.config/rofi      && cp -r .config/rofi ~/.config
	@rm -rf ~/.config/starship  && cp -r .config/starship ~/.config
	@rm -rf ~/.config/uv        && cp -r .config/uv ~/.config
	@rm -rf ~/.config/vim       && cp -r .config/vim ~/.config
	@rm -rf ~/.config/wezterm   && cp -r .config/wezterm ~/.config
	@rm -rf ~/.config/yazi      && cp -r .config/yazi ~/.config
	@rm -rf ~/iman              && cp -r iman ~
	@rm -rf ~/scripts           && cp -r scripts ~
	@rm -rf ~/uman              && cp -r uman ~
	@cp .bash_login ~
	@cp .bash_logout ~
	@cp .bashrc ~
	@make add_missing_dirs --silent
	@cp .config/calcurse/conf .config/calcurse/keys ~/.config/calcurse
	@cp .config/git/config .config/git/delta_themes .config/git/public ~/.config/git
	@cp .config/lazygit/config.yml ~/.config/lazygit
	@cp .config/nushell/config.nu .config/nushell/env.nu ~/.config/nushell
	@cp .config/tmux/tmux.conf ~/.config/tmux
	@cp .gitignore ~

add_missing_dirs:
	@mkdir -p .config/calcurse
	@mkdir -p .config/git
	@mkdir -p .config/lazygit
	@mkdir -p .config/nushell
	@mkdir -p .config/tmux
