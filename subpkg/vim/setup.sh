#!/bin/bash

# UltiSnips
cp -r "${ZETUP_SUB_PKG_LOCATION}/UltiSnips" "$HOME/.vim"

# YouCompleteMe
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +GoInstallBinaries +qa
cd $HOME/.vim/bundle/YouCompleteMe
./install.py --js-completer --go-completer
