# Notes
In here are instructions on the creation, maintenance, and use of this repository
via [git][01] and [GitHub][02].  For more information, check out these posts:

* [Using Git and Github to Manage Your Dotfiles][03]
* [Managing dot files with Git][04]

===

Using Vim's scripting language (and a great deal of insight and tools from others),
I have setup Vim on my local machine to be an effective development environment
for my needs.  Using GitHub, I can replicate this Vim environment across the
multiple systems I'm presently use.

I will explain here how I established the git environment on my local machine,
how I established a GitHub for that environment, how to replicate the Vim environment
to another machine, and how to update both the local git repository and GitHub.

### Creating Your Local Git Repository
Copy existing Pathogen Git repository into your local systems $Home/.vim directory.

    mkdir -p ~/.vim/autoload ~/.vim/bundle
    curl -Sso ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim

Store your existing .vimrc and .gvimrc in the .vim directory

    mv .vimrc ~/.vim/vimrc
    mv .gvimrc ~/.vim/gvimrc
    ln -s ~/.vim/vimrc ~/.vimrc
    ln -s ~/.vim/gvimrc ~/.gvimrc

Change to the .vim directory, and initialize it as a git repository
 
    cd ~/.vim
    git init
 
Create a README.md file, add all the files, and make initial comment

    <make a README file>
    git add .
    git commit -m 'Initial commit'

### Creating the GitHub Repository
Goto GitHub and create the new repository

    goto https://github.com/jeffskinnerbox
    <create empty repository called 'dotvim'>

### Loading the GitHub Repository for the First Time
Within the ~.vim directory, use git to load the files to GitHub
 
    git remote add origin https://github.com/jeffskinnerbox/dotvim.git
    git push -u origin master

### To Update the Local Git Repository
Within the .vim directory, do a "get status" to see what will be included in the commit,
add files (or remove) that are required, and then do the commit to the local git repository.

    git status
    git add <files>   (or git rm <files>)
    git commit --dry-run
    git commit -m 'Some comments'

### To Update the Remote (i.e. GitHub) Repository
To which shows you the URL that Git has stored for the shortname to for
the remote (GitHub) repository:

    git remote -v

Now to push your files to the GitHub repository

    git push -u origin master

### To Perform the Initial Replication of .vim Environment on Another Machine
Login into the target machine and go to its $HOME

    cd ~
    git clone http://github.com/jeffskinnerbox/dotvim.git ~/.vim
    ln -s ~/.vim/vimrc ~/.vimrc
    ln -s ~/.vim/gvimrc ~/.gvimrc
    cd ~/.vim
    git submodule init
    git submodule update

### Upgrading Your .vim Directory From Remote GitHub Repository

    cd ~/.vim
    ?????????? git pull origin master ???????????

### To Upgrading a Plugin in bundle Directory
At some point in the future, a plugin might be updated. If this plugin
also uses Git, you can fetch the latest changes via

    cd ~/.vim/bundle/<plugin>
    git pull origin master

To upgrading all bundled plugins

    git submodule foreach git pull origin master



[01]:http://git-scm.com/
[02]:https://github.com/
[03]:http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/
[04]:http://blog.sanctum.geek.nz/managing-dot-files-with-git/
