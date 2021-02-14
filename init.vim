"=============================================================================
" init.vim ---- Entry file for neovim
" Copyright (c) 2020 Nghia Lam
" Author: Nghia Lam <nghialam12795@gmail.com>
" URL: https://github.com/zZnghialamZz/nvim
" License: The Unlicense
"=============================================================================
"
" TODO (Nghia Lam):
"   - A project workflow similar to 4ed.
"
" Sections:
"
"   GENERAL
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/utils/settings.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/utils/mapping.vim'

"   VIM-PLUG
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/plugs/init.vim'

"   UI
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/ui/general.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/ui/theme.vim'
if has("gui_running")
  execute 'source' fnamemodify(expand('<sfile>'), ':h').'/ui/gui.vim'
endif
if exists('g:neovide')
  execute 'source' fnamemodify(expand('<sfile>'), ':h').'/ui/neovide.vim'
endif

"   PLUGINS
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/plugs/airline.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/plugs/align.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/plugs/choosewin.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/plugs/cursor.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/plugs/ctrlsf.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/plugs/format.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/plugs/fzf.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/plugs/lsp.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/plugs/nerdtree.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/plugs/snippet.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/plugs/vista.vim'


"   HELPERS
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/helpers/term.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/helpers/comment.vim'

"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
