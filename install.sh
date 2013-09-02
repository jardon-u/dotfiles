#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

ln -s ${DIR}/zshrc ~/.zshrc
ln -s ${DIR}/gitconfig ~/.gitconfigc
ln -s ${DIR}/emacsd ~/.emacsd
