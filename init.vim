"=============================================================================
" init.vim ---- Entry file for neovim
" Copyright (c) 2020 Nghia Lam
" Author: Nghia Lam <nghialam12795@gmail.com>
" URL: https://github.com/zZnghialamZz/nvim
" License: The Unlicense
"=============================================================================
"
" TODO (Nghia Lam):
"   - A project workflow similar to 4ed.
"
" Sections:
"
"   GENERAL
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/utils/settings.vim'

"   VIM-PLUG
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/plugs/init.vim'

"   UI
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/ui/general.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/ui/theme.vim'
if has("gui_running")
  execute 'source' fnamemodify(expand('<sfile>'), ':h').'/ui/gui.vim'
endif
if exists('g:neovide')
  execute 'source' fnamemodify(expand('<sfile>'), ':h').'/ui/neovide.vim'
endif

" => Editing mapping {{{

let g:mapleader=" "

inoremap jk <ESC>
nmap <C-g> <ESC>

nnoremap <Leader>bs :w<CR>

nnoremap <Leader>my "*y
vnoremap <Leader>my "*y
nnoremap <Leader>mp "*p
vnoremap <Leader>mp "*p

" Helper functions
let NERDSpaceDelims=1
command! -nargs=1 InsertTODO :normal! i <args>(Nghia Lam): <ESC>==
" TODO(Nghia Lam): Find a better way for this
function! AddTODO()
  InsertTODO TODO
  call NERDComment('n', 'toggle')
endfunction
function! AddNOTE()
  InsertTODO NOTE
  call NERDComment('n', 'toggle')
endfunction
function! AddFIXME()
  InsertTODO FIXME
  call NERDComment('n', 'toggle')
endfunction

nmap <Leader>at :call AddTODO()<CR>
nmap <Leader>an :call AddNOTE()<CR>
nmap <Leader>af :call AddFIXME()<CR>

" Command mapping
command! C nohlsearch           "use :C to clear hlsearch

" window commands
nmap <Leader>wv :vsp<cr>
nmap <Leader>ws :split<cr>
nmap <Leader>wl <c-w><c-l>
nmap <Leader>wh <c-w><c-h>
nmap <Leader>wj <c-w><c-j>
nmap <Leader>wk <c-w><c-k>

if has("gui_running")
  au GUIEnter * simalt ~x "toggle maximized when using gvim
endif

" Quick command for vim config
command! Config execute ":e $MYVIMRC"
command! Reload execute "source $MYVIMRC"

" Custom Commands
nmap <S-h> ^
nmap <S-l> $
vnoremap <S-h> ^
vnoremap <S-l> $

nnoremap j gj
nnoremap k gk

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

nnoremap <Leader>bb :Buffers<CR>

" Make adjusing split sizes a bit more friendly
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>

nnoremap <Leader>gg :Lines<CR>
nnoremap <Leader>gG :BLines<CR>

nnoremap <Leader>sw :%s/\s\+$//<cr>:let @/=''<CR>
command! Stripwhitespace :%s/\s\+$//
command! Whitespacestrip :%s/\s\+$//

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"
imap <c-space> <Plug>(asyncomplete_force_refresh)

" Adding blank lines.
nnoremap <silent><expr> <CR> &buftype ==# 'quickfix' ? '<CR>' : ':<C-U>call append(".", repeat([""], v:count1))<CR>'
nnoremap <silent> <Leader>O :<C-U>call append(line('.') - 1, repeat([''], v:count1))<CR>

" Change window local current directory to the directory of the file at the current window.
nnoremap <silent> <Leader>cd :<C-U>lcd %:p:h<CR>" Plugin Commands

nnoremap <Leader>u :UndotreeShow<CR>
nnoremap <Leader>f :NERDTreeToggle<CR>

nnoremap <Leader>pF :Files<CR>
nnoremap <Leader>pf :GFiles<CR>
nnoremap <Leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" vista.vim
let g:vista_echo_cursor          = 0
let g:vista_echo_cursor_strategy = 'floating_win'
let g:vista_icon_indent          = ["'-> ", "|-> "]
let g:vista_fzf_preview          = ['right:50%']
let g:vista#renderer#enable_icon = 0

" Choose win Commands
nmap - <Plug>(choosewin)
let g:choosewin_overlay_enable = 1
let g:choosewin_overlay_clear_multibyte = 1

" LSP
" Disable diagnostics
let g:lsp_diagnostics_enabled = 0

" Disable highligh errors
let g:lsp_highlights_enabled = 0
let g:lsp_textprop_enabled = 0
let g:lsp_signs_priority = 1

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    " refer to doc to add more commands
endfunction

if executable('pyls')
    " pip install python-language-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ })
endif

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
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" Terminal Function
let g:term_buf = 0
let g:term_win = 0
function! TermToggle(height)
  if win_gotoid(g:term_win)
    hide
  else
    botright new
    exec "resize " . a:height
    try
      exec "buffer " . g:term_buf
    catch
      "call termopen($SHELL, {"detach": 0})
      terminal
      let g:term_buf = bufnr("")
      set nonumber
      set norelativenumber
      set signcolumn=no
    endtry
    startinsert!
    let g:term_win = win_getid()
  endif
endfunction

" Toggle terminal on/off (neovim)
nnoremap <A-t> :call TermToggle(16)<CR>
inoremap <A-t> <Esc>:call TermToggle(16)<CR>
tnoremap <A-t> <C-\><C-n>:call TermToggle(16)<CR>

" Terminal go back to normal mode
tnoremap <Esc> <C-\><C-n>
tnoremap :q! <C-\><C-n>:q!<CR>

" }}} end Editor mapping
" => Misc {{{

" Search
let g:ctrlsf_backend = 'rg'

" Multiple Cursor settings
let g:multi_cursor_use_default_mapping=0

let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

" Neosnippet configuration
imap <expr> <Tab> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<Tab>"
smap <expr> <Tab> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<Tab>"

" Nerdtree settings
let NERDTreeMinimalUI    = 1
let NERDTreeShowHidden   = 1
let g:NERDTreeIgnore     = []
let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" FZF settings
" let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let g:fzf_layout = { 'window': { 'width': 1, 'height': 0.4, 'yoffset': 1, 'border': 'horizontal' } }
let $FZF_DEFAULT_OPTS='--reverse'
let g:fzf_branch_actions = {
      \ 'rebase': {
      \   'prompt': 'Rebase> ',
      \   'execute': 'echo system("{git} rebase {branch}")',
      \   'multiple': v:false,
      \   'keymap': 'ctrl-r',
      \   'required': ['branch'],
      \   'confirm': v:false,
      \ },
      \ 'track': {
      \   'prompt': 'Track> ',
      \   'execute': 'echo system("{git} checkout --track {branch}")',
      \   'multiple': v:false,
      \   'keymap': 'ctrl-t',
      \   'required': ['branch'],
      \   'confirm': v:false,
      \ },
      \}

let loaded_matchparen    = 1
let g:netrw_browse_split = 2
let g:vrfr_rg            = 'true'
let g:netrw_banner       = 0
let g:netrw_winsize      = 25
"let g:clang_format#auto_format=1
"let g:clang_format#auto_format_on_insert_leave=1      "Automatically format when exiting insert mode
let g:clang_format#style_options = {
      \ "AlignConsecutiveAssignments" : "true",
      \ "AlignConsecutiveMacros" : "true",
      \ "AllowAllArgumentsOnNextLine" : "false",
      \ "AllowAllParametersOfDeclarationOnNextLine" : "false",
      \ "AllowShortIfStatementsOnASingleLine" : "true",
      \ "AlignEscapedNewlines" : "Right",
      \ "AlignTrailingComments" : "true",
      \ "AlwaysBreakTemplateDeclarations" : "Yes",
      \ "BreakBeforeTernaryOperators" : "true",
      \ "BreakConstructorInitializers" : "BeforeComma",
      \ "DerivePointerAlignment" : "false",
      \ "PointerAlignment" : "Left",
      \ "UseTab" : "Never",
      \ "Standard" : "C++11"}

let g:airline_section_z = '%{strftime("%H:%M")}'
" }}} end Misc
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
