set nocompatible
filetype plugin indent on

set encoding=utf-8

" Tabs / indenting
set tabstop=2                     "Global tab width
set shiftwidth=2                  "Shift width
set smarttab                      "<Tab> in indent inserts 'shiftwidth' spaces
set softtabstop=2                 "No of spaces to insert for a <Tab>
set expandtab                     "Use spaces instead of tabs
set autoindent                    "Match previous indent level
set smartindent

" Display
set scrolloff=3                   "Show 3 lines of context around cursor
set number                        "Show line numbers
set ruler                         "Show cursor position
set cursorline                    "Draw line under cursor
set wrap                          "Turn on line wrapping
set list                          "Show whitespace chars
set listchars=tab:\ \ ,trail:·    "List strings used for list mode

" Messages and info
set title
set showmode                      "Display the mode we're in
set showcmd                       "Display incomplete commands

" Search
set ignorecase                    "Case-insensitive searching
set smartcase                     "But case-sensitive if using cap letter
set gdefault                      "Default to /g suffix on searches
set incsearch                     "Highlight matches as you type
set hlsearch                      "Highlight matches
set inccommand=split
hi Search ctermbg=LightYellow ctermfg=Black

" Status line
set laststatus=2                  "Enables the status line at the bottom of Vim
set statusline= "Begin
set statusline+=\ %t%m
set statusline+=%=
set statusline+=%c,
set statusline+=%l/%L
set statusline+=\  "Set ending space
highlight statusLine cterm=bold ctermfg=black ctermbg=white
highlight statusLineNC cterm=bold ctermfg=black ctermbg=gray
au InsertLeave * highlight StatusLine cterm=bold ctermfg=black ctermbg=white
au InsertEnter * highlight StatusLine cterm=bold ctermfg=black ctermbg=blue

" Windows
set hidden                        "Handle multiple buffers better

" Command line
set wildmenu                      "Enhanced command line completion
set wildmode=list:longest         "Complete files like a shell
set wildignore=.git,.vim-tags,*.swp,*.spl,*.DS_Store,*.jpg,*.bmp,*.gif,*.png,*.jpeg,*/tmp,*/log,*/vendor/bundle,*/vendor/cache,*/bin,*.zip

" Editing text
set backspace=indent,eol,start    "Intuitive backspacing

set nobackup                      "Don't make file backups
set nowritebackup                 "Ditto
set directory=$HOME/.vim-tmp/,~/tmp,/var/tmp,/tmp
set backupdir=$HOME/.vim-tmp/,~/tmp,/var/tmp,/tmp

syntax enable                     "Turn on syntax highlighting

"Change leader key
let mapleader=","

"Navigate splits w/ ctrl movement
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

if bufwinnr(1)
  map + <C-W>+
  map - <C-W>-
  map } <C-w>>
  map { <C-w><
endif

" Toggle line numbers
nnoremap <F2> :set nonumber!<CR>

"Terminal mode
nnoremap <leader><b> :terminal<CR>
tnoremap <C-\><Esc> <C-\><C-n>
highlight! TermCursorNC guibg=red guifg=white ctermbg=1 ctermfg=15

" Toggle paste mode
set pastetoggle=<leader>z

"Leader-Space to clear search highlighting
nnoremap <leader><space> :noh<CR>

" Quit file
noremap <leader>q :q<cr>

" Save file
nnoremap <leader>s :w<cr>
inoremap <leader>s <C-c>:w<cr>

"Strip all trailing whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

"Horizontal split
nnoremap <leader>w <C-w>s<C-w>k
nnoremap <leader>s <C-w>v

"Use tab for matching bracket pairs
nnoremap <tab> %
vnoremap <tab> %

"Fix vim regex handling
vnoremap / /\v

"Reselect text just pasted
nnoremap <leader>v V`]

" Fixers
let g:ale_fixers = {'javascript': ['prettier']}
let g:ale_fixers = {'typescript': ['prettier']}

noremap <leader>d :ALEFix<cr>
