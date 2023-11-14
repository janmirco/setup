.PHONY: update update-dotfiles update-installs

update:
	@make update-dotfiles --silent
	@make update-installs --silent

update-dotfiles:
	@rm -rf dotfiles/.config/nvim/
	@cp -r ~/.config/nvim/ dotfiles/.config/
	@cp ~/.bashrc dotfiles/
	@cp ~/.bash_aliases dotfiles/
	@cp ~/.gdbinit dotfiles/
	@cp ~/.git-prompt.sh dotfiles/
	@cp ~/.gitconfig dotfiles/
	@cp ~/.tmux.conf dotfiles/

update-installs:
	@rm -rf installs/*
	@cp ~/setup/installs/* installs/
