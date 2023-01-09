#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Git
git config --global user.email "abelrguezxd@gmail.com"
git config --global user.name "AbelClapton"

# Neovim
ln -s ${BASEDIR}/nvim ~/.config/nvim
