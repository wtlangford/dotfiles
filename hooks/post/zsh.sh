#!/bin/sh
if [ -d "~/.oh-my-zsh" ]; then
	cd ~/.oh-my-zsh
	git pull
else
	git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
fi
touch ~/.zshrc_custom
