#!/bin/bash
#set -e
#tput setaf 0 = black
#tput setaf 1 = red
#tput setaf 2 = green
#tput setaf 3 = yellow
#tput setaf 4 = dark blue
#tput setaf 5 = purple
#tput setaf 6 = cyan
#tput setaf 7 = gray
#tput setaf 8 = light blue
##################################################################################################################

if [ "$DEBUG" = true ]; then
    echo
    echo "------------------------------------------------------------"
    echo "Running $(basename $0)"
    echo "------------------------------------------------------------"
    echo
    read -n 1 -s -r -p "Debug mode is on. Press any key to continue..."
    echo
fi

##################################################################################################################

echo
tput setaf 3
echo "######################################################"
echo "################### Remove software for all"
echo "######################################################"
tput sgr0
echo

sudo pacman -Rs --noconfirm adobe-source-han-sans-cn-fonts
sudo pacman -Rs --noconfirm adobe-source-han-sans-jp-fonts
sudo pacman -Rs --noconfirm adobe-source-han-sans-kr-fonts
sudo pacman -Rs --noconfirm vim vim-runtime
sudo pacman -Rs --noconfirm xfce4-screensaver


# when on Arch Linux - remove conflicting files
if grep -q "archlinux" /etc/os-release; then

  echo
  tput setaf 2
  echo "######################################################"
  echo "############### Removing software for Arch"
  echo "######################################################"
  tput sgr0
  echo
  if [ -f /etc/skel/.config/rofi/config.rasi ]; then
    sudo rm -v /etc/skel/.config/rofi/config.rasi
  fi   
  

  sudo pacman -R --noconfirm kiro-rofi
  sudo pacman -R --noconfirm kiro-xfce
  sudo pacman -R --noconfirm kiro-bash-config
  sudo pacman -R --noconfirm kiro-rofi-themes
  sudo pacman -R --noconfirm kiro-zsh-config
  sudo pacman -R --noconfirm kiro-plank
  sudo pacman -R --noconfirm kiro-dot-files
  sudo pacman -R --noconfirm kiro-shells
  sudo pacman -R --noconfirm kiro-powermenue
  sudo pacman -R --noconfirm
  sudo pacman -R --noconfirm
  sudo pacman -R --noconfirm
  sudo pacman -R --noconfirm
  sudo pacman -R --noconfirm
  sudo pacman -R --noconfirm
  sudo pacman -R --noconfirm

  echo
  tput setaf 2
  echo "######################################################"
  echo "################### Software removed"
  echo "######################################################"
  tput sgr0
  echo

fi


  tput setaf 2
  echo "######################################################"
  echo "################### Software removed"
  echo "######################################################"
  tput sgr0
  echo



echo
tput setaf 6
echo "######################################################"
echo "###################  $(basename $0) done"
echo "######################################################"
tput sgr0
echo
