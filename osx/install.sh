sudo pacman -S --noconfirm --needed base base-devel xorg-server xorg-server-utils xorg-xinit xmonad xmonad-contrib xfce4 chromium firefox dmenu wget vim rxvt-unicode unzip virtualbox terminus-font ruby encfs openssh qt4 evince xfce4-mixer rsync

ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"

brew update

brew tap phinze/homebrew-cask
brew install brew-cask automake git-flow encfs

brew cask install zotero virtualbox vagrant totalspaces sublime-text vlc google-chrome dropbox iterm2
