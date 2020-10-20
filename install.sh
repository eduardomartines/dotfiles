#
# update Kernel
cd /tmp
wget -c https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.9/amd64/linux-headers-5.9.0-050900_5.9.0-050900.202010112230_all.deb
wget -c https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.9/amd64/linux-headers-5.9.0-050900-generic_5.9.0-050900.202010112230_amd64.deb
wget -c https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.9/amd64/linux-image-unsigned-5.9.0-050900-generic_5.9.0-050900.202010112230_amd64.deb
wget -c https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.9/amd64/linux-modules-5.9.0-050900-generic_5.9.0-050900.202010112230_amd64.deb
sudo dpkg -i *.deb
reboot
# MANUAL STEPs:
#   * login

#
# nvidia driver
ubuntu-drivers devices
sudo apt install -y nvidia-driver-450
reboot
# MANUAL STEPs:
#   * login

#
# basic update
sudo sed -i '/cdrom/d' /etc/apt/sources.list
sudo apt dist-upgrade
sudo apt update -y
sudo apt upgrade -y

#
# browser
cd /tmp
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
rm -rf google-chrome-stable_current_amd64.deb
# MANUAL STEPs:
# 	* install LAST PASS plugin
# 	* sign in and sync with Google Account
#	* go to "chrome://settings/system" and make sure the following option is disabled "Use hardware acceleration when available" to prevent system crash
#   * go to "chrome://flags/#hardware-media-key-handling" and make sure the following option is disabled "Hardware Media Key Handling" to prevent issues with media keys
#   * relaunch Chrome
sudo apt purge -y firefox

# ssh
ssh-keygen
cat ~/.ssh/id_rsa.pub
# MANUAL STEPs:
#   * add ssh on Github (https://github.com/settings/keys) and Bitbucket

# some tools
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

# git
sudo apt install -y git
git config --global user.email "martines.eduardo@gmail.com"
git config --global user.name "Eduardo Martines"

# gitui
cd /tmp
wget https://github.com/extrawurst/gitui/releases/download/v0.10.1/gitui-linux-musl.tar.gz
mkdir gitui-musl
tar -zxvf gitui-linux-musl.tar.gz -C gitui-musl
mv gitui-musl/gitui /usr/local/bin/

# docker
sudo snap install --classic docker
sudo groupadd docker
sudo chown root:docker /var/run/docker.sock
sudo usermod -aG docker $USER
newgrp docker
reboot
# MANUAL STEPs:
#	* loing
#	* test with com "docker run hello-world"

# docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.25.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# zsh
sudo apt-get install -y zsh

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# i3gaps
sudo apt install -y git libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev autoconf libxcb-xrm0 libxcb-xrm-dev automake libxcb-shape0-dev
cd /tmp
git clone https://www.github.com/Airblader/i3 i3-gaps
cd i3-gaps
autoreconf --force --install && rm -rf build/ && mkdir -p build && cd build/ && ../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers && make && sudo make install

# polybar
# sudo snap install polybar-git --edge --devmode
# please follow instructions from here: https://github.com/polybar/polybar#building-from-source

# rofi
sudo apt install -y rofi

# drivers (necessary?)
# sudo ubuntu-drivers autoinstall

# terminal
cd /tmp
git clone https://github.com/jwilm/alacritty
cd alacritty
sudo apt install -y cargo
cargo build --release
sudo cp target/release/alacritty /usr/local/bin
# launcher
sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
sudo desktop-file-install extra/linux/Alacritty.desktop
sudo update-desktop-database
# change defaults
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /usr/local/bin/alacritty 50
sudo gsettings set org.gnome.desktop.default-applications.terminal exec 'alacritty'

# tmux
sudo apt install -y tmux

# visual studio Code
sudo snap install --classic code
code --install-extension ms-azuretools.vscode-docker
code --install-extension ms-python.python
code --install-extension eamodio.gitlens
code --installer-extension pkief.material-icon-theme
code --installer-extension akamud.vscode-theme-onelight
code --installer-extension lourenci.go-to-spec

# vim
sudo apt install -y vim

# discord
sudo snap install --classic discord

# dotfiles
mkdir ~/Projects
cd ~/Projects
git clone git@github.com:eduardomartines/dotfiles.git
sudo apt-get install -y stow
cd dotfiles
# WARNING: pay all attention here
#rm ~/.zshrc
#rm ~/.oh-my-zsh/oh-my-zsh.sh
./setup.sh
gnome-session-quit --no-prompt
# MANUAL STEPs:
#   * change settings to i3
#   * login

# nvm node
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.1/install.sh | bash
nvm install v14.14.0

# yarn
npm install -g yarn

# rbenv ruby
sudo apt install autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm6 libgdbm-dev libdb-dev
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-installer | bash
rbenv install 2.7.2
rbenv global 2.7.2

# tmuxinator
gem install tmuxinator

# python venv
sudo apt install -y python3-venv

# firacode font
sudo apt install -y fonts-firacode

# iosevka font
cd /tmp
wget https://github.com/be5invis/Iosevka/releases/download/v3.6.3/ttf-iosevka-3.6.3.zip
unzip ttf-iosevka-3.6.3.zip -d iosevka
mv iosevka/ttf /usr/local/share/fonts/iosevka
sudo fc-cache -fv

# iosevka-term font
cd /tmp
wget https://github.com/be5invis/Iosevka/releases/download/v3.6.3/ttf-iosevka-term-3.6.3.zip
unzip ttf-iosevka-term-3.6.3.zip -d iosevka-term
mv iosevka-term/ttf /usr/local/share/fonts/iosevka-term
sudo fc-cache -fv

# spotify
sudo snap install spotify

# cleanup
sudo apt autoremove -y
