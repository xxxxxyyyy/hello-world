set nocompatible
filetype off

"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"alternatively, pass a path where Vundle should install plugins
Plugin 'gmarik/Vundle.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized' 
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'tomasr/molokai'

"Add all your plugins here (note older version of Vundle used Bundle instead
"of Plugin)
"All of your Plugins must be added before the following line
call vundle#end()
filetype plugin indent on

"Enable folding
set foldmethod=indent
set foldlevel=99

"Enable folding with the spacebar
nnoremap <space> za
"保存折叠
au BufWinLeave * silent mkview
au BufWinEnter * silent loadview
let g:SimpylFold_docstring_preview=1
"语法高亮
let python_highlight_all=1
let g:rehash256 = 1
syntax on
set nu
"文件浏览插件快捷键
map <C-e> :NERDTreeToggle<CR>
"根据模式判断使用色调
if has('gui_running')
	 set background=dark
	 colorscheme solarized
else
	 colorscheme zenburn
endif
call togglebg#map("<F5>")
set guifont=Monaco:h19
"python
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |
"不必要的空白字符
highlight BadWhitespace ctermbg=red guibg=red
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
" Keep indentation level from previous line:
autocmd FileType python set autoindent

" " make backspaces more powerfull
set backspace=indent,eol,start
set encoding=utf-8
