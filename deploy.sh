#!/bin/bash
FILES=(
bashrc
bash_aliases
tmux.conf
)

for file in "${FILES[@]}"
do
  echo Linking "$file" to $HOME
  ln -sf $(pwd)/$file ~/.$file
done

ln -sf init.vim $HOME/.config/nvim/init.vim
