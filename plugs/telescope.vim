"=============================================================================
" plugs/telescope.vim ---- Settings for telescope plugin
" Copyright (c) 2021 Nghia Lam
" Author: Nghia Lam <nghialam12795@gmail.com>
" URL: https://github.com/zZnghialamZz/nvim
" License: The Unlicense
"=============================================================================

nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <leader>pF :lua require('telescope.builtin').git_files()<CR>
nnoremap <leader>pf :lua require('telescope.builtin').find_files()<CR>

nnoremap <leader>pw :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>
nnoremap <leader>pb :lua require('telescope.builtin').buffers()<CR>
nnoremap <leader>vh :lua require('telescope.builtin').help_tags()<CR>
