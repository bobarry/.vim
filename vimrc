
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 
"    References
"        Information about Vim
"            The Vim Editor - http://www.vim.org
"            Vim Recipes - http://vim.runpaint.org/toc/
"            Turning Vim into a modern Python IDE - http://sontek.net/blog/detail/turning-vim-into-a-modern-python-ide
" 
"        Vim Scripting Tutorials
"            Run the Linux Vim tutorial program - Linux program called "vimtutor"
"            Vim Introduction and Tutorial - http://blog.interlinked.org/tutorials/vim_tutorial.html
"            Learn Vimscript the Hard Way - http://learnvimscriptthehardway.stevelosh.com/
"            25 Vim Tutorials, Screencasts, and Resources - http://net.tutsplus.com/articles/web-roundups/25-vim-tutorials-screencasts-and-resources/
"            How to Write Vim Plugins with Python - http://brainacle.com/how-to-write-vim-plugins-with-python.html
" 
"        Maintaining & Synchronizing Vim on Other Machines
"            Git Submodules and Pathogen - http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/
"            Get Reference - http://gitref.org/
"
" ------------------------------------------------------------------------------
" 
"    Using Vim's scripting language (and a great deal of insight and tools from others),
"    I have setup Vim on my local machine to be an effective development environment
"    for my needs.  Using GitHub, I can replicate this Vim environment across the
"    multiple systems I'm presently use.
"
"    I will explain here how I established the git environment on my local machine,
"    how I established a GitHub for that environment, how to replicate the Vim environment
"    to another machine, and how to update both the local git repository and GitHub.
"
"
"    ** Creating the Local Git Repository
" 
"        Install Pathogen in your .vim Directory
" 
"            mkdir -p ~/.vim/autoload ~/.vim/bundle
"            curl -Sso ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim
"            <add Pathogen to your ~/.vim/vimrc file>
" 
"        Store your .vimrc & .gvimrc in the .vim directory
" 
"            mv .vimrc ~/.vim/vimrc
"            mv .gvimrc ~/.vim/gvimrc
"            ln -s ~/.vim/vimrc ~/.vimrc
"            ln -s ~/.vim/gvimrc ~/.gvimrc
" 
"        Change to the .vim directory, and initialize it as a git repository
" 
"            cd ~/.vim
"            git init
" 
"        Create a README file, add all the files, and make initial comment
" 
"            <make a README file>
"            git add .
"            git commit -m 'Initial commit'
" 
"
"    ** Creating the GitHub Repository
" 
"        Goto GitHub and create the new repository
" 
"            goto https://github.com/jeffskinnerbox
"            <create empty repository called 'dotvim'>
" 
"
"    ** Loading the GitHub Repository for the First Time
" 
"        Within the ~.vim directory, use git to load the files to GitHub
" 
"            git remote add origin https://github.com/jeffskinnerbox/dotvim.git
"            git push -u origin master
" 
"
"    ** To Update the Local Git Repository
"
"        Within the .vim directory, do a "get status" to see what will be included in the commit,
"        add files (or remove) that are required, and then do the commit to the local git repository.
"
"            git status
"            git add <files>   (or git rm <files>)
"            git commit --dry-run
"            git commit
"
"
"    ** To Update the Remote (i.e. GitHub) Repository
"
"        To which shows you the URL that Git has stored for the shortname to for
"        the remote (GitHub) repository:
"
"            git remote -v
"
"        Now to push your files to the GitHub repository
"
"            git push -u origin master
"
"
"    ** To Perform the Initial Replication of .vim Environment on Another Machine
" 
"        Login into the target machine and go to its $HOME
" 
"            cd ~
"            git clone http://github.com/jeffskinnerbox/dotvim.git ~/.vim
"            ln -s ~/.vim/vimrc ~/.vimrc
"            ln -s ~/.vim/gvimrc ~/.gvimrc
"            cd ~/.vim
"            git submodule init
"            git submodule update
"    
"    
"    ** To Upgrading Your .vim Directory From Remote GitHub Repository
" 
"            cd ~/.vim
"            ?????????? git pull origin master ???????????
" 
"
"    ** To Upgrading a Plugin in bundle Directory
" 
"        At some point in the future, a plugin might be updated. If this plugin
"        also uses Git, you can fetch the latest changes via
" 
"            cd ~/.vim/bundle/<plugin>
"            git pull origin master
" 
"        To upgrading all bundled plugins
" 
"            git submodule foreach git pull origin master
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" FOR DEBUGGING: when bigger than zero, Vim will give messages about what it is doing
set verbose=0

" default leader is '\', but many people prefer ','
let mapleader = ","
let g:mapleader = ","

" automatic reload of .vimrc after it's saved (great for when your editing .vimrc)
autocmd bufwritepost .vimrc source %



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"	Plugins
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"---------------------------------- Pathogen -----------------------------------
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
syntax on                   " set syntax highlighting and color highlighting for a file type

"---------------------------------- NERDTree -----------------------------------
" to install
"       cd ~/.vim/bundle
"       git clone https://github.com/scrooloose/nerdtree.git
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1

augroup VimNERDTree
    " delete any old autocommands in this group
    autocmd!
    " open a NERDTree automatically when vim starts up
    "autocmd VimEnter * NERDTree
    " close vim if the only window left open is a NERDTree
    autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
augroup END

map <leader>e :NERDTreeFind<CR>

" toggle NERDTree on or off
nmap <leader>nt :NERDTreeToggle<CR>

"--------------------------------- Python-Mode ---------------------------------
" to install
"       cd ~/.vim/bundle
"       git clone git://github.com/klen/python-mode.git

" Python-Mode Keys:
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)

let g:pymode_rope = 1

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'                  " allows lookup of Python docs by pressing K

" automatically check code on each save, but only use PyLint or PyFlakes
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"

let g:pymode_lint_write = 1                 " Auto check on save
let g:pymode_virtualenv = 1                 " Support virtualenv
let g:pymode_folding = 0                    " Don't autofold code

" Enable breakpoints plugin
" use <leader>b to add a pdb shortcut (inserts import pdb; pdb.set_trace() ### XXX BREAKPOINT into code
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = '<leader>b'

" syntax highlighting and formatting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" turn on all the high lighting feature (see file /usr/share/vim/vim73/syntax/python.vim)
let g:python_highlight_all = 1

"-------------------------------- ScrollColors ---------------------------------
" to install
"       cd ~/.vim/bundle
"       git clone git://github.com/vim-scripts/ScrollColors.git
map <silent><F12> :NEXTCOLOR<cr>
map <silent><F11> :PREVCOLOR<cr>
"
"-------------------------------- NERDCommenter --------------------------------
" to install
"       cd ~/.vim/bundle
"       git clone https://github.com/scrooloose/nerdcommenter.git`



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
"	General
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
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



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
"	Vim Start-Up Position
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
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
    winpos 420 25	                " loaction of window when Vim opens
    set lines=75                    " number of lines in the terminal window when Vim opens
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

augroup VimStartUp
    " delete any old autocommands in this group
    autocmd!
    " save/restore the size of the terminal window
    autocmd VimEnter * SizeUp           " increase the size of the terminal window
    autocmd VimLeavePre * SizeDown      " restore terminal size when Vim quits
    " make Vim returns to the same line when we reopen a file
    autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \ execute 'normal! g`"zvzz' |
        \ endif
augroup END

" remember info about open buffers on close
set viminfo^=%



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
"  Folding
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
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

"augroup VimFolding
"    " delete any old autocommands in this group
"    autocmd!
"    " save/restore the view of the file (saves the folding)
"    autocmd BufWinLeave * mkview             " write the view of the current file
"    autocmd BufWinEnter * silent loadview    " load the view of the current file
"augroup END



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
"  Window Tabs
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" color the tabs
hi TabLineFill ctermfg=Black ctermbg=LightGray
hi TabLine ctermfg=Black ctermbg=Gray
hi TabLineSel ctermfg=DarkGreen ctermbg=Gray



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
"  Spell Checking
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" here are the commands you need to know for spell
"   ]s    move to the next misspelled word
"   [s    move to the previous misspelled word
"   zg    add a word to the dictionary
"   zug   undo the addition of a word to the dictionary
"   z=    view spelling suggestions for a mispelled word
setlocal nospell            " disable inline spell check at stratup
setlocal spelllang=en_us    " use USA English spelling dictionary

" toggle and untoggle spell checking
map <leader>sp :setlocal spell!<cr>

" Pressing ,ss will toggle and untoggle spell checking
" map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
" map <leader>sn ]s
" map <leader>sp [s
" map <leader>sa zg
" map <leader>s? z=



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
"	VIM User Interface
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" Vim will show a block cursor in normal mode and a line cursor in insert mode
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

" determines the number of context lines you would like to see above and below the cursoret to 999 to center cursor
set scrolloff=7

set mouse=a		" Enable mouse usage; to paste, press shift while selecting with the mouse

" Height of the command bar
set cmdheight=1

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

" bind Ctrl+<movement> keys to move around windows, instead of using Ctrl+w+<movement>
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
"	Sound, Errors, Warnings
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" No annoying sound ot flashing on errors
set errorbells
" set noerrorbells		" turn of beeping when errors occure
" set novisualbell		" turn off screen flashing when errors occure
" set t_vb=				" If 't_vb' is cleared, Vim will never flash the screen
" set tm=500



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
"	Copy & Paste
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
set pastetoggle=<F2>
set clipboard=unnamed



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
"	Searching
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
set incsearch		" incremental search
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
"set hlsearch		" highlight search results

" clears the search highlights
nmap <silent> <leader><space> :nohlsearch<CR>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
"  Indentation
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
set copyindent		" copy previous indent on enter

"Indent only if the file is of type cpp,c,java,sh,pl,php,asp
augroup VimIndent
    " delete any old autocommands in this group
    autocmd!
    autocmd FileType py set autoindent
    autocmd FileType py set smartindent
    autocmd FileType py set textwidth=79						" PEP-8 friendly
    autocmd FileType cpp,c,java,sh,pl,php,asp  set autoindent
    autocmd FileType cpp,c,java,sh,pl,php,asp  set smartindent
    autocmd FileType cpp,c,java,sh,pl,php,asp  set cindent		" C type indentation
augroup END



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
"  Text and Tabs
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
set expandtab		" Use spaces instead of tabs
set shiftwidth=4	" 1 tab equals 4 spaces
set smarttab		" Be smart when using tabs
set tabstop=4		" set tab stops ever 4 character spaces
set nolist          " do not display tabs or ends of lines

" Cool tab completion stuff
set wildmenu
set wildmode=list:longest,full

set wrap			" wrap lines when they are larger than the window size
set wrapmargin=4	" number of characters from right window border when wrapping starts
set tw=500			" Linebreak on 500 characters
set lbr
set formatoptions=1	" to stop unexpected effects, use :set paste and leave this mode via :set nopaste



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
"  Colors and Fonts
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
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

"set guifont=courier_new:h11:b
"set guifont=Lucida_Console:h8:cDEFAULT
set guifont=Consolas:h10:cANSI

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
"   Files, Backups, and Undo
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" disable backup and swap files (they trigger too many events)
set nobackup
set nowritebackup
set noswapfile

" keep temporary and backup files (make sure to create these directories first)
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
"  Abbreviations
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" when in INPUT mode and hit space after typing the abbreviation, Vim will replace it
iabbrev #c /****************************************************************************/
iabbrev #v """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
iabbrev #s #-----------------------------------------------------------------------------
iabbrev @@ jeff.irland@gmail.net
iabbrev ccopy Copyright 2013 Jeffrey C. Irland, all rights reserved.



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
"   Mapping Keys
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
set timeoutlen=1000		" time in millisec mapping key sequance must complete

" edit my .vimrc file in a new window (so you can update .vimrc on the fly)
nnoremap <leader>ev :split $MYVIMRC<cr>

" source my .vimrc file so it takes effect immedately
nnoremap <leader>sv :source $MYVIMRC<cr>

" surround a word with double quotes
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel

" yank from the cursor to the end of the line, to be consistent with C and D
nnoremap Y y$

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" use these mapping to establish the muscle memory to become a Vim power user
"    - map <esc> to 'jk' and turn off <esc>
"    - disable the arrow keys
"inoremap jk <esc>
"inoremap <esc> <nop>
"map <up> <nop>
"map <down> <nop>
"map <left> <nop>
"map <right> <nop>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
"   Wildmenu Completion
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set wildmenu
set wildmode=list:longest
set wildignore+=.hg,.git,.svn                       " Version Controls
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg      " Binary Imgs
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest    " Compiled Object files
set wildignore+=*.sw?                               " Vim swap files
set wildignore+=*.pyc                               " Python Object codes
set wildignore+=*.orig                              " Merge resolution files



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
"   Shell Specific
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
"   C++ Specific
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   Python Specific
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
"augroup VimPython
"    " delete any old autocommands in this group
"    autocmd!
"    " comment out a line
"    autocmd FileType python nnoremap <buffer> <leader>c I#<esc>
"augroup END



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
"  Status Line
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" format the status line at the bottom of the Vim window
" status line broken down into easily includeable segments
if has('statusline')
    set laststatus=2                                " Always show the status line
    set statusline=%<File:\ %f                      " Filename
    set statusline+=\ %w%h%m%r                      " Options
   "set statusline+=%{fugitive#statusline()}        " Git Hotness
    set statusline+=\ [%{&ff}/%Y]                   " file type
    set statusline+=\ CWD:\ %{getcwd()}             " current working directory
   "set statusline+=\ [A=\%03.3b/H=\%02.2B]         " ASCII / Hexadecimal value of character under curser
    set statusline+=\ \ \ \ \ \ \ \ \ \ \ \ \ \     " spacing
    set statusline+=(Line:\ %l/%L,\ Column:\ %c)    " curent line number, total lines, and curent column
endif

function! InsertStatuslineColor(mode)
    if a:mode == 'i'
        hi statusline guibg=Cyan ctermfg=6 guifg=Black ctermbg=0
    elseif a:mode == 'r'
        hi statusline guibg=Purple ctermfg=5 guifg=Black ctermbg=0
    else
        hi statusline guibg=DarkRed ctermfg=1 guifg=Black ctermbg=0
    endif
endfunction
 
augroup VimStatusLine
    " delete any old autocommands in this group
    autocmd!
    autocmd InsertEnter * call InsertStatuslineColor(v:insertmode)
    autocmd InsertLeave * hi statusline guibg=DarkGrey ctermfg=8 guifg=White ctermbg=15
augroup END

" default the statusline to green when entering Vim
hi statusline guibg=DarkGrey ctermfg=8 guifg=White ctermbg=15


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
"  Helper Functions
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" map sort function to key
vnoremap <leader>s :sort<CR>

" Returns true if paste mode is enabled
function! HasPaste()
  if &paste
    return 'PASTE MODE  '
  endif
  return ''
endfunction

