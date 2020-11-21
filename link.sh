#!/bin/sh

for i in $(find . -name '.[^.]*' -not -name .git); do
  ln -sf "$PWD/$i" "$HOME/$i"
done
