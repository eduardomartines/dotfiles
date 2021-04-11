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
sudo apt dist-upgrade -y
sudo apt update -y
sudo apt upgrade -y

#
# browser
sudo add-apt-repository ppa:xalt7x/chromium-deb-vaapi
cat <<EOF | sudo tee /etc/apt/preferences.d/pin-xalt7x-chromium-deb-vaapi
Package: *
Pin: release o=LP-PPA-xalt7x-chromium-deb-vaapi
Pin-Priority: 1337
EOF
sudo apt-get update
sudo apt install -y chromium-browser chromium-codecs-ffmpeg chromium-codecs-ffmpeg-extra
# MANUAL STEPs:
#   * install LAST PASS plugin and make the account sync
#   * sign in and sync with Google Account
#   * go to "chrome://settings/system" and make sure the following option is disabled "Use hardware acceleration when available" to prevent system crash
#   * go to "chrome://flags/#hardware-media-key-handling" and make sure the following option is disabled "Hardware Media Key Handling" to prevent issues with media keys
#   * go to "chrome://flags/#enable-gpu-rasterization" and make sure the GPU Rasterization is disabled
#   * relaunch Chrome
sudo apt purge -y firefox
sudo apt purge -y firefox-locale-en
sudo rm -rf .mozilla
sudo rm -rf /etc/firefox/
sudo rm -rf /usr/lib/firefox/
sudo rm -rf /usr/lib/firefox-addons/

#
# ssh
ssh-keygen
cat ~/.ssh/id_rsa.pub
# MANUAL STEPs:
#   * add ssh on Github (https://github.com/settings/keys) and Bitbucket

#
# some tools
sudo apt install -y apt-transport-https ca-certificates software-properties-common curl wget

#
# git
sudo apt install -y git
git config --global user.email "martines.eduardo@gmail.com"
git config --global user.name "Eduardo Martines"

#
# gitui
cd /tmp
wget https://github.com/extrawurst/gitui/releases/download/v0.10.1/gitui-linux-musl.tar.gz
mkdir gitui-musl
tar -zxvf gitui-linux-musl.tar.gz -C gitui-musl
sudo mv gitui-musl/gitui /usr/local/bin/

#
# docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
sudo apt update
apt-cache policy docker-ce
sudo apt install -y docker-ce
sudo usermod -aG docker ${USER}
su - ${USER}
# MANUAL STEPs:
#   * login
#   * test with com "docker run hello-world"

#
# docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.28.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

#
# zsh
sudo apt install -y zsh

#
# oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#
# i3gaps
sudo apt install -y libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev autoconf libxcb-xrm0 libxcb-xrm-dev automake libxcb-shape0-dev
cd /tmp
git clone https://www.github.com/Airblader/i3 i3-gaps
cd i3-gaps
autoreconf --force --install && rm -rf build/ && mkdir -p build && cd build/ && ../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers && make && sudo make install

#
# handling i3 workspaces
sudo apt install libanyevent-i3-perl
# example:
# sudo i3-save-tree --workspace 7 > ~/.config/i3/workspace-7.json

#
# polybar (https://github.com/polybar/polybar#building-from-source)
sudo apt install -y cmake
cd /tmp
wget https://github.com/polybar/polybar/releases/download/3.4.3/polybar-3.4.3.tar
tar xvf polybar-3.4.3.tar
cd polybar
sudo apt install -y libxcb-composite0-dev
sudo apt install -y xcb-proto
sudo apt install -y libxcb-ewmh-dev
sudo apt install -y python3-xcbgen
sudo apt install -y libsdl2-dev
sudo apt install -y libcurl4-openssl-dev
sudo apt install -y libmpdclient-dev
sudo apt install libiw-dev
sudo apt install libjsoncpp-dev
./build.sh

#
# rofi
sudo apt install -y rofi

#
# terminal
cd /tmp
git clone https://github.com/jwilm/alacritty
cd alacritty
sudo apt install -y cargo
cargo build --release
sudo cp target/release/alacritty /usr/local/bin
sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
sudo desktop-file-install extra/linux/Alacritty.desktop
sudo update-desktop-database

#
# tmux
sudo apt install -y tmux

#
# visual studio Code
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add --
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
sudo apt install code
code --install-extension ms-azuretools.vscode-docker
code --install-extension ms-python.python
code --install-extension eamodio.gitlens
code --install-extension pkief.material-icon-theme
code --install-extension akamud.vscode-theme-onelight
code --install-extension lourenci.go-to-spec
code --install-extension kamikillerto.vscode-colorize
code --install-extension fukatani.colorize-similar
code --install-extension alexkrechik.cucumberautocomplete
code --install-extension ms-vsliveshare.vsliveshare-pack
code --install-extension pavlitsky.yard
code --install-extension mjmcloug.vscode-elixir

#
# vim
sudo apt install -y vim

#
# discord
cd /tmp
sudo apt install -y gdebi-core wget
wget -O discord.deb "https://discordapp.com/api/download?platform=linux&format=deb"
sudo gdebi --non-interactive discord.deb

#
# dotfiles
mkdir ~/projects
cd ~/projects
git clone git@github.com:eduardomartines/dotfiles.git
sudo apt install -y stow
cd dotfiles
# WARNING: pay extra attention here
#rm ~/.zshrc
#rm ~/.oh-my-zsh/oh-my-zsh.sh
./setup.sh
gnome-session-quit --no-prompt
# MANUAL STEPs:
#   * change settings to i3
#   * login

#
# nvm node
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.1/install.sh | bash
nvm install v14.14.0

#
# yarn
npm install -g yarn

#
# rbenv ruby
sudo apt install -y autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm6 libgdbm-dev libdb-dev
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-installer | bash
rbenv install 2.7.2
rbenv global 2.7.2

#
# tmuxinator
gem install tmuxinator

#
# python venv
sudo apt install -y python3-venv

#
# firacode font
sudo apt install -y fonts-firacode

#
# iosevka font
cd /tmp
wget https://github.com/be5invis/Iosevka/releases/download/v3.6.3/ttf-iosevka-3.6.3.zip
unzip ttf-iosevka-3.6.3.zip -d iosevka
sudo mv iosevka/ttf /usr/local/share/fonts/iosevka
sudo fc-cache -fv

#
# iosevka-term font
cd /tmp
wget https://github.com/be5invis/Iosevka/releases/download/v3.6.3/ttf-iosevka-term-3.6.3.zip
unzip ttf-iosevka-term-3.6.3.zip -d iosevka-term
sudo mv iosevka-term/ttf /usr/local/share/fonts/iosevka-term
sudo fc-cache -fv

#
# spotify
curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | sudo apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt update
sudo apt install -y spotify-client

#
# vpn
sudo apt install -y network-manager-openvpn network-manager-openvpn-gnome
# WARNING: pay extra attention here
sudo rm -f /etc/resolv.conf
cat << EOF | sudo tee /etc/NetworkManager/NetworkManager.conf
[main]
plugins=ifupdown,keyfile
dns=default

[ifupdown]
managed=false

[device]
wifi.scan-rand-mac-address=no
EOF
sudo service NetworkManager restart

#
# python 2
sudo apt install -y python2
sudo update-alternatives --install /usr/bin/python python /usr/bin/python2 1
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3 2
sudo update-alternatives --list python
# sudo update-alternatives --config python

#
# shopify themekit
curl -s https://shopify.github.io/themekit/scripts/install.py | sudo python

#
# bluetooth
sudo apt install -y blueman

#
# sound
sudo apt install -y pavucontrol

#
# OBS Studio + Virtual Camera (v4l2sink)
sudo apt install -y v4l2loopback-dkms
sudo modprobe v4l2loopback video_nr=10 card_label="OBS Video Source" exclusive_caps=1
sudo add-apt-repository ppa:obsproject/obs-studio
sudo apt update
sudo apt install -y ffmpeg
sudo apt install -y obs-studio
sudo apt install -y qtbase5-dev
sudo apt install -y libobs0
sudo apt install -y libobs-dev
cd /tmp
git clone --recursive https://github.com/obsproject/obs-studio.git
git clone https://github.com/CatxFish/obs-v4l2sink
cd obs-v4l2sink
mkdir build && cd build
cmake -DLIBOBS_INCLUDE_DIR="../../obs-studio/libobs" -DCMAKE_INSTALL_PREFIX=/usr ..
make -j4
sudo make install
mkdir -p ~/.config/obs-studio/plugins/v4l2sink/bin/64bit/
sudo ln -s /usr/lib/x86_64-linux-gnu/obs-plugins/v4l2sink.so ~/.config/obs-studio/plugins/v4l2sink/bin/64bit/

#
#  SYS CTL max_user_watches
echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p

#
# cleanup
sudo apt --purge autoremove -y
