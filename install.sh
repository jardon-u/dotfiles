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
# install python stuff (needed by emacs conf)
# install c++ stuff (needed by emacs conf)
sudo apt-get install git cmake ipython python-virtualenv pylint clang-3.4 libclang-3.4-dev libncurses5-dev

# Emacs
read -p "Do you want to install emacs 24.4 from source ? (y) " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo "Install emacs24.5 from source"
    bash ./install_emacs24_5.sh 
else
    echo "Install package version emacs24"
    sudo apt-get install emacs24
fi
# emacs configuration
pushd ~/.emacs.d
echo "Adding .cask/bin to your $PATH"
echo "export PATH=\"$PATH:$HOME/.cask/bin/\"" >> .zshrc
echo "export PATH=\"$PATH:$HOME/.cask/bin/\"" >> .bashrc
export PATH="$PATH:$HOME/.cask/bin/"
bash ./install-cask.sh
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
