
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
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
nnoremap <S-Left> gT
nnoremap <S-Right> gt
nnoremap + <C-a>
nnoremap - <C-x>
nnoremap <silent> <Space><Space> "zyiw:let @/ = '\<' . @z . '\>'<CR>:set hlsearch<CR>
nmap # <Space><Space>:%s/<C-r>///g<Left><Left>
noremap ga ggVG


" NERDTree
map <C-e> :NERDTreeToggle<CR>


" accelerated-jk
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)


" quickfix
nmap <Space>r <Plug>(quickrun)
au FileType qf nnoremap <silent><buffer>q :quit<CR>
autocmd FileType qf nnoremap <buffer> <Enter> <C-W><Enter><C-W>T
nnoremap <silent> @rr :Qfreplace<Enter>


" Do not yank by x,s
nnoremap x "_x
nnoremap s "_s


" vimgrep
nmap <C-G> <Space><Space>:vimgrep /<C-R><C-W>/j **/*
nmap <F3> <Space><Space>:vimgrep //j **/*<Left><Left><Left><Left><Left><Left><Left>
vnoremap G* "zy :vimgrep /<C-R>z/j **/*


" Unite
nnoremap <silent> ,,; :<C-u>Unite history/yank<CR>
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> ,,. :<C-u>Unite file_mru buffer<CR>


" tcomment keymap
nmap <silent> -- <C-_><C-_>
vmap <silent> -- <C-_><C-_>


" Modify register when you pasted.
xnoremap p "_dP
nnoremap <silent>;h :call g:ToggleNuMode()<cr>


" Replace highlighted text in current file.
nmap rr <Space><Space>:%s///g<Left><Left>
vnoremap rr "zy :%s/<C-R>z//g<Left><Left>


".vimrcを開く: <Space>e.
nnoremap <Space>e. :<C-u>edit $MYVIMRC<Enter>
 ".vimrcを反映: <Space>s.
nnoremap <Space>s. :<C-u>source $MYVIMRC<Enter>


" Back to the normal mode.
inoremap jj <ESC>

" Search selected character.
vnoremap * "zy:let @/ = @z<CR>n



" osyo-manga/vim-over, the easy grep
nnoremap <silent> <Space>o :OverCommandLine<CR>%s///g<Left><Left><Left>
vnoremap <silent> <Space>o :OverCommandLine<CR>s///g<Left><Left><Left>
nnoremap rep :OverCommandLine<CR>%s/<C-r><C-w>//g<Left><Left>


