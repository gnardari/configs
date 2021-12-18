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
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
 sudo apt update && sudo apt install -y docker-ce docker-ce-cli containerd.io && sudo groupadd docker

sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
# RUN THIS MANUALLY
# sudo usermod -aG docker $USER && newgrp docker
