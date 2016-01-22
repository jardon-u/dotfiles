#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

ln -sinv ${DIR}/zshrc ~/.zshrc
ln -sinv ${DIR}/gitconfig ~/.gitconfig
ln -sinv ${DIR}/emacs.d ~/.emacs.d

# install minimal tools to survive
sudo apt-get install emacs24 git zsh cmake ipython
# install python stuff (needed by emacs conf)
sudo apt-get install python-virtualenv pylint
# install c++ stuff (needed by emacs conf)
sudo apt-get install clang-3.4 libclang-3.4-dev


# Zsh
read -p "Do you want to set zsh as your default shell ? (y) " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    sudo chsh $USER -s $(which zsh)
fi

# emacs configuration
pushd ~/.emacs.d
bash ./install-cask.sh
echo "You may need to add export PATH=\"$PATH:$HOME/.cask/bin/\" to you .zshrc or .bashrc"
cask install
popd

echo "*** WARNING *** Now run the following command inside emacs":
echo " M-x irony-install-server "
echo " M-x jedi:install-server "
