#!/bin/sh

FILES=".bash_profile .bashrc .hushlogin .inputrc .profile .vimrc"

for i in $FILES; do
  sourceFile="$PWD/$i"
  targetFile="$HOME/$i"
  
  echo "Linking $targetfile -> $sourcefile"
  
  rm -rf "$targetfile"
  ln -sf "$PWD/$i" "$HOME/$i"
done
