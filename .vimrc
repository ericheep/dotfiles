" Let vim behave like vim
set nocompatible
set encoding=utf-8

" vundle up
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let vundle manage itself
Plugin 'gmarik/Vundle.vim'
Plugin 'klen/python-mode'
Plugin 'wilsaj/chuck.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'scrooloose/nerdtree'

call vundle#end()
filetype plugin indent on

syntax on

set background=dark
colorscheme gruvbox

" backspace through everything
set backspace=eol,indent,start

" turns off preview window for auto completion
autocmd FileType python setlocal completeopt-=preview

" turns off autocompletion
let g:pymode_rope = 0

" turns off caps key in normal mode
autocmd InsertLeave * set iminsert=0

" autoremove unused whitespaces
let g:pymode_utils_whitespaces = 1

" use 4-spaces for taba and autoindent
set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" turn off numbering
set nu!

" don't beep
set visualbell

" allows case insensitive searching
" unless one or more characters are uppercase
set ignorecase
set smartcase

" highlights searching
set gdefault

" keep a minimum of 3 lines of context around current line
set scrolloff=3

"no menu or scrollbars
set guioptions=

"show commands as they are typed
set showcmd
