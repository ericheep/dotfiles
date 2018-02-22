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
Plugin 'gmarik/Vundle.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'Drogglbecher/vim-moonscape'
Plugin 'itchyny/lightline.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'jacoborus/tender.vim'
Plugin 'juleswang/css.vim'
Plugin 'junegunn/limelight.vim'
Plugin 'junegunn/goyo.vim'
Plugin 'sonjapeterson/1989.vim'
Plugin 'supercollider/scvim'
Plugin 'wilsaj/chuck.vim'

call vundle#end()
filetype plugin indent on

syntax on
colorscheme moonscape

" for any gvim
if has("gui_running")
  set guifont=Operator\ Light:h11

" a different font per os
  if has("gui_gtk2")
    set guifont=Operator\ 12
  elseif has("gui_macvim")
    set guifont=Operator\ Light:h11
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

" default spacing
set shiftwidth=4
set softtabstop=4
set tabstop=4

" use 2-spaces for tabs and autoindent on js and html
au FileType javascript setl sw=2 sts=2 et
au FileType lua setl sw=2 sts=2 et
au FileType html setl sw=2 sts=2 et
au FileType ruby setl sw=2 sts=2 et

" use 4-spaces for tabs and autoindent on python and chuck
au FileType py setl sw=4 sts=4 et
au FileType chuck setl sw=4 sts=4 et

set autoindent

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

" remove all trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" set map leader
let mapleader = ","

" supercollider stuff
let g:sclangPipeApp = "~/.vim/bundle/scvim/bin/start_pipe"
let g:sclangDispatcher = "~/.vim/bundle/scvim/bin/sc_dispatcher"
"
" supercollider mapping
let g:sclangTerm="tmux split-window -v -p 20"

" lightline config
set laststatus=2
set noshowmode

let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ }

" zen mode mapping
nnoremap <leader>z :Goyo<CR>

" limelight mode mapping
nnoremap <leader>l :Limelight<CR>

" color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'black'
let g:limelight_conceal_ctermfg = 240

" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

" Beginning/end of paragraph
"   When there's no empty line between the paragraphs
"   and each paragraph starts with indentation
let g:limelight_bop = '^\s'
let g:limelight_eop = '\ze\n^\s'
let g:limelight_priority = -1

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" italics
highlight Comment gui=italic
highlight Comment cterm=italic

 if &term =~ '256color'
    " disable Background Color Erase (BCE) so that color schemes
    " render properly when inside 256-color tmux and GNU screen.
    " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
      set t_ut=
 endif
