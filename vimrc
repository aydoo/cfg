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
	set laststatus=2
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

set number
set relativenumber
set cursorline
"set cursorcolumn
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
:let mapleader = "ö"
imap Ö <leader>

" Use leader to get into normal mode
inoremap <leader> <Esc><right>
vnoremap <leader> <Esc>
cnoremap <leader> <CR>

" Unmap Q to disable Ex-mode
nnoremap Q <Nop>

" More convenient saving/closing
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>Q :q!<CR>

" hjkl to i(up)j(left)k(down)l(right)
noremap i gk
noremap I K
noremap j h
noremap J H
noremap k gj
noremap K J
noremap h i
noremap H I

" Faster jumping using ALT
nnoremap i 5k
nnoremap k 5j

" Jumping between splits
noremap <C-W>i <C-W>k
noremap <C-W>j <C-W>h
noremap <C-W>k <C-W>j
noremap <C-W>h <C-W>i

" Remap annoying buffer overwriting when deleting
noremap d "_d
noremap dd "_dd
noremap D "_D
noremap x "_x
noremap X "_X
vnoremap p "_dP

" Remap up/down scroll
nnoremap <c-i> <c-b>
nnoremap <c-k> <c-f>

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

" Smart pairs
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>

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
inoremap <left> <Nop>
inoremap <right> <Nop>
inoremap <up> <Nop>
inoremap <down> <Nop>

" Execute python in connected Jupyter-Console
autocmd FileType python nnoremap <Leader>e :JupyterSendCount<CR>
autocmd FileType python nnoremap <Leader>E :JupyterRunFile<CR>
autocmd FileType python vnoremap <Leader>e :JupyterSendRange<CR>
