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

echo "
#=================================
#=     Which Monitor Setup       =
#=================================

1) Single
2) Dual
Defaults to Single if you choose
something else

"

read Monitor
case $Monitor in
1)
  sudo pacman -S --noconfirm singlescreen;;
2)
  sudo pacman -S --noconfirm dualscreen;;
*)
 sudo pacman -S --noconfirm singlescreen;;
esac


echo "
#=================================
#=     Do you want a dock ?      =
#=================================

1) yes
2) no


"

read dock
case $dock in
1)
sudo pacman -S --noconfirm plank plank-themes-git ;; 

  
*)
 
esac

PKGS=(

# Custom-Repo ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
am-theme-manager
betterlockscreen
xdg-user-dirs-gtk
custom-xfce4
pamac-aur
chaotic-keyring
chaotic-mirrorlist
grub-customizer
multicolor-sddm-theme
thumbler
catppuccin-icons
conky-lua-archers
pywal-conky-git
python-pywal
yad
dracular-icons
brave-bin
firefox
win11-icons-git
root-git
tokyonight-icons
tela-icons
paru-git
yay-git
arandr
noto-fonts
polkit-gnome
thunar
thunar-archive-plugin
thunar-volman
ttf-hack
xrandr
grub-themes
catppuccin-gtk-theme-mocha
catppuccin-gtk-theme-macchiato
catppuccin-gtk-theme-frappe
catppuccin-gtk-theme-latte
catppuccin-cursors-latte
catppuccin-cursors-frappe
catppuccin-cursors-macchiato
catppuccin-cursors-mocha
thunderbird
gtk-themes-git
icon-themes-git
archlinux-logout-git
#archlinux-tweak-tool-git
#archlinux-logout-themes-git
ttf-bitstream-vera
ttf-dejavu
ttf-droid
ttf-hack
ttf-inconsolata
ttf-liberation
ttf-roboto
ttf-roboto-mono
ttf-ubuntu-font-family
adobe-source-sans-fonts
gsfonts
sublime-text-4
geany
geany-plugins
#visual-studio-code-bin
#spotify
#spotify-adblock-git
#spotrec
pragha
mpv
meld
gzip
p7zip
unace
unrar
unzip
soundconverter
 kvantum-qt5
file-roller
font-manager
fastfetch
galculator
gparted
xfce4-panel-profiles
xorg-xkill

# Gh0st-Repo
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
#gh0stzk-icons-zafiro
#gh0stzk-icons-zafiro-purple



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


# Internet ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#discord
#telegram-desktop
#skypeforlinux-stable-bin

# Kernels ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#linux-zen
#linux-zen-headers

# Nvidia ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 #nvidia-dkms
 #lib32-nvidia
 #nvidia-settings

# Printer related +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
cups
cups-pdf
ghostscript
gutenprint
gtk3-print-backends
libcups
system-config-printer
#samsung-unified-driver-common
#samsung-unified-driver-printer
#samsung-unified-driver-scanner
canon-pixma-ts5055-complete
# Multimedia ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#simplescreenrecorder
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
#imagewriter
mintstick-git
neofetch
qbittorrent
vlc
xorg-kill
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
arcolinux-kvantum-git

# Office ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
libreoffice-fresh

# Themes
emilia-xfce-theme
expanse-xfce-theme
default-xfce-theme
space-nebula-theme
spectre-xfce-theme
les-paul-xfce-theme
grandcanion-xfce-theme
pinkfloyed-xfce-theme
sunset-drive-xfce-theme
sunset-lookout-xfce-theme
sunset-xfce-theme
cutecat-xfce-theme
marta-xfce-theme
mountainsunset-xfce-theme
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
