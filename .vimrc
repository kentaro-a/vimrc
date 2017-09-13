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
set whichwrap=b,s,[,],<,>
set backspace=indent,eol,start
set encoding=utf-8
set clipboard=unnamed,autoselect
set hidden
set shiftwidth=4
let &t_ti.="\e[5 q"
set virtualedit=onemore
set ruler
set paste
set cursorline
set autoindent
set incsearch
set hlsearch
nmap <Esc><Esc> :nohlsearch<CR><Esc>

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
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'thinca/vim-quickrun'	
NeoBundle 'grep.vim'
NeoBundle 'tyru/caw.vim.git'
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
"set background=dark
"colorscheme deep-space
"set background=dark
"colorscheme paramount
colorscheme blues
"colorscheme welpe
"colorscheme sky
"colorscheme genericdc
"colorscheme 256_noir

filetype plugin indent off
filetype indent off


" 出力がないやエラーの場合はquickfixに出力。それ以外は普通にバッファへ。
" vimprocの非同期設定。
" ウィンドウのサイズなど
let g:quickrun_config = {
		\   "_" : {
				\       "outputter/buffer/split" : ":botright 8sp",
				\   },
				\}

				" quickrunを強制終了
				nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"

				" 簡単起動
				cmap qr QuickRun
				cmap QR QuickRun

				" 簡単終了
				command! -nargs=0 QC call CloseQuickRunWindow()
				function! CloseQuickRunWindow()
				    execute "normal \<c-c>\<c-w>jZZ"
					endfunction
					cmap qc QC

set splitbelow
set whichwrap=b,s,h,l,<,>,[,]
nmap <Leader>c <Plug>(caw:i:toggle)
vmap <Leader>c <Plug>(caw:i:toggle)

