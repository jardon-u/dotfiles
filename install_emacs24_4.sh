sudo apt-get build-dep emacs24
wget http://ftp.gnu.org/gnu/emacs/emacs-24.4.tar.gz
tar xvf emacs-24.4.tar.gz
cd emacs-24.4
./configure
make -j4
sudo make install
