#!/bin/bash

dotfiles=(".vimrc" ".Xresources")
dir="${HOME}"

for dotfile in "${dotfiles[@]}";do
 ln -sf "${HOME}/${dotfile}" "${dir}"
done
