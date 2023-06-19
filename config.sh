#!/usr/bin/env bash
enable_docker() {
    read -r -p "Start and enable Docker? [y/N] " answer
    if [[ "$answer" != y ]] && [[ "$answer" != Y ]]; then
        printf "\nSkipping Docker systemctl setup...\n"
    else
        printf "\nStarting Docker through systemctl..."
        systemctl start docker

        printf "\nStarting Docker through systemctl..."
        systemctl enable docker

        printf "DONE.\n"
    fi
}

configure_docker() {
    read -r -p "Manage Docker as a non-root user? [y/N] " answer
    if [[ "$answer" != y ]] && [[ "$answer" != Y ]]; then
        printf 'Skipping Docker non-root configuration...\n'
    else
        printf "\nAdding 'docker' group..."
        sudo groupadd docker

        printf '\nAdding user %s to docker group...' "$USER"
        sudo usermod -aG docker "$USER"

        printf "DONE.\n"
    fi
}

enable_docker
configure_docker

printf "Configuration completed.\n"
