.PHONY: update update-dotfiles update-installs

update:
	@make update-dotfiles --silent
	@make update-installs --silent

update-dotfiles:
	@cp ~/.config/nvim/autoload/plug.vim dotfiles/.config/nvim/autoload/
	@rm -rf dotfiles/.config/nvim/lua/*
	@cp -r ~/.config/nvim/lua/* dotfiles/.config/nvim/lua/
	@cp -r ~/.config/nvim/lua/.clang-format dotfiles/.config/nvim/lua/
	@cp ~/.config/nvim/coc-settings.json dotfiles/.config/nvim/
	@cp ~/.config/nvim/init.lua dotfiles/.config/nvim/
	@cp ~/.bashrc dotfiles/
	@cp ~/.gdbinit dotfiles/
	@cp ~/.git-prompt.sh dotfiles/
	@cp ~/.gitconfig dotfiles/
	@cp ~/.tmux.conf dotfiles/

update-installs:
	@rm -rf installs/*
	@cp ~/setup/installs/* installs/
