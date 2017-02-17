#!/bin/sh

cp ./.vimrc ~/.vimrc

if [ ! -e ~/.vim ]; then
	mkdir ~/.vim
fi

cp -r ./.colors ~/.vim/

sh ./nb-install.sh
