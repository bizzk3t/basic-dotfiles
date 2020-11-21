#!/bin/sh

FILES=".bash_profile .bashrc .hushlogin .inputrc .profile .vimrc .vim"

for i in $FILES; do
  sourcefile="$PWD/$i"
  targetfile="$HOME/$i"
  
  echo "Linking $targetfile -> $sourcefile"
  
  rm -rf $targetfile
  ln -sf $sourcefile $targetfile
done
