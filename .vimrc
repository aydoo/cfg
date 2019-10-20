"#############################################
"#                  Plugins                  #
"#############################################
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

    Plugin 'VundleVim/Vundle.vim'
	Plugin 'crusoexia/vim-monokai'
	Plugin 'wmvanvliet/jupyter-vim'
    Plugin 'itchyny/lightline.vim'
    Plugin 'Valloric/YouCompleteMe'
    let g:ycm_autoclose_preview_window_after_completion=1

call vundle#end() 
filetype plugin indent on

"#############################################
"#                  Settings                 #
"#############################################

syntax on
colorscheme monokai
set background=dark
hi normal ctermbg=NONE guibg=NONE
autocmd VimLeave * call system("xclip -selection clipboard -i", getreg('+'))

set number
set relativenumber
set cursorline
"set cursorcolumn
set laststatus=2
set foldenable
set foldmethod=indent
set foldlevel=99
set clipboard=unnamedplus
set go+=a
set list listchars=tab:\ \ ,trail:-
set nohlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
set showcmd
"set mouse=a
set noswapfile
set scrolloff=5
set tabstop=4 shiftwidth=4 expandtab

" Set ö/Ö as leader
:let mapleader = ";"
imap Ö <leader>

" Use leader to get into normal mode
inoremap <leader> <Esc><right>
vnoremap <leader> <Esc>
cnoremap <leader> <CR>

" Unmap useless, annoying stuff
nnoremap Q <Nop>
nnoremap K <Nop>

" More convenient saving/closing
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>Q :q!<CR>

" Visual lines instead of logical lines
noremap k gk
noremap j gj

" Remap annoying buffer overwriting when deleting
noremap d "_d
noremap dd "_dd
noremap D "_D
noremap c "_c
noremap cc "_cc
noremap C "_C
noremap s "_s
noremap S "_S
noremap x "_x
noremap X "_X
vnoremap p "_dP

" Still make cutting possible with leader
noremap <Leader>d d
noremap <Leader>dd dd
noremap <Leader>D D
noremap <Leader>x x

" Make Y consist with D and C
nnoremap Y y$

" Remap up/down scroll TODO: get used to this instead
nnoremap <c-k> <c-b>
nnoremap <c-j> <c-f>

" Remap undo
nnoremap z <c-r>

" Remap fold
nnoremap <Space> za

" Remap search/replace
nnoremap <Leader>f /
nnoremap <Leader>r :%s/<C-R><C-W>//g<left><left>

" Don't leave normal mode when using o/O
nnoremap o o<Esc>
nnoremap O O<Esc>

" Select all
nnoremap <Leader>v ggVG

" Smart indent
nnoremap > >>
nnoremap < <<
vnoremap < <gv
vnoremap > >gv

" Commenting out in visual block mode
vnoremap # :s/^/#/<Esc><Esc>
"vnoremap ' :s/#/<Esc><Esc>

" Smart insertion of 'surrounding' chars
vnoremap " c""<Esc><left>pb
vnoremap ' c''<Esc><left>pb
vnoremap ( c()<Esc><left>pb
vnoremap [ c[]<Esc><left>pb
vnoremap { c{}<Esc><left>pb

" Learn to not use these
noremap <left> <Nop>
noremap <right> <Nop>
noremap <up> <Nop>
noremap <down> <Nop>

" Execute python in connected Jupyter-Console
autocmd FileType python nnoremap <Leader>e :JupyterSendCount<CR>
autocmd FileType python nnoremap <Leader>E :JupyterRunFile<CR>
autocmd FileType python vnoremap <Leader>e :JupyterSendRange<CR>

autocmd FileType tex,latex nnoremap <Leader>w :w<CR> :!texi2pdf %<CR><CR>

au BufReadPost *.ftl set syntax=python