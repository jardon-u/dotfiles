#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

ln -s ${DIR}/zshrc ~/.zshrc
ln -s ${DIR}/gitconfig ~/.gitconfig
ln -s ${DIR}/emacs.d ~/.emacs.d
