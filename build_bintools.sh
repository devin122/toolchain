#!/bin/bash

version="2.26"


wget "http://ftp.gnu.org/gnu/binutils/binutils-${version}.tar.gz"

tar -xf "binutils-${version}.tar.gz"
mkdir build
mkdir pkg
pkg_dir=$(pwd)/pkg
cd build
../binutils-${version}/configure --prefix=/ --target=$target --with-sysroot --disable-nls --disable-werror && \
make && make install DESTDIR="${pkg_dir}" 
cd ../pkg
tar -czf ../binutils-pkg.tar.gz *