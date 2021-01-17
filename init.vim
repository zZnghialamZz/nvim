"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer:
"       Nghia Lam <nghialam12795@gmail.com>
"
" TODO (Nghia Lam):
"   - Organize this file to a more readable format.
"   - Add quickly TODO, NOTE, FIXME comment hotkey.
"   - A project workflow similar to 4ed.
"
" Sections:
"
" => General {{{
" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

syntax on

set exrc
set guicursor=
set backspace=indent,eol,start     "allow backspacing over everything in insert mode
set noerrorbells visualbell t_vb=  "remove annoying sound in vim
set relativenumber                 "relative number for line numbers
set lazyredraw                     "no redraw when executing macros
set cursorline                     "highlight current line
set hidden
set foldenable                     "enable folding
set foldnestmax=10                 "10 nested fold max
set foldmethod=marker
set foldlevel=0
set mouse=a                        "allow mouse
set magic                          "for regex
set showmatch                      "show matching bracket when cursor is over
set wildmenu
set wildoptions=pum
set pumblend=20
"set nohlsearch                     "not highlight stuff when jump searchs
set incsearch                      "increamental search
set tabstop=2 softtabstop=2
set shiftwidth=2
set splitright
set splitbelow
set termguicolors
set shortmess+=c
set expandtab
set smartindent
set nu
set nowrap
set undodir=~/.vim/undodir
set undofile
set scrolloff=8
set encoding=UTF-8
set list
set listchars=tab:→\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
set wildignorecase

" Display in one line is more than enough.
set cmdheight=1

" delays and poor user experience.
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
set updatetime=50

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

" }}} end General
" => VIM User Interface {{{

" Set extra options when running in GUI mode
if has("gui_running")
    set t_Co=256
    set guioptions-=m " remove menu bar
    set guioptions-=e
    set guioptions-=T " remove toolbar
    set guioptions-=r " remove right-hand scroll bar
    set guioptions-=L " remove left-hand scroll bar
    set guitablabel=%M\ %t
endif


" }}} end VIM User Interface
" => Plugins install {{{

" auto-install vim-plug
call plug#begin('~/.vim/plugged')

"------------------------------------------"
"GENERAL"
Plug 'terryma/vim-multiple-cursors'
Plug 'mbbill/undotree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'junegunn/vim-easy-align'
Plug 'vifm/vifm.vim'
Plug 't9md/vim-choosewin'
Plug 'haya14busa/vim-operator-flashy'
Plug 'dyng/ctrlsf.vim'
Plug 'jremmen/vim-ripgrep'

"------------------------------------------"
"LANGUAGE"
Plug 'sheerun/vim-polyglot'                 " all around languages
Plug 'plasticboy/vim-markdown'              " better markdown support

Plug 'kana/vim-operator-user'
Plug 'Shougo/vimproc.vim'

Plug 'prabirshrestha/async.vim'             " async autocompletion for Vim 8 and Neovim with |timers|.
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-file.vim' " provide Language Server Protocol autocompletion source for asyncomplete.vim and vim-lsp.
Plug 'prabirshrestha/asyncomplete-lsp.vim'  " async Language Server Protocol plugin for vim8 and neovim.

Plug 'prabirshrestha/vim-lsp'
Plug 'liuchengxu/vista.vim'
Plug 'mattn/vim-lsp-settings'               " add suport for languages
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'thomasfaingnaert/vim-lsp-snippets'
Plug 'thomasfaingnaert/vim-lsp-neosnippet'
Plug 'honza/vim-snippets'
Plug 'rhysd/vim-clang-format'

"------------------------------------------"
"THEME"
Plug 'gruvbox-community/gruvbox'
Plug 'sainnhe/gruvbox-material'
Plug 'tomasr/molokai'
Plug 'ayu-theme/ayu-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'dracula/vim', { 'name': 'dracula' }
Plug 'CreaturePhil/vim-handmade-hero'

call plug#end()

" }}} end Plugins Install
" => Colors {{{

" Enable 256 colors palette in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

" Theme
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_termcolors=16
let g:solarized_termcolors=256

if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

colorscheme gruvbox

set background=dark
set encoding=utf-8                          "set utf8 as standard encoding

" }}} end Color
" => Neovide Specific {{{
if exists('g:neovide')
  set guifont=Fixedsys\ Excelsior\ 3.01:h16   "set to use my favorite font
  "set guifont=JetBrains\ Mono:h16
  let g:neovide_transparency=0.95
  let g:neovide_fullscreen=v:true
  let g:neovide_cursor_vfx_mode = "wireframe"
  let g:neovide_cursor_animation_length=0.09
endif
" }}} end Neovide Specific
" => Files, backups and undo {{{

" Turn backup off, since most stuff is in SVN, git etc. anyway...
set nobackup
set nowb
set noswapfile

" }}} end Files, backup and undo
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

" vim-operator-flashy
map y <Plug>(operator-flashy)
map Y <Plug>(operator-flashy)$
let g:operator#flashy#group = 'Error'

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
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
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
