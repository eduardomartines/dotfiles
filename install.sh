#
sudo apt update -y
sudo apt upgrade -y

# browser
sudo apt purge -y firefox
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
# TODO: install LAST PASS plugin

# ssh
ssh-keygen
cat ~/.ssh/id_rsa.pub
# TODO: add ssh on Github and Bitbucket

# TODO: necessary?
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

# git
sudo apt install -y git
git config --global user.email "martines.eduardo@gmail.com"
git config --global user.name "Eduardo Martines"

# docker
sudo snap install --classic docker
sudo chown root:docker /var/run/docker.sock
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
reboot
# TODO: test with com "docker run hello-world"

# docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.25.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# zsh
sudo apt-get install -y zsh

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# i3gaps
cd ~/
sudo apt install -y git libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev autoconf libxcb-xrm0 libxcb-xrm-dev automake libxcb-shape0-dev && git clone https://www.github.com/Airblader/i3 i3-gaps && cd i3-gaps && autoreconf --force --install && rm -rf build/ && mkdir -p build && cd build/ && ../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers && make && sudo make install
rm -rf i3-gaps

# polybar
cd ~/
sudo apt-get install -y cmake cmake-data libcairo2-dev libxcb1-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-image0-dev libxcb-randr0-dev libxcb-util0-dev libxcb-xkb-dev pkg-config python-xcbgen xcb-proto libxcb-xrm-dev libasound2-dev libmpdclient-dev libiw-dev libcurl4-openssl-dev libpulse-dev libxcb-composite0-dev xcb libxcb-ewmh2 && git clone https://github.com/jaagr/polybar.git && cd polybar && sudo ./build.sh
rm -rf polybar

# rofi
sudo apt install -y rofi

# TODO: necessary?
sudo apt-get install -y cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev python3

# drivers
sudo ubuntu-drivers autoinstall

# terminal
sudo add-apt-repository ppa:mmstick76/alacritty
sudo apt install -y alacritty

# tmux
sudo apt install -y tmux

# tmuxinator
gem install --no-document tmuxinator

# visual studio Code
sudo snap install --classic code
code --install-extension ms-azuretools.vscode-docker
code --install-extension ms-python.python

# vim
sudo apt install -y vim

# discord
sudo snap install --classic discord

# dotfiles
mkdir Projects
cd $_
git clone git@github.com:eduardomartines/dotfiles.git
sudo apt-get install -y stow
./setup.sh
[logout/login]

# nvm node
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.1/install.sh | bash
nvm install v13.3.0
nvm alias default node

# yarn
npm install -g yarn

# rbenv ruby
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
sudo apt-get install -y libssl-dev libreadline-dev
rbenv install 2.6.5
rbenv global 2.6.5

# python venv
sudo apt install -y python3-venv

# clean
sudo apt autoremove -y
