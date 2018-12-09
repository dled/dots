""------------------------------------------------
"" (.vimrc) Basic Settings - vim-plug
""------------------------------------------------
if 0 | endif

set laststatus=2
set nocompatible
set encoding=utf-8
set wildmenu
set lazyredraw

set history=256
set nobackup
set nowritebackup
set noswf

set ruler
set number
set novisualbell
set noerrorbells

set notimeout
set ttimeout
set ttimeoutlen=100

set incsearch
set hlsearch
set smartcase
set showmatch

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright

"set autoindent
"set tabstop=4
"set softtabstop=4
"set shiftwidth=4
"set expandtab
"set backspace=indent,eol,start
"set nowrap

syntax match Tab /\t/
hi Tab ctermbg=blue

nnoremap gV `[v`]

nnoremap <space> za
set foldenable
set foldmethod=indent
set foldnestmax=10
set foldlevelstart=10

function! <SID>TrimWS()
let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction

" local filetype settings
filetype on
filetype plugin indent on

" filetypes
augroup filetypes
    autocmd!
    autocmd Filetype css,ruby,eruby,yaml set ai sw=2 sts=2 et
    autocmd Filetype js set ai sw=4 sts=4 et
    autocmd Filetype tsv set sw=8 sts=8 noexpandtab
augroup END

augroup buflocal
    autocmd!
    autocmd VimEnter * highlight clear SignColumn
    autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.rb :call <SID>TrimwWS()
    autocmd BufEnter *.cls setlocal filetype=java
    autocmd BufEnter *.zsh-theme setlocal filetype=zsh
    autocmd BufEnter Makefile setlocal noexpandtab
    autocmd BufEnter *.sh setlocal ts=2 sw=2 sts=2
augroup END

call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': '.install --all' }
Plug 'tpope/vim-surround'
Plug 'terryma/vim-multiple-cursors'
Plug 'editorconfig/editorconfig-vim'
Plug 'mattn/emmet-vim'
Plug 'scrooloose/nerdtree'
Plug 'mechatroner/rainbow_csv'
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
call plug#end()

syntax enable
syntax on

map <C-o> :NERDTreeToggle<CR>
" EOF .vimrc
