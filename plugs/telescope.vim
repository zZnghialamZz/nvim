"=============================================================================
" File: plugs/telescope.vim
" Brief: Settings for telescope plugin
" Author: Nghia Lam <nghialam12795@gmail.com>
" URL: https://github.com/zZnghialamZz/nvim
" License: Copyright (c) 2021 Nghia Lam - The Unlicense
"=============================================================================

nnoremap <leader>ps <cmd>Telescope live_grep<cr>
nnoremap <leader>pF <cmd>Telescope git_files<cr>
nnoremap <leader>pf <cmd>Telescope find_files<cr>
nnoremap <leader>ph <cmd>Telescope help_tags<cr>
nnoremap <leader>pb <cmd>Telescope buffers<cr>
nnoremap <leader>: <cmd>Telescope commands<cr>
nnoremap <leader>ot <cmd>Telescope colorscheme<cr>

lua << EOF
  -- You dont need to set any of these options. These are the default ones. Only
  -- the loading is important
  require('telescope').setup {
    pickers = {
      find_files = {
        theme = "dropdown",
      }
    },
    extensions = {
      fzf = {
        fuzzy = true,                    -- false will only do exact matching
        override_generic_sorter = true,  -- override the generic sorter
        override_file_sorter = true,     -- override the file sorter
        case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                         -- the default case_mode is "smart_case"
      }
    }
  }
  -- To get fzf loaded and working with telescope, you need to call
  -- load_extension, somewhere after setup function:
  require('telescope').load_extension('fzf')
  require('telescope').load_extension('fzy_native')
EOF
