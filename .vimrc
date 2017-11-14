" let vim be vim
set nocompatible
set encoding=utf-8
filetype off

" vundle up
if has ("win32")
    set rtp+=$HOME/vimfiles/bundle/Vundle.vim
    call vundle#begin('$HOME/vimfiles/bundle/')
elseif has("unix")
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
endif

" let vundle manage itself
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'Drogglbecher/vim-moonscape'
Plugin 'iceisspetrel/Monrovia'
Plugin 'flazz/vim-colorschemes'
Plugin 'gmarik/Vundle.vim'
Plugin 'klen/python-mode'
Plugin 'johngrib/vim-game-code-break'
Plugin 'juleswang/css.vim'
Plugin 'junegunn/limelight.vim'
Plugin 'junegunn/goyo.vim'
Plugin 'kocakosm/hilal'
Plugin 'scrooloose/nerdtree'
Plugin 'Shougo/vimproc.vim'
Plugin 'sophacles/vim-processing'
Plugin 'sonjapeterson/1989.vim'
Plugin 'supercollider/scvim'
Plugin 'tpozzi/Sidonia'
Plugin 'tyrannicaltoucan/vim-deep-space'
Plugin 'wilsaj/chuck.vim'

call vundle#end()
filetype plugin indent on

syntax on
set background=dark
colorscheme sierra

" for any gvim
if has("gui_running")
  set guifont=Operator\ Light:h11

" a different font per os
  if has("gui_gtk2")
    set guifont=Operator\ 12
  elseif has("gui_macvim")
    set guifont=Operator\ Regular:h11
  elseif has("gui_win32")
    set guifont=Operator:h9:cDEFAULT
  endif
endif

" turn off numbering and current number
set relativenumber
set nu

" show commands as they are typed
set showcmd

" keep of mininum of 3 lines of context around current line
set scrolloff=3

" no menu or scrollbars
set guioptions=

" set nolazyredraw

" turn off bells
set noerrorbells visualbell t_vb=
if has('autocmd')
    autocmd GUIEnter * set visualbell t_vb=
endif

" we'll do it live!
set noswapfile

" backspace through everything
set backspace=eol,indent,start

set autoindent

" default spacing
set shiftwidth=4
set softtabstop=4
set tabstop=4

" use 2-spaces for tabs and autoindent on js and html
au FileType javascript setl sw=2 sts=2 et
au FileType lua setl sw=2 sts=2 et
au FileType html setl sw=2 sts=2 et

" use 4-spaces for tabs and autoindent on js and html
au FileType py setl sw=4 sts=4 et
au FileType chuck setl sw=4 sts=4 et

" allows case insensitive searching
set ignorecase
set smartcase

" highlights searching
set gdefault
set incsearch
set showmatch
set hlsearch

" jk also works as the escape key
inoremap jk <esc>

" removes ununsed whitespaces from all files
autocmd BufWritePre * :%s/\s\+$//e

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

" fullscreen mode mapping
nnoremap <leader>f :Fullscreen<CR>

" limelight mode mapping
nnoremap <leader>l :Limelight<CR>

" ChucK vim stuff
function! ChuckRunBuffer()
    silent !clear
    execute "!chuck" . " " . bufname("%")
endfunction

nnoremap <buffer> <leader>r :call ChuckRunBuffer()<cr>

" processing mapping
autocmd FileType processing nnoremap <leader>r :make<CR>

" supercollider mapping
let g:sclangTerm="tmux split-window -v -p 20"

" italics
highlight Comment gui=italic
highlight Comment cterm=italic

if &term =~ '256color'
    " disable Background Color Erase (BCE) so that color schemes
    " render properly when inside 256-color tmux and GNU screen.
    " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
     set t_ut=
 endif
