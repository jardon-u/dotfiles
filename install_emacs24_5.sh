sudo apt-get build-dep emacs24
wget http://ftp.gnu.org/gnu/emacs/emacs-24.5.tar.gz
tar xvf emacs-24.5.tar.gz emacs-24.5
cd emacs-24.5
./configure
make -j4
sudo make install
