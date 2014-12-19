"""
" Vundle stuff...
"""

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.

Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'bufkill.vim'
Plugin 'bling/vim-airline'
Plugin 'mileszs/ack.vim'
Plugin 'scrooloose/nerdcommenter'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"""
" ...end Vundle stuff
"""

set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
set autoindent
syntax enable
filetype plugin on " Needed for The NERD Commenter to work
colorscheme molokai

" Use Tab on the command line to show a menu to complete buffer, file,
" and command names. http://vim.wikia.com/wiki/Easier_buffer_switching
set wildchar=<Tab> wildmenu wildmode=full

" Map space to leader instead of 'letting' to pop up something
" in the showcmd corner.
" http://www.reddit.com/r/vim/comments/1vdrxg/space_is_a_big_key_what_do_you_map_it_to/cerq68d
"let mapleader = " "
map <space> <leader>

nmap <leader>n :NERDTree<cr>
nmap <leader>w :w<cr>

" Copy & paste to system clipboard with <leader>p and <leader>y.
vmap <leader>y "+y
vmap <leader>d "+d
nmap <leader>p "+p
nmap <leader>P "+P
vmap <leader>p "+p
vmap <leader>P "+P

" Open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Enable the list of buffers in Airline.
let g:airline#extensions#tabline#enabled = 1

" Easier buffer navigation.
nmap b[ :bp<cr>
nmap b] :bn<cr>

set pastetoggle=<F2>

" Easier pane navigations.
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Pane resizing.
map + <C-w>+
map - <C-w>-
map <C-n> <C-w><
map <C-m> <C-w>>

" Don't lose selection on indent in visual mode.
vnoremap > >gv
vnoremap < <gv

" Set ctrlp's working dir to the ancestor of this file... or something.
" http://kien.github.io/ctrlp.vim/
let g:ctrlp_working_path_mode = 'a'

