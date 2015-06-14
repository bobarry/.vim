#!/bin/bash


# Check out these posts:
#   Using Git and Github to Manage Your Dotfiles - http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/
#   Managing dot files with Git - http://blog.sanctum.geek.nz/managing-dot-files-with-git/
#
# This script will setup the .vim directory, and in general, make the Vim
# resource file usable.  This should be executed immediately after you have created
# the local git repository via: git clone http://github.com/jeffskinnerbox/dotvim.git ~/.vim


# First make a backup of anything you plan to blow away
cd ~
mkdir ~/tmp/old_vim_files
mv .vim .vimrc .gvimrc ~/tmp/old_vim_files

# make the additional directories that you need
mkdir -p ~/.vim/autoload ~/.vim/bundle ~/.vim/backup ~/.vim/tmp

# download and install your vim resource file
curl -Sso ~/.vim/vimrc https://raw.githubusercontent.com/jeffskinnerbox/dotvim/master/vimrc

# download and install pathogen
curl -Sso ~/.vim/autoload/pathogen.vim https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim

# now install the other Vim plugins
cd ~/.vim/bundle
git clone git://github.com/scrooloose/nerdtree.git
git clone git://github.com/klen/python-mode.git
git clone git://github.com/vim-scripts/ScrollColors.git
git clone git://github.com/scrooloose/nerdcommenter.git
git clone git://github.com/plasticboy/vim-markdown.git

# create the virtual links to the Vim resource file
ln -s ~/.vim/vimrc ~/.vimrc
ln -s ~/.vim/gvimrc ~/.vimrc
