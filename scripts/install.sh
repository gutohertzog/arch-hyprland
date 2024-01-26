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
    printf "\n\n"
    printf " Instalando Neofetch........................"
    sudo pacman -S --noconfirm neofetch > /dev/null 2>&1
    printf $OK

    printf "\n"
    printf " Instalando cURL............................"
    sudo pacman -S --noconfirm curl > /dev/null 2>&1
    printf $OK

    printf "\n"
    printf " Configuranco Fontes........................"
    printf "\n"
    printf " ...CaskaydiaCove Nerd Font................."
    curl -LO https://github.com/ryanoasis/nerd-fonts/releases/download/$FONT_VERSAO/CascadiaCode.tar.xz > /dev/null 2>&1
    sudo mkdir -p /usr/local/share/fonts/caskaydiacove > /dev/null 2>&1
    sudo tar -xf CascadiaCode.tar.xz -C /usr/local/share/fonts/caskaydiacove > /dev/null 2>&1
    rm CascadiaCode.tar.xz > /dev/null 2>&1
    printf $OK

    printf "\n"
    printf " ...CaskaydiaMono Nerd Font................."
    curl -LO https://github.com/ryanoasis/nerd-fonts/releases/download/$FONT_VERSAO/CascadiaMono.tar.xz > /dev/null 2>&1
    sudo mkdir -p /usr/local/share/fonts/caskaydiamono > /dev/null 2>&1
    sudo tar -xf CascadiaMono.tar.xz -C /usr/local/share/fonts/caskaydiamono > /dev/null 2>&1
    rm CascadiaMono.tar.xz > /dev/null 2>&1
    printf $OK
}

function instala_hyprland() {
    printf "\n\n"
    printf " Instalando Hyprland........................"
    sudo pacman -S --noconfirm hyprland > /dev/null 2>&1
    printf $OK

    printf "\n"
    printf " Instalando SDDM............................"
    sudo pacman -S --noconfirm sddm qt5-wayland qt6-wayland qt5-quickcontrols qt5-quickcontrols2 qt5-graphicaleffects qt5-svg > /dev/null 2>&1
    sudo cp -r $1/dotfiles/sddm/themes/* /usr/share/sddm/themes/ > /dev/null 2>&1
    sudo cp $1/dotfiles/sddm/sddm.conf /etc/ > /dev/null 2>&1
    sudo systemctl enable sddm > /dev/null 2>&1
    printf $OK

    printf "\n"
    printf " Instalando Hyprpaper......................."
    sudo pacman -S --noconfirm hyprpaper > /dev/null 2>&1
    cp -r $1/dotfiles/Pictures $HOME/ > /dev/null 2>&1
    printf $OK

    printf "\n"
    printf " Instalando Waybar.........................."
    sudo pacman -S --noconfirm waybar ttf-font-awesome > /dev/null 2>&1
    sudo usermod -aG input $USER > /dev/null 2>&1
    printf $OK

    printf "\n"
    printf " Instalando Kitty..........................."
    sudo pacman -S --noconfirm kitty > /dev/null 2>&1
    printf $OK

    printf "\n"
    printf " Instalando Thunar.........................."
    sudo pacman -S --noconfirm thunar thunar-volman gvfs gnome-themes-standard > /dev/null 2>&1
    gsettings set org.gnome.desktop.interface gtk-theme Adwaita-dark
    gsettings set org.gnome.desktop.interface color-scheme prefer-dark
    printf $OK

    printf "\n"
    printf " Instalando Oreo Cursores..................."
    # rm -rf $HOME/.icons > /dev/null 2>&1
    mkdir $HOME/.icons/
    cp -r $1/dotfiles/.icons/defaults $HOME/.icons/ > /dev/null 2>&1
    for f in $1/dotfiles/.icons/*.tar.gz; do tar xfv "$f" -C $HOME/.icons/; done
    # for f in $HOME/.icons/*.tar.gz; do tar xf "$f"; done
    # rm $HOME/.icons/*.tar.xz > /dev/null 2>&1
    printf $OK
}

function instala_programas() {
    printf "\n\n"
    printf " Instalando Firefox........................."
    sudo pacman -S --noconfirm firefox > /dev/null 2>&1
    printf $OK

    printf "\n"
    printf " Instalando Neovim.........................."
    sudo pacman -S --noconfirm neovim > /dev/null 2>&1
    printf $OK

    printf "\n"
    printf " Instalando Code - OSS + Extensões.........."
    sudo pacman -S --noconfirm code > /dev/null 2>&1
    printf $OK
    printf "\n"
    printf " ...VSCodeVim..............................."
    code-oss --install-extension vscodevim.vim > /dev/null 2>&1
    printf $OK
    printf "\n"
    printf " ...VSCode Icons............................"
    code-oss --install-extension vscode-icons-team.vscode-icons > /dev/null 2>&1
    printf $OK
    printf "\n"
    printf " ...Indent Rainbow.........................."
    code-oss --install-extension oderwat.indent-rainbow > /dev/null 2>&1
    printf $OK

    printf "\n"
    printf " Instalando KeePassXC......................."
    sudo pacman -S --noconfirm keepassxc > /dev/null 2>&1
    printf $OK
}

function instala_diversos() {
    printf "\n\n"
    printf " Instalando Pacotes Adicionais.............."

    printf "\n\n"
    printf " Instalando Brightnessctl..................."
    sudo pacman -S --noconfirm brightnessctl > /dev/null 2>&1
    printf $OK

    printf "\n"
    printf " Instalando htop............................"
    sudo pacman -S --noconfirm htop > /dev/null 2>&1
    printf $OK

    printf "\n"
    printf " Instalando exFAT..........................."
    sudo pacman -S --noconfirm exfat-utils > /dev/null 2>&1
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
    printf " Atualizando Sistema........................"
    sudo pacman -Suy --noconfirm > /dev/null 2>&1
    printf $OK
}

function copia_arquivos(){
    printf "\n"
    printf " Copiando Arquivos de Configuração.........."
    rm -rf $HOME/.config > /dev/null 2>&1
    cp -r $1/dotfiles/.config $HOME > /dev/null 2>&1
    cp $1/dotfiles/.bashrc $HOME > /dev/null 2>&1
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
    copia_arquivos $rota
    printf "\n\nInstalação Finalizada\n"
    inicializador
else
    printf "\n\nErro, o script não deve ser executado como root.\n\n"
    exit 0
fi
