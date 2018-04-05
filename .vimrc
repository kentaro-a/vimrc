" Color Scheme
colorscheme blues


" General
syntax on
set list
set listchars=tab:»-
set number
set fenc=utf-8
set encoding=utf-8
set nobackup
set noswapfile
set cursorline
set autoindent
set smartindent
set showmatch
set laststatus=2
set wildmode=list:longest
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set noerrorbells
set cmdheight=2
set display=lastline
set history=200
set guioptions+=a
set title
set whichwrap=b,s,h,l,<,>,[,],~
set mouse=a
set nowrap
set pumheight=10
set foldmethod=marker
set autoread
set hidden
set ignorecase
set smartcase
set incsearch
set wrapscan
set hlsearch
set backspace=indent,eol,start
set virtualedit=block
set ambiwidth=double
set wildmenu
set splitbelow
set splitright
set scrolloff=3
set gdefault
set noshowmode


hi Comment ctermfg=242
highlight LineNr ctermfg=darkyellow
autocmd BufWritePre * :%s/\s\+$//ge



" set number
"function Setnumber()
"  if &number
"    setlocal nonumber
"  else
"    setlocal number
"  endif
"endfunction
"nnoremap <silent> <C-m> :call Setnumber()<CR>


if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
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
NeoBundle 'grep.vim'
call neobundle#end()

filetype plugin indent on

NeoBundleCheck
filetype plugin indent off
filetype indent off


map <C-n> :NERDTreeToggle<CR>
nmap <Esc><Esc> :nohlsearch<CR><Esc>
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h


