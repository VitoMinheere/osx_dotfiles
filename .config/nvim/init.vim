set nocompatible            " Disable compatibility to old-time vi
set showmatch               " Show matching brackets.
set ignorecase              " Do case insensitive matching
set hlsearch                " highlight search results
set tabstop=4               " number of columns occupied by a tab character
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab             " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number relativenumber   " add relative line numbers
set wildmode=longest,list   " get bash-like tab completions
set cursorline              " highlight current line
filetype indent on          " load filetype file from ~/.vim/indent/{filetype}
set wildmenu                " visual autocomplete for command menu
set lazyredraw              " redraw only when needed
set noswapfile              " Remove swap file usage

" Search settings
set incsearch               " search as characters are entered
set hlsearch                " highlight matches

colorscheme badwolf

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.config/nvim/plugged')

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'davidhalter/jedi-vim'
Plug 'w0rp/ale'
Plug 'leafgarland/typescript-vim'
Plug 'plytophogy/vim-virtualenv'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dart-lang/dart-vim-plugin'
call plug#end()

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\   'typescript': [],
\   'python': ['autopep8', 'remove_trailing_lines', 'trim_whitespace']
\}
" Set this variable to 1 to fix files when you save them.
" let g:ale_fix_on_save = 1
let g:ale_sign_column_always = 1

" VIM Jedi
let g:jedi#force_py_version = 3
set completeopt-=preview                        " Don't show preview popup

" coc.nvim
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

autocmd VimEnter * NERDTree | wincmd p
" AUTOCOMPLETION
" filetype plugin on
" set omnifunc=syntaxcomplete#Complete

" Toggle NERDtreeview
nnoremap <silent> <Space> :NERDTreeToggle <CR>

" Toggle tagbar
" nmap <F8> :TagbarToggle<CR>

" Set working dir to currently opened file
autocmd BufEnter * silent! lcd %:p:h

" " Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y

" " Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" Add custom Commands
command Respace execute "!sed -i 's/        /\t/g' %"

" Python settings
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix
