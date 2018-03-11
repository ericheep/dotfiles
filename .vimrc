" let vim be vim
set nocompatible
set encoding=utf-8
filetype off

" plug
call plug#begin('~/.vim/plugged')

Plug 'christoomey/vim-tmux-navigator'
Plug 'Drogglbecher/vim-moonscape'
Plug 'itchyny/lightline.vim'
Plug 'flazz/vim-colorschemes'
Plug 'jacoborus/tender.vim'
Plug 'juleswang/css.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'
Plug 'sonjapeterson/1989.vim'
Plug 'supercollider/scvim'
Plug 'wilsaj/chuck.vim'

" initialize
call plug#end()

" colors
syntax on
colorscheme 1989

" font
set guifont=Operator\ Light:h11

" italics
highlight Comment gui=italic
highlight Comment cterm=italic

" no menu or scrollbars
set guioptions=

" turn off bells
set noerrorbells visualbell t_vb=
if has('autocmd')
    autocmd GUIEnter * set visualbell t_vb=
endif

" turn off numbering and current number
set relativenumber
set nu

" show commands as they are typed
set showcmd

" keep of mininum of 3 lines of context around current line
set scrolloff=3

" we'll do it live!
set noswapfile

" backspace through everything
set backspace=eol,indent,start

" indent stuff
filetype plugin indent on

" default spacing
set autoindent
set shiftwidth=4
set softtabstop=4
set tabstop=4

" use 2-spaces for tabs and autoindent on js, html, lua, ruby, css
au FileType javascript setl sw=2 sts=2 et
au FileType lua setl sw=2 sts=2 et
au FileType html setl sw=2 sts=2 et
au FileType ruby setl sw=2 sts=2 et
au FileType css setl sw=2 sts=2 et

" use 4-spaces for tabs and autoindent on python and chuck
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
" When there's no empty line between the paragraphs
" and each paragraph starts with indentation
let g:limelight_bop = '^\s'
let g:limelight_eop = '\ze\n^\s'
let g:limelight_priority = -1

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

if &term =~ '256color'
	" disable Background Color Erase (BCE) so that color schemes
	" render properly when inside 256-color tmux and GNU screen.
	" see also http://snk.tuxfamily.org/log/vim-256color-bce.html
	set t_ut=
endif

" danny's super fancy remove whitespace on save function
function! RemoveTrailingWhitespace()
	let l:winview = winsaveview()
	:%s/\s\+$//e
	call winrestview(l:winview)
endfunction

augroup whitespace
	autocmd!
	autocmd BufWritePre * :call RemoveTrailingWhitespace()
augroup END
