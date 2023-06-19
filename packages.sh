#!/bin/sh

package_list() {
    printf '%s ' \
        "zip" \
        "unzip" \
        "docker" \
        "docker-compose" \
        "openssh" \
        "gnu-netcat" \
        "nano" \
        "tree"
}

install_packages() {
    printf 'Installing packages for Centos...\n'

    sudo yum -y "$(package_list)"

    printf "Done.\n"
}

install_packages
