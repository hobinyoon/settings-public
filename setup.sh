ln -sf ~/code/hobinyoon/settings-public/.bash_profile ~/.bash_profile

# Don't want to override what platform already provides
#   ln -sf ~/code/hobinyoon/settings-public/.bashrc.bash ~/.bashrc
# Instead, add the following in ~/.bashrc
#   . ~/code/hobinyoon/settings-public/.bashrc.bash

ln -sf ~/code/hobinyoon/settings-public/.vimrc ~/.vimrc
ln -sf ~/code/hobinyoon/settings-public/.gitconfig-global ~/.gitconfig

# Install vim-fugitive
#   https://github.com/tpope/vim-fugitive
mkdir -p ~/.vim/pack/tpope/start
cd ~/.vim/pack/tpope/start
git clone https://tpope.io/vim/fugitive.git
vim -u NONE -c "helptags fugitive/doc" -c q
