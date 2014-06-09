#!/bin/sh
mkdir -p ~/.vim/tmp/backup
mkdir -p ~/.vim/tmp/swap
if [ -d "$HOME/.vim/bundle/syntastic" ]
then
	cd "$HOME/.vim/bundle/syntastic"
	git pull
else
	git clone https://github.com/scrooloose/syntastic.git ~/.vim/bundle/syntastic
fi
