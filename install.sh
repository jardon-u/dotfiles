#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

ln -sinv ${DIR}/zshrc ~/.zshrc
ln -sinv ${DIR}/gitconfig ~/.gitconfig
ln -sinv ${DIR}/emacs.d ~/.emacs.d

# Zsh
# (Ask this first as this might not be wanted by everybody)
read -p "Do you want to set zsh as your default shell ? (y) " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    sudo apt-get install zsh
    sudo chsh $USER -s $(which zsh)
fi

# install minimal tools to survive
sudo apt-get install git cmake ipython
# install python stuff (needed by emacs conf)
sudo apt-get install python-virtualenv pylint
# install c++ stuff (needed by emacs conf)
sudo apt-get install clang-3.4 libclang-3.4-dev libncurses5-dev

# Emacs
read -p "Do you want to install emacs 24.4 from source ? (y) " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    bash ./install_emacs24_4.sh 
else
    echo "Install package version emacs24"
    sudo apt-get install emacs24
fi
# emacs configuration
pushd ~/.emacs.d
bash ./install-cask.sh
echo "You may need to add export PATH=\"$PATH:$HOME/.cask/bin/\" to you .zshrc or .bashrc"
cask install
popd

read -p "Install rtags for smart C++ completion ? (y) " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    bash ./install_rtags.sh
fi

echo "*** WARNING *** You may need to run these commands in emacs:"
echo " M-x irony-install-server "
echo " M-x jedi:install-server "
