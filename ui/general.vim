"=============================================================================
" ui/general.vim ---- General settings for ui related stuffs 
" Copyright (c) 2020 Nghia Lam
" Author: Nghia Lam <nghialam12795@gmail.com>
" URL: https://github.com/zZnghialamZz/nvim
" License: The Unlicense
"=============================================================================

" Highlight maximum file columns (set to 80 right now)
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

" Set extra options when running in GUI mode
if has("gui_running")
    set t_Co=256
    set guioptions-=m " remove menu bar
    set guioptions-=e
    set guioptions-=T " remove toolbar
    set guioptions-=r " remove right-hand scroll bar
    set guioptions-=L " remove left-hand scroll bar
    set guitablabel=%M\ %t
endif

" Enable 256 colors palette in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif
