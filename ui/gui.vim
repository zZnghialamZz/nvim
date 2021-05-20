"=============================================================================
" ui/gui.vim ---- UI settings for GUI
" Copyright (c) 2020 Nghia Lam
" Author: Nghia Lam <nghialam12795@gmail.com>
" URL: https://github.com/zZnghialamZz/nvim
" License: The Unlicense
"=============================================================================

let s:fontsize = 13

" execute "GuiFont! JetBrains Mono:h" . s:fontsize
execute "GuiFont! Fixedsys Excelsior 3.01:h" . s:fontsize
" execute "GuiFont! Iosevka NF:h" . s:fontsize

function! AdjustFontSize(amount)
  let s:fontsize = s:fontsize+a:amount
  " :execute "GuiFont! JetBrains Mono:h" . s:fontsize
  " :execute "GuiFont! Iosevka NF:h" . s:fontsize
  :execute "GuiFont! Fixedsys Excelsior 3.01:h" . s:fontsize
endfunction

noremap <C-ScrollWheelUp> :call AdjustFontSize(1)<CR>
noremap <C-ScrollWheelDown> :call AdjustFontSize(-1)<CR>
inoremap <C-ScrollWheelUp> <Esc>:call AdjustFontSize(1)<CR>a
inoremap <C-ScrollWheelDown> <Esc>:call AdjustFontSize(-1)<CR>a

" NEOVIDE
if exists('g:neovide')
  " set guifont=Iosevka\ NF:h16   "set to use my favorite font
  set guifont=Fixedsys\ Excelsior\ 3.01:h16   "set to use my favorite font
  " set guifont=JetBrains\ Mono:h16
  let g:neovide_transparency=0.95
  let g:neovide_fullscreen=v:true
  let g:neovide_cursor_vfx_mode = "wireframe"
  let g:neovide_cursor_animation_length=0.09
endif
