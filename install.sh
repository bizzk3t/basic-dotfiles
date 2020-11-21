#!/bin/sh

cd $HOME
git clone https://github.com/bizzk3t/basic-dotfiles.git .dotfiles
cd .dotfiles
sh link.sh
source ~/.bashrc
