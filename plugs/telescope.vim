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
  -- Setting for quicker preview
  local previewers = require('telescope.previewers')

  local _bad = { '.*%.csv', '.*%.lua', '.*%.png', '.*%.meta' }
  local bad_files = function(filepath)
    for _, v in ipairs(_bad) do
      if filepath:match(v) then
        return false
      end
    end

    return true
  end

  local new_maker = function(filepath, bufnr, opts)
    opts = opts or {}
    if opts.use_ft_detect == nil then opts.use_ft_detect = true end
    opts.use_ft_detect = opts.use_ft_detect == false and false or bad_files(filepath)
    previewers.buffer_previewer_maker(filepath, bufnr, opts)
  end

  -- You dont need to set any of these options. These are the default ones. Only
  -- the loading is important
  require('telescope').setup {
    defaults = {
      buffer_previewer_maker = new_maker,
      preview = {
        filesize_hook = function(filepath, bufnr, opts)
          local max_bytes = 10000
          local cmd = {"head", "-c", max_bytes, filepath}
          require('telescope.previewers.utils').job_maker(cmd, bufnr, opts)
        end
      }
    },
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
