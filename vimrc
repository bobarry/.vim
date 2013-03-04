
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Some reference for more information about how to setup the .vimrc file
"       The Vim Editor - http://www.vim.org
"       Vim Recipes - http://vim.runpaint.org/toc/
"       Turning Vim into a modern Python IDE - http://sontek.net/blog/detail/turning-vim-into-a-modern-python-ide
"
" Vim and Vim Scripting Tutotials
"		Run the Linux Vim tutorial program: vimtutor
" 		Vim Introduction and Tutorial - http://blog.interlinked.org/tutorials/vim_tutorial.html
"		Learn Vimscript the Hard Way - http://learnvimscriptthehardway.stevelosh.com/
"		25 Vim Tutorials, Screencasts, and Resources - http://net.tutsplus.com/articles/web-roundups/25-vim-tutorials-screencasts-and-resources/
"       How to Write Vim Plugins with Python - http://brainacle.com/how-to-write-vim-plugins-with-python.html
"
"------------------------------------------------------------------------------
"
" Maintaining & Synchronizing Vim on Other Machines With Git Submodules and Pathogen
"   - http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/
"
"   Loading the Local Git Repository for the First Time
"
"       Install Pathogen in your .vim Directory
"
"           mkdir -p ~/.vim/autoload ~/.vim/bundle
"           curl -Sso ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim
"           <add Pathogen to your ~/.vim/vimrc file>
"
"       Store your .vimrc & .gvimrc in the .vim directory
"
"           mv .vimrc ~/.vim/vimrc
"           mv .gvimrc ~/.vim/gvimrc
"           ln -s ~/.vim/vimrc ~/.vimrc
"           ln -s ~/.vim/gvimrc ~/.gvimrc
"
"       Change to the .vim directory, and initialize it as a git repository
"
"           cd ~/.vim
"           git init
"
"       Create a README file, add all the files, and make intial comment
"
"           <make a README file>
"           git add .
"           git commit -m 'Initial commit'
"
"   Create the Remote Github Repository
"
"       Goto GitHub and create the new repository
"
"           https://github.com/jeffskinnerbox
"           <create empty repository called 'dotvim'>
"
"   Loading the Remote Repository for the First Time
"
"       Within the ~.vim directory, use git to load the files to GitHub
"
"          git remote add origin https://github.com/jeffskinnerbox/dotvim.git
"          git push -u origin master
"
"   To Perform the Initial Replication of .vim Environment on Another Machine
"
"       Login into the target machine and go to its $HOME
"
"           cd ~
"           git clone http://github.com/jeffskinnerbox/dotvim.git ~/.vim
"           ln -s ~/.vim/vimrc ~/.vimrc
"           ln -s ~/.vim/gvimrc ~/.gvimrc
"           cd ~/.vim
"           git submodule init
"           git submodule update
"   
"   To Upgrading Your .vim Directory From Remote GitHub Repository
"
"           cd ~/.vim
"           ?????????? git pull origin master ???????????
"
"   To Upgrading a Plugin in bundle Directory
"
"       At some point in the future, a plugin might be updated. If this plugin
"       also uses Git, you can fetch the latest changes via
"
"           cd ~/.vim/bundle/<plugin>
"           git pull origin master
"
"       To upgrading all bundled plugins
"
"           git submodule foreach git pull origin master
"
"   To Update the Local Git Repository
"
"           ????????????????
"
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" default leader is '\', but many people prefer ','
let mapleader = ","

" automatic reload of .vimrc after it's saved (great for when your editing .vimrc)
autocmd bufwritepost .vimrc source %


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	Plugins
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"--------------------------- Pathogen ---------------------------
" to install Pathogen for managing your plugins
"       mkdir -p ~/.vim/autoload ~/.vim/bundle
"       curl -Sso ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim
" Now you install all your plugins into a .vim/bundle/<plugin-name> folder
"
" call pathogen to install the remaining plugins
filetype off                " do not detect the type of file that is edited
call pathogen#infect()		" this pulls in the plugins
call pathogen#helptags()	" generate helptags for everything in 'runtimepath'
filetype plugin indent on   " must be enabled to use python-mode (and others)
syntax on                   " used for syntax highlighting

"--------------------------- NERDTree ---------------------------
" to install
"       cd ~/.vim/bundle
"       git clone https://github.com/scrooloose/nerdtree.git
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1

" open a NERDTree automatically when vim starts up
autocmd VimEnter * NERDTree

" close vim if the only window left open is a NERDTree
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

map <Leader>e :NERDTreeFind<CR>

" toggle NERDTree on or off
nmap <Leader>nt :NERDTreeToggle<CR>

"--------------------------- Python-Mode ---------------------------
" to install
"       cd ~/.vim/bundle
"       git clone git://github.com/klen/python-mode.git

"--------------------------- ScrollColors ---------------------------
" to install
"       cd ~/.vim/bundle
"       git clone git://github.com/vim-scripts/ScrollColors.git
map <silent><F12> :NEXTCOLOR<cr>
map <silent><F11> :PREVCOLOR<cr>
"
"--------------------------- NERDCommenter ---------------------------
" to install
"       cd ~/.vim/bundle
"       git clone https://github.com/scrooloose/nerdcommenter.git`


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
"	General
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
set nocompatible    " make vim incompatible to vi

set number			" enable line numbers
set numberwidth=4	" space provided for line numbering

set nocompatible	" not compatible with the old-fashion vi mode
set bs=2			" allow backspacing over everything in insert mode
set autoread		" auto read when file is changed from outside
set hidden			" buffers can exist in background

if has('cmdline_info')
    set ruler                   " show the ruler
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " a ruler on steroids
    set showcmd                 " show partial commands in status line and selected characters/lines in visual mode
endif

" highlight current line, background color
set cursorline
hi cursorline guibg=#333333
hi CursorColumn guibg=#333333

" use colored highlighting for file types recognized
"syntax on			" Enable syntax highlighting
"filetype on			" Enable filetype detection
"filetype indent on	" Enable filetype-specific indenting

set history=200		" sets how many command line history VIM has to remember
set undolevels=200  " use many muchos levels of undo


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
"	Vim Start-Up Position
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" http://www.scarpa.name/2011/04/06/terminal-vim-resizing/
" http://vim.wikia.com/wiki/Restore_screen_size_and_position
"
" Function to increase the size of the terminal window for Vim editing
function! SizeUpFunc()
    if exists("g:oldColumns")
        return
    endif
    let g:oldColumns = &columns     " Save the current width
    let g:oldLines = &lines         " Save the current length
    winpos 420 50	                " loaction of window when Vim opens
    set lines=85                    " number of lines in the terminal window when Vim opens
    set columns=130                 " number of columns in the terminal window when Vim opens
endfunction
command! SizeUp call SizeUpFunc()

" Function to restore the terminal window to its orginal size
function! SizeDownFunc()
    if !exists("g:oldColumns")
        return
    endif
    let &columns = g:oldColumns     " restore the orginal width
    let &lines = g:oldLines         " restore the orginal length
    unlet g:oldColumns              " remove the variable
    unlet g:oldLines                " remove the variable
endfunction
command! SizeDown call SizeDownFunc()

" save/restore the size of the terminal window
autocmd VimEnter * SizeUp           " increase the size of the terminal window
autocmd VimLeavePre * SizeDown      " restore terminal size when Vim quits

" Make Sure that Vim returns to the same line when we reopen a file
augroup line_return
    autocmd!
        autocmd BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \ execute 'normal! g`"zvzz' |
            \ endif
augroup END



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
"  Folding
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" here are the commands you need to know for folding
"   zi      toggle folding feature on/off
"   zf#j    creates a fold from the cursor down # lines.
"   zf      (VISUAL Mode) creates a fold over highlighted area
"   zj      moves the cursor to the next fold.
"   zk      moves the cursor to the previous fold.
"   zo      opens a fold at the cursor.
"   zO      opens all folds at the cursor.
"   zm      increases the foldlevel by one.
"   zM      closes all open folds.
"   zr      decreases the foldlevel by one.
"   zR      decreases the foldlevel to zero -- all folds will be open.
"   zd      deletes the fold at the cursor.
"   zE      deletes all folds.
"   [z      move to start of open fold.
"   ]z      move to end of open fold.
set foldcolumn=2    " include open/close folding button of width provided
set nofoldenable    " don't fold by default

" save/restore the view of the file (saves the folding)
autocmd BufWinLeave * mkview             " write the view of the current file
autocmd BufWinEnter * silent loadview    " load the view of the current file


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
"  Spell Checking
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" here are the commands you need to know for spell
"   ]s    move to the next misspelled word
"   [s    move to the previous misspelled word
"   zg    add a word to the dictionary
"   zug   undo the addition of a word to the dictionary
"   z=    view spelling suggestions for a mispelled word
setlocal nospell            " disable inline spell check at stratup
setlocal spelllang=en_us    " use USA English spelling dictionary

" toggle and untoggle spell checking
map <Leader>sp :setlocal spell!<cr>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
"	VIM User Interface
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" Vim will show a block cursor in normal mode and a line cursor in insert mode
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

set mouse=a		" Enable mouse usage; to paste, press shift while selecting with the mouse

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set lazyredraw		" Don't redraw while executing macros
set magic			" For regular expressions turn magic on
set showcmd			" Show (partial) commands in status line

set showmatch		" Show matching brackets when text indicator is over them
set mat=2			" tenths of a second to blink when matching brackets

set title								"Show info in the window title
set titlestring=RedRPi\ Vim\ Editor:\ %F	"Automatically set screen title

" No annoying sound ot flashing on errors
" set noerrorbells		" turn of beeping when errors occure
" set novisualbell		" turn off screen flashing when errors occure
" set t_vb=				" If 't_vb' is cleared, Vim will never flash the screen
" set tm=500

" bind Ctrl+<movement> keys to move around windows, instead of using Ctrl+w+<movement>
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
"	Copy & Paste
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
set pastetoggle=<F2>
set clipboard=unnamed


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
"	Searching
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
set incsearch		" incremental search
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
"set hlsearch		" highlight search results

" clears the search highlights
nmap <silent> <Leader><space> :nohlsearch<CR>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
"  Indentation
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
set copyindent		" copy previous indent on enter

"Indent only if the file is of type cpp,c,java,sh,pl,php,asp
au FileType py set autoindent
au FileType py set smartindent
au FileType py set textwidth=79							" PEP-8 friendly
au FileType cpp,c,java,sh,pl,php,asp  set autoindent
au FileType cpp,c,java,sh,pl,php,asp  set smartindent
au FileType cpp,c,java,sh,pl,php,asp  set cindent		" C type indentation



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
"  Text and Tabs
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
set expandtab		" Use spaces instead of tabs
set shiftwidth=4	" 1 tab equals 4 spaces
set smarttab		" Be smart when using tabs
set tabstop=4		" set tab stops ever 4 character spaces

" Cool tab completion stuff
set wildmenu
set wildmode=list:longest,full

set wrap			" wrap lines when they are larger than the window size
set wrapmargin=4	" number of characters from right window border when wrapping starts
set tw=500			" Linebreak on 500 characters
set lbr
set formatoptions=1	" to stop unexpected effects, use :set paste and leave this mode via :set nopaste



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
"  Colors and Fonts
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" Set extra options when running in GUI mode
if has("gui_running")       " settings for GVim
	set t_Co=256
	set guitablabel=%M\ %t
    set guioptions-=T       " remove the toolbar
    set guioptions-=r
    set guioptions-=L
    set guioptions+=a
	set guioptions+=e
    set guioptions-=m
    colorscheme wombat256mod
else                        " settings for Vim
    set t_Co=256
    colorscheme jellybeans
endif

set colorcolumn=80          	" puts a line at the column given

"set guifont=Times_New_Roman:h11:cANSI
"set guifont=courier_new:h11:b
set guifont=Lucida_Console:h8:cDEFAULT

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
"   Files, Backups, and Undo
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" disable backup and swap files (they trigger too many events)
set nobackup
set nowritebackup
set noswapfile

" keep temporary and backup files (make sure to create these directories first)
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
"  Abbreviations
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" when in INPUT mode and hit space after typing the abbreviation, Vim will replace it
iabbrev #c /****************************************************************************/
iabbrev #v """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
iabbrev #s ##############################################################################
iabbrev @@ jeff.irland@gmail.net
iabbrev ccopy Copyright 2013 Jeffrey C. Irland, all rights reserved.



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
"   Mapping Keys
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
set timeoutlen=1000		" time in millisec mapping key sequance must complete

" edit my .vimrc file in a new window (so you can update .vimrc on the fly)
nnoremap <Leader>ev :split $MYVIMRC<cr>

" source my .vimrc file so it takes effect immedately
nnoremap <Leader>sv :source $MYVIMRC<cr>

" surround a word with double quotes
nnoremap <Leader>" viw<esc>a"<esc>hbi"<esc>lel

" yank from the cursor to the end of the line, to be consistent with C and D
nnoremap Y y$

" use these mapping to establish the muscle memory to become a Vim power user
"    - map <esc> to 'jk' and turn off <esc>
"    - disable the arrow keys
"inoremap jk <esc>
"inoremap <esc> <nop>
"map <up> <nop>
"map <down> <nop>
"map <left> <nop>
"map <right> <nop>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
"   Wildmenu Completion
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" B
set wildmenu
set wildmode=list:longest
set wildignore+=.hg,.git,.svn                       " Version Controls
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg      " Binary Imgs
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest    " Compiled Object files
set wildignore+=*.sw?                               " Vim swap files
set wildignore+=*.pyc                               " Python Object codes
set wildignore+=*.orig                              " Merge resolution files


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
"   Shell Specific
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
"   C++ Specific
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   Python Specific
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" comment out a line
autocmd FileType python nnoremap <buffer> <localleader>c I#



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
"  Status Line
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" format the status line at the bottom of the Vim window
" status line broken down into easily includeable segments
if has('statusline')
    set laststatus=2                            " Always show the status line
    set statusline=%<File:\ %f                  " Filename
    set statusline+=\ %w%h%m%r                  " Options
    "set statusline+=%{fugitive#statusline()}   " Git Hotness
    set statusline+=\ [%{&ff}/%Y]               " file type
    set statusline+=\ CWD:\ %{getcwd()}         " current dir
   "set statusline+=\ [A=\%03.3b/H=\%02.2B]     " ASCII / Hexadecimal value of char
    set statusline+=\ \ \ \ \ \ \ \ (Line:\ %l,\ Column:\ %c)
endif



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
"  Helper Functions
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" map sort function to key
vnoremap <Leader>s :sort<CR>

" Returns true if paste mode is enabled
function! HasPaste()
  if &paste
    return 'PASTE MODE  '
  endif
  return ''
endfunction

