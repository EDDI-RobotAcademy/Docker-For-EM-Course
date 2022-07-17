#!/usr/bin/bash

apt-get update
apt-get install vim
apt-get install build-essential
apt-get install codeblocks
apt-get install software-properties-common
add-apt-repository ppa:pmjdebruijn/avrdude-release

apt-get update
apt-get install binutils-avr gcc-avr avr-libc avrdude libc6-dev-i386
