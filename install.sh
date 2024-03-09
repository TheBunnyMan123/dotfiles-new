#!/bin/bash

CURRENTDIR=$(pwd)

bash $CURRENTDIR/install-files/packages.sh

echo "QT_QPA_PLATFORMTHEME=qt5ct" | sudo tee -a /etc/environment

sudo systemctl enable NetworkManager --force --now

echo "Fonts"
sudo pacman -S noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra ttf-jetbrains-mono-nerd

sudo cp wallpaper /wallpapers

firefox-developer-edition "https://github.com/catppuccin/dark-reader"
firefox-developer-edition "https://color.firefox.com/?theme=XQAAAAJHBAAAAAAAAABBqYhm849SCicxcUcPX38oKRicm6da8pG5gi-DrbS7fiEFLUzDsWXWyUHMSkHZ2PpRK_LvZGTF44fp7VjbASbxkoZAmYAwEJIoRnjw8xrOTGV_TjmyI1jBzmpM9P7ysk1XcU5Vim_Fm-lEdd2D1sQPsP1UC1SXCENsCDFL_dvGtcmeCmbfO6OGGOJq3ruAS_Gz79X7J3IPhPKRi0y17vC4T81wBaZnK5IwST8XwXhsZW2xuHYXlQW9lWh_0MNERp0985NX-OWb_-ihrUcCUtuKvpNVRhWiOZEGlf8aqXacHiX1iC-UFzj9yYek5qPRUzkk0PbDL3_klrAKV3FhiFwzCdwhv8YLU-O8D_iavg6KYN8B5YNgd1CGF1betSDtAH2A8YHzjQlW16NmIECM0pNIUwPIAfdyRQ-aJb506nBvtvjIb3D_pn9BgwOl-Ok0CmqQ0Tzjt5DGy1bJL8OX8lKslypKhSobuDw63XSwbG9yxD4rKvo_NnhWJBdY1xtGLs4MOLeRe4Oc10HPwY2o-9WL3ktoaN2k17lOsMoF836BLjf_wIADwA"

echo "Installing JetBrains Mono Nerd Font"
TMPDIR="$(mktemp -d /tmp/nerd_fonts_XXXXXX)"
cd "$TMPDIR"
curl -Lo JetBrainsMono.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/JetBrainsMono.zip
unzip ./JetBrainsMono.zip -d ./patched-fonts/
curl https://raw.githubusercontent.com/ryanoasis/nerd-fonts/96497b4fef014743867b6289f7761408f9e04e89/install.sh | bash

chsh -s /bin/zsh

bash $CURRENTDIR/install-files/swapfile.sh
