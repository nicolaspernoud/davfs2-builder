#!/bin/bash

# Install prerequisites
sudo apt install -y pkg-config libtool libssl-dev

# Build and install neon
export NEON_VERSION=0.31.2
wget https://github.com/notroj/neon/archive/$NEON_VERSION.tar.gz
tar -zxvf $NEON_VERSION.tar.gz

cd ./neon-$NEON_VERSION

# Patch buffer
#sudo sed -i 's/NE_ABUFSIZ (256)/NE_ABUFSIZ (512)/g' ./src/ne_auth.h

./autogen.sh && ./configure --prefix=/usr \
    --with-ssl \
    --enable-shared \
    --disable-static &&
    make &&
    sudo make install

cd ..

# Build and install davfs2
export DAVFS2_VERSION=1.6.0
wget http://download.savannah.nongnu.org/releases/davfs2/davfs2-1.6.0.tar.gz
tar -zxvf davfs2-$DAVFS2_VERSION.tar.gz
cd davfs2-$DAVFS2_VERSION

./configure &&
    make &&
    sudo make install

# Clean
rm *tar.gz*
