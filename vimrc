"" .vimrc
if 0 | endif
set nocompatible
set encoding=utf-8
set backspace=indent,eol,start
filetype plugin on
filetype indent on

"" Automatic Installation (vim-plug)
"" https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"" vim-plug
"" https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')
"" shorthand
Plug 'junegunn/vim-easy-align'
"" any valid git url
"" Plug 'https://github.com/junegunn/vim-github-dashboard.git'
"" non-master branch
""Plug 'rdnetto/ycm-generator', { 'branch': 'stable' }
"" plug-in options (tag, rtp)
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
"" group deps
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
"" lazy loading
Plug 'scrooloose/nerdtree', { 'on' : 'NERDTreeToggle' }
"" vader
Plug 'junegunn/vader.vim',  { 'on': 'Vader', 'for': 'vader' }
"" post-update hook plugs in outside ~/.vim/plugged
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': '.install --all' }
"" add plug-ins to &runtimepath
call plug#end()
"" Time out on keycodes -- but not mappings
"" https://gist.github.com/mislav/5706063
set notimeout
set ttimeout
set ttimeoutlen=100

"" Search
set incsearch
set hlsearch
set ignorecase
set smartcase

"" Folding
set foldmethod=indent
set foldnestmax=10
set foldenable
nnoremap <space> za
set foldlevelstart=10
"" Space
set nowrap
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
""set autoindent

"if has('gui_running')
"	set background=light
"else
"	set background=dark
"endif
"colorscheme badwolf

set wildmenu
set lazyredraw
augroup configgroup
	autocmd!
	autocmd VimEnter * highlight clear SignColumn
	autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md,*.rb :call <SID>StripTrailingWhitespaces()
	autocmd BufEnter *.cls setlocal filetype=java
	autocmd BufEnter *.zsh-theme setlocal filetype=zsh
	autocmd BufEnter Makefile setlocal noexpandtab
	autocmd BufEnter *.sh setlocal tabstop=2
	autocmd BufEnter *.sh setlocal shiftwidth=2
	autocmd BufEnter *.sh setlocal softtabstop=2
augroup END

" strips trailing whitespace at the end of files. this
" is called on buffer write in the autogroup above.
" e.g., build programs differently named across systems:
"let g:make = 'gmake'
"if system('uname -o') =~ '^GNU/'
"	        let g:make = 'make'
"		endif
"		NeoBundle 'Shougo/vimproc.vim', {'build': {'unix': g:make}}
" highlight last inserted text
" nnoremap gV `[v`]
function! <SID>StripTrailingWhitespaces()
"    " save last search & cursor position
     let _s=@/
     let l = line(".")
     let c = col(".")
     %s/\s\+$//e
     let @/=_s
     call cursor(l, c)
endfunction
" split nav
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright
" max height / width / normalize
" <C-W _ | =>
" " swap opp / breakout new tab / close others
" <C-W R T o>

