"=============================================================================
" plugs/present.vim ---- Settings for presenting plugin
" Copyright (c) 2020 Nghia Lam
" Author: Nghia Lam <nghialam12795@gmail.com>
" URL: https://github.com/zZnghialamZz/nvim
" License: The Unlicense
"=============================================================================

" Support .md extension for markdown presenting
autcmd BufRead,BufNewFile *.md setlocal filetype=markdown
