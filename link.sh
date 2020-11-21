#!/bin/sh
FILES="find . -name '.[^.]*' -maxdepth 1 -type f -not -name .git -printf '%P\n'"
for file in $FILES; do
  ln -sf "$PWD/$file" "$HOME/$file"
done
