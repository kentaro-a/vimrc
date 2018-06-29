#!/bin/sh

cp ./.vimrc ~/.vimrc
cp -r ./.kentaro-a.vim ~/

if [ ! -e ~/.vim ]; then
	mkdir ~/.vim
fi

cp -r ./colors ~/.vim/
