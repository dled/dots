"" .vimrc
if 0 | endif
set nocompatible
set encoding=utf-8
set backspace=indent,eol,start
filetype plugin on
filetype indent on
syntax on

autocmd ColorScheme pulumi highlight Normal ctermbg=235
colorscheme pulumi

nnoremap <Leader>o o<Esc>
nnoremap <NL> i<CR><Esc>
nnoremap gob  :s/\((\zs\\|,\ *\zs\\|)\)/\r&/g<CR><Bar>:'[,']normal ==<CR>
nnoremap <silent> <F3> :redir @a<CR>:g//<CR>:redir END<CR>:new<CR>:put! a<CR>

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
"set nowrap
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
""set autoindent

"if has('gui_running')
"	set background=light
"else
"	set background=dark
"endif

set wildmenu
set lazyredraw
augroup configgroup
	autocmd!
	autocmd VimEnter * highlight clear SignColumn
	autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.rb :call <SID>StripTrailingWhitespaces()
	autocmd BufEnter *.cls setlocal filetype=java
	autocmd BufEnter *.zsh-theme setlocal filetype=zsh
	autocmd BufEnter Makefile setlocal noexpandtab
	autocmd BufEnter *.sh setlocal tabstop=4 shiftwidth=4 softtabstop=4 expandtab
  autocmd BufRead,BufNewfile *.md setlocal textwidth=80
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

