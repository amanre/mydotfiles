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

installed_dir=$(dirname $(readlink -f $(basename `pwd`)))

echo
tput setaf 2
echo "################################################################"
echo "###################  Software to install"
echo "################################################################"
tput sgr0
echo

if grep -q amanre_repo /etc/pacman.conf; then

  echo
  tput setaf 2
  echo "################################################################"
  echo "################ amanre repos are already in /etc/pacman.conf"
  echo "################################################################"
  tput sgr0
  echo
  else
  echo
  tput setaf 2
  echo "################################################################"
  echo "################### Getting  repos "
  echo "################################################################"
  tput sgr0
  echo

  sh repo/get-amanre-repo.sh
  sudo pacman -Sy


fi

# install yay if not already installed
if ! command -v yay > /dev/null; then
    sudo pacman -S yay-git --noconfirm --needed

fi

esac

PKGS=(

# Custom-Repo ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
xfce-theme-manager
xfce-themes-git
amanre-xfce
amanre-gtk-themes
amanre-icon-themes
bspwm-config
bspwm-patched
catppuccin-cursors-frappe
catppuccin-cursors-latte
catppuccin-cursors-macchiato
catppuccin-cursors-mocha
conky-lua-archers
dracular-icons
plank-themes-git
pywal-conky-git
root-git
ttf-meslo-nerd-font-powerlevel10k
zsh-theme-powerlevel10k-git

# Gh0st-Repo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#gh0stzk-curser-qogirr
gh0stzk-gtk-themes
#gh0stzk-icons-beautyline
#gh0stzk-icons-candy
#gh0stzk-icons-catppuccin-mocha
#gh0stzk-icons-dracula
#gh0stzk-icons-glassy
gh0stzk-icons-gruvbox-plus-dark
#gh0stzk-icons-hack
#gh0stzk-icons-luv
#gh0stzk-icons-sweet-rainbow
#gh0stzk-icons-tokyo-night
#gh0stzk-icons-vimix-white
gh0stzk-icons-zafiro
gh0stzk-icons-zafiro-purple



# Gaming Related ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#proton-ge-custom-bin
#protonup-git
#proton-community-updater
#steam
#steam-fonts
#steam-tweaks
#steam-native-runtime
#goverlay-bin
#bottles
#gamemode
#lib32-gamemode
#lutris
#wine-staging
#winetricks
#playonlinux



# Printer related +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#cups
#cups-pdf
#ghostscript
#gutenprint
#gtk3-print-backends
##ibcups
system-config-printer
samsung-unified-driver-common
samsung-unified-driver-printer
samsung-unified-driver-scanner
canon-pixma-ts5055-complete
# Multimedia ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
simplescreenrecorder
obs
gimp
gpick
cava
inkscape
simple-scan
guvcview

# Utils +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

archiso
dmenu
downgrade
duf
dunst
feh
gnome-disk-utility
htop
imagewriter
mintstick-git
qbittorrent
vlc
zsh
zsh-completions
zsh-syntax-highlighting
zsh-autosuggestions
zsh-theme-powerlevel10k-git
sane
xfce4-mpc-plugin
ttf-meslo-nerd-font-powerlevel10k
kshutdown
xscreensaver
xorg-xsetroot
flameshot
gnome-screenshot


)

for PKG in "${PKGS[@]}"; do
    echo "INSTALLING ${PKG}"
    yay -S "$PKG" --noconfirm --needed
done

echo
tput setaf 2
echo "################################################################"
echo "################### Done"
echo "################################################################"
tput sgr0
echo
