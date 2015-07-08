" Let vim behave like vim
set nocompatible
set encoding=utf-8

" vundle up
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let vundle manage itself
Plugin 'flazz/vim-colorschemes'
Plugin 'gmarik/Vundle.vim'
Plugin 'jplaut/vim-arduino-ino'
Plugin 'junegunn/goyo.vim'
Plugin 'klen/python-mode'
Plugin 'luxflux/vim-git-inline-diff'
" Plugin 'sbl/scvim'
Plugin 'scrooloose/nerdtree'
Plugin 'sophacles/vim-processing'
Plugin 'tpope/vim-rails'
Plugin 'ericheep/chuck.vim'

call vundle#end()
filetype plugin indent on

syntax on
set background=dark
colorscheme codeschool

" turn off numbering and current number
set relativenumber
set nu

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

" forcing myself off the escape key
inoremap jk <esc>
inoremap <esc> <nop>

" removes ununsed whitespaces from all files
autocmd BufWritePre * :%s/\s\+$//e

" vim-git inline config
" symbol for lines which have been added, default: +
let g:git_diff_added_symbol='⇒'

" symbol for lines which have been removed, default: -
let g:git_diff_removed_symbol='⇐'

" symbol for lines which have been changed, default: <>
let g:git_diff_changed_symbol='⇔'

" turn off default pymode options
let g:pymode_options = 0

" turn off auto complete
let g:pymode_rope = 0
let g:pymode_rope_completion = 0
let g:pymode_rope_lookup_project = 0

" ignores annoying PEP8 rules
let g:pymode_lint_ignore = "E265"
let g:pymode_lint_ignore = "E228"
let g:pymode_lint_ignore = "E231"
let g:pymode_lint_ignore = "C901"
let g:pymode_lint_ignore = "E255"
let g:pymode_lint_ignore = "E501"

" autoremove unused whitespaces
let g:pymode_utils_whitespaces = 1

" set map leader
let mapleader = ","

" supercollider stuff
let g:sclangPipeApp = "~/.vim/bundle/scvim/bin/start_pipe"
let g:sclangDispatcher = "~/.vim/bundle/scvim/bin/sc_dispatcher"

" zen mode mapping
nnoremap <leader>z :Goyo<CR>

" processing mapping
autocmd FileType processing nnoremap <leader>r :make<CR>

" supercollider mapping
autocmd FileType supercollider nnoremap <leader>b :SClangStart<CR>
autocmd FileType supercollider nnoremap <leader>k :SClangKill<CR>
