#!/bin/bash

BUILD_DIR="/tmp/build"

mkdir -p $BUILD_DIR
cd $BUILD_DIR

# p4python
wget http://ftp.perforce.com/perforce/r18.2/bin.tools/p4python.tgz
tar -xvf p4python.tgz

# p4api
wget http://ftp.perforce.com/perforce/r18.2/bin.linux26x86_64/p4api.tgz
tar -xvf p4api.tgz

# openssl
wget https://ftp.openssl.org/source/old/1.0.1/openssl-1.0.1h.tar.gz
tar -xvf openssl-1.0.1h.tar.gz

#pushd openssl-1.0.1h/
#./config shared
#make
#popd

pushd p4python-2018.2.1743033/
python3 setup.py build --ssl $BUILD_DIR/openssl-1.0.1h/ --apidir $BUILD_DIR/p4api-2018.2.1751184/
python3 setup.py bdist_wheel --ssl $BUILD_DIR/openssl-1.0.1h/ --apidir $BUILD_DIR/p4api-2018.2.1751184/
cp dist/${WHEEL} /p4python
popd
