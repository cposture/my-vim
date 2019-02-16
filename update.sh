#!/bin/bash
git submodule update --init --recursive
yes|cp -r .vim .vimrc vim-plugin ~/
