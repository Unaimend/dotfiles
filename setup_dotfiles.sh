#!/bin/bash

#ln -sf ~/dotfiles/polybar/ -t ~/.config/


dotfiles=(".vimrc" ".Xresources" ".bash_aliases")
dir="${HOME}/dotfiles"

for dotfile in "${dotfiles[@]}";do
 ln -sf "${dir}/${dotfile}" "${HOME}"
done
