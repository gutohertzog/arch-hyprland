#!/bin/bash

# variável global OK em verde
OK="\e[0;32mOK\e[0m"
FONT_VERSAO="v3.1.1"

function autor(){
    clear
    printf "\n"
    printf " #############################################\n"
    printf " #          SCRIPT POR GUTO HERTZOG          #\n"
    printf " #############################################\n"
    printf "\n"
}

function instala_basico() {
    printf "\n"
    printf "\nCriando .config.................."
    mkdir "$HOME/.config" > /dev/null 2>&1
    printf $OK

    printf "\nInstalando Neofetch.............."
    sudo pacman -S --noconfirm neofetch > /dev/null 2>&1
    cp -r $1/dotfiles/.config/neofetch $HOME/.config/
    printf $OK

    printf "\nInstalando cURL.................."
    sudo pacman -S --noconfirm curl > /dev/null 2>&1
    printf $OK

    printf "\nConfigurando Fontes.............."
    printf "\n........CaskaydiaCove Nerd Font"
    curl -LO https://github.com/ryanoasis/nerd-fonts/releases/download/$FONT_VERSAO/CascadiaCode.tar.xz > /dev/null 2>&1
    sudo mkdir -p /usr/local/share/fonts/caskaydiacove # > /dev/null 2>&1
    sudo tar -xvf CascadiaCode.tar.xz -C /usr/local/share/fonts/caskaydiacove > /dev/null 2>&1
    rm CascadiaCode.tar.xz

    printf "\n..........CaskaydiaMono Nerd Font"
    curl -LO https://github.com/ryanoasis/nerd-fonts/releases/download/$FONT_VERSAO/CascadiaMono.tar.xz > /dev/null 2>&1
    sudo mkdir -p /usr/local/share/fonts/caskaydiamono # > /dev/null 2>&1
    sudo tar -xvf CascadiaMono.tar.xz -C /usr/local/share/fonts/caskaydiamono > /dev/null 2>&1
    rm CascadiaMono.tar.xz

    printf "\n..............Recarregando Fontes"
    sudo fc-cache -f -v > /dev/null 2>&1
    printf $OK

    printf "\nCopiando .bashrc................."
    cp $1/dotfiles/.bashrc $HOME/
    printf $OK
}

function instala_hyprland() {
    printf "\n"
    printf "\nInstalando Hyprland.............."
    sudo pacman -S --noconfirm hyprland > /dev/null 2>&1
    cp -r $1/dotfiles/.config/hypr $HOME/.config/
    printf $OK

    printf "\nInstalando SDDM.................."
    sudo pacman -S --noconfirm sddm qt5-wayland qt6-wayland qt5-quickcontrols qt5-quickconstrols2 qt5-graphicaleffects qt5-svg > /dev/null 2>&1
    systemctl enable sddm > /dev/null 2>&1
    sudo cp -r $1/dotfiles/sddm/themes/* /usr/share/sddm/themes/
    sudo cp $1/dotfiles/sddm/sddm.conf /etc/
    printf $OK

    printf "\nInstalando Hyprpaper............."
    sudo pacman -S --noconfirm hyprpaper > /dev/null 2>&1
    mkdir -p $HOME/Images/wallpapers
    cp $1/dotfiles/Images/wallpapers/* $HOME/Images/wallpapers/
    printf $OK

    printf "\nInstalando Kitty................."
    sudo pacman -S --noconfirm kitty > /dev/null 2>&1
    cp -r $1/dotfiles/.config/kitty $HOME/.config/
    printf $OK

    printf "\nInstalando Dolphin..............."
    sudo pacman -S --noconfirm dolphin > /dev/null 2>&1
    printf $OK
}

function instala_programas() {
    printf "\n"
    printf "\nInstalando Firefox..............."
    sudo pacman -S --noconfirm firefox > /dev/null 2>&1
    printf $OK

    printf "\nInstalando Neovim................"
    sudo pacman -S --noconfirm neovim > /dev/null 2>&1
    cp -r $1/dotfiles/.config/nvim $HOME/
    printf $OK

    printf "\nInstalando Code - OSS............"
    sudo pacman -S --noconfirm code > /dev/null 2>&1
    # code-oss --install-extension vscodevim.vim > /dev/null 2>&1
    # code-oss --install-extension vscode-icons-team.vscode-icons > /dev/null 2>&1
    # code-oss --install-extension ms-python.python > /dev/null 2>&1
    cp -r $1/dotfiles/.config/\"Code - OSS\" $HOME/.config/
    printf $OK
}

function instala_diversos() {
    printf "\n"
    printf "\nInstalando Bluetooth............."
    sudo pacman -S --noconfirm bluez bluez-utils blueman > /dev/null 2>&1
    printf $OK

    printf "\nInstalando Controle Brilho......."
    sudo pacman -S --noconfirm brightnessctl > /dev/null 2>&1
    printf $OK

    printf "\nInstalando Pipewire.............."
    sudo pacman -S --noconfirm pipewire pipewire-alsa pipewire-jack pipewire-pulse gst-plugin-pipewire wireplumber > /dev/null 2>&1
    printf $OK

    printf "\nInstalando Network Manager......."
    sudo pacman -S --noconfirm networkmanager network-manager-applet > /dev/null 2>&1
    printf $OK
}

function inicializador() {
    printf "\n\nReiniciando em:\n"
    for i in 5 4 3 2 1; do
        printf "$i"
        for j in 4 3 2 1; do
            printf "."
            sleep 0.25
        done
    done
    reboot
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
    instala_basico $rota
    instala_hyprland $rota
    instala_programas $rota
    instala_diversos $rota
    printf "\n\nInstalação Finalizada\n"
    inicializador
else
    printf "\n\nErro, o script não deve ser executado como root.\n\n"
    exit 0
fi
