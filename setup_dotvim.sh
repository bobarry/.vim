#!/bin/bash
#
# Check out these posts:
#   Using Git and Github to Manage Your Dotfiles - http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/
#   Managing dot files with Git - http://blog.sanctum.geek.nz/managing-dot-files-with-git/
#
# This script sets up the .vim directory and other thing

# First make a backup of anything you plan to blow away
mkdir ~/tmp/old_vim_files
mv .vim .vimrc .gvimrc ~/tmp/old_vim_files

# make the directories that you need
cd ~
mkdir -p ~/.vim/autoload ~/.vim/bundle ~/.vim/backup ~/.vim/tmp

curl -Sso ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim

cd ~/.vim/bundle
git clone git://github.com/scrooloose/nerdtree.git
git clone git://github.com/klen/python-mode.git
git clone git://github.com/vim-scripts/ScrollColors.git
git clone git://github.com/scrooloose/nerdcommenter.git

ln -s ~/.vim/vimrc ~/.vimrc
ln -s ~/.vim/gvimrc ~/.vimrc
