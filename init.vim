syntax on

set guicursor=
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2
set splitright
set termguicolors
set shortmess+=c
set t_Co=256
set expandtab
set smartindent
set nu
set nowrap
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set scrolloff=8
set encoding=utf-8

" Give more space for displaying messages.
set cmdheight=2

" delays and poor user experience.
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
set updatetime=50

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey
highlight Pmenu ctermbg=111217 guibg=#11121

" auto-install vim-plug                                                                                                                
if empty(glob('~/.config/nvim/autoload/plug.vim'))                                                                                    
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim                                                             
  autocmd VimEnter * PlugInstall                                                                                                      
endif 

call plug#begin('~/.config/nvim/plugged')

Plug 'terryma/vim-multiple-cursors'
" Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
" Plug 'tweekmonster/gofmt.vim'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'vim-utils/vim-man'
Plug 'mbbill/undotree'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vuciv/vim-bujo'
Plug 'godlygeek/tabular'

"------------------------------------------"
"LANGUAGE"
Plug 'plasticboy/vim-markdown' "better markdown support
Plug 'rhysd/vim-clang-format'
" New autocomplete
" Async support
Plug 'prabirshrestha/async.vim'
" Async autocompletion for Vim 8 and Neovim with |timers|.
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-file.vim'
" Provide Language Server Protocol autocompletion source for asyncomplete.vim and vim-lsp.
Plug 'prabirshrestha/asyncomplete-lsp.vim'
" Async Language Server Protocol plugin for vim8 and neovim.
Plug 'prabirshrestha/vim-lsp'
" Add suport for languages
Plug 'mattn/vim-lsp-settings'

"------------------------------------------"
"THEME"
Plug 'gruvbox-community/gruvbox'
Plug 'sainnhe/gruvbox-material'
Plug 'phanviet/vim-monokai-pro'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'flazz/vim-colorschemes'
Plug 'preservim/nerdtree'

call plug#end()

" theme
let g:gruvbox_contrast_dark = 'hard'
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

colorscheme gruvbox
set background=dark

if executable('rg')
    let g:rg_derive_root='true'
endif

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

let loaded_matchparen = 1
let mapleader = " "

let g:netrw_browse_split = 2
let g:vrfr_rg = 'true'
let g:netrw_banner = 0
let g:netrw_winsize = 25

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeShowHidden = 1

"Key Map"
inoremap jk <ESC>

nnoremap <Leader>bs :w<CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <Leader>ps :Rg<SPACE>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>f :NERDTreeToggle<CR>
nnoremap <Leader>pf :Files<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
nnoremap <C-p> :GFiles<CR>

" open header fswitch
nmap <silent> <F4> :FSHere<cr>
nmap <silent> <Leader>of :FSHere<cr>
nmap <silent> <Leader>ol :FSRight<cr>
nmap <silent> <Leader>oL :FSSplitRight<cr>
nmap <silent> <Leader>oh :FSLeft<cr>
nmap <silent> <Leader>oH :FSSplitLeft<cr>
nmap <silent> <Leader>ok :FSAbove<cr>
nmap <silent> <Leader>oK :FSSplitAbove<cr>
nmap <silent> <Leader>oj :FSBelow<cr>
nmap <silent> <Leader>oJ :FSSplitBelow<cr>

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

inoremap <C-c> <esc>

" Quick command for vim config
command! Config execute ":e $MYVIMRC"
command! Reload execute "source ~/.config/nvim/init.vim"

"strip whitespace
nnoremap <leader>sw :%s/\s\+$//<cr>:let @/=''<CR>
command! Stripwhitespace :%s/\s\+$//
command! Whitespacestrip :%s/\s\+$//

" Git Config
nnoremap <leader>gc :GBranches<CR>
nnoremap <leader>ga :Git fetch --all<CR>

" vim TODO
nmap <Leader>tu <Plug>BujoChecknormal
nmap <Leader>th <Plug>BujoAddnormal
let g:bujo#todo_file_path = $HOME . "/.cache/bujo"

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"
imap <c-space> <Plug>(asyncomplete_force_refresh)

" Disable diagnostics
" let g:lsp_diagnostics_enabled = 0
let g:lsp_signs_error = {'text': '✗'}
let g:lsp_signs_warning = {'text': '%'}
" Disable highligh errors
let g:lsp_highlights_enabled = 0
let g:lsp_textprop_enabled = 0
let g:lsp_signs_priority = 11

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    " refer to doc to add more commands
endfunction

nmap <F12> <plug>(lsp-declaration)
nmap gd <plug>(lsp-declaration)
nmap gD <plug>(lsp-definition)
nmap gp <plug>(lsp-peek-declaration)
nmap gP <plug>(lsp-peek-definition)
nmap ge <plug>(lsp-next-diagnostic)
nmap gh <plug>(lsp-hover)
nmap gr <plug>(lsp-references)
nmap gu <plug>(lsp-references)
nmap gE <plug>(lsp-document-diagnostics)
nmap ga <plug>(lsp-code-action)
nmap <leader>ya <plug>(lsp-code-action)
nmap <leader>yj <plug>(lsp-declaration)
nmap <leader>yg <plug>(lsp-declaration)
nmap <leader>yd <plug>(lsp-peek-declaration)
nmap <leader>ys <plug>(lsp-status)

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
    \ 'name': 'file',
    \ 'whitelist': ['*'],
    \ 'priority': 10,
    \ 'completor': function('asyncomplete#sources#file#completor')
    \ }))
