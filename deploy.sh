#!/bin/bash
sudo apt install \
curl \
neovim \
python3-pip \
tmux \
iputils-ping \
nmap \
wget \
git \
htop \
guake \
powerline \
fonts-powerline \
ca-certificates \
gnupg \
lsb-release \
silversearcher-ag

FILES=(
bashrc
bash_aliases
tmux.conf
)

for file in "${FILES[@]}"
do
  echo Linking "$file" to $HOME
  ln -sf $(pwd)/$file ~/.$file
done

mkdir -p $HOME/.config/nvim
ln -sf $(pwd)/init.vim $HOME/.config/nvim/init.vim

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
   https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

mkdir $HOME/thirdparty
git clone https://github.com/rupa/z.git $HOME/thirdparty/z

# DOCKER
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io docker-compose-plugin

# RUN THIS MANUALLY
# sudo usermod -aG docker $USER && newgrp docker
