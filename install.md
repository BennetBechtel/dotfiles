### Fresh Install & Setup Guide

#### Initial System Update

```bash
sudo apt update && sudo apt upgrade -y
```

#### Base Packages & Repositories

**Fastfetch**

```bash
sudo add-apt-repository ppa:zhangsongcui3371/fastfetch
sudo apt update
sudo apt install -y fastfetch
```

**Flatpak & Flathub**

```bash
sudo apt install -y flatpak gnome-software-plugin-flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
```

#### Terminal & Shell Environment

**Core Tools**

```bash
sudo apt install -y kitty git stow vim btop zoxide tmux curl build-essential
```

**Zsh Setup**

```bash
sudo apt install -y zsh zsh-autosuggestions zsh-syntax-highlighting
chsh -s $(which zsh)
```

**Starship Prompt**

```bash
sudo apt install -y starship
```

#### Window Manager & Desktop (Sway)

**Sway Core & Utilities**

```bash
sudo apt install -y sway waybar kanshi autotiling swaybg swaync sway-notification-center
sudo apt install -y slurp grim wl-clipboard playerctl swayidle swaylock
```

**Appearance & Interface**

```bash
sudo apt install -y nwg-look lxpolkit rofi imagemagick pavucontrol
```

**Applications**

```bash
sudo apt install -y thunderbird chromium-browser
# Zen Browser (Flatpak)
flatpak install flathub app.zen_browser.zen
```

#### Development Environment

**Neovim & Dependencies**

```bash
sudo snap install nvim --classic
sudo apt install -y nodejs npm python3 python3-pip python3-venv luarocks ripgrep fzf fd-find
```

**Rust & Cargo Tools**

```bash
curl https://sh.rustup.rs -sSf | sh
# After sourcing cargo:
cargo install wiremix
cargo install --force yazi-build
```

#### Fonts & Assets

**Fira Code & SF Pro**

```bash
# Manual move to local share
mkdir -p ~/.local/share/fonts/FiraCode
mkdir -p ~/.local/share/fonts/SF-Pro
fc-cache -fv
```

#### Networking & Sync

**Proton VPN**

```bash
wget https://repo.protonvpn.com/debian/dists/stable/main/binary-all/protonvpn-stable-release_1.0.8_all.deb
sudo dpkg -i ./protonvpn-stable-release_1.0.8_all.deb
sudo apt update
sudo apt install -y proton-vpn-gnome-desktop gnome-shell-extension-appindicator
```

**Rclone (Dropbox Sync)**

```bash
# Install
curl https://rclone.org/install.sh | sudo bash
```

```bash
# Initial Sync
rclone config
mkdir ~/Dropbox
rclone ~/Dropbox dropbox: --resync --verbose
```

```bash
# Enable systemd timer for sync
systemctl --user start rclone-dropbox.timer
systemctl --user enable rclone-dropbox.timer
```

#### Hardware & Bluetooth

```bash
sudo apt install -y bluez bluetui ddcutil pamixer brightnessctl
```

#### Boot & Plymouth (Theming)

```bash
sudo apt install -y plymouth plymouth-themes plymouth-theme-breeze
sudo update-alternatives --set default.plymouth /usr/share/plymouth/themes/breeze/breeze.plymouth
sudo update-initramfs -u
```

#### Dotfiles Deployment

```bash
git clone https://github.com/bennetbechtel/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
stow fastfetch starship systemd tmux zshrc backgrounds kitty rofi sway nvim
```
