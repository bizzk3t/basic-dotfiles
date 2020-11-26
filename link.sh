#!/bin/sh

FILES=$(cat<<EOF
.bash_profile
.bashrc
.hushlogin
.inputrc
.profile
.vim
.vimrc
EOF
)

echo "Linking Files"

for i in $FILES; do
  sourcefile="$PWD/$i"
  targetfile="$HOME/$i"
  
  echo "$targetfile -> $sourcefile"
  
  rm -rf $targetfile
  ln -sf $sourcefile $targetfile
done
