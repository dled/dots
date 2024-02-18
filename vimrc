"" .vimrc
if 0 | endif
set nocompatible
set encoding=utf-8
set backspace=indent,eol,start
filetype plugin on
filetype indent on

"" helper function
function! Cond(cond, ...)
  let opts = get(a:000, 0, {})
  return a:cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction

"" Automatic Installation (vim-plug)
"" https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"" Automatic Installation of missing plugins
"" https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation-of-missing-plugins
"" from CLI
"" vim -es -u vimrc -i NONE -c "PlugInstall" -c "qa"

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

"" vim-plug
"" https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')
"" register vim-plug itself
Plug 'junegunn/vim-plug'
"" shorthand
Plug 'junegunn/vim-easy-align'
"" lazy loading
Plug 'scrooloose/nerdtree', { 'on' : 'NERDTreeToggle' }
"" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"" gist support
Plug 'https://gist.github.com/junegunn/5dff641d68d20ba309ce',
    \ { 'as': 'vim-awesome', 'do': 'mkdir -p plugin; cp -f *.vim plugin/' }
"" conditional
"if has('mac')
"  Plug 'junegunn/vim-xmark'
"endif

"" Load on nothing
"" ultisnips error (py3 import not available (E319)
"Plug 'SirVer/ultisnips', { 'on': [] }
"Plug 'Valloric/YouCompleteMe', { 'on': [] }
"
"augroup load_us_ycm
"  autocmd!
"  autocmd InsertEnter * call plug#load('ultisnips', 'YouCompleteMe')
"                     \| autocmd! load_us_ycm
"augroup END

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
	autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.rb :call <SID>StripTrailingWhitespaces()
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
"set splitbelow 
"set splitright
" max height / width / normalize
" <C-W _ | =>
" " swap opp / breakout new tab / close others
" <C-W R T o>

