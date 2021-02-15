"=============================================================================
" ui/gui.vim ---- UI settings for GUI
" Copyright (c) 2020 Nghia Lam
" Author: Nghia Lam <nghialam12795@gmail.com>
" URL: https://github.com/zZnghialamZz/nvim
" License: The Unlicense
"=============================================================================

let s:fontsize = 16

exec 'set guifont=Fixedsys\ Excelsior\ 3.01:h' . s:fontsize
" exec 'set guifont=JetBrains\ Mono:h' . s:fontsize

function! AdjustFontSize(amount)
  let s:fontsize = s:fontsize+a:amount
  exec 'set guifont=Fixedsys\ Excelsior\ 3.01:h' . s:fontsize
  " exec 'set guifont=JetBrains\ Mono:h' . s:fontsize
endfunction

noremap <C-S-Up> :call AdjustFontSize(1)<CR>
noremap <C-S-Down> :call AdjustFontSize(-1)<CR>
inoremap <C-S-Up> <Esc>:call AdjustFontSize(1)<CR>a
inoremap <C-S-Down> <Esc>:call AdjustFontSize(-1)<CR>a

let g:neovide_transparency=0.95
let g:neovide_fullscreen=v:true
let g:neovide_cursor_vfx_mode = "wireframe"
let g:neovide_cursor_animation_length=0.05
