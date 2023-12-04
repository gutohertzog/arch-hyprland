#!/bin/bash

printf "Realizando backup das pastas\n"

cp $HOME/.bashrc $HOME/arch-hyprland/dotfiles/
cp -rv $HOME/.config/hypr $HOME/arch-hyprland/dotfiles/.config
cp -rv $HOME/.config/kitty $HOME/arch-hyprland/dotfiles/.config
cp -rv $HOME/.config/waybar $HOME/arch-hyprland/dotfiles/.config
cp -rv $HOME/.config/Code\ -\ OSS/User/*.json $HOME/arch-hyprland/dotfiles/.config/Code\ -\ OSS/User/
cp -rv $HOME/.config/nvim $HOME/arch-hyprland/dotfiles/.config
