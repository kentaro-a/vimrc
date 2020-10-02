#!/bin/sh

cp ./.vimrc ~/.vimrc
cp -r ./.kentaro-a.vim ~/

if [ ! -e ~/.vim ]; then
	mkdir ~/.vim
fi
if [ ! -e ~/.vim/colors ]; then
	mkdir ~/.vim/colors
fi



cp -r ./colors/myblues.vim ~/.vim/colors/myblues.vim
