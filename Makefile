.PHONY: update update-dotfiles update-installs undo-dotfiles

update:
	@make update-dotfiles --silent
	@make update-installs --silent

update-dotfiles:
	@rm -rf dotfiles/.config/alacritty/ && cp -r ~/.config/alacritty/ dotfiles/.config/
	@rm -rf dotfiles/.config/fzf/ && cp -r ~/.config/fzf/ dotfiles/.config/
	@rm -rf dotfiles/.config/nvim/ && cp -r ~/.config/nvim/ dotfiles/.config/
	@rm -rf dotfiles/.config/wezterm/ && cp -r ~/.config/wezterm/ dotfiles/.config/
	@rm -rf dotfiles/uman/ && cp -r ~/uman/ dotfiles/
	@rm -rf dotfiles/scripts/ && cp -r ~/scripts/ dotfiles/
	@cp ~/.bash_aliases dotfiles/
	@cp ~/.bash_login dotfiles/
	@cp ~/.bash_logout dotfiles/
	@cp ~/.bash_path dotfiles/
	@cp ~/.bashrc dotfiles/
	@cp ~/.gdbinit dotfiles/
	@cp ~/.git-prompt.sh dotfiles/
	@cp ~/.gitconfig dotfiles/
	@cp ~/.gitignore dotfiles/
	@cp ~/.tmux.conf dotfiles/

update-installs:
	@rm -rf installs/*
	@cp ~/setup/installs/* installs/

undo-dotfiles:
	@git checkout -- dotfiles/.bash_aliases
	@git checkout -- dotfiles/.bash_path
	@git checkout -- dotfiles/.gitconfig
