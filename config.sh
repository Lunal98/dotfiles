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
configure_ssh() {
    read -r -p "Enable SSH Server? [y/N] " answer
    if [[ "$answer" != y ]] && [[ "$answer" != Y ]]; then
        printf 'Skipping SSH Server...\n'
    else
        printf "\nStarting service..."
        sudo systemctl start sshd
        
	printf "DONE.\n"
    fi
}
configure_lang() {
    read -r -p "Configure Hungarian Keyboard Layout? [y/N] " answer
    if [[ "$answer" != y ]] && [[ "$answer" != Y ]]; then
        printf 'Skippin Hungarian Keyboard Layout...\n'
    else
        printf "\nConfiguring Hungarian Keyboard Layout..."
	sudo localectl set-x11-keymap hu
	sudo localectl set-keymap hu

        printf "DONE.\n"
    fi
}

enable_docker
configure_docker
configure_ssh
configure_lang
printf "Configuration completed.\n"
