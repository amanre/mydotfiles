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

sudo pacman -Rs broadcom-wl-dkms --noconfirm
sudo pacman -Rs rtl8821cu-morrownr-dkms-git --noconfirm
sudo pacman -Rs --noconfirm archinstall
sudo pacman -Rs lftp --noconfirm
sudo pacman -Rs xf86-video-amdgpu --noconfirm
sudo pacman -Rs xf86-video-fbdev --noconfirm
sudo pacman -Rs xf86-video-openchrome --noconfirm
if pacman -Qi xf86-video-vmware &> /dev/null; then
  sudo pacman -Rs xf86-video-vmware --noconfirm
fi
sudo pacman -Rs xf86-video-ati --noconfirm
sudo pacman -Rs xf86-video-nouveau --noconfirm
sudo pacman -Rs xf86-video-vesa --noconfirm
sudo pacman -Rs --noconfirm xfce4-artwork
sudo rm -rf /usr/share/backgrounds/xfce

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

  echo "Nothing to remove"

  echo
  tput setaf 2
  echo "######################################################"
  echo "################### Software removed"
  echo "######################################################"
  tput sgr0
  echo

fi

# when on EOS - remove conflicting files

if grep -q "EndeavourOS" /etc/os-release; then

  echo
  tput setaf 3
  echo "##############################################################"
  echo "############### Removing software for EOS"
  echo "##############################################################"
  tput sgr0
  echo
  if [ -f /etc/skel/.config/rofi/config.rasi ]; then
    sudo rm -v /etc/skel/.config/rofi/config.rasi
  fi   

  sudo systemctl disable firewalld
  sudo pacman -R --noconfirm firewalld
  sudo pacman -R --noconfirm eos-settings-xfce4
  sudo pacman -R --noconfirm arc-gtk-theme-eos
  sudo pacman -R --noconfirm endeavouros-xfce4-terminal-colors
  sudo pacman -R --noconfirm yay

  echo
  tput setaf 3
  echo "##############################################################"
  echo "################### Software removed"
  echo "##############################################################"
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
