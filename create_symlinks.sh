#!/bin/bash

if [ -e ~/.vimrc ]
then
    echo "~/.vimrc already exists, moving to ~/.vimrc.bak"
    mv ~/.vimrc ~/.vimrc.bak
fi

if [ -e ~/.nvimrc ]
then
    echo "~/.nvimrc already exists, moving to ~/.nvimrc.bak"
    mv ~/.nvimrc ~/.nvimrc.bak
fi

if [ -e ~/.bashrc ]
then
    echo "~/.bashrc already exists, moving to ~/.vimrc.bak"
    mv ~/.bashrc ~/.bashrc.bak
fi

if [ -e ~/.tmux.conf ]
then
    echo "~/.tmux.conf already exists, moving to ~/.tmux.conf.bak"
    mv ~/.tmux.conf ~/.tmux.conf.bak
fi

if [ -e ~/.mydircolors ]
then
    echo "~/.mydircolors already exists, moving to ~/.mydircolors.bak"
    mv  ~/.mydircolors ~/.mydircolors.bak
fi

ln -s ~/.dotfiles/vimrc ~/.vimrc
ln -s ~/.dotfiles/vimrc ~/.nvimrc
ln -s ~/.dotfiles/bashrc ~/.bashrc
ln -s ~/.dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/.dotfiles/mydircolors ~/.mydircolors
