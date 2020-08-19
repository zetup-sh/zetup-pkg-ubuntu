#!/bin/bash

mkdir -p "$HOME/.config/Code/User"

if [ ! -x "$(command -v code)" ]
then
sudo snap install --classic code
fi


ZETUP_DIR=$HOME/zetup-pkg-ubuntu
sh "$ZETUP_DIR/subpkg/vscode/import-extensions.sh"
cp "$ZETUP_DIR/subpkg/vscode/config/keybindings.json" "$HOME/.config/Code/User"
cp "$ZETUP_DIR/subpkg/vscode/config/settings.json" "$HOME/.config/Code/User"
