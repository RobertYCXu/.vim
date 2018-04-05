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
" deus color scheme
Plug 'ajmwagar/vim-deus'
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
call plug#end()

" color theme
colorscheme palenight

" turn on filetype detection
filetype plugin on
filetype indent on

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

" use spaces
set expandtab

" smart tabs
set smarttab

" 1 tab == 4 spaces
set tabstop=4
set shiftwidth=4

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

" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT

" Close all the buffers
map <leader>ba :bufdo bd<cr>

map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" vimrc stuff
" map vimrc to open vimrc
map <leader>vimrc :e ~/.vim/vimrc<cr>
map <leader>sv :source ~/.vimrc<cr>

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

" PALENIGHT
 " Enable true colors
if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif

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



