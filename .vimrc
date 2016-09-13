"""" HOW TO USE
" 1. Select a profile from the PROFILES section by uncommenting its lines and
"    commenting-out the lines of the other profiles.
" 2. Add a user profile entry to the USERS section if you want to make any
"    changes to the default settings.
" 3. If you have a different tabs-to-spaces setting (other than 4), add
"    another profile to the PROFILES section instead of modifying one.


"""" TIPS
" - paste multiple lines without vim mangling them
"     set paste
"     <insert lines>
"     set nopaste
" - convert tabs to spaces (according to the settings in this file)
"     retab


"""" COMMON SETTINGS
set nocompatible                " vim defaults, not vi
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
Plugin 'Valloric/YouCompleteMe'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" lots of colorschemes
Plugin 'flazz/vim-colorschemes'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on              " enable filetypes and plugins

let g:ycm_global_ycm_extra_conf = '~/.vim/ycm_extra_conf.py'
let g:omni_sql_no_default_maps = 1 "disable incessant warning that something sql-related is not configured

" to let command-t find files near top level of directories with more files than CommandTMaxFiles
" I ran into this limit by leaving too many repositories cloned in ~
let CommandTMaxFiles = 300000  " default 30000
let CommandTMaxDepth = 5  " default 15
let CommandTAlwaysShowDotFiles = 1
let CommandTScanDotDirectories = 1
set wildignore+=*.o,*.obj,*.git

"" General
set encoding=utf-8
set textwidth=80                " wrap at
"set autoindent smartindent      " smarter indent behavior
" smartindent has been depreciated. filetype-based indentation or cindent may
" work better
set smarttab                    " make tab and backspace smarter
"set nowrap                      " don't wrap long lines
set wrap linebreak breakindent nolist  " soft/visual-wrap long lines
set textwidth=0
set wrapmargin=0                " vim stop adding linebreaks in comments
set number                      " display line numbers
set hlsearch                    " highlight search matches
set backspace=indent,eol,start  " allow backspace over indent, eol, start
"set formatoptions=tcqlron       " auto-wrap lines/comments at textwidth,
"                                " allow formatting using gq commands,
"                                " long lines not broken in insert mode
"                                " auto-insert comment leader on Enter or O,
"                                " recognize numbered lists
set formatoptions=tqron         " auto-wrap lines but not comments at textwidth,
                                " allow formatting using gq commands,
                                " long lines broken in insert mode
                                " auto-insert comment leader on Enter or O,
                                " recognize numbered lists
"set numberwidth=4  " more default space for line nums up to line 999

"" Menus
set wildmenu
set wildmode=list:longest,full

"" Syntax
syntax on                       " enable syntax highlighting
set foldmethod=syntax           " syntax-based code folding
set nofoldenable                " disable folding (enable in USERS section)
set cinoptions=:0,l1,t0,g0      " case labels at column 0,
                                " align line after case label with label,
                                " return type declaration at column 0,
                                " c++ scope declarations at column 0

"" Tabs
set expandtab      " use spaces, not tabs
set tabstop=4      " tab this width of spaces
set shiftwidth=4   " indent this width of spaces
set softtabstop=4  " backspace amount when tab-aligned (like using tabs)


"" Colors
"colorscheme pencil  " the color scheme
highlight LineNr ctermfg=grey



"" Shortcuts
" using space for leader
let mapleader=" "
" swapping : and ; in command and visual selection mode
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;
" default s seems eclipsed by c functionality. instead mapping s to 'insert
" one char and stay in normal mode'
:nnoremap s :exec "normal i".nr2char(getchar())."\e"<CR>
:nnoremap S :exec "normal a".nr2char(getchar())."\e"<CR>
" fd to escape insert mode.. no, f is too common terminal char and introduces
" distracting delay after f is typed and its apperance
" i suppose I'll use j j instead as english words dont end with j anyway 
" inoremap <special> fd <ESC>
inoremap <special> jj <ESC>
" backspace to toggle between current and previous file
" forces (re)indentation of a block of code
nmap <c-j> vip=
" scroll forward one screen
"nmap <space> <c-f>
" scroll backward one screen
"nmap <bs> <c-b>
" cycle between split windows
nmap - <c-w>w
" toggle search highlighting
nmap th :set hlsearch!<cr>
" toggle code folding
nmap tf :set foldenable!<cr>
" toggle line wrapping
nmap tw :set wrap!<cr>
" toggle numbering
nmap tn :set number!<cr>
" rebuild python
nmap prb :!python setup.py install --prefix=~<cr>



