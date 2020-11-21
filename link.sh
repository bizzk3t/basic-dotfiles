#!/bin/sh

for i in $(ls .[^.]*); do
  ln -sf "$PWD/$i" "$HOME/$i"
done
