#!/bin/bash

# S905X Kernel Modules Installer

if [ "$(id -u)" != "0" ]; then
  echo "This script must be run as root" 1>&2
  exit 1
fi

install_module() {
  module_name="${1}"
  module="$(find -name ${module_name}.ko)"
  cp -afvp "${module}" /lib/modules/$(uname -r)
  insmod /lib/modules/$(uname -r)/${module_name}.ko
}

usage() {
  cat <<EOF
Usage:
  ${0} -i module_name

Example
  ${0} -i wireguard
EOF
}

case "${1}" in
  -i)
    install_module "${2}"
    ;;
  *)
    usage
    ;;
esac
