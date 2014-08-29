" Let vim behave like vim
set nocompatible
set encoding=utf-8

" vundle up
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let vundle manage itself
Plugin 'gmarik/Vundle.vim'
Plugin 'junegunn/goyo.vim'
Plugin 'klen/python-mode'
Plugin 'scrooloose/nerdtree'
Plugin 'sophacles/vim-processing'
Bundle "sudar/vim-arduino-syntax"
Plugin 'wilsaj/chuck.vim'

call vundle#end()
filetype plugin indent on

syntax on
set background=dark
colorscheme xoria256

" turn off numbering
set nu!

" show commands as they are typed
set showcmd

" keep of mininum of 3 lines of context around current line
set scrolloff=3

"no menu or scrollbars
set guioptions=

" turn off the beep
set visualbell

" we'll do it live!
set noswapfile

" backspace through everything
set backspace=eol,indent,start

" use 4-spaces for taba and autoindent
set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" allows case insensitive searching
set ignorecase
set smartcase

" highlights searching
set gdefault
set incsearch
set showmatch
set hlsearch

" turn off default pymode options
let g:pymode_options = 0

" set to python3 mode
let g:pymode_python = 'python3'

" turn off auto complete
let g:pymode_rope_completion = 0 

" ignores an annoying PEP8 rule
let g:pymode_lint_ignore = "E265"

" autoremove unused whitespaces
let g:pymode_utils_whitespaces = 1

" set map leader
let mapleader = ","

" zen mode mapping to ',z'
nnoremap <leader>z :Goyo<CR>
