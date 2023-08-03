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
    mkdir ~/.config > /dev/null 2>&1
    printf $OK

    #printf '\nConfigurando Pacman............'
    #sudo bash -c 'echo "ILoveCandy" >> /etc/pacman.conf'
    #printf $OK

    printf '\nInstalando Vim.................'
    sudo pacman -S --noconfim vim > /dev/null 2>&1
    cp -r ~/arch-hyprland/dotfiles/.vim ~/
    cp ~/arch-hyprland/dotfiles/.vimrc ~/
    printf $OK

    printf '\nInstalando Neofetch............'
    sudo pacman -S --noconfirm neofetch > /dev/null 2>&1
    cp -r ~/arch-hyprland/dotfiles/.config/neofetch ~/.config/
    printf $OK

    printf '\nInstalando cURL................'
    sudo pacman -S --noconfirm curl > /dev/null 2>&1
    printf $OK

    printf '\nConfigurando Fonte.............'
    curl -LO https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/CascadiaCode.tar.xz > /dev/null 2>&1
    sudo mkdir -p /usr/share/fonts/caskaydiacove-nerd-font # > /dev/null 2>&1
    sudo tar -xvf CascadiaCode.tar.xz -C /usr/share/fonts/caskaydiacove-nerd-font > /dev/null 2>&1
    rm CascadiaCode.tar.xz
    printf $OK
    
    printf '\nCopiando .bashrc...............'
    cp ~/arch-hyprland/dotfiles/.bashrc ~/
    printf $OK
}

function instala_hyprland() {
    printf '\nInstalando Hyprland............'
    sudo pacman -S --noconfirm hyprland > /dev/null 2>&1
    cp -r ~/arch-hyprland/dotfiles/.config/hypr ~/.config/
    printf $OK

    printf '\nInstalando Kitty...............'
    sudo pacman -S --noconfirm kitty > /dev/null 2>&1
    cp -r ~/arch-hyprland/dotfiles/.config/kitty ~/.config/
    printf $OK

    printf '\nInstalando Firefox.............'
    sudo pacman -S --noconfirm firefox > /dev/null 2>&1
    printf $OK
}

function inicializador() {
    printf '\nInicializando o Hyprland em:\n'
    for i in 3 2 1; do
        printf '    $i ...\n'
        sleep 1
    done
    Hyprland
}

function atualiza_sistema(){
    printf '\nAtualizando Sistema............'
    sudo pacman -Suy --noconfirm > /dev/null 2>&1
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
    printf '\n\nErro, o script não deve ser executado como root.\n\n'
    exit 0
fi

