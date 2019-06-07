" let vim be vim
set nocompatible
set encoding=utf-8
filetype off

" plug
call plug#begin('~/.vim/plugged')

Plug 'christoomey/vim-tmux-navigator'
Plug 'flrnprz/candid.vim'
Plug 'inside/vim-search-pulse'
Plug 'jacoborus/tender.vim'
Plug 'juleswang/css.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'
Plug 'kien/ctrlp.vim'
Plug 'leafOfTree/vim-vue-plugin'
Plug 'mxw/vim-jsx'
Plug 'sonjapeterson/1989.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'wilsaj/chuck.vim'

" initialize
call plug#end()

" colors
syntax on
colorscheme 1989
set background=dark

" use hyper background color
highlight LineNr ctermfg=NONE ctermbg=NONE
highlight Normal ctermfg=White ctermbg=NONE
highlight NonText ctermfg=White ctermbg=NONE

" font
" set guifont=Operator \ Light:h11

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
set shiftwidth=2
set softtabstop=2
set tabstop=2

" use 2-spaces for tabs and autoindent on js, html, lua, ruby, css
au FileType javascript setl sw=2 sts=2 et
au FileType json setl sw=2 sts=2 et
au FileType lua setl sw=2 sts=2 et
au FileType html setl sw=2 sts=2 et
au FileType ruby setl sw=2 sts=2 et
au FileType css setl sw=2 sts=2 et
au FileType vue setl sw=2 sts=2 et
au FileType ino setl sw=2 sts=2 et
au FileType py setl sw=2 sts=2 et
au FileType chuck setl sw=2 sts=2 et

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

" better searches for all
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store'

" shorten pulse duration
let g:vim_search_pulse_duration = 50
let g:vim_search_pulse_color_list = [244, 245, 246, 247, 248]

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

autocmd BufRead,BufNewFile *.qplug set filetype=lua
