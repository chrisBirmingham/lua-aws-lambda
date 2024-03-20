#!/bin/sh

LUA_VERSION="5.4.6"
LUAROCKS_VERSION="3.11.0"
INSTALL_DIR="/opt/lua"

curl -sL https://www.lua.org/ftp/lua-${LUA_VERSION}.tar.gz | tar -xz
(
    cd lua-${LUA_VERSION} || exit 1
    make
    make install INSTALL_TOP=${INSTALL_DIR}
)

curl -sL https://luarocks.github.io/luarocks/releases/luarocks-${LUAROCKS_VERSION}.tar.gz | tar -xz
(
    cd luarocks-${LUAROCKS_VERSION} || exit 1
    ./configure --with-lua=${INSTALL_DIR} --rocks-tree=${INSTALL_DIR}
    make 
    make install
)

luarocks install luasocket
luarocks install lunajson

chmod +x runtime/bootstrap
