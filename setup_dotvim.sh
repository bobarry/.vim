
NOTE: Replace this with notes concerning a clone of the github .vim
followed by some  virtual links to the vimrc resource file.

#!/bin/bash

# Maintainer:   jeffskinnerbox@yahoo.com / www.jeffskinnerbox.me
# Version:      1.0.4

# Check out these posts:
#   Using Git and Github to Manage Your Dotfiles - http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/
#   Managing dot files with Git - http://blog.sanctum.geek.nz/managing-dot-files-with-git/
#
# This script will setup the .vim directory, and in general, make the Vim
# resource file usable.  This should be executed immediately after you have created
# the local git repository via: git clone http://github.com/jeffskinnerbox/dotvim.git ~/.vim


# directory used to store Vim file
VIMDIR="~/.vim"

# directory used to store backups
TMP="~/.vim/tmp"
TMPDIR="$TMP/old_vim_files_$(date | tr ': ' '_')"

# First check if the target and temporary directory exists, abort if not
if [[ ! -d $TMP ]]; then
    echo "Temporary directory $TMP does not exist. Exiting."
    exit 1
fi

if [[ ! -d $VIMDIR ]]; then
    echo "Target directory $VIMDIR does not exist. Exiting."
    exit 1
fi

# First make a backup of anything you plan to blow away
cd $VIMDIR
mkdir $TMPDIR
cp -ar * $TMPDIR

# make the additional directories that you need
#mkdir -p $VIMDIR/autoload $VIMDIR/bundle $VIMDIR/backup $VIMDIR/tmp
mkdir -p $VIMDIR/backup $VIMDIR/tmp

# download and install your vim resource file
curl -Sso $VIMDIR/vimrc https://raw.githubusercontent.com/jeffskinnerbox/dotvim/master/vimrc

# download and install pathogen
curl -Sso $VIMDIR/autoload/pathogen.vim https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim

# now install the other Vim plugins
cd $VIMDIR/bundle
git clone git://github.com/scrooloose/nerdtree.git
git clone git://github.com/klen/python-mode.git
git clone git://github.com/vim-scripts/ScrollColors.git
git clone git://github.com/scrooloose/nerdcommenter.git
git clone git://github.com/plasticboy/vim-markdown.git
git clone git://github.com/smancill/conky-syntax.vim.git
git clone git://github.com/sudar/vim-arduino-syntax

# create the virtual links to the Vim resource file
ln -s $VIMDIR/vimrc ~/.vimrc
ln -s $VIMDIR/gvimrc ~/.vimrc
