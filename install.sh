#!/bin/bash

# variável global OK em verde
OK="\e[0;32mOK\e[0m"

function autor(){
    clear
    printf "\n"
    printf " #############################################\n"
    printf " #          SCRIPT POR GUTO HERTZOG          #\n"
    printf " #############################################\n"
    printf "\n"
}

function instala_basico() {
    #printf "\n\nCriando .config................"
    #mkdir "$HOME/.config" > /dev/null 2>&1
    #printf $OK

    printf "\nInstalando Vim................."
    sudo pacman -S --noconfirm vim > /dev/null 2>&1
    sudo pacman -S --noconfirm fzf > /dev/null 2>&1
    cp -r $1/dotfiles/.vim "$HOME/"
    cp $1/dotfiles/.vimrc "$HOME/"
    printf $OK

    printf "\nInstalando Neofetch............"
    sudo pacman -S --noconfirm neofetch > /dev/null 2>&1
    cp -r $1/dotfiles/.config/neofetch "$HOME/.config/"
    printf $OK

    printf "\nInstalando cURL................"
    sudo pacman -S --noconfirm curl > /dev/null 2>&1
    printf $OK

    printf "\nConfigurando Fonte............."
    curl -LO https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/CascadiaCode.tar.xz > /dev/null 2>&1
    sudo mkdir -p /usr/share/fonts/caskaydiacove-nerd-font # > /dev/null 2>&1
    sudo tar -xvf CascadiaCode.tar.xz -C /usr/share/fonts/caskaydiacove-nerd-font > /dev/null 2>&1
    rm CascadiaCode.tar.xz
    printf $OK
    
    printf "\nCopiando .bashrc..............."
    cp $1/dotfiles/.bashrc "$HOME/"
    printf $OK
}

function instala_hyprland() {
    printf "\n\nInstalando Hyprland............"
    sudo pacman -S --noconfirm hyprland > /dev/null 2>&1
    cp -r $1/dotfiles/.config/hypr "$HOME/.config/"
    printf $OK

    printf "\nInstalando SDDM................"
    sudo pacman -S --noconfirm sddm qt5-graphicaleffects qt5-svg qt5-quickcontrols2 > /dev/null 2>&1
    systemctl enable sddm > /dev/null 2>&1
    sudo cp -r $1/dotfiles/sddm/themes/* /usr/share/sddm/themes/
    sudo cp $1/dotfiles/sddm/sddm.conf /etc/
    printf $OK

    printf "\nInstalando Hyprpaper..........."
    sudo pacman -S --noconfirm hyprpaper > /dev/null 2>&1
    mkdir -p "$HOME/Images/wallpapers"
    cp $1/dotfiles/hypr/hyprpaper.conf "$HOME/.config/hypr/"
    cp $1/dotfiles/Images/wallpapers/* "$HOME/Images/wallpapers"
    printf $OK

    printf "\nInstalando Kitty..............."
    sudo pacman -S --noconfirm kitty > /dev/null 2>&1
    cp -r $1/dotfiles/.config/kitty "$HOME/.config/"
    printf $OK

    printf "\nInstalando Firefox............."
    sudo pacman -S --noconfirm firefox > /dev/null 2>&1
    printf $OK
}

function inicializador() {
    printf "\n\nInicializando o Hyprland em:\n"
    for i in 5 4 3 2 1; do
        printf "$i...."
        sleep 1
    done
    Hyprland
}

function atualiza_sistema(){
    printf "\nAtualizando Sistema............"
    sudo pacman -Suy --noconfirm > /dev/null 2>&1
    printf $OK
}

# inicializa o script
if [ $(whoami) != "root" ]; then
    rota=$(pwd)
    autor
    printf "\nInstalação Iniciada\n"
    atualiza_sistema
    instala_basico "$rota"
    instala_hyprland "$rota"
    printf "\n\nInstalação Finalizada\n"
    inicializador
else
    printf "\n\nErro, o script não deve ser executado como root.\n\n"
    exit 0
fi

