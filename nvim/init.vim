set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching 
set ignorecase              " case insensitive 
set hlsearch                " highlight search 
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab 
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set relativenumber                  " add line numbers
set number
set wildmode=longest,list   " get bash-like tab completions
filetype plugin indent on   " allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
filetype plugin on
" set noswapfile            " disable creating swap file
" set backupdir=~/.cache/vim " Directory to store backup files.

call plug#begin('~/.local/share/nvim/plugged')

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " autocomplete
Plug 'vim-airline/vim-airline' " bar
Plug 'vim-airline/vim-airline-themes' " bar themes
Plug 'jiangmiao/auto-pairs' "auto bracket pairs
Plug 'scrooloose/nerdcommenter' " comment with \cc uncoment \cu
Plug 'scrooloose/nerdtree' " file tree
Plug 'machakann/vim-highlightedyank'
Plug 'tmhedberg/SimpylFold'
Plug 'github/copilot.vim'

call plug#end()

let g:deoplete#enable_at_startup = 1
let g:airline_theme='base16_atelierforest'
nnoremap <silent> <C-k><C-B> :NERDTreeToggle<CR>
let g:highlightedyank_highlight_duration = 400
