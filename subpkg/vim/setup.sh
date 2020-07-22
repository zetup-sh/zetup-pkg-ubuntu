#!/bin/bash

# UltiSnips
# cp -r "${ZETUP_SUB_PKG_LOCATION}/UltiSnips" "$HOME/.vim"

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# vim +PlugInstall +GoInstallBinaries +qa
vim +PlugInstall +qa
# YouCompleteMe
# cd $HOME/.vim/bundle/YouCompleteMe
# ./install.py --js-completer --go-completer
