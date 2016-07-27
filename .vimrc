set number
set title
set showmatch
syntax on
set tabstop=4
set nrformats-=octal
set smartindent
set ignorecase
set smartcase
set wrapscan
set virtualedit=block
set whichwrap=b,s,[,],<,>
set backspace=indent,eol,start
set encoding=utf-8
set clipboard=unnamed,autoselect

vmap <C-c> :w !xsel -ib<CR><CR>

if has('mouse')
	set mouse=a
	if has('mouse_sgr')
	  set ttymouse=sgr
	elseif v:version > 703 || v:version is 703 && has('patch632') " I couldn't use has('mouse_sgr') :-(
	  set ttymouse=sgr
	else
	  set ttymouse=xterm2
	endif
endif

if has('vim_starting')
	set nocompatible

    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle "tyru/caw.vim.git"
call neobundle#end()

filetype plugin indent on

NeoBundleCheck
noremap <C-P> :Unite buffer<CR>
noremap <C-N> :Unite -buffer-name=file file<CR>
noremap <C-Z> :Unite file_mru<CR>
nmap <C-K> <Plug>(caw:i:toggle)
vmap <C-K> <Plug>(caw:i:toggle)
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
colorscheme desert
filetype plugin indent off
filetype indent off

