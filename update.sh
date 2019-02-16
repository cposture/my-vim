#!/bin/bash
git submodule update --init --recursive
yes|cp -r .vim .vimrc .clang-format vim-plugin ~/
