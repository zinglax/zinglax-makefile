#!/usr/bin/env bash
mkdir -p $HOME/.config/nvim/plugin
mkdir -p $HOME/.config/nvim/after/plugin
mkdir -p $HOME/.config/nvim/lua
mkdir -p $HOME/.config/nvim/lua/zinglax

# link wholesale
for f in `find . -regex ".*\.vim$\|.*\.lua$"`; do
  rm -rf $HOME/.config/nvim/$f
  ln -s $HOME/Gits/zinglax-makefile/nvim/$f $HOME/.config/nvim/$f
done


