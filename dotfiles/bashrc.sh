#!/bin/bash

ZETUP_PKG_LOCATION="${HOME}/zetup-pkg-ubuntu"
GITHUB_USERNAME=${zwhitchcox} # put your gh username here


# uncomment to install
subpkg_installations=(
  # "chrome"
  # "docker"
  "git"
  # "go"
  # "keyboard-shortcuts"
  # "kubernetes"
  # "node"
  # "ui"
  # "video"
  "vim"
  # "virtualbox"
  # "vscode"
)

for subpkg in "${apt_installations[@]}"
do
  source "${ZETUP_PKG_LOCATION}/subpkg/${subpkg}/bashrc.sh"
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