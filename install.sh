#!/bin/bash

PKGS="btop adwaita-cursors ripgrep tmux neovim zoxide fzf stow eza bat w3m plasma-desktop sddm"

sudo pacman -S zsh $PKGS mc

sudo systemctl enable sddm --force

echo "Installing JetBrains Mono Nerd Font"
TMPDIR="$(mktemp -d /tmp/nerd_fonts_XXXXXX)"
cd "$TMPDIR"
curl -Lo JetBrainsMono.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/JetBrainsMono.zip
unzip ./JetBrainsMono.zip -d ./patched-fonts/
curl https://raw.githubusercontent.com/ryanoasis/nerd-fonts/96497b4fef014743867b6289f7761408f9e04e89/install.sh | bash

chsh -s /bin/zsh

stow .
