sudo pacman -Sy
sudo pacman -S --noconfirm --needed base base-devel xorg-server xorg-server-utils xorg-xinit chromium wget vim rxvt-unicode unzip terminus-font ruby encfs openssh evince rsync udiskie 

# xmonad
sudo pacman -S --noconfirm --needed xmonad xmonad-contrib dmenu xmobar trayer xcompmgr

# xfce
sudo pacman -S --noconfirm --needed xfce4

# pulseaudio
sudo pacman -S --noconfirm --needed pulseaudio pavucontrol alsa-utils

# This causes troubles sometimes, so keep it separate
sudo pacman -S --noconfirm --needed virtualbox

# just install a stupid amount of printer drivers
sudo pacman -S --noconfirm --needed libcups cups gutenprint hplip splix cups-pdf

# Install yaourt
mkdir -p ~/downloads
cd ~/downloads
curl -O https://aur.archlinux.org/packages/pa/package-query/package-query.tar.gz
tar zxvf package-query.tar.gz
cd package-query
makepkg -si --noconfirm
cd ..
curl -O https://aur.archlinux.org/packages/ya/yaourt/yaourt.tar.gz
tar zxvf yaourt.tar.gz
cd yaourt
makepkg -si --noconfirm
cd ..
