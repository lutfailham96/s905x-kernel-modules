#!/bin/bash

# S905X Kernel Modules Installer

if [ "$(id -u)" != "0" ]; then
  echo "This script must be run as root" 1>&2
  exit 1
fi

install_module() {
  module_name="${1}"
  module="$(find -name ${module_name}.ko)"
  # copy module to system
  cp -afvp "${module}" /lib/modules/$(uname -r)
  # load module
  insmod /lib/modules/$(uname -r)/${module_name}.ko
  # enable auto load module
  echo -e "${module_name}" > "/etc/modules.d/${module_name}"
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
