#!/bin/bash
git pull
git submodule update --init --recursive
yes|cp -r .vim .vimrc vim-plugin ~/
