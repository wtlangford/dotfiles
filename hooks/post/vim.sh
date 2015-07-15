#!/bin/sh
mkdir -p ~/.vim/tmp/backup
mkdir -p ~/.vim/tmp/swap
git clone https://github.com/VundleVim/Vundle.vim ~/.vim/bundle/Vundle.vim
vim +PluginInstall
