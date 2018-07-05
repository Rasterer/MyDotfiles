#!/bin/sh
#
# Author:
# jzhebin@gmail.com

packagedir=$(basename $PWD)
if [ $PWD != $HOME"/src/"$packagedir ]; then
    (>&2 echo "Error: install package must be put under /home/<username>/src")
    exit -1
fi

# backup old configs
mkdir -p ~/.dotfiles.bak
mv ~/autoload.d   ~/.dotfiles.bak/ 2>/dev/null
mv ~/.zshrc ~/.dotfiles.bak/ 2>/dev/null
mv ~/.bashrc ~/.dotfiles.bak/ 2>/dev/null
mv ~/.oh-my-zsh ~/.dotfiles.bak/ 2>/dev/null
mv ~/.vimrc ~/.dotfiles.bak/ 2>/dev/null
mv ~/.vim ~/.dotfiles.bak/ 2>/dev/null
mv ~/.gitconfig ~/.dotfiles.bak/ 2>/dev/null
mv ~/.tmux.conf ~/.dotfiles.bak/ 2>/dev/null
mv ~/.profile ~/.dotfiles.bak/ 2>/dev/null
mv ~/.gitmessage ~/.dotfiles.bak/ 2>/dev/null
mv zsh/oh-my-zsh ~/.dotfiles.bak/ 2>/dev/null
mv vim/.vim/bundle ~/.dotfiles.bak/ 2>/dev/null

git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git zsh/oh-my-zsh/
cp -r zsh/custom zsh/oh-my-zsh/

git clone --depth=1 https://github.com/VundleVim/Vundle.vim.git vim/.vim/bundle/Vundle.vim/

ln -s $PWD/.profile         ~/.profile
ln -s $PWD/bash/.bashrc     ~/.bashrc
ln -s $PWD/autoload.d       ~/autoload.d
ln -s $PWD/zsh/.zshrc       ~/.zshrc
ln -s $PWD/zsh/oh-my-zsh    ~/.oh-my-zsh
ln -s $PWD/vim/.vimrc       ~/.vimrc
ln -s $PWD/vim/.vim         ~/.vim
ln -s $PWD/git/.gitconfig   ~/.gitconfig
ln -s $PWD/git/.gitmessage  ~/.gitmessage
ln -s $PWD/tmux/.tmux.conf  ~/.tmux.conf

mkdir -p ~/.local/share/xfce4/terminal/colorschemes
ln -s $PWD/xfce4/terminal/colorschemes/Moso.theme ~/.local/share/xfce4/terminal/colorschemes/Moso.theme 2>/dev/null
