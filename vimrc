
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Some referance for more information about how to setup the .vimrc file
"	The Vim Editor - http://www.vim.org
"	Vim Recipes - http://vim.runpaint.org/toc/
"
" Much of this .vimrc file was taken from:
"	http://www.terminally-incoherent.com/blog/2012/03/26/how-to-configure-vim/ 
"	http://amix.dk/blog/post/19691#The-ultimate-Vim-configuration-on-Github
"	http://hackr.se/vim/vimrc/
"	http://www.youtube.com/watch?v=YhqsjUUHj6g
"	http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/
"
"
" Vim and Vim Scripting Tutotials
"		Run the Linux Vim tutorial program: vimtutor
" 		Vim Introduction and Tutorial - http://blog.interlinked.org/tutorials/vim_tutorial.html
"		Learn Vimscript the Hard Way - http://learnvimscriptthehardway.stevelosh.com/
"		25 Vim Tutorials, Screencasts, and Resources - http://net.tutsplus.com/articles/web-roundups/25-vim-tutorials-screencasts-and-resources/
"
" Maintaining & Synchronizing Vim on Other Machines With Git Submodules and Pathogen
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
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" rebind <leader> key (if not set or empty, a backslash is used instead)
let mapleader = ","

" automatic reload of .vimrc after it's saved
autocmd! bufwritepost .vimrc source %



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	Plugins
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"-------------------- Pathogen --------------------
" to install Pathogen to manage your plugins
"       mkdir -p ~/.vim/autoload ~/.vim/bundle
"       curl -Sso ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim
" Now you install all your plugins into a .vim/bundle/<plugin-name>/ folder
"
" call pathogen to install the remaining plugins
filetype off
call pathogen#infect()		" this pulls in the plugins
"call pathogen#helptags()	" generate helptags for everything in 'runtimepath'
"filetype plugin indent on	" enable filetype-specific plugins
"call pathogen#runtime_append_all_bundles()
syntax on
filetype plugin indent on

"-------------------- NERDTree --------------------
" to install
"       cd ~/.vim/bundle
"       get clone ....
"
" open a NERDTree automatically when vim starts up
autocmd vimenter * NERDTree

" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"-------------------- ScrollColors --------------------
"-------------------- NERDCommenter --------------------
"-------------------- PowerLine --------------------
"-------------------- Python-Mode --------------------
"-------------------- Python Code Folding --------------------
" http://superuser.com/questions/267407/best-code-folding-plugin-for-python-in-vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
"	General
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
set nocompatible    " make vim incompatbile to vi

set number			" enable line numbers
set numberwidth=4	" space provided for line numbering

set nocompatible	" not compatible with the old-fashion vi mode
set bs=2			" allow backspacing over everything in insert mode
set autoread		" auto read when file is changed from outside
set hidden			" buffers can exist in background

set ruler			" show the cursor position all the time
"set cursorline		" show line marker
"set cursorcolumn	" show column markers

" use colored highlighting for file types recognized
syntax on			" Enable syntax highlighting
filetype on			" Enable filetype detection
filetype indent on	" Enable filetype-specific indenting

set history=200		" Sets how many command line history VIM has to remember



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
"	Vim Start-Up Position
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
winpos 400 50		" loaction of window when vi opens
set lines=80		" number of lines in the terminal window when vi opens
set columns=100		" number of columns in the terminal window when vi opens



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
"  Spell Checking
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" here are the commands you need to know for spell
"   ]s — move to the next misspelled word
"   [s — move to the previous misspelled word
"   zg — add a word to the dictionary
"   zug — undo the addition of a word to the dictionary
"   z= — view spelling suggestions for a mispelled word
setlocal nospell            " disable inline spell check at stratup
setlocal spelllang=en_us    " use USA English spelling dictionary

" toggle and untoggle spell checking
map <leader>sp :setlocal spell!<cr>



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
nmap <silent> <leader><space> :nohlsearch<CR>



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
if has("gui_running")           " settings for GVim
	set t_Co=256
	set guitablabel=%M\ %t
    set guioptions-=T
    set guioptions-=r
    set guioptions-=L
    set guioptions+=a
	set guioptions+=e
    set guioptions-=m
    colorscheme jellybeans
else                            " settings for Vim
    set t_Co=256
    colorscheme jellybeans
endif

set colorcolumn=80	" puts a line at the column given

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
nnoremap <leader>ev :split $MYVIMRC<cr>

" source my .vimrc file so it takes effect immedately
nnoremap <leader>sv :source $MYVIMRC<cr>

" toggle NERDTree on or off
nmap <leader>nt :NERDTreeToggle<CR>

" surround a word with double quotes
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel

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
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ \ Column:\ %c
set laststatus=2        " Always show the status line




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
"  Helper Functions
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" map sort function to key
vnoremap <leader>s :sort<CR>

" Returns true if paste mode is enabled
function! HasPaste()
  if &paste
    return 'PASTE MODE  '
  endif
  return ''
endfunction

" Make Sure that Vim returns to the same line when we reopen a file
augroup line_return
    au!
        au BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \ execute 'normal! g`"zvzz' |
            \ endif
augroup END



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
"   GVim Settings
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
