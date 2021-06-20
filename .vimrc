set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set exrc
set nu
set relativenumber
set hidden
set guicursor=
set nohlsearch
set noerrorbells
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set smartcase
set smartcase
set incsearch
set termguicolors
set scrolloff=8
set noshowmode
set signcolumn=yes
set colorcolumn=120
set signcolumn=yes
set backspace=indent,eol,start
highlight ColorColumn guibg=grey
set cmdheight=2

call plug#begin('~/.vim/plugged')
Plug 'gruvbox-community/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'puremourning/vimspector'
Plug 'valloric/youcompleteme'
Plug 'tell-k/vim-autopep8'
Plug 'dense-analysis/ale'
Plug 'puremourning/vimspector'
Plug 'scrooloose/nerdcommenter'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-surround'
Plug 'kana/vim-textobj-user'
Plug 'glts/vim-textobj-comment'
Plug 'janko/vim-test'
Plug 'mhinz/vim-signify'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
Plug 'yggdroot/indentline'
Plug 'kien/ctrlp.vim'
Plug 'plasticboy/vim-markdown'
Plug 'elzr/vim-json'
Plug 'derekwyatt/vim-scala'
Plug 'ekalinin/dockerfile.vim'
Plug 'suan/vim-instant-markdown'
Plug 'glench/vim-jinja2-syntax'
Plug 'pearofducks/ansible-vim'
Plug 'vim-latex/vim-latex'
Plug 'cespare/vim-toml'
Plug 'stephpy/vim-yaml'
Plug 'vim-scripts/bats.vim'
Plug 'powerline/powerline'
Plug 'vim-scripts/bash-support.vim'
Plug 'vim-scripts/sh.vim'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'mbbill/undotree'
cal plug#end()

colorscheme gruvbox
set background=dark
if executable('rg')
    let g:rg_derive_root='true'
endif

let NERDTreeShowHidden=1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 1

let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_folding_style_pythonic = 1
let g:vim_markdown_folding_level = 6
set conceallevel=2
let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_json_frontmatter = 1
let g:vim_markdown_strikethrough = 1
let g:vim_markdown_new_list_item_indent = 2
let g:vim_markdown_no_extensions_in_markdown = 1
let g:vim_markdown_autowrite = 1
let g:vim_markdown_edit_url_in = 'tab'


autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif
" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

map <C-b> :NERDTreeToggle<CR>
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'
let g:gitgutter_show_msg_on_hunk_jumping = 0
set foldtext=gitgutter#fold#foldtext()
let g:gitgutter_sign_allow_clobber = 1
let g:gitgutter_set_sign_backgrounds = 1
highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1
let g:gitgutter_sign_added = 'xx'
let g:gitgutter_sign_modified = 'yy'
let g:gitgutter_sign_removed = 'zz'
let g:gitgutter_sign_removed_first_line = '^^'
let g:gitgutter_sign_removed_above_and_below = '{'
let g:gitgutter_sign_modified_removed = 'ww'
highlight link GitGutterChangeLine DiffText
let g:gitgutter_diff_relative_to = 'working_tree'
let g:gitgutter_diff_base = '<commit SHA>'
let g:gitgutter_git_args = '--git-dir-""'
let g:gitgutter_diff_args = '-w'
let g:gitgutter_map_keys = 0
let g:gitgutter_grep = 'grep'
let mapleader=" "
" Autocommands
fun! TrimWhitespace()
    let l:save=winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup THE_PRIMEAGEN
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END
filetype plugin on


nnoremap <C-Left> :call AfPPAlternatePluthPluth()<CR>
nnoremap <C-Up> :call AfPPAlternate()<CR>
inoremap <C-Left> <esc>:call AfPPAlternatePluthPluth()<CR>
inoremap <C-Up> <esc>:call AfPPAlternate()<CR>
nnoremap <C-k> :cnext<CR>zz
nnoremap <C-j> :cprev<CR>zz
nnoremap <leader>k :lnext<CR>zz
nnoremap <leader>j :lprev<CR>zz
nnoremap <C-q> :call ToggleQFList(1)<CR>
nnoremap <leader>q :call ToggleQFList(0)<CR>

let g:the_primeagen_qf_l = 0
let g:the_primeagen_qf_g = 0

fun! ToggleQFList(global)
    if a:global
        if g:the_primeagen_qf_g == 1
            let g:the_primeagen_qf_g = 0
            cclose
        else
            let g:the_primeagen_qf_g = 1
            copen
        end
    else
        if g:the_primeagen_qf_l == 1
            let g:the_primeagen_qf_l = 0
            lclose
        else
            let g:the_primeagen_qf_l = 1
            lopen
        end
    endif
endfun


nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <leader>ps :Rg<space>
nnoremap <silent> <Leader>+ :vertical resize +5<CR>
nnoremap <silent> <Leader>+ :vertical resize -5<CR>

nnoremap <silent> <Leader>gd :YcmCompleter GoTo<CR>
nnoremap <silent> <Leader>gf :YcmCompleter Fixit<CR>

let g:BASH_AuthorName   = 'AlexanderOsipenko'
let g:BASH_Email        = 'mr.aosipenko@gmail.com'
