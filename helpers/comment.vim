"=============================================================================
" helpers/comment.vim ---- Helper functions for comment in Vim
" Copyright (c) 2020 Nghia Lam
" Author: Nghia Lam <nghialam12795@gmail.com>
" URL: https://github.com/zZnghialamZz/nvim
" License: The Unlicense
"=============================================================================

command! -nargs=1 InsertTODO :normal! i <args>(Nghia Lam): <ESC>==

" TODO(Nghia Lam): Find a better way for this
function! AddTODO()
  InsertTODO TODO
  call NERDComment('n', 'toggle')
endfunction
function! AddNOTE()
  InsertTODO NOTE
  call NERDComment('n', 'toggle')
endfunction
function! AddFIXME()
  InsertTODO FIXME
  call NERDComment('n', 'toggle')
endfunction

nmap <Leader>at :call AddTODO()<CR>
nmap <Leader>an :call AddNOTE()<CR>
nmap <Leader>af :call AddFIXME()<CR>
