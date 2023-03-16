#!/usr/bin/env bash

mkdir -p {easyrsa,ccd}

cd easyrsa

if [ ! -f easyrsa ]; then
  curl -sL https://github.com/OpenVPN/easy-rsa/releases/download/v3.1.2/EasyRSA-3.1.2.tgz | tar -xzv --strip-components=1 -C .
fi

if [ -d pki ]; then
  exit 0
fi

./easyrsa --batch init-pki
./easyrsa --batch build-ca nopass
./easyrsa --batch build-server-full server nopass
./easyrsa --batch build-client-full client nopass
