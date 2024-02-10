#!/bin/bash

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

ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
ln -s ~/.dotfiles/tmux ~/.config/tmux
ln -s ~/.dotfiles/.zshrc ~/.zshrc
ln -s ~/.dotfiles/nvim ~/.config/nvim

chsh -s /bin/zsh
ln -s ~/.dotfiles/alacritty ~/.config/alacritty
ln -s ~/.dotfiles/fontconfig ~/.config/fontconfig
