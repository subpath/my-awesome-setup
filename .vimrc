set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set exrc
set nu
set relativenumber
set hidden
set guicursor=
set mouse=a
set nohlsearch
set noerrorbells
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set smartcase
set incsearch
set termguicolors
set scrolloff=8
set noshowmode
set signcolumn=yes
set colorcolumn=120
set signcolumn=yes
set updatetime=100
set backspace=indent,eol,start
highlight ColorColumn guibg=grey
set cmdheight=2
syntax enable
filetype plugin indent on

call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'puremourning/vimspector'
Plug 'scrooloose/nerdcommenter'
Plug 'sheerun/vim-polyglot'
Plug 'scrooloose/nerdtree'
Plug 'yggdroot/indentline'
Plug 'kien/ctrlp.vim'
Plug 'elzr/vim-json'
Plug 'ekalinin/dockerfile.vim'
Plug 'glench/vim-jinja2-syntax'
Plug 'cespare/vim-toml'
Plug 'stephpy/vim-yaml'
Plug 'derekwyatt/vim-scala'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'mbbill/undotree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'rust-lang/rust.vim'
Plug 'itchyny/lightline.vim'
Plug 'airblade/vim-gitgutter'
cal plug#end()

colorscheme gruvbox

let NERDTreeShowHidden=1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 1

let g:indentLine_char_list = ['|', '¦', '┆', '┊']
set conceallevel=2

autocmd FileType json syntax match Comment +\/\/.\+$+

autocmd StdinReadPre * let s:std_in=1
" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

map <C-b> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$']

" Autocommands
fun! TrimWhitespace()
    let l:save=winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

" Help Vim recognize *.sbt and *.sc as Scala files
au BufRead,BufNewFile *.sbt,*.sc set filetype=scala

" Used to expand decorations in worksheets
nmap <Leader>ws <Plug>(coc-metals-expand-decoration)

" Toggle panel with Tree Views
nnoremap <silent> <space>t :<C-u>CocCommand metals.tvp<CR>
" Toggle Tree View 'metalsPackages'
nnoremap <silent> <space>tp :<C-u>CocCommand metals.tvp metalsPackages<CR>
" Toggle Tree View 'metalsCompile'
nnoremap <silent> <space>tc :<C-u>CocCommand metals.tvp metalsCompile<CR>
" Toggle Tree View 'metalsBuild'
nnoremap <silent> <space>tb :<C-u>CocCommand metals.tvp metalsBuild<CR>
" Reveal current current class (trait or object) in Tree View 'metalsPackages'
nnoremap <silent> <space>tf :<C-u>CocCommand metals.revealInTreeView metalsPackages<CR>


