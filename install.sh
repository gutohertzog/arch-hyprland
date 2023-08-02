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
    print '\nCriando .config................'
    mkdir ~/.config
    print $OK

    print '\nConfigurando Pacman............'
    sudo bash -c 'echo "ILoveCandy" >> /etc/pacman.conf'
    print $OK

    print '\nInstalando Vim.................'
    sudo pacman -S vim
    cp -r ./dotfiles/.vim ~/
    cp .dotfiles/.vimrc ~/
    print $OK

    print '\nInstalando Neofetch............'
    sudo pacman -S neofetch
    cp -r ./dotfiles/.config/neofetch
    print $OK

    print '\nInstalando cURL................'
    sudo pacman -S curl
    print $OK

    print '\nConfigurando Fonte.............'
    curl -LO https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/CascadiaCode.tar.xz
    sudo mkdir -p /usr/share/fonts/caskaydiacove-nerd-font > /dev/null 2>&1
    sudo tar -xvf CascadiaCode.tar.xz -C /usr/share/fonts/caskaydiacove-nerd-font
    rm CascadiaCode.tar.xz
    print $OK
    
    print '\nCopiando .bashrc...............'
    cp ./dotfiles/.bashrc ~/
    print $OK
}

function instala_hyprland() {
    print '\nInstalando Hyprland............'
    sudo pacman -S hyprland
    cp -r ./dotfiles/.config/hypr
    print $OK

    print '\nInstalando Kitty...............'
    sudo pacman -S kitty
    cp -r ./dotfiles/.config/kitty
    print $OK

    print '\nInstalando Firefox.............'
    sudo pacman -S firefox
    print $OK
}

function inicializador() {
    printf '\nInicializando o Hyprland em:'
    for i in 3 2 1; do
        printf '$i ...'
    done
    Hyprland
}

function atualiza_sistema(){
    print '\nAtualizando Sistema............'
    sudo pacman -Suy
    print $OK
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

