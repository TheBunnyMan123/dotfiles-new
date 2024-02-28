#!/bin/bash

cd $(mktemp -d /tmp/grub-catppuccin-XXXXXX)
git clone https://github.com/catppuccin/grub.git
cd grub
sudo cp -r src/* /usr/share/grub/themes/

echo "Uncomment and edit the corrosponding line in /etc/default/grub to this:"
echo "GRUB_THEME=\"/usr/share/grub/themes/catppuccin-macchiato-grub-theme/theme.txt\""
echo "also edit GRUB_GFXMODE to your screen resolution"
echo ""
echo "After doing so, run this command:"
echo "sudo grub-mkconfig -o /boot/grub/grub.cfg"
