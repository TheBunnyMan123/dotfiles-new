#!/bin/bash

PKGS="tmux neovim zoxide fzf stow"

if [ 'command -v "brew" > /dev/null' ]
then
  read -p "Install tmux, stow, neovim, zoxide, and fzf via brew? [y\n] " -n 1 -r
  echo ""
  if [[ ! $REPLY =~ ^[Yy]$ ]]
  then
    brew install $PKGS
  fi
elif [ 'command -v "pacman" > /dev/null' ]
then
  sudo pacman -S zsh $PKGS
elif [ 'command -v "apt" > /dev/null' ]
then
  sudo apt install zsh $PKGS
elif [ 'command -v "dnf" > /dev/null' ]
then
  sudo dnf install zsh $PKGS
else
  echo "Please install zsh, stow, tmux, zoxide, and fzf"
fi

echo "Installing JetBrains Mono Nerd Font"
TMPDIR="$(mktemp -d /tmp/nerd_fonts_XXXXXX)"
cd "$TMPDIR"
curl -Lo JetBrainsMono.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/JetBrainsMono.zip
unzip ./JetBrainsMono.zip -d ./patched-fonts/
curl https://raw.githubusercontent.com/ryanoasis/nerd-fonts/96497b4fef014743867b6289f7761408f9e04e89/install.sh | bash

chsh -s /bin/zsh

stow .
