" Disable vi compatible
if &compatible
	set nocompatible
endif

" Directory for dein.vim
let s:dein_dir = expand('~/.kentaro-a.vim/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" Git clone
if !isdirectory(s:dein_repo_dir)
	execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
endif

" Path
execute 'set runtimepath^=' . s:dein_repo_dir

" Load plugins
if dein#load_state(s:dein_dir)
	call dein#begin(s:dein_dir)
	let s:toml = s:dein_dir . '/dein.toml'
	let s:lazy_toml = s:dein_dir . '/dein_lazy.toml'
	call dein#load_toml(s:toml, {'lazy': 0})
	" To be lazy...
	call dein#load_toml(s:lazy_toml, {'lazy': 1})
	call dein#end()
	call dein#save_state()
endif

" Check installed state and install if it were needed.
if dein#check_install()
	call dein#install()
endif

" Include configs
source ~/.kentaro-a.vim/dein/conf.vimrc

