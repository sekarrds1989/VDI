#!/bin/bash

#directory for backup
mkdir -p ~/.vim/bkup
mkdir -p ~/.vim/undo
mkdir -p ~/.vim/plugged

mkdir -p bkup
#copy vimrc 
cp ~/.vimrc bkup/
cp vimrc ~/.vimrc

#Autoload and colors for vim
cp -rf autoload ~/.vim/
cp -rf colors ~/.vim/
cp gtags-cscope.vim ~/.vim/plugged/

mv ~/.bashrc bkup/
mv ~/.bash_aliases bkup/
cp bashrc ~/.bashrc
cp bash_aliases ~/.bash_aliases

vim +'PlugInstall --sync' +qa


