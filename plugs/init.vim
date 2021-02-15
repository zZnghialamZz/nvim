"=============================================================================
" plugs/init.vim ---- Init vim-plug for install plugins
" Copyright (c) 2020 Nghia Lam
" Author: Nghia Lam <nghialam12795@gmail.com>
" URL: https://github.com/zZnghialamZz/nvim
" License: The Unlicense
"=============================================================================

" VIM=PLUG
call plug#begin('~/.vim/plugged')

"------------------------------------------"
"GENERAL"
Plug 'terryma/vim-multiple-cursors'
Plug 'mbbill/undotree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree'
Plug 'junegunn/vim-easy-align'
Plug 't9md/vim-choosewin'
Plug 'dyng/ctrlsf.vim'
Plug 'jremmen/vim-ripgrep'
Plug 'pelodelfuego/vim-swoop'
Plug 'jiangmiao/auto-pairs'
Plug 'sotte/presenting.vim'
Plug 'junegunn/goyo.vim'

"------------------------------------------"
"LANGUAGE"
Plug 'sheerun/vim-polyglot'                 " all around languages
Plug 'plasticboy/vim-markdown'              " better markdown support

Plug 'kana/vim-operator-user'
Plug 'Shougo/vimproc.vim'

Plug 'prabirshrestha/async.vim'             " async autocompletion for Vim 8 and Neovim with |timers|.
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-file.vim' " provide Language Server Protocol autocompletion source for asyncomplete.vim and vim-lsp.
Plug 'prabirshrestha/asyncomplete-lsp.vim'  " async Language Server Protocol plugin for vim8 and neovim.

Plug 'prabirshrestha/vim-lsp'
Plug 'liuchengxu/vista.vim'
Plug 'mattn/vim-lsp-settings'               " add suport for languages
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'thomasfaingnaert/vim-lsp-snippets'
Plug 'thomasfaingnaert/vim-lsp-neosnippet'
Plug 'honza/vim-snippets'
Plug 'rhysd/vim-clang-format'

"------------------------------------------"
"THEME"
Plug 'gruvbox-community/gruvbox'
Plug 'sainnhe/gruvbox-material'
Plug 'zZnghialamZz/vim-mini-collection'
Plug 'ayu-theme/ayu-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'dracula/vim', { 'name': 'dracula' }
Plug 'CreaturePhil/vim-handmade-hero'

call plug#end()
