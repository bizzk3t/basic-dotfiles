#!/bin/sh


FILES="$(find $PWD/src -name '*' -mindepth 1 -maxdepth 1 -exec basename {} \;)"

echo "Linking Files"

dotdir="$PWD/src"
for i in $FILES; do
  sourcefile="${dotdir}/$i"
  targetfile="$HOME/$i"
  
  echo "$targetfile -> $sourcefile"
  
  rm -rf $targetfile
  ln -sf $sourcefile $targetfile
done
