#!/bin/bash

if [ 'command -v "brew" > /dev/null'
then
  read -p "Install tmux and neovim via brew? [y\n] " -n 1 -r
  echo ""
  if [[ ! $REPLY =~ ^[Yy]$ ]]
  then
    [[ "$0" = "$BASH_SOURCE" ]] && exit 1 || return 1 # handle exits from shell or function but don't exit interactive shell
  fi
if [ 'command -v "pacman" > /dev/null' ]
then
  sudo pacman -S zsh tmux neovim
elif [ 'command -v "apt" > /dev/null' ]
then
  sudo apt install zsh tmux neovim 
elif [ 'command -v "dnf" > /dev/null' ]
then
  sudo dnf install zsh tmux neovim
else
  echo "Please install zsh and tmux"
fi

echo "Installing JetBrains Mono Nerd Font"
TMPDIR="$(mktemp -d /tmp/nerd_fonts_XXXXXX)"
cd "$TMPDIR"
curl -Lo JetBrainsMono.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/JetBrainsMono.zip
unzip ./JetBrainsMono.zip -d ./patched-fonts/
curl https://raw.githubusercontent.com/ryanoasis/nerd-fonts/96497b4fef014743867b6289f7761408f9e04e89/install.sh | bash

ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
ln -s ~/.dotfiles/tmux ~/.config/tmux
ln -s ~/.dotfiles/.zshrc ~/.zshrc
ln -s ~/.dotfiles/nvim ~/.config/nvim

chsh -s /bin/zsh
ln -s ~/.dotfiles/alacritty ~/.config/alacritty
ln -s ~/.dotfiles/fontconfig ~/.config/fontconfig
