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

" Insert mode movement (Emacs)
inoremap <C-f> <Right>
inoremap <C-b> <Left>
" inoremap <C-e> <C-o>$
" inoremap <C-a> <C-o>^

" Repeat the last colon command
nnoremap <C-p> @:<CR>

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
nmap <Leader>ws :split<cr>
nmap <Leader>wv :vsp<cr>
nmap <Leader>wl <c-w><c-l>
nmap <Leader>wh <c-w><c-h>
nmap <Leader>wj <c-w><c-j>
nmap <Leader>wk <c-w><c-k>
nmap <Leader>wL <c-w>L
nmap <Leader>wH <c-w>H
nmap <Leader>wJ <c-w>J
nmap <Leader>wK <c-w>K
nmap <Leader>wr <c-w>r
nmap <Leader>wx <c-w>x
nmap <Leader>ww <c-w>w

" Make adjusing split sizes a bit more friendly
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>

" Quick command for vim config
command! Config execute ":e $MYVIMRC"
command! Reload execute "source $MYVIMRC"

" Horizontal line movement
nnoremap <S-h> ^
nnoremap <S-l> $
vnoremap <S-h> ^
vnoremap <S-l> $
" Vertical line movement
nnoremap j gj
nnoremap k gk
nnoremap <C-j> }
nnoremap <C-k> {

nnoremap <M-j> 15j
nnoremap <M-k> 15k
vnoremap <M-j> 15j
vnoremap <M-k> 15k

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
vnoremap <C-j> }
vnoremap <C-k> {

nnoremap <Leader>sw :%s/\s\+$//<cr>:let @/=''<CR>
command! Stripwhitespace :%s/\s\+$//
command! Whitespacestrip :%s/\s\+$//

" Adding blank lines.
nnoremap <silent><expr> <CR> &buftype ==# 'quickfix' ? '<CR>' : ':<C-U>call append(".", repeat([""], v:count1))<CR>'
nnoremap <silent> <Leader>O :<C-U>call append(line('.') - 1, repeat([''], v:count1))<CR>

" Change window local current directory to the directory of the file at the current window.
nnoremap <silent> <Leader>cd :<C-U>lcd %:p:h<CR>" Plugin Commands

nnoremap <Leader>u :UndotreeShow<CR>
nnoremap <Leader>f :NERDTreeToggle<CR>

" Toggle hybrid line number
function! ToggleLineNumber()
    set number! relativenumber!
endfunction

nnoremap <Leader>tl :call ToggleLineNumber()<CR>
