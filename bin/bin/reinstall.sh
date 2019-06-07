#!/usr/bin/env bash

if [[ "$1" == 'clean' ]] ; then
    make clean
    #./configure && make && sudo make install
    ./configure && make
else
    #make && sudo make install
    make
fi
