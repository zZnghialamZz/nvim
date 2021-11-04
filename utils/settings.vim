"=============================================================================
" utils/settings.vim ---- Utitlities settings
" Copyright (c) 2020 Nghia Lam
" Author: Nghia Lam <nghialam12795@gmail.com>
" URL: https://github.com/zZnghialamZz/nvim
" License: The Unlicense
"=============================================================================

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

syntax on

set autoread                       "auto load file changes
set guicursor=
set backspace=indent,eol,start     "allow backspacing over everything in insert mode
set noerrorbells visualbell t_vb=  "remove annoying sound in vim
" set relativenumber                 "relative number for line numbers
set nornu
set nonumber
set lazyredraw                     "no redraw when executing macros
set cursorline                     "highlight current line
set hidden                         "required to keep multiple buffers open multiple buffers
set foldenable                     "enable folding
set foldnestmax=10                 "10 nested fold max
set foldmethod=marker
set foldlevel=0
set ma
set mouse=a                        "allow mouse
set magic                          "for regex
set showmatch                      "show matching bracket when cursor is over
set matchtime=2
set wildoptions=pum
set pumblend=20
set hlsearch                       "highlight stuff when jump searchs
set incsearch                      "increamental search
set tabstop=2 softtabstop=2
set shiftwidth=2
set splitright
set splitbelow
set termguicolors
set shortmess+=c
" set expandtab
set smartindent
set nowrap
set undodir=~/.vim/undodir
set undofile
set scrolloff=8
set encoding=UTF-8
set list
set listchars=tab:→\ ,trail:⋅,extends:❯,precedes:❮
set wildignorecase
set cmdheight=1                    "display command in 1 line

" delays and poor user experience.
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
set updatetime=50

" Turn backup off, since most stuff is in SVN, git etc. anyway...
set nobackup
set nowb
set noswapfile

" Ignore files
set wildmenu

set wildignore+=*.pyc
set wildignore+=*.meta
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*

