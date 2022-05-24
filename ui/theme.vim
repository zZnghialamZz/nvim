"=============================================================================
" ui/theme.vim ---- Theme settings for vim
" Copyright (c) 2020 Nghia Lam
" Author: Nghia Lam <nghialam12795@gmail.com>
" URL: https://github.com/zZnghialamZz/nvim
" License: The Unlicense
"=============================================================================

let g:gruvbox_contrast_dark='hard'
let g:gruvbox_termcolors=16
let g:solarized_termcolors=256

if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

let g:use_dark_theme = 0
function! ToggleTheme()
    if g:use_dark_theme == 1
        colorscheme rastafari
        set background=dark
    else
        colorscheme paper
        set background=light
        let g:airline_theme='minimalist'
    endif
    let g:use_dark_theme = !g:use_dark_theme
endfunction

colorscheme rastafari
set background=dark

nnoremap <Leader>tt :call ToggleTheme()<CR>
