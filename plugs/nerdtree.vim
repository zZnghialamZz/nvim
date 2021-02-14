"=============================================================================
" plugs/nerdtree.vim ---- Settings for nerdtree plugin
" Copyright (c) 2020 Nghia Lam
" Author: Nghia Lam <nghialam12795@gmail.com>
" URL: https://github.com/zZnghialamZz/nvim
" License: The Unlicense
"=============================================================================

let NERDSpaceDelims      = 1
let NERDTreeMinimalUI    = 1
let NERDTreeShowHidden   = 1
let g:NERDTreeIgnore     = []
let g:NERDTreeStatusline = ''

" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
