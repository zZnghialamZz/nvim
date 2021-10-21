"=e============================================================================
" project_management.vim ---- Setup things for project managements
" Copyright (c) 2020 Nghia Lam
" Author: Nghia Lam <nghialam12795@gmail.com>
" URL: https://github.com/zZnghialamZz/nvim
" License: The Unlicense
"=============================================================================

" TODO(Nghia Lam): This needs to be expanded and support other dev env

" Ensure the buffer for building code opens in a new view
" set switchbuf=useopen,split

" Thanks to https://forums.handmadehero.org/index.php/forum?view=topic&catid=4&id=704#3982
" error message formats
" Microsoft MSBuild
set errorformat+=\\\ %#%f(%l\\\,%c):\ %m
" Microsoft compiler: cl.exe
set errorformat+=\\\ %#%f(%l)\ :\ %#%t%[A-z]%#\ %m
" Microsoft HLSL compiler: fxc.exe
set errorformat+=\\\ %#%f(%l\\\,%c-%*[0-9]):\ %#%t%[A-z]%#\ %m


function! DoBuildBatchFile()
    " build.bat
    set makeprg=build
    " Make sure the output doesnt interfere with anything
    silent make
    " Open the output buffer
    copen
    echo 'Build Complete'
endfunction

" Set F1 to build. I like using this since I use visual studio with the c++
" build env
nnoremap <F1> :call DoBuildBatchFile()<CR>

" Go to next error
nnoremap <F2> :cn<CR>
nnoremap <M-n> :cn<CR>
" Go to previous error
nnoremap <F3> :cp<CR>
nnoremap <M-p> :cp<CR>

" Close the window
nnoremap <M-c> :cclose<CR>
