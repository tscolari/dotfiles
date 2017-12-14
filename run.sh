#!/bin/bash

set -xeuo pipefail
extra_tags=$@
export PATH=$PATH:~/.local/bin

unix() {
  flavour="$(uname)"
  if [ "$flavour" == "Linux" ]; then
    if grep Ubuntu /etc/os-release > /dev/null; then
      "$1"__Ubuntu
    else
      "$1"__Gentoo
    fi
  elif [ "$flavour" == "Darwin" ]; then
    "$1"__Darwin
  else
    echo "$flavour doesn't sound like a Unix"
  fi
}

install_ansible__Gentoo() {
  sudo emerge ansible
}

install_ansible__Ubuntu() {
  sudo apt-get update
  sudo apt-get install -y python-pip libssl-dev
  pip install --upgrade --user pip
  pip install --user ansible
}

install_ansible__Darwin() {
  log "installing/upgrading Homebrew"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew install ansible
}

playbook_tags__Gentoo() {
  echo "gentoo"
}

playbook_tags__Ubuntu() {
  echo "ubuntu"
}

playbook_tags__Darwin() {
  echo "macos"
}

log() {
  echo
  echo "----------------------------------------------------------------------"
  echo "$1"
  echo "----------------------------------------------------------------------"
  echo
}

log "Oh boy, here I go installin' again!"

if ! which ansible-playbook > /dev/null 2>&1 ; then
  echo "ansible-playbook not found on \$PATH, installing"
  unix install_ansible
fi

(
cd "$(dirname "$0")"
cmd="ansible-playbook -i localhost, --tags $(unix playbook_tags),$extra_tags --con local playbook.yml"
if [ "$(uname)" == "Linux" ]; then
  cmd="$cmd --ask-become-pass"
fi
$cmd
)

log "Don't forget to read the post install steps for your OS in README.md."
