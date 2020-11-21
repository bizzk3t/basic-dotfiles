#!/bin/sh

FILES="$(find . -name '.[^.]*' -not -name .git)"
for file in FILES; do
  ln -sf "$PWD/$file" "$HOME/$file"
done
