#!/bin/bash

set -eux

ZETUP_PKG_LOCATION="${HOME}/zetup-pkg-ubuntu"

apt_installations=(
  "tmux"
  "vim"
  "cmake"
  "apt-transport-https"
  "wget"
  "ca-certificates"
  "software-properties-common"
  "snapd"
  "git"
  "xclip"
  "net-tools"
)
sudo apt update
sh -c "sudo apt install $to_install -yqq" && \

snap_installations=(
  "yq"
)

sudo snap install "$pkg"

backupdir="${HOME}/dotfile_backups"
mkdir -p ${backupdir}

zetup_link() {
  backupfile="${backupdir}/${1}"
  src=${2}
  symlink=${3}
  if [ ! -f ${backupfile} ]
  then
    mv ${symlink} ${backupfile}
  else
    rm ${symlink}
  fi
  ln -s src symlink
}

zetup_link .bashrc "${ZETUP_PKG_LOCATION}/dotfiles/bashrc.sh" "$HOME/.bashrc"
zetup_link .aliases "${ZETUP_PKG_LOCATION}/dotfiles/aliases.sh" "$HOME/.aliases"
zetup_link .fns "${ZETUP_PKG_LOCATION}/dotfiles/fns.sh" "$HOME/.fns"
zetup_link .tmux.conf "${ZETUP_PKG_LOCATION}/dotfiles/tmux.conf" "$HOME/.tmux.conf"
zetup_link .vimrc "${ZETUP_PKG_LOCATION}/dotfiles/vimrc" "$HOME/.vimrc"

source "$HOME/.bashrc"


# uncomment to install Note: also need to edit /dotfiles/bashrc.sh
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

for pkg in "${apt_installations[@]}"
do
  ZETUP_PKG_LOCATION=${ZETUP_PKG_LOCATION} bash ${ZETUP_PKG_LOCATION}/subpkg/${pkg}/setup.sh
done