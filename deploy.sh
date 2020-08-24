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
guake \
powerline \
fonts-powerline \
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
