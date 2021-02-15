"=============================================================================
" plugs/lsp.vim ---- Settings for lsp plugin
" Copyright (c) 2020 Nghia Lam
" Author: Nghia Lam <nghialam12795@gmail.com>
" URL: https://github.com/zZnghialamZz/nvim
" License: The Unlicense
"=============================================================================

" Disable diagnostics
let g:lsp_diagnostics_enabled = 0

" Disable highligh errors
let g:lsp_highlights_enabled  = 0
let g:lsp_textprop_enabled    = 0
let g:lsp_signs_priority      = 1

function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  setlocal signcolumn=yes
  " refer to doc to add more commands
endfunction

" if executable('pyls')
  " " pip install python-language-server
  " au User lsp_setup call lsp#register_server({
        " \ 'name': 'pyls',
        " \ 'cmd': {server_info->['pyls']},
        " \ 'whitelist': ['python'],
        " \ })
" endif

nmap <Leader>gd <plug>(lsp-declaration)
nmap <Leader>gD <plug>(lsp-definition)
nmap <Leader>gp <plug>(lsp-peek-declaration)
nmap <Leader>gP <plug>(lsp-peek-definition)
nmap <Leader>ge <plug>(lsp-next-diagnostic)
nmap <Leader>gh <plug>(lsp-hover)
nmap <Leader>gr <plug>(lsp-references)
nmap <Leader>gu <plug>(lsp-references)
nmap <Leader>gE <plug>(lsp-document-diagnostics)
nmap <Leader>ga <plug>(lsp-code-action)
nmap <Leader>ya <plug>(lsp-code-action)
nmap <Leader>yj <plug>(lsp-declaration)
nmap <Leader>yg <plug>(lsp-declaration)
nmap <Leader>yd <plug>(lsp-peek-declaration)
nmap <Leader>ys <plug>(lsp-status)

augroup lsp_install
  au!
  " call s:on_lsp_buffer_enabled only for languages that has the server
  " registered.
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
