#!/bin/bash

# variável global
OK="\e[0;32mOK\e[0m"

function autor(){
    clear
    printf '\n'
    printf ' ############################################\n'
    printf ' #          SCRIPT POR GUTOHERTZOG          #\n'
    printf ' ############################################\n'
    printf '\n'
}

function instala_basico() {
    printf '\nCriando .config................'
    mkdir ~/.config
    printf $OK

    printf '\nConfigurando Pacman............'
    sudo bash -c 'echo "ILoveCandy" >> /etc/pacman.conf'
    printf $OK

    printf '\nInstalando Vim.................'
    sudo pacman -S vim
    cp -r ./dotfiles/.vim ~/
    cp .dotfiles/.vimrc ~/
    printf $OK

    printf '\nInstalando Neofetch............'
    sudo pacman -S neofetch
    cp -r ./dotfiles/.config/neofetch
    printf $OK

    printf '\nInstalando cURL................'
    sudo pacman -S curl
    printf $OK

    printf '\nConfigurando Fonte.............'
    curl -LO https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/CascadiaCode.tar.xz
    sudo mkdir -p /usr/share/fonts/caskaydiacove-nerd-font > /dev/null 2>&1
    sudo tar -xvf CascadiaCode.tar.xz -C /usr/share/fonts/caskaydiacove-nerd-font
    rm CascadiaCode.tar.xz
    printf $OK
    
    printf '\nCopiando .bashrc...............'
    cp ./dotfiles/.bashrc ~/
    printf $OK
}

function instala_hyprland() {
    printf '\nInstalando Hyprland............'
    sudo pacman -S hyprland
    cp -r ./dotfiles/.config/hypr
    printf $OK

    printf '\nInstalando Kitty...............'
    sudo pacman -S kitty
    cp -r ./dotfiles/.config/kitty
    printf $OK

    printf '\nInstalando Firefox.............'
    sudo pacman -S firefox
    printf $OK
}

function inicializador() {
    printf '\nInicializando o Hyprland em:'
    for i in 3 2 1; do
        printf '$i ...'
    done
    Hyprland
}

function atualiza_sistema(){
    printf '\nAtualizando Sistema............'
    sudo pacman -Suy
    printf $OK
}

# inicializa o script
if [ $(whoami) != 'root' ]; then
    autor
    printf '\nInstalação Iniciada\n'
    atualiza_sistema
    instala_basico
    instala_hyprland
    printf '\nInstalação Finalizada\n'
    inicializador
else
    printf 'Erro, o script não deve ser executado como root.'
    exit 0
fi

