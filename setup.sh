#!/bin/bash

set -eux


ZETUP_PKG_LOCATION="${HOME}/zetup-pkg-ubuntu"
source ${ZETUP_PKG_LOCATION}/env

getifnotset() {
  description=${2}
  if [ ! -n  "${!1}" ]
  then
    echo "enter ${description}"
    read -e var
    export ${1}=$var
  fi
}

if [ ! -n "$(git config user.name)" ]
then
  getifnotset GIT_NAME "your git user.name"
  git config --global user.name ${GIT_NAME}
fi

if [ ! -n "$(git config user.email)" ]
then
  getifnotset GIT_NAME "your git user.email"
  git config --global user.email ${GIT_EMAIL}
fi

if [ ! -f ${HOME}/.ssh/authorized_keys ]
then
  mkdir -p ${HOME}/.ssh
  getifnotset GITHUB_USERNAME "your github username"
  curl https://github.com/${GITHUB_USERNAME}.keys -o ${HOME}/.ssh/authorized_keys
  chmod 600 ${HOME}/.ssh
  chmod 700 ${HOME}/.ssh/authorized_keys
fi


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
for pkg in "${apt_installations[@]}"
do
  sh -c "sudo apt install ${pkg} -yqq"
done

snap_installations=(
  "yq"
)

for pkg in "${snap_installations[@]}"
do
  sudo snap install "$pkg"
done

backupdir="${HOME}/dotfile_backups"
mkdir -p ${backupdir}

zetup_link() {
  backupfile="${backupdir}/${1}"
  src=${2}
  symlink=${3}
  if [ ! -f ${backupfile} ]
  then
    ! mv ${symlink} ${backupfile}
  else
    ! rm -f ${symlink}
  fi
  ln -s ${src} ${symlink}
}

zetup_link .bashrc "${ZETUP_PKG_LOCATION}/dotfiles/bashrc.sh" "$HOME/.bashrc"
zetup_link .aliases "${ZETUP_PKG_LOCATION}/dotfiles/aliases.sh" "$HOME/.aliases"
zetup_link .fns "${ZETUP_PKG_LOCATION}/dotfiles/fns.sh" "$HOME/.fns"
zetup_link .tmux.conf "${ZETUP_PKG_LOCATION}/dotfiles/tmux.conf" "$HOME/.tmux.conf"
zetup_link .vimrc "${ZETUP_PKG_LOCATION}/dotfiles/vimrc" "$HOME/.vimrc"

source "$HOME/.bashrc"


for pkg in "${subpkg_installations[@]}"
do
  ZETUP_PKG_LOCATION=${ZETUP_PKG_LOCATION} bash ${ZETUP_PKG_LOCATION}/subpkg/${pkg}/setup.sh
done
