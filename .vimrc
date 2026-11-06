" ============================
set nocompatible          " Use Vim defaults, not old Vi behavior
syntax on                 " Enable syntax highlighting
filetype plugin indent on " Detect file type, load plugins/indent rules for it

" ============================
" INDENTATION
" ============================
set tabstop=4             " A tab character looks like 4 spaces
set shiftwidth=4          " Indent by 4 spaces when using >> or <<
set expandtab             " Convert tabs to spaces
set autoindent            " Copy indent from current line when starting a new one

" ============================
" SEARCH
" ============================
set incsearch             " Show matches as you type
set hlsearch               " Highlight all matches
set ignorecase             " Case-insensitive search...
set smartcase               " ...unless you type an uppercase letter

" ============================
" UI
" ============================
set number                 " Show line numbers
set relativenumber         " Show relative line numbers (great for jumps like 5j)
set cursorline              " Highlight the current line
set showcmd                 " Show partial commands in the bottom bar
set wildmenu                " Visual autocomplete for command menu
set scrolloff=8              " Keep 8 lines visible above/below cursor

" ============================
" EDITING BEHAVIOR
" ============================
set backspace=indent,eol,start  " Make backspace work like you'd expect
" NOTE: not sure its the right
set clipboard=unnamedplus       " Use system clipboard for yank/paste
set undofile                     " Persistent undo across sessions


" ============================
" KEY MAPPINGS
" ============================
let mapleader = " "               " Set space as the leader key
nnoremap <leader>w :w<CR>         " Space+w to save
nnoremap <leader>q :q<CR>         " Space+q to quit
nnoremap <esc> :noh<CR><esc>      " Pressing Esc clears search highlight

" toggle explorer
nnoremap <leader>b :NERDTreeToggle <CR> " toggle nerd tree

" comment current line

" vertical split
nnoremap <leader>sv :vsplit <CR>

" easy python function


" ======================= Plugins ======================

call plug#begin()

    " List your plugins here

    " vscode like style : autocomplete, lsp...
    Plug 'neoclide/coc.nvim', { 'branch': 'release' }

    " fuzzy finder, to  explore & find files 
    Plug 'junegunn/fzf', { 'dir': '~/.fzf' }

    " side explorer
    Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
   
call plug#end()


" Configuration for 'coc.vim' plugin
" NOTE: you must organise this later
let g:coc_global_extensions = ['coc-pyright', 'coc-tsserver','coc-clangd']

set nobackup
set nowritebackup
set updatetime=300
set signcolumn=yes
set laststatus=2

" ---------------- coc.vim configuration -------------------- 
    " Show coc.nvim status, including extension installation progress
    set statusline^=%{coc#status()}
     
    function! CheckBackspace() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1] =~# '\s'
    endfunction
     
    " Trigger completion with Tab and navigate the completion menu
    inoremap <silent><expr> <TAB>
          \ coc#pum#visible() ? coc#pum#next(1) :
          \ CheckBackspace() ? "\<Tab>" :
          \ coc#refresh()
    inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
    inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
     
    " Diagnostics and code navigation
    nmap <silent> [c <Plug>(coc-diagnostic-prev)
    nmap <silent> ]c <Plug>(coc-diagnostic-next)
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)
    nmap <leader>rn <Plug>(coc-rename)
