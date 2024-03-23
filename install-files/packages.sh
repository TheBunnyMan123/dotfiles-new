#!/bin/bash

PKGS="qt5ct speech-dispatcher espeak-ng zsh mc networkmanager network-manager-applet rust gdb lldb vlc busybox zip unzip tar p7zip xdg-desktop-portal xdg-desktop-portal-gtk xorg-server flameshot xfce4 xfce4-goodies base-devel pipewire-pulse firefox-developer-edition tmux neovim zoxide fzf stow eza bat w3m alacritty keepassxc syncthing"
AURPKGS="prismlauncher-qt5-bin catppuccin-cursors-macchiato catppuccin-gtk-theme-macchiato caffeine-ng"
sudo pacman -Syu $PKGS--needed

cd $(mktemp -d /tmp/yay)
git clone "https://aur.archlinux.org/yay-bin.git" yay-bin
cd yay-bin
makepkg -si

yay -S $AURPKGS
