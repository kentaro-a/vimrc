
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
nnoremap <silent> <Space><Space> "zyiw:let @/ = '\<' . @z . '\>'<CR>"*yiw:let @/ = '\<' . @z . '\>'<CR>:set hlsearch<CR>
nmap # <Space><Space>:%s/<C-r>///g<Left><Left>
noremap ga ggVG


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

nnoremap cmd :belowright :terminal<CR>
tnoremap <C-j> <C-w>j
tnoremap <C-k> <C-w>k
tnoremap <C-h> <C-w>h
tnoremap <C-l> <C-w>l


" Search selected character.
vnoremap * "zy:let @/ = @z<CR>n


" grep
nmap <F3> <Space><Space>:vimgrep //j **/*<Left><Left><Left><Left><Left><Left><Left>
nmap <C-G> <Space><Space>:vimgrep /<C-R><C-W>/j **/*
vnoremap G* "zy :vimgrep /<C-R>z/j **/*
nmap G* :vimgrep //j **/*<Left><Left><Left><Left><Left><Left><Left>


" replace
nnoremap <silent> <Space>o :OverCommandLine<CR>%s///g<Left><Left><Left>
vnoremap <silent> <Space>o :OverCommandLine<CR>s///g<Left><Left><Left>
nnoremap rep :OverCommandLine<CR>%s/<C-r><C-w>//g<Left><Left>


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

" toggle row number format
nnoremap <silent>;h :call g:ToggleNuMode()<cr>


" Back to the normal mode.
inoremap jj <ESC>


vnoremap <Space><Space>y :<C-U>call g:DumpText('v')<CR>
nnoremap <Space><Space>y :call g:DumpText('n')<CR>






