#!/bin/bash

apt update && apt dist-upgrade -y

apt install sudo iptables wget sudo net-tools bmon netfilter-persistent iptables-persistent build-essential libssl-dev liblzo2-dev libpam0g-dev easy-rsa git openssl lz4 gcc cmake telnet curl make lsof -y

rm -rf openvpn_install
mkdir openvpn_install
cd openvpn_install
wget https://swupdate.openvpn.org/community/releases/openvpn-2.5.9.tar.gz
tar xvf openvpn-2.5.9.tar.gz
cd openvpn-2.5.9

wget https://raw.githubusercontent.com/Tunnelblick/Tunnelblick/master/third_party/sources/openvpn/openvpn-2.5.9/patches/02-tunnelblick-openvpn_xorpatch-a.diff
wget https://raw.githubusercontent.com/Tunnelblick/Tunnelblick/master/third_party/sources/openvpn/openvpn-2.5.9/patches/03-tunnelblick-openvpn_xorpatch-b.diff
wget https://raw.githubusercontent.com/Tunnelblick/Tunnelblick/master/third_party/sources/openvpn/openvpn-2.5.9/patches/04-tunnelblick-openvpn_xorpatch-c.diff
wget https://raw.githubusercontent.com/Tunnelblick/Tunnelblick/master/third_party/sources/openvpn/openvpn-2.5.9/patches/05-tunnelblick-openvpn_xorpatch-d.diff
wget https://raw.githubusercontent.com/Tunnelblick/Tunnelblick/master/third_party/sources/openvpn/openvpn-2.5.9/patches/06-tunnelblick-openvpn_xorpatch-e.diff

git apply 02-tunnelblick-openvpn_xorpatch-a.diff
git apply 03-tunnelblick-openvpn_xorpatch-b.diff
git apply 04-tunnelblick-openvpn_xorpatch-c.diff
git apply 05-tunnelblick-openvpn_xorpatch-d.diff
git apply 06-tunnelblick-openvpn_xorpatch-e.diff

./configure
make
make install
