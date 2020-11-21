#!/bin/sh
declare -a FILES=$(find . -type f -maxdepth 1 -name ".*" -not -name .git | sed -e 's|//|/|' | sed -e 's|./.|.|')

for i in ${FILES[@]}; do
  sourceFile="$(pwd)/$i"
  targetFile="$HOME/$(printf "%s" "$i" | sed "s/.*\/\(.*\)/\1/g")"
  
  echo "Linking $targetfile -> $sourcefile"
  
  rm -rf "$targetfile"
  ln -sf "$PWD/$i" "$HOME/$i"
done
