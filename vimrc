" PLUGS
call plug#begin('~/.vim/plugged')
" Comment out stuff fast
Plug 'tpope/vim-commentary'
" Auto brackets
Plug 'raimondi/delimitMate'
" PlugInstall and PlugUpdate will clone fzf in ~/.fzf and run install script
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Git integration
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
" File explorer
Plug 'justinmk/vim-dirvish'
" js syntax highlighting
Plug 'pangloss/vim-javascript'
" React syntax highlighting
Plug 'mxw/vim-jsx'
" json highlighting
Plug 'elzr/vim-json'
" Bclose command (closes current buffer but not all windows)
Plug 'chrismccord/bclose.vim'
" palenight color scheme
Plug 'drewtempelmeyer/palenight.vim'
" Syntax checker via ale
Plug 'w0rp/ale'
" Easily edit surroundings
Plug 'tpope/vim-surround'
" Vim wrapper for UNIX
Plug 'tpope/vim-eunuch'
" Configure status line
Plug 'vim-airline/vim-airline'
" airline themes
Plug 'vim-airline/vim-airline-themes'
" show indentation
Plug 'Yggdroot/indentLine'
" allow plugins to access .
Plug 'tpope/vim-repeat'
" Sublime search for vim
Plug 'dyng/ctrlsf.vim'
" useful mappings
Plug 'tpope/vim-unimpaired'
" latex live preview
" Plug 'xuhdev/vim-latex-live-preview'
" latex plugin
Plug 'lervag/vimtex'
call plug#end()

" color theme
colorscheme palenight

" turn on filetype detection
filetype plugin on

" set autoread when file changed outside
set autoread

" set map leader
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" set wildmenu
set wildmenu

" show ruler (bottom right)
set ruler

" ignore case when searching
set ignorecase

" smart case
set smartcase

" highlight search results
set hlsearch

" modern search
set incsearch

" don't redraw when executing macros (for performance)
set lazyredraw

" turn on magic for regex
set magic

" show matching brackets
set showmatch

" how many tenths of a second to blink when matching brackets
set mat=0

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" turn syntax highlighting on
syntax on

" set utf8 encoding
set encoding=utf8

" ume spaces
set expandtab

" smart tabs
set smarttab

" 1 tab == 4 spaces
set tabstop=2
set shiftwidth=2

" indent things
set tw=99
set smartindent
set autoindent
filetype indent on

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" display
set number relativenumber
set colorcolumn=100
set hidden
set history=500

" don't match autocomplete from included files
set complete-=i

" search in real time
set incsearch

" autoread
set autoread

" sensible backspace
set backspace=indent,eol,start

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

" always have a line after cursor
if !&scrolloff
  set scrolloff=1
endif
if !&sidescrolloff
  set sidescrolloff=5
endif
set display+=lastline

" prettify visible whitespace
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif

" BUFFERS
" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT
" Close all the buffers
map <leader>ba :bufdo bd<cr>
" switch to last buffer
map <leader>f :b#<cr>

" vimrc stuff
" map vimrc to open vimrc
map <leader>vimrc :e ~/.vim/vimrc<cr>
map <leader>sv :source ~/.vimrc<cr>

" run file in vim
nnoremap <leader>r :!"%:p"

" open in chrome
map <leader>gc :!open % -a Google\ Chrome<cr>

" latex previewer
let g:livepreview_previewer = 'open -a Preview'
autocmd Filetype tex setl updatetime=1

" find tags file
if has('path_extra')
  setglobal tags-=./tags tags-=./tags; tags^=./tags;
endif

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" delete trailing spaces on save
autocmd BufWritePre * :%s/\s\+$//e

augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" Remap VIM 0 to first non-blank character
map 0 ^

" DelimitMate set expansions
let delimitMate_expand_cr=1
let delimitMate_expand_space=1

" ALE
" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1

"AIRLINE
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

