#!/bin/bash

mkdir -p "$HOME/.config/Code/User"

if [ ! -x "$(command -v code)" ]
then
sudo snap install --classic code
fi


sh "$HOME/zetup-pkg-ubuntu/subpkg/vscode/import-extensions.sh"
