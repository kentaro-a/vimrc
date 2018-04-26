scriptencoding utf-8


" Color Scheme
colorscheme blues


" General
syntax on
set list
set listchars=tab:»-
hi SpecialKey ctermfg=237 guifg=#3a3a3a
hi NonText ctermfg=66 guifg=#5f8787
hi TabLineFill term=bold cterm=bold ctermbg=0
hi TabLineSel term=bold cterm=bold ctermbg=75 ctermfg=15

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
" set gdefault
set noshowmode
" set statusline=%F%m%r%h%w\%=[FILETYPE=%Y][ENC=%{&fenc}][%{&ff}]%=%c,\%l/%L
set pastetoggle=<F2>
set noexpandtab

hi Comment ctermfg=242
highlight LineNr ctermfg=67


function! s:remove_dust()
	let cursor = getpos(".")
	%s/\s\+$//ge
	call setpos(".", cursor)
	unlet cursor
endfunction
autocmd BufWritePre * call <SID>remove_dust()



" Highlight Space
function! ZenkakuSpace()
	highlight ZenkakuSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
endfunction

if has('syntax')
	augroup ZenkakuSpace
		autocmd!
		autocmd ColorScheme		  * call ZenkakuSpace()
		autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
	augroup END
	call ZenkakuSpace()
endif





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
	NeoBundle 'jistr/vim-nerdtree-tabs'
	NeoBundle 'mattn/emmet-vim'
	NeoBundle 'grep.vim'
	NeoBundle 'Shougo/neocomplcache'
	NeoBundle 'Shougo/neoyank.vim'
	" NeoBundle 'Shougo/neosnippet'
	" NeoBundle 'Shougo/neosnippet-snippets'
	NeoBundle 'tomtom/tcomment_vim'
	NeoBundle 'surround.vim'
	NeoBundle 'Townk/vim-autoclose'
	NeoBundle 'rhysd/accelerated-jk'
	NeoBundle 'thinca/vim-quickrun'
	NeoBundle 'ctrlpvim/ctrlp.vim'
	NeoBundle 'thinca/vim-qfreplace'
	NeoBundle 'tpope/vim-fugitive'
	NeoBundle 'scrooloose/syntastic'

call neobundle#end()

filetype plugin indent on

NeoBundleCheck
filetype plugin indent off
filetype indent off

noremap <S-h>	^
noremap <S-j>	}
noremap <S-k>	{
noremap <S-l>	$
nnoremap <CR> A<CR><ESC>
nmap <Esc><Esc> :nohlsearch<CR><Esc>
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
nnoremap <S-Left> gT
nnoremap <S-Right> gt
nnoremap + <C-a>
nnoremap - <C-x>
nnoremap <silent> <Space><Space> "zyiw:let @/ = '\<' . @z . '\>'<CR>:set hlsearch<CR>
nmap # <Space><Space>:%s/<C-r>///g<Left><Left>
noremap ga ggVG



" Nerdtree
map <C-e> :NERDTreeToggle<CR>
let NERDTreeShowHidden = 1
let g:nerdtree_tabs_open_on_console_startup=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
function s:MoveToFileAtStart()
	call feedkeys("\<C-w>")
	call feedkeys("\w")
endfunction
autocmd VimEnter *	NERDTree | call s:MoveToFileAtStart()
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
	exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
	exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction
call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')






" neocomplcache
let g:neocomplcache_enable_at_startup = 1
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

" neosnippet
" imap <C-k>	   <Plug>(neosnippet_expand_or_jump)
" smap <C-k>	   <Plug>(neosnippet_expand_or_jump)
" imap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
" smap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
" if has('conceal')
" 	set conceallevel=2 concealcursor=i
" endif
"
"

" accelerated-jk
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)


" quick run
let g:quickrun_config = {'*': {'hook/time/enable': '1'},}
set t_Co=256
nmap <Space>r <Plug>(quickrun)
au FileType qf nnoremap <silent><buffer>q :quit<CR>
let g:quickrun_config = {
	\'_' : {
		\	'outputter/buffer/split' : ':botright 20sp',
		\	'outputter/error/success' : 'buffer',
		\	'outputter/error/error'   : 'buffer',
		\	"outputter/buffer/into" : '1',
		\	'outputter/quickfix/errorformat' : '%f:%l,%m in %f on line %l',
		\	'outputter/buffer/close_on_empty' : 1,
		\	'outputter' : 'error',
		\},
\}


" Do not yank by x,s
nnoremap x "_x
nnoremap s "_s



" vimgrep highlighted word
nmap <C-G> <Space><Space>:vimgrep /<C-R><C-W>/j **/*
nmap <F3> <Space><Space>:vimgrep //j **/*<Left><Left><Left><Left><Left><Left><Left>
autocmd QuickFixCmdPost *grep* cwindow


" Treat - as a keyword.(Not border char)
set iskeyword+=-


" Open file as new tab when clicking quickfix list item.
autocmd FileType qf nnoremap <buffer> <Enter> <C-W><Enter><C-W>T
nnoremap <silent> @rr :Qfreplace<Enter>



" unite
let g:unite_source_file_mru_limit = 50
nnoremap <silent> ,,; :<C-u>Unite history/yank<CR>
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> ,,. :<C-u>Unite file_mru buffer<CR>



" Tab settings
set showtabline=2


" tcomment keymap
nmap <silent> <C-/><C-/> <C-_>p


" Toggle row number format.
function! ToggleNuMode()
  if(&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunc
nnoremap <silent>;h :call g:ToggleNuMode()<cr>

" Modify register when you pasted.
xnoremap p "_dP


" share the os clipboard.
set clipboard+=unnamed


" Replace highlighted text in current file.
nmap rr <Space><Space>:%s///g<Left><Left>


".vimrcを開く: <Space>e.
nnoremap <Space>e. :<C-u>edit $MYVIMRC<Enter>
 ".vimrcを反映: <Space>s.
nnoremap <Space>s. :<C-u>source $MYVIMRC<Enter>

" Back to the normal mode.
inoremap jj <ESC>


if isdirectory(expand('~/.vim/bundle/vim-fugitive'))
	set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ \[ENC=%{&fileencoding}]%P
endif


if isdirectory(expand('~/.vim/bundle/syntastic'))
	set statusline+=%#warningmsg#
	set statusline+=%{SyntasticStatuslineFlag()}
	set statusline+=%*

	let g:syntastic_always_populate_loc_list = 1
	let g:syntastic_auto_loc_list = 1
	let g:syntastic_check_on_open = 1
	let g:syntastic_check_on_wq = 0
endif

" memo
" vat -> select whole tag.
