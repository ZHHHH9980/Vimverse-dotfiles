set relativenumber


" save
nmap Q :q<CR>
nmap S :w<CR>
" noremap R :source $MYVIMRC<CR>

" remap <^>  up dowm left right
nnoremap i k
nnoremap k j
nnoremap j h
vnoremap i k
vnoremap k j
vnoremap j h

" switch normal mode to insert mode
" noremap <Space> a
noremap h i

" to the end
nnoremap L A
" to the begin
nnoremap J ^
nnoremap H I

inoremap jk <ESC>


