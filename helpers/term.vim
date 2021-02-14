"=============================================================================
" helpers/term.vim ---- Helper functions for terminal in Vim
" Copyright (c) 2020 Nghia Lam
" Author: Nghia Lam <nghialam12795@gmail.com>
" URL: https://github.com/zZnghialamZz/nvim
" License: The Unlicense
"=============================================================================

let g:term_buf = 0
let g:term_win = 0

function! TermToggle(height)
  if win_gotoid(g:term_win)
    hide
  else
    botright new
    exec "resize " . a:height
    try
      exec "buffer " . g:term_buf
    catch
      "call termopen($SHELL, {"detach": 0})
      terminal
      let g:term_buf = bufnr("")
      set nonumber
      set norelativenumber
      set signcolumn=no
    endtry
    startinsert!
    let g:term_win = win_getid()
  endif
endfunction

" Toggle terminal on/off (neovim)
nnoremap <A-t> :call TermToggle(16)<CR>
inoremap <A-t> <Esc>:call TermToggle(16)<CR>
tnoremap <A-t> <C-\><C-n>:call TermToggle(16)<CR>

" Terminal go back to normal mode
tnoremap <Esc> <C-\><C-n>
tnoremap :q! <C-\><C-n>:q!<CR>
