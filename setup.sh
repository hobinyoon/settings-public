#!/bin/bash

set -e

ln -sf ~/code/hobinyoon/settings-public/.bash_profile ~/.bash_profile

ln -sf ~/code/hobinyoon/settings-public/.vimrc ~/.vimrc
ln -sf ~/code/hobinyoon/settings-public/.gitconfig-global ~/.gitconfig

# Fix the file ownership because sometimes they are overwritten by git or htop
sudo chown -R `whoami`:`id -gn` ~/.config

# Install vim-fugitive
#   https://github.com/tpope/vim-fugitive
mkdir -p ~/.vim/pack/tpope/start
cd ~/.vim/pack/tpope/start
git clone https://tpope.io/vim/fugitive.git
vim -u NONE -c "helptags fugitive/doc" -c q

echo ". ~/code/hobinyoon/settings-public/.bashrc.bash" >> ~/.bashrc

