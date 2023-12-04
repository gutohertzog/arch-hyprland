#!/bin/bash

# variável global OK em verde
OK="\e[0;32mOK\e[0m"
FONT_VERSAO="v3.1.1"
LOG="instalacao.log"

function autor(){
    clear
    printf "\n"
    printf " #############################################\n"
    printf " #          SCRIPT POR GUTO HERTZOG          #\n"
    printf " #############################################\n"
    printf "\n"
}

function instala_basico() {
    printf "\n\n"
    printf " Criando .config.............................."
    printf "\n\n Criando .config\n" >> $LOG
    mkdir "$HOME/.config" >> $LOG
    printf $OK

    printf "\n"
    printf " Instalando Neofetch.........................."
    printf "\n\n Instalando Neofetch\n" >> $LOG
    sudo pacman -S --noconfirm neofetch >> $LOG
    cp -r $1/dotfiles/.config/neofetch $HOME/.config/ >> $LOG
    printf $OK

    printf "\n"
    printf " Instalando cURL.............................."
    printf "\n\n Instalando cURL\n" >> $LOG
    sudo pacman -S --noconfirm curl >> $LOG
    printf $OK

    printf "\n"
    printf " Configuranco Fontes.........................."
    printf "\n\n Configurando Fontes\n" >> $LOG
    printf "\n"
    printf "....CaskaydiaCove Nerd Font..................."
    curl -LO https://github.com/ryanoasis/nerd-fonts/releases/download/$FONT_VERSAO/CascadiaCode.tar.xz >> $LOG
    sudo mkdir -p /usr/local/share/fonts/caskaydiacove >> $LOG
    sudo tar -xvf CascadiaCode.tar.xz -C /usr/local/share/fonts/caskaydiacove >> $LOG
    rm CascadiaCode.tar.xz >> $LOG
    printf $OK

    printf "\n"
    printf "....CaskaydiaMono Nerd Font..................."
    curl -LO https://github.com/ryanoasis/nerd-fonts/releases/download/$FONT_VERSAO/CascadiaMono.tar.xz >> $LOG
    sudo mkdir -p /usr/local/share/fonts/caskaydiamono >> $LOG
    sudo tar -xvf CascadiaMono.tar.xz -C /usr/local/share/fonts/caskaydiamono >> $LOG
    rm CascadiaMono.tar.xz >> $LOG
    printf $OK

    printf "\n"
    printf "....Recarregando Fontes......................."
    printf "\n Recarregando Fontes\n" >> $LOG
    sudo fc-cache -fv >> $LOG
    printf $OK

    printf "\n"
    printf " Copiando .bashrc............................."
    printf "\n Copiando .bashrc\n" >> $LOG
    cp $1/dotfiles/.bashrc $HOME/ >> $LOG
    printf $OK
}

function instala_hyprland() {
    printf "\n\n"
    printf " Instalando Hyprland.........................."
    printf "\n\n Instalando Hyprland\n" >> $LOG
    sudo pacman -S --noconfirm hyprland >> $LOG
    cp -r $1/dotfiles/.config/hypr $HOME/.config/ >> $LOG
    printf $OK

    printf "\n"
    printf " Instalando SDDM.............................."
    printf "\n\n Instalando SDDM\n" >> $LOG
    sudo mkdir -p /usr/share/sddm/themes/ >> $LOG
    sudo pacman -S --noconfirm sddm qt5-wayland qt6-wayland qt5-quickcontrols qt5-quickcontrols2 qt5-graphicaleffects qt5-svg >> $LOG
    sudo cp -r $1/dotfiles/sddm/themes/* /usr/share/sddm/themes/ >> $LOG
    sudo cp $1/dotfiles/sddm/sddm.conf /etc/ >> $LOG
    systemctl enable sddm >> $LOG
    printf $OK

    printf "\n"
    printf " Instalando Hyprpaper........................."
    printf "\n\n Instalando Hyprpaper\n" >> $LOG
    sudo pacman -S --noconfirm hyprpaper >> $LOG
    mkdir -p $HOME/Images/wallpapers >> $LOG
    cp $1/dotfiles/Images/wallpapers/* $HOME/Images/wallpapers/ >> $LOG
    printf $OK

    printf "\n"
    printf " Instalando Waybar............................"
    printf "\n\n Instalando Waybar\n" >> $LOG
    sudo pacman -S --noconfirm waybar >> $LOG
    sudo pacman -S --noconfirm ttf-font-awesome >> $LOG
    sudo cp $1/dotfiles/.config/waybar $HOME/.config/ >> $LOG
    sudo usermod -aG input $USER >> $LOG
    printf $OK

    printf "\n"
    printf " Instalando Kitty............................."
    printf "\n\n Instalando Kitty\n" >> $LOG
    sudo pacman -S --noconfirm kitty >> $LOG
    cp -r $1/dotfiles/.config/kitty $HOME/.config/ >> $LOG
    printf $OK

    printf "\n"
    printf " Instalando Dolphin..........................."
    printf "\n\n Instalando Dolphin\n" >> $LOG
    sudo pacman -S --noconfirm dolphin >> $LOG
    printf $OK
}

function instala_programas() {
    printf "\n\n"
    printf " Instalando Firefox..........................."
    printf "\n\n Instalando Firefox\n" >> $LOG
    sudo pacman -S --noconfirm firefox >> $LOG
    printf $OK

    printf "\n"
    printf " Instalando Neovim............................"
    printf "\n\n Instalando Neovim\n" >> $LOG
    sudo pacman -S --noconfirm neovim >> $LOG
    cp -r $1/dotfiles/.config/nvim $HOME/ >> $LOG
    printf $OK

    printf "\n"
    printf " Instalando Code - OSS........................"
    printf "\n\n Instalando Code - OSS\n" >> $LOG
    sudo pacman -S --noconfirm code >> $LOG
    code-oss --install-extension vscodevim.vim >> $LOG
    code-oss --install-extension vscode-icons-team.vscode-icons >> $LOG
    # code-oss --install-extension ms-python.python >> $LOG
    cp -r $1/dotfiles/.config/Code\ -\ OSS $HOME/.config/ >> $LOG
    printf $OK

    printf "\n"
    printf " Instalando KeePassXC........................."
    printf "\n\n Instalando KeePassXC\n" >> $LOG
    sudo pacman -S --noconfirm keepassxc >> $LOG
    printf $OK
}

function instala_diversos() {
    printf "\n\n"
    printf " Instalando Bluetooth........................."
    printf "\n\n Instalando Bluetooth\n" >> $LOG
    sudo pacman -S --noconfirm bluez bluez-utils blueman >> $LOG
    printf $OK

    printf "\n"
    printf " Instalando Brightnessctl....................."
    printf "\n\n Instalando Brightnessctl\n" >> $LOG
    sudo pacman -S --noconfirm brightnessctl >> $LOG
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
    printf "\n"
    printf " Atualizando Sistema.........................."
    printf "\n\n Atualizando Sistema\n" >> $LOG
    sudo pacman -Suy --noconfirm >> $LOG
    printf $OK
}

function cria_log(){
    printf "\n"
    printf "\nCriando o arquivo de log....................."
    touch instalacao.log
    printf $OK
}

# inicializa o script
if [ $(whoami) != "root" ]; then
    rota=$(pwd)
    autor
    printf "\nInstalação Iniciada\n"
    cria_log
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
