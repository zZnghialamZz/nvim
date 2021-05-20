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
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree'
Plug 'junegunn/vim-easy-align'
Plug 't9md/vim-choosewin'
Plug 'dyng/ctrlsf.vim'
Plug 'jremmen/vim-ripgrep'
Plug 'pelodelfuego/vim-swoop'
Plug 'jiangmiao/auto-pairs'
Plug 'andymass/vim-matchup'
Plug 'junegunn/goyo.vim'
Plug 'skywind3000/asyncrun.vim'

"------------------------------------------"
"PROGRAMMING"
Plug 'sheerun/vim-polyglot'                 " all around languages
Plug 'plasticboy/vim-markdown'              " better markdown support
Plug 'cdelledonne/vim-cmake'

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
Plug 'dart-lang/dart-vim-plugin'

"------------------------------------------"
"THEME"
Plug 'bfrg/vim-cpp-modern'
Plug 'gruvbox-community/gruvbox'
Plug 'sainnhe/gruvbox-material'
Plug 'zZnghialamZz/vim-mini-collection'
Plug 'CreaturePhil/vim-handmade-hero'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'dracula/vim', { 'name': 'dracula' }
Plug 'b4skyx/serenade'

call plug#end()
