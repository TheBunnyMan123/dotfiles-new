#!/bin/bash

PKGS="ripgrep tmux neovim zoxide fzf stow eza bat w3m"

if [ -x "$(command -v "brew")" ]
then
  read -p "Install [$PKGS] an midnight-commander via brew? [y\n] " -n 1 -r
  echo ""
  if [[ $REPLY =~ ^[Yy]$ ]]
  then
    brew install $PKGS midnight-commander
  fi
elif [ -x "$(command -v "pacman")" ]
then
  sudo pacman -S zsh $PKGS mc
elif [ -x "$(command -v "apt")" ]
  sudo apt install zsh $PKGS mc
elif [ -x "$(command -v "dnf")" ]
then
  sudo dnf install zsh $PKGS mc
else
  echo "Please install $PKGS and midnight-commander"
fi

echo "Installing JetBrains Mono Nerd Font"
TMPDIR="$(mktemp -d /tmp/nerd_fonts_XXXXXX)"
cd "$TMPDIR"
curl -Lo JetBrainsMono.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/JetBrainsMono.zip
unzip ./JetBrainsMono.zip -d ./patched-fonts/
curl https://raw.githubusercontent.com/ryanoasis/nerd-fonts/96497b4fef014743867b6289f7761408f9e04e89/install.sh | bash

chsh -s /bin/zsh

stow .
