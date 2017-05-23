git clone --recursive https://github.com/Andersbakken/rtags.git
cd rtags
git co v2.9
cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1 .
make -j4
sudo make install
