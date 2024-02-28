#!/bin/bash

echo "Would you like to set up a swap file?"
read -p "THIS WILL DISABLE ALL OTHER SWAP DEVICES [y/N]? " REPLY

echo ""

if [[ "${REPLY,,}" = "y" ]]
then
  sudo swapoff -a
  read -p "How many GB of swap? " REPLY
  sudo dd if=/dev/zero of=/swapfile bs=1M count=${REPLY}K status=progress
  sudo chmod 0600 clear /swapfile
  sudo mkswap -U clear /swapfile
  sudo swapon /swapfile
  sudo cp /etc/fstab /etc/fstab.backup
  echo -e "\n/swapfile none swap defaults 0 0" | sudo tee -a /etc/fstab
fi
