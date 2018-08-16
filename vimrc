"------------------------------------------------
" (.vimrc) Basic Settings - vim-plug
"------------------------------------------------
if 0 | endif

" statusline / vi compatibility
set laststatus=2
set nocompatible
set encoding=utf-8
set wildmenu
set lazyredraw

" history / backups / swap
set history=256
" set backup
" set backupdir=~/.vim/backups
set nobackup
set nowritebackup
set noswf

" ruler / number / bells
set ruler
set number
set novisualbell
set noerrorbells

"" time out on keycodes -- but not mappings
"" https://gist.github.com/mislav/5706063
set notimeout
set ttimeout
set ttimeoutlen=100

" search
set incsearch
set hlsearch
set smartcase
set showmatch

" nav
" nnoremap <C-J> <C-W><C-J>
" nnoremap <C-K> <C-W><C-K>
" nnoremap <C-L> <C-W><C-L>
" nnoremap <C-H> <C-W><C-H>
" set splitbelow
" set splitright
" max pane h/w/normalize
" <C-W _ | =>
" swap opp / breakout new tab / close others
" <C-W R T o>

" fallback sts / indent
set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set backspace=indent,eol,start
set nowrap

" highlight tabs
syntax match Tab /\t/
hi Tab ctermbg=blue

" highlight last inserted text
nnoremap gV `[v`]

" folding
" nnoremap <space> za
" set foldenable
" set foldmethod=indent
" set foldnestmax=10
" set foldlevelstart=10

" trim trailing whitespace
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
augroup END

" buffers
augroup buflocal
    autocmd!
    autocmd VimEnter * highlight clear SignColumn
    autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md,*.rb :call <SID>TrimwWS()
    autocmd BufEnter *.cls setlocal filetype=java
    autocmd BufEnter *.zsh-theme setlocal filetype=zsh
    autocmd BufEnter Makefile setlocal noexpandtab
    autocmd BufEnter *.sh setlocal ts=2 sw=2 sts=2
augroup END

"" vim-plug
call plug#begin('~/.vim/plugged')
"" group deps
"" post-update hook plugs in outside ~/.vim/plugged
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': '.install --all' }
Plug 'tpope/vim-surround'
Plug 'terryma/vim-multiple-cursors'
Plug 'editorconfig/editorconfig-vim'
Plug 'mattn/emmet-vim'
Plug  'scrooloose/nerdtree'
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
call plug#end()

" local filetype settings (calling before v after plug-ins autoload)
" filetype on
" filetype plugin indent on

" syntax
syntax enable
syntax on

" interactive file tree view panel
map <C-o> :NERDTreeToggle<CR>
" EOF .vimrc
