.PHONY: update update-dotfiles update-installs

update:
	@make update-dotfiles --silent
	@make update-installs --silent

update-dotfiles:
	@rm -rf dotfiles/.config/alacritty/ && cp -r ~/.config/alacritty/ dotfiles/.config/
	@cp -r ~/.config/nvim/ dotfiles/.config/
	@rm -rf dotfiles/uman/
	@cp -r ~/uman/ dotfiles/
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
