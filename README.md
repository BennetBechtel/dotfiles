### System Initialization

#### Initial Update

```bash
sudo apt update && sudo apt upgrade -y
```

#### Core Build Tools

```bash
sudo apt install -y git lazygit vim curl build-essential unzip clang cmake gettext bluez tmux btop
```

### Package Management & Repositories

#### Flatpak Setup

```bash
sudo apt install -y flatpak gnome-software gnome-software-plugin-flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
```

#### Rust & Cargo Environment

```bash
sudo apt install -y libpipewire-0.3-dev pkg-config clang libdbus-1-dev pkg-config
curl https://sh.rustup.rs -sSf | sh
```

#### Fastfetch PPA

```bash
sudo add-apt-repository ppa:zhangsongcui3371/fastfetch
sudo apt update
sudo apt install -y fastfetch
```

### Desktop Environment (Sway)

#### User Groups

```bash
sudo usermod -a -G video ${USER}
```

#### Window Manager & Utilities

```bash
sudo apt install -y sway kanshi autotiling swaybg sway-notification-center slurp grim wl-clipboard swayidle swaylock playerctl pamixer brightnessctl ddcutil
sudo apt install -y gnome-keyring libpam-gnome-keyring seahorse lxpolkit

sudo apt install libpipewire-0.3-dev libwayland-dev
cargo install wayland-pipewire-idle-inhibit
```

#### Status Bar & Appearance

```bash
sudo apt install -y waybar pavucontrol nwg-look
```

#### Rofi Launcher

```bash
sudo apt install -y rofi imagemagick

# Make flatpaks visible in rofi
mkdir -p ~/.local/share/applications/flatpak
ln -s /var/lib/flatpak/exports/share/applications/*.desktop ~/.local/share/applications/flatpak/
```

### Terminal & Development Workspace

#### Shell (Zsh)

```bash
sudo apt install -y zsh zsh-autosuggestions zsh-syntax-highlighting zoxide starship fonts-font-awesome
chsh -s $(which zsh)
```

Log out and back in to make changes work

#### Terminal Emulator (Kitty)

```bash
sudo apt install -y kitty
```

#### Neovim Setup

```bash
sudo snap install nvim --classic
sudo apt install -y nodejs npm python3 python3-pip python3-venv luarocks lua5.1 ripgrep fzf fd-find wl-clipboard
```

#### Dotfiles Management

```bash
sudo apt install -y stow
git clone https://github.com/bennetbechtel/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
stow backgrounds fastfetch kitty nvim rofi starship sway tmux zshrc
```

#### Fonts & Assets

```bash
cd ~/.dotfiles
stow fonts
fc-cache -fv
```

### Applications & CLI Tools

#### CLI Utilities

```bash
cargo install bluetui
cargo install wiremix
cargo install --force yazi-build
```

#### GUI Applications

```bash
sudo apt install -y thunderbird chromium-browser
flatpak install flathub app.zen_browser.zen
```

### Services & Sync

#### Proton VPN

```bash
wget https://repo.protonvpn.com/debian/dists/stable/main/binary-all/protonvpn-stable-release_1.0.8_all.deb
sudo dpkg -i ./protonvpn-stable-release_1.0.8_all.deb
sudo apt update
sudo apt install -y proton-vpn-gnome-desktop gnome-shell-extension-appindicator
```

#### Rclone (Dropbox Sync)

```bash
# Install
curl https://rclone.org/install.sh | sudo bash
```

```bash
# Initial Sync
rclone config
mkdir ~/Dropbox
rclone bisync ~/Dropbox dropbox: --resync --verbose
```

```bash
# Copy rclone-dropbox.servie and rclone-dropbox.timer to /etc/systemd/system
sudo cp ~/.dotfiles/systemd/rclone-dropbox.service /etc/systemd/system/
sudo cp ~/.dotfiles/systemd/rclone-dropbox.timer /etc/systemd/system/

# Enable systemd timer for sync
sudo systemctl daemon-reload
sudo systemctl start rclone-dropbox.timer
sudo systemctl enable rclone-dropbox.timer
```
