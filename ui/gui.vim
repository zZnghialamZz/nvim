"=============================================================================
" ui/gui.vim ---- UI settings for GUI
" Copyright (c) 2020 Nghia Lam
" Author: Nghia Lam <nghialam12795@gmail.com>
" URL: https://github.com/zZnghialamZz/nvim
" License: The Unlicense
"=============================================================================

let s:fontsize = 13

" execute "GuiFont! JetBrains Mono:h" . s:fontsize
" execute "GuiFont! Fixedsys Excelsior 3.01:h" . s:fontsize
" execute "GuiFont! Iosevka NF:h" . s:fontsize
execute "GuiFont! Liberation Mono:h" . s:fontsize

function! AdjustFontSize(amount)
  let s:fontsize = s:fontsize+a:amount
  " :execute "GuiFont! JetBrains Mono:h" . s:fontsize
  " :execute "GuiFont! Iosevka NF:h" . s:fontsize
  " :execute "GuiFont! Fixedsys Excelsior 3.01:h" . s:fontsize
  :execute "GuiFont! Liberation Mono:h" . s:fontsize
endfunction

noremap <M--> :call AdjustFontSize(1)<CR>
noremap <M-+> :call AdjustFontSize(1)<CR>

noremap <C-ScrollWheelUp> :call AdjustFontSize(1)<CR>
noremap <C-ScrollWheelDown> :call AdjustFontSize(-1)<CR>
inoremap <C-ScrollWheelUp> <Esc>:call AdjustFontSize(1)<CR>a
inoremap <C-ScrollWheelDown> <Esc>:call AdjustFontSize(-1)<CR>a
