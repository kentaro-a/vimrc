scriptencoding utf-8
filetype plugin indent on


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
set noshowmode
set pastetoggle=<F2>
set noexpandtab
set iskeyword+=-
set showtabline=2
set clipboard+=unnamed
set foldmethod=indent
set foldlevel=1
set foldnestmax=2


function! s:RemoveDust()
	let cursor = getpos(".")
	%s/\s\+$//ge
	call setpos(".", cursor)
	unlet cursor
endfunction
autocmd BufWritePre * call <SID>RemoveDust()



" Highlight Space
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



" vimgrep highlighted word
autocmd QuickFixCmdPost *grep* cwindow


" unite
let g:unite_source_file_mru_limit = 50




" Toggle row number format.
function! ToggleNuMode()
  if(&relativenumber == 1)
	set norelativenumber
  else
	set relativenumber
  endif
endfunc


set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ \[ENC=%{&fileencoding}]%P

" Key mapping
source ~/.kentaro-a.vim/dein/map.vimrc

" Color settings
source ~/.kentaro-a.vim/dein/color.vimrc
