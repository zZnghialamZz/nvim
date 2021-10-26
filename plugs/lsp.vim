"=============================================================================
" plugs/lsp.vim ---- Settings for lsp plugin
" Copyright (c) 2020 Nghia Lam
" Author: Nghia Lam <nghialam12795@gmail.com>
" URL: https://github.com/zZnghialamZz/nvim
" License: The Unlicense
"=============================================================================

set completeopt=menu,menuone,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

nnoremap <leader>lu :SymbolsOutline<CR>
nnoremap <leader>ld <cmd>Telescope lsp_definitions<CR>
nnoremap <leader>li :lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>lg <cmd>Telescope lsp_references<CR>
nnoremap <leader>lf :lua vim.lsp.buf.formatting()<CR>
nnoremap <leader>lw <cmd>Telescope lsp_workspace_symbols<CR>
nnoremap <leader>ln :lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <leader>lD :Lspsaga preview_definition<CR>
nnoremap <leader>la :Lspsaga code_action<CR>
nnoremap <leader>lh :Lspsaga hover_doc<CR>
nnoremap <leader>lr :Lspsaga rename<CR>
nnoremap <leader>lsh :Lspsaga signature_help<CR>
nnoremap <leader>lss :Lspsaga lsp_finder<CR>

let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.documentation = v:true

let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.calc = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true
let g:compe.source.vsnip = v:true
let g:compe.source.ultisnips = v:true
let g:compe.source.luasnip = v:true

" Config autocmd and setup languageserver
" ---
lua << EOF
    -- Setup nvim-cmp.
    local cmp = require'cmp'

    cmp.setup({
        snippet = {
            expand = function(args)
                -- For `vsnip` user.
                -- vim.fn["vsnip#anonymous"](args.body)
                -- For `luasnip` user.
                -- require('luasnip').lsp_expand(args.body)
                -- For `ultisnips` user.
                -- vim.fn["UltiSnips#Anon"](args.body)
            end,
        },
        mapping = {
            ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
            ['<C-u>'] = cmp.mapping.scroll_docs(-4),
            ['<C-d>'] = cmp.mapping.scroll_docs(4),
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<C-e>'] = cmp.mapping.close(),
            ['<CR>'] = cmp.mapping.confirm({ select = true }),
        },

        sources = {
            { name = 'nvim_lsp' },

            -- For vsnip user.
            -- { name = 'vsnip' },
            -- For luasnip user.
            -- { name = 'luasnip' },
            -- For ultisnips user.
            -- { name = 'ultisnips' },

            { name = 'buffer' },
        }
    })

    local function config(_config)
        return vim.tbl_deep_extend("force", {
            capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
        }, _config or {})
    end

    -- C#
    -- ------------------------------------------------------------------------
    local pid = vim.fn.getpid()

    -- On linux/darwin if using a release build, otherwise under scripts/OmniSharp(.Core)(.cmd)
    -- local omnisharp_bin = "/path/to/omnisharp-repo/run"
    -- on Windows
    local omnisharp_bin = "C:/Users/Nghia/AppData/Local/nvim-data/lsp_servers/omnisharp/omnisharp/OmniSharp.exe"

    require'lspconfig'.omnisharp.setup (config({
        cmd = { omnisharp_bin, "--languageserver" , "--hostPID", tostring(pid) };
    }))

    -- Vim
    -- ------------------------------------------------------------------------
    require'lspconfig'.vimls.setup(config())
EOF

" Config the lspsaga package
" ---
lua << EOF
    local saga = require 'lspsaga'
    saga.init_lsp_saga {
        use_saga_diagnostic_sign = true,
        error_sign = 'E',
        warn_sign = 'W',
        hint_sign = 'H',
        infor_sign = 'I',
        dianostic_header_icon = '',
        code_action_icon = '',
        code_action_prompt = {
          enable = true,
          sign = true,
          sign_priority = 20,
          virtual_text = true,
        },
        finder_definition_icon = '►  ',
        finder_reference_icon = '✎  ',
        border_style = "round",
    }
EOF

" Config the symbols-outline package
" ---
lua << EOF
    local opts = {
        -- whether to highlight the currently hovered symbol
        -- disable if your cpu usage is higher than you want it
        -- or you just hate the highlight
        -- default: true
        highlight_hovered_item = true,

        -- whether to show outline guides
        -- default: true
        show_guides = true,
        symbols = {
            File = {icon = "⍞ ", hl = "TSURI"},
            Module = {icon = "❐ ", hl = "TSNamespace"},
            Namespace = {icon = "▼", hl = "TSNamespace"},
            Package = {icon = "▧ ", hl = "TSNamespace"},
            Class = {icon = "∁", hl = "TSType"},
            Method = {icon = "ƒ", hl = "TSMethod"},
            Property = {icon = "Ρ", hl = "TSMethod"},
            Field = {icon = "ʃ", hl = "TSField"},
            Constructor = {icon = "Σ", hl = "TSConstructor"},
            Enum = {icon = "ℰ", hl = "TSType"},
            Interface = {icon = "I", hl = "TSType"},
            Function = {icon = "ƒ", hl = "TSFunction"},
            Variable = {icon = "α", hl = "TSConstant"},
            Constant = {icon = "θ", hl = "TSConstant"},
            String = {icon = "ξ", hl = "TSString"},
            Number = {icon = "#", hl = "TSNumber"},
            Boolean = {icon = "⊨", hl = "TSBoolean"},
            Array = {icon = "⌸ ", hl = "TSConstant"},
            Object = {icon = "⦿", hl = "TSType"},
            Key = {icon = "k", hl = "TSType"},
            Null = {icon = "NULL", hl = "TSType"},
            EnumMember = {icon = "ε", hl = "TSField"},
            Struct = {icon = "δ", hl = "TSType"},
            Event = {icon = "Ψ", hl = "TSType"},
            Operator = {icon = "+", hl = "TSOperator"},
            TypeParameter = {icon = "Τ", hl = "TSParameter"}
        },
    }

    require('symbols-outline').setup(opts)
EOF

augroup LSP
    autocmd!
    autocmd BufEnter,BufWinEnter,TabEnter *.rs :lua require'lsp_extensions'.inlay_hints{}
augroup END
