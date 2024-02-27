#!/bin/bash

echo "NoDisplay=true" >> ~/.local/share/applications/xfce4-mail-reader.desktop
xfconf-query -c xsettings -p /Net/ThemeName -s "Catppuccin-Macchiato-Standard-Teal-Dark
