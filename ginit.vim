"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer:
"       Nghia Lam <nghialam12795@gmail.com>
"
" Sections:
"
" => Fonts {{{

let s:fontsize = 13

"execute "GuiFont! JetBrains Mono:h" . s:fontsize
execute "GuiFont! Fixedsys Excelsior 3.01:h" . s:fontsize

function! AdjustFontSize(amount)
  let s:fontsize = s:fontsize+a:amount
  ":execute "GuiFont! JetBrains Mono:h" . s:fontsize
  :execute "GuiFont! Fixedsys Excelsior 3.01:h" . s:fontsize
endfunction

noremap <C-ScrollWheelUp> :call AdjustFontSize(1)<CR>
noremap <C-ScrollWheelDown> :call AdjustFontSize(-1)<CR>
inoremap <C-ScrollWheelUp> <Esc>:call AdjustFontSize(1)<CR>a
inoremap <C-ScrollWheelDown> <Esc>:call AdjustFontSize(-1)<CR>a

" }}} end Fonts
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
