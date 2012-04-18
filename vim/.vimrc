"""""""""""
" Options "
"""""""""""

set nocompatible " turn off compatibility with Vi

set hidden " hide buffers when not displayed

set nobackup " don't make a backup before overwriting a file.
set nowritebackup " ^^^
set noswapfile " don't need no stinky swapfiles
set directory=~/tmp,/tmp " keep swap files in one location

set confirm " confirm on quit, etc.
set autoread " automatically read changes from disk

set showcmd " display incomplete commands.
set history=1000 " remember more commands and search history

set softtabstop=2 " soft tab width
set tabstop=2 " global tab width
set shiftwidth=2 " number of spaces for (un)indenting
set shiftround " round indent to multiple of 'shiftwidth'
set expandtab " expand tab characters into spaces

set number! " Number lines

" Leader
let mapleader = ","

" Search
set ignorecase " Ignore case in search
set hlsearch " highlight matches...
set incsearch " ...as you type.


" Run NERDTree on ESC+t
function OpenNERDTree()
  execute ":NERDTree"
endfunction
command -nargs=0 OpenNERDTree :call OpenNERDTree()

nmap <ESC>t :OpenNERDTree<CR>

" Solarized
syntax enable
if has('gui_running')
  set background=dark
else
  set background=dark
endif
" let g:solarized_termcolors=256
colorscheme solarized

" Inconsolata
if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 13
  elseif has("gui_win32")
    set guifont=Consolas:h11:cANSI
  endif
endif

" 80 characters line
if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

" Vundle setup
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" My Bundles here:
Bundle 'scrooloose/nerdtree'
Bundle 'wincent/Command-T'
Bundle 'tpope/vim-rails.git'
Bundle 'bronson/vim-trailing-whitespace'
Bundle 'altercation/vim-colors-solarized'
Bundle 'vim-ruby/vim-ruby'

filetype on           " Enable filetype detection after Vundle
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins


" Fix bug with broken Omni completion
if has("autocmd")
  autocmd FileType ruby set omnifunc=rubycomplete#Complete
  autocmd FileType ruby let g:rubycomplete_buffer_loading=1
  autocmd FileType ruby let g:rubycomplete_classes_in_global=1
endif

