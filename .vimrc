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
Plugin 'alessandroyorba/monrovia'
Plugin 'alessandroyorba/sidonia'
Plugin 'junegunn/limelight.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'gmarik/Vundle.vim'
Plugin 'junegunn/goyo.vim'
Plugin 'klen/python-mode'
Plugin 'scrooloose/nerdtree'
Plugin 'sophacles/vim-processing'
Plugin 'wilsaj/chuck.vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-shell'

call vundle#end()
filetype plugin indent on

" font stuff
syntax on
set background=dark

" for any gvim
if has("gui_running")
  colorscheme monrovia
  set lines=999 columns=999

  " a different font per os
  if has("gui_gtk2")
    set guifont=Inconsolata\ 12
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h11
  elseif has("gui_win32")
    set guifont=Consolas:h9:cDEFAULT
  endif
else
    " terminal, or cmdprompt/powershell
    if has("unix")
        colorscheme gruvbox
    elseif("win32")
        colorscheme gruvbox
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

" turn off the beep
set visualbell
set t_vb=

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

" no escape key
inoremap jk <esc>
inoremap <esc> <nop>

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
" autocmd FileType supercollider nnoremap <leader>b :SClangStart<CR>
" autocmd FileType supercollider nnoremap <leader>k :SClangKill<CR>
