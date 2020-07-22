#!/bin/bash

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

link "${ZETUP_PKG_LOCATION}/dotfiles/bashrc.sh" "$HOME/.bashrc"
link "${ZETUP_PKG_LOCATION}/dotfiles/aliases.sh" "$HOME/.aliases"
link "${ZETUP_PKG_LOCATION}/dotfiles/fns.sh" "$HOME/.fns"
link "${ZETUP_PKG_LOCATION}/dotfiles/tmux.conf" "$HOME/.tmux.conf"
link "${ZETUP_PKG_LOCATION}/dotfiles/vimrc" "$HOME/.vimrc"

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