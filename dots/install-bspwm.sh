#!/bin/bash
#set -e

##################################################################################################################
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

func_install() {
    if pacman -Qi $1 &> /dev/null; then
        tput setaf 2
        echo "###############################################################################"
        echo "################## The package "$1" is already installed"
        echo "###############################################################################"
        echo
        tput sgr0
    else
        tput setaf 3
        echo "###############################################################################"
        echo "##################  Installing package "  $1
        echo "###############################################################################"
        echo
        tput sgr0
        sudo pacman -S --noconfirm --needed $1
    fi
}


echo
tput setaf 2
echo "################################################################"
echo "################### Install bspwm"
echo "################################################################"
tput sgr0
echo


PKGS=(
bspwm-patched
#bspwm-config-git
awesome-terminal-fonts
#conky-lua-archers-git
sutils-git
lxappearance-gtk3
picom
polybar
sxhkd
xtitle-git
trizen
jgmenu
rofi

)

for PKG in "${PKGS[@]}"; do
    echo "INSTALLING ${PKG}"
    yay -S "$PKG" --noconfirm --needed
done


