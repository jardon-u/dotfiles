#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

ln -sinv ${DIR}/zshrc ~/.zshrc
ln -sinv ${DIR}/gitconfig ~/.gitconfig
ln -sinv ${DIR}/emacs.d ~/.emacs.d

dpkg --get-selections emacs
dpkg --get-selections emacs-goodies-el
dpkg --get-selections ipython
dpkg --get-selections pymacs
dpkg --get-selections pylint
dpkg --get-selections pyflakes
dpkg --get-selections zsh
