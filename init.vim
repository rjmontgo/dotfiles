syntax on

set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~./.vim/undodir
set undofile
set incsearch

set colorcolumn=80
highlight ColorColumn ctermbg=darkgray

call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'leafgarland/typescript-vim'
Plug 'vim-utils/vim-man'
Plug 'https://github.com/ctrlpvim/ctrlp.vim.git'
Plug 'https://github.com/ycm-core/YouCompleteMe.git'
Plug 'mbbill/undotree'

call plug#end()

colorscheme gruvbox
set background=dark

set completeopt-=preview

" Gives <CR> open in a new vertical tab
"" let g:netrw_browse_split=2

" open vertical tabs to the right instead of left
let g:netrw_altv=1

" Whenever netrw is opened it has an initial window size of 75%
let g:netrw_winsize=75

" set the directory list style to be a tree
let g:netrw_liststyle=3

" Remove banner at the top of file explorer
let g:netrw_banner=0

let mapleader=" "

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>

nnoremap <silent> <leader>gd :YcmCompleter GoTo<CR>
nnoremap <silent> <leader>gr :YcmCompleter GoToReferences<CR>

" ycm doesn't support javascriptreact file types yet so set it manually
au BufNewFile,BufRead *.jsx set filetype=javascript
