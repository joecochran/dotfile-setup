" Pathogen for plugins, etc
execute pathogen#infect()

" Forget compatibility with vi
set nocompatible

let mapleader = ","
let g:mapleader = ","

"Enable filetypes
filetype on
filetype plugin on
filetype indent on

syntax enable
let g:solarized_termcolors=16
let g:solarized_termtrans = 1
se t_Co=16
set background=dark
colorscheme solarized
set encoding=utf-8 " Necessary to show Unicode glyphs

" Write the old file out when switching between files.
set autowrite

" Display current cursor position in lower right corner.
set ruler

"Ever notice a slight lag after typing the leader key + command? This lowers
"the timeout.
set timeoutlen=500

" Down is really the next line
nnoremap j gj
nnoremap k gk

" Switch between buffers without saving
set hidden

" Tab stuff
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" Show command in bottom right portion of the screen
set showcmd

"Show lines numbers
set number

"Indent stuff
set smartindent
set autoindent

"Always show the status line
set laststatus=2

"Prefer a slightly higher line height
set linespace=3

"Better line wrapping
set wrap
set textwidth=79
set formatoptions=qrn1

"Allow backspace over everything in insert mode.
set backspace=indent,eol,start

"Set incremental searching"
set incsearch

"Highlight searching
set hlsearch

"Hide mouse when typing
set mousehide

" Correct mouse highlighting
set mouse=a

" session settings
set sessionoptions=resize,winpos,winsize,buffers,tabpages,folds,curdir,help

"Saves time; maps the spacebar to colon
nmap <space> :

"Automatically change current directory to that of the file in the buffer
" autocmd BufEnter * cd %:p:h

"Map escape key to jj -- much faster
imap jj <esc>

" Source the vimrc file after saving it. This way, you don't have to reload Vim to see the changes.
if has("autocmd")
 augroup myvimrchooks
  au!
  autocmd bufwritepost .vimrc source ~/.vimrc
 augroup END
endif

" easier window navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l


au FocusLost * :wa

set showmatch " show matching brackets

nnoremap ,cd :cd %:p:h<CR>:pwd<CR>

" Alphabetically sort CSS properties in file with :SortCSS
:command! SortCSS :g#\({\n\)\@<=#.,/}/sort

nmap <leader>w :w!<cr>

"===============PLUGIN SETTINGS=============="

"EMMET

" let g:user_emmet_leader_key='<C-Z>'

"===========NERDTREE==============="

"HIDE ARROWS IF NECESSARY
"let g:NERDTreeDirArrows=0  

"Ctrl-B for nerdtree toggle
nmap <C-b> :NERDTreeToggle<cr>

"Show hidden files in NerdTree
let NERDTreeShowHidden=1

" Have NERDTree ignore vim swap files
let NERDTreeIgnore = ['\.swp$']

"===================TCOMMENT
"Faster shortcut for commenting. Requires T-Comment plugin
map <leader>c <c-_><c-_>

"===GnuPG stuff===
" :cmap cs %!gpg --clearsign
" :cmap es %!gpg -seat
"map <leader>ee %!gpg -eat
" :cmap de %!gpg -d

"========Ctrl P========
let g:ctrlp_map = '<c-p>'
let g:ctrlp_working_path_mode = '0'
source /usr/local/lib/python3.4/site-packages/powerline/bindings/vim/plugin/powerline.vim

"More natural splitting
set splitbelow
set splitright
