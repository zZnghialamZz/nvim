"=============================================================================
" utils/mapping.vim ---- General mapping for vim
" Copyright (c) 2020 Nghia Lam
" Author: Nghia Lam <nghialam12795@gmail.com>
" URL: https://github.com/zZnghialamZz/nvim
" License: The Unlicense
"=============================================================================

let g:mapleader=" "

inoremap jk <ESC>
nmap <C-g> <ESC>

nnoremap <Leader>bs :w<CR>

nnoremap <Leader>my "*y
vnoremap <Leader>my "*y
nnoremap <Leader>mp "*p
vnoremap <Leader>mp "*p

" Better tabbing
vnoremap > >gv
vnoremap < <gv
nnoremap > <S-v>><esc>
nnoremap < <S-v><<esc>

" Command mapping
command! C nohlsearch           "use :C to clear hlsearch
" Kill search on escape
nnoremap <esc> :noh<return><esc>

" window commands
nmap <Leader>wv :vsp<cr>
nmap <Leader>ws :split<cr>
nmap <Leader>wl <c-w><c-l>
nmap <Leader>wh <c-w><c-h>
nmap <Leader>wj <c-w><c-j>
nmap <Leader>wk <c-w><c-k>

" Make adjusing split sizes a bit more friendly
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>

" Quick command for vim config
command! Config execute ":e $MYVIMRC"
command! Reload execute "source $MYVIMRC"

" Horizontal line movement
nnoremap <S-h> g^
nnoremap <S-l> g$
vnoremap <S-h> g^
vnoremap <S-l> g$
" Vertical line movement
nnoremap j gj
nnoremap k gk

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

nnoremap <Leader>bb :Buffers<CR>
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
