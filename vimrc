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

set mouse=a " enable mouse in GUI & terminal

" Leader
let mapleader = ","

" Search
"set smartcase " Smartcase is better than ignorecase
set ignorecase " I was wrong...
set hlsearch " highlight matches...
set incsearch " ...as you type.


" Run NERDTree on ESC+t
function OpenNERDTree()
  execute ":NERDTree"
endfunction
command -nargs=0 OpenNERDTree :call OpenNERDTree()

nmap <ESC>t :OpenNERDTree<CR>

" " Solarized
" syntax enable
" if has('gui_running')
"   set background=dark
" else
"   set background=dark
" endif
" " let g:solarized_termcolors=256
" colorscheme solarized

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COLOR
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable
set t_Co=256 " 256 colors
set background=dark
colorscheme solarized
highlight Normal ctermfg=grey ctermbg=black

" Inconsolata
if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 13
  elseif has("gui_win32")
    set guifont=Consolas:h12:cANSI
  endif
endif

" 80 characters line
if exists('+colorcolumn')
  set colorcolumn=125
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>125v.\+', -1)
endif

" Vundle setup
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required!
Plugin 'gmarik/vundle'

" My Plugins here:
Plugin 'tpope/vim-rails'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-ruby/vim-ruby'
Plugin 'sickill/vim-pasta'
Plugin 'tpope/vim-haml'
Plugin 'pangloss/vim-javascript'
Plugin 'kchmck/vim-coffee-script'
Plugin 'ervandew/supertab'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'jgdavey/vim-blockle'
Plugin 'vim-scripts/vim-json-bundle'
Plugin 'tpope/vim-commentary'
Plugin 'mattn/gist-vim'
Plugin 'vim-scripts/nginx.vim'
Plugin 'vim-scripts/matchit.zip'
Plugin 'vim-scripts/c.vim'
Plugin 'rking/ag.vim'
Plugin 'skalnik/vim-vroom'
Plugin 'jwhitley/vim-matchit'
Plugin 'nono/vim-handlebars'
Plugin 'vim-scripts/yaml.vim'
Plugin 'gcmt/wildfire.vim'
Plugin 'Shutnik/jshint2.vim'
Plugin 'briancollins/vim-jst'

call vundle#end()
filetype on           " Enable filetype detection after Vundle
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

au BufRead,BufNewFile /etc/nginx/* set ft=nginx


" Fix bug with broken Omni completion
if has("autocmd")
  autocmd FileType ruby set omnifunc=rubycomplete#Complete
  autocmd FileType ruby let g:rubycomplete_buffer_loading=1
  autocmd FileType ruby let g:rubycomplete_classes_in_global=1
endif

" Disable arrow keys
"map <Left> <Nop>
"map <Right> <Nop>
"map <Up> <Nop>
"map <Down> <Nop>

set guioptions-=T

nnoremap <leader>s :Ag<Space>

" ARB templates
autocmd BufRead,BufNewFile *.arb setfiletype ruby

" Haml coffee
au BufRead,BufNewFile *.hamlc set ft=haml

" Maximize GVim on start
if has("gui_running")
  set lines=55 columns=211
endif


" grb magic
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>e :edit %%
map <leader>v :view %%

map <leader>t :CtrlP<cr>

map <leader>gv :CtrlP app/views<cr>
map <leader>gc :CtrlP app/controllers<cr>
map <leader>gm :CtrlP app/models<cr>
map <leader>gh :CtrlP app/helpers<cr>
map <leader>gw :CtrlP app/workers<cr>
map <leader>ga :CtrlP app/assets<cr>
map <leader>gs :CtrlP spec<cr>
map <leader>gl :CtrlP lib<cr>
map <leader>gp :CtrlP public<cr>
map <leader>gf :CtrlP features<cr>
map <leader>gg :topleft 100 :split Gemfile<cr>
map <leader>f :CtrlP<cr>
map <leader>F :CtrlP %%<cr>

" Vroom
map <leader>r :VroomRunNearestTest<cr>

" tabedit % - double tab
map <leader>dd :tabedit %<cr>




" wildfire.vim
"
" This selects the next closest text object.
let g:wildfire_fuel_map = "<ENTER>"

" This selects the previous closest text object.
let g:wildfire_water_map = "<BS>"


" https://coderwall.com/p/faceag
com! FormatJSON %!python -m json.tool
