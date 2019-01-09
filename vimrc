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

" autoindent / tabstop / softtabstop / shiftwidth
set backspace=indent,eol,start

set nobackup
set nowritebackup
set noswf

set ruler
set showcmd
set wildmenu

set background=dark
set noerrorbells
set novisualbell
set notimeout

set so=2
set whichwrap=b,s,<,>,[,]

syntax on
filetype on
filetype plugin indent on
set incsearch
set hlsearch
set showmatch

"nnoremap <C-J> <C-W><C-J>
"nnoremap <C-K> <C-W><C-K>
"nnoremap <C-L> <C-W><C-L>
"nnoremap <C-H> <C-W><C-H>
nnoremap gV `[v`]
nnoremap <space> za
"set splitbelow
"set splitright

" folding
"set foldenable
"set foldmethod=indent
"hset foldnestmax=10

packadd! matchit

"function! <SID>TrimWS()
"let _s=@/
"    let l = line(".")
"    let c = col(".")
"    %s/\s\+$//e
"    let @/=_s
"    "call cursor(l, c)
"endfunction

"augroup buflocal
"    autocmd!
"    autocmd VimEnter * highlight clear SignColumn
"    autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.rb :"call <SID>TrimwWS()
"    autocmd BufEnter *.cls setlocal filetype=java
"    autocmd BufEnter *.zsh-theme setlocal filetype=zsh
"    autocmd BufEnter Makefile setlocal noexpandtab
"    autocmd BufEnter *.sh setlocal ts=2 sw=2 sts=2
"augroup END

"call plug#begin('~/.vim/plugged')
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': '.install --all' }
"Plug 'tpope/vim-abolish'
"Plug 'tpope/vim-sensible'
"Plug 'tpope/vim-surround'
"Plug 'tpope/vim-dotenv'
"Plug 'tpope/vim-dispatch'
"Plug 'tpope/vim-dadbod'
"Plug 'tpope/vim-rails'
"Plug 'terryma/vim-multiple-cursors'
"Plug 'editorconfig/editorconfig-vim'
"Plug 'mattn/emmet-vim'
"Plug 'scrooloose/nerdtree'
"Plug 'mechatroner/rainbow_csv'
"call plug#end()

"map <C-o> :NERDTreeToggle<CR>
" terryma/vim-multiple-cursors
"vnoremap // y/<c-r>"<CR>
"vnoremap // y/\V<c-r>"<CR>
"vnoremap <silent> <C-j> :MultipleCursorsFind <C-R>/<CR>
" keybindings
"let g:multi_cursor_use_default_mapping = 0
"let g:multi_cursor_start_word_key      = '<c-n>'
"let g:multi_cursor_select_all_word_key = '<a-n>'
"let g:multi_cursor_start_key           = 'g<c-n>'
"let g:multi_cursor_select_all_key      = 'g<a-n>'
"let g:multi_cursor_next_key            = '<c-n>'
"let g:multi_cursor_prev_key            = '<c-p>'
"let g:multi_cursor_skip_key            = '<c-x>'
"let g:multi_cursor_quit_key            = '<esc>'

" highlights 
"highlight multiple_cursors_cursor term=reverse cterm=reverse gui=reverse
"highlight link multiple_cursors_visual Visual
" EOF .vimrc
