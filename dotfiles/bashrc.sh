#!/bin/bash

ZETUP_PKG_LOCATION="${HOME}/zetup-pkg-ubuntu"
source ${ZETUP_PKG_LOCATION}/env



for subpkg in "${subpkg_installations[@]}"
do
  ! source "${ZETUP_PKG_LOCATION}/subpkg/${subpkg}/bashrc.sh" > /dev/null 2>&1
done

bin_path="${ZETUP_PKG_LOCATION}/bin"
export PATH="$PATH:$bin_path"
export PATH="$PATH:$bin_path/tmux"
export PATH="$PATH:$bin_path/git"

source $HOME/.aliases
source $HOME/.fns

export PATH=$PATH:/usr/sbin

export EDITOR=vim
export HISTSIZE=50000
export HISTFILESIZE=100000

if [ -f $HOME/.dir_colors/dircolors ]
  then eval `dircolors ~/.dir_colors/dircolors`
fi

# go to the dev directory
if [[ $HOME == "$(pwd)" ]]; then cd $HOME/dev ; fi