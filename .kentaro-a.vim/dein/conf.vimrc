scriptencoding utf-8
filetype plugin indent on
" General
syntax on
set synmaxcol=200
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
set noshowmode
set pastetoggle=<F2>
set noexpandtab
set iskeyword+=-
set showtabline=2
set clipboard+=unnamed

" Show vim config files
command! C call ShowVimConfig()
function! ShowVimConfig()
	:tabe $HOME/.kentaro-a.vim/dein
endfunction

" Reload vim config files
command! Cr source ~/.vimrc 



" Remove trailing whitespace
function! s:RemoveDust()
	let cursor = getpos(".")
	%s/\s\+$//ge
	call setpos(".", cursor)
	unlet cursor
endfunction
autocmd BufWritePre *.js,*.php,*.go,*.py,*.rb,*.vue call <SID>RemoveDust()


" Mark multibyte space
function! MarkMbSpace()
	highlight MarkMbSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
endfunction
if has('syntax')
	augroup MarkMbSpace
		autocmd!
		autocmd ColorScheme		  * call MarkMbSpace()
		autocmd VimEnter,WinEnter * match MarkMbSpace /　/
	augroup END
	call MarkMbSpace()
endif



" Nerdtree
let NERDTreeShowHidden = 1
let g:nerdtree_tabs_open_on_console_startup=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
function! s:MoveToFileAtStart()
	call feedkeys("\<C-w>")
	call feedkeys("\w")
endfunction
autocmd VimEnter *	NERDTree | call s:MoveToFileAtStart()



" *********************************************************
" *********************************************************
" *********************************************************
" Key mapping
" *********************************************************
" *********************************************************
" *********************************************************
noremap <S-h>	^
noremap <S-j>	}
noremap <S-k>	{
noremap <S-l>	$
vnoremap <S-l> $<Left>
noremap <CR> A<CR><ESC>
nmap <Esc><Esc> :nohlsearch<CR><Esc>
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <S-Left> gT
nnoremap <S-Right> gt
noremap ga ggVG
tnoremap <C-j> <C-w>j
tnoremap <C-k> <C-w>k
tnoremap <C-h> <C-w>h
tnoremap <C-l> <C-w>l
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)
" Do not yank by x,s
nnoremap x "_x
nnoremap s "_s
" Terminal window
nnoremap cmd :belowright :terminal<CR>
" grep
vnoremap G* "zy :vimgrep /<C-R>z/j ./**/*
" vimgrep highlighted word
autocmd QuickFixCmdPost *grep* cwindow
" tcomment keymap
nmap <silent> -- <C-_><C-_>
vmap <silent> -- <C-_><C-_>
" Modify register when you pasted.
xnoremap p "_dP
" Back to the normal mode.
inoremap jj <ESC>
" search
nnoremap <silent> <Space><Space> "zyiw:let @/ = '\<' . @z . '\>'<CR>:set hlsearch<CR>
vnoremap <silent> <Space><Space> "zy:let @/ = @z<CR>:set hlsearch<CR>

" replace
nnoremap <Space>r :OverCommandLine<CR>%s/<C-r><C-w>//g<Left><Left>
vnoremap <silent> <Space>r :OverCommandLine<CR>s///g<Left><Left><Left>
vnoremap <silent> r "zy:let @/ = @z<CR>:OverCommandLine<CR>%s/<C-r>///g<Left><Left>

"paste
nnoremap p ""p 
vnoremap p ""p 

" quickfix
au FileType qf nnoremap <silent><buffer>q :quit<CR>
autocmd FileType qf nnoremap <buffer> <Enter> <C-W><Enter><C-W>T




" *********************************************************
" *********************************************************
" *********************************************************
" Color Scheme 
" *********************************************************
" *********************************************************
" *********************************************************
colorscheme myblues
set t_Co=256
hi SpecialKey ctermfg=237 guifg=#3a3a3a
hi NonText ctermfg=66 guifg=#5f8787
hi TabLineFill term=bold cterm=bold ctermbg=0
hi TabLineSel term=bold cterm=bold ctermbg=75 ctermfg=15
hi Comment ctermfg=242
highlight LineNr ctermfg=67



