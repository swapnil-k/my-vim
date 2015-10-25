" enable syntax highlighting
syntax enable
set tabstop=4
set showmode
set nowrap
set softtabstop=4
set expandtab
set shiftwidth=4
set shiftround
set backspace=indent,eol,start
set autoindent
set copyindent
set number
set showmatch
set ignorecase
set smartcase
set smarttab
set scrolloff=4
set virtualedit=all
set hlsearch
set incsearch
set gdefault
set list
"set listchars=tab:>-,trail:.,extends:#,nbsp:.
"set listchars=trail:.,extends:#,nbsp:.
set mouse=a
set fileformats="unix,dos,mac"
set nrformats=
set shortmess+=I
set clipboard=unnamed
set autoread
set termencoding=utf-8
set encoding=utf-8
set laststatus=2
set ruler   "show line number in right bottom
set cmdheight=2
set hidden
set history=1000
set undolevels=1000
if v:version >= 730
    set undofile
    set undodir=~/.vim/.undo,~/tmp,/tmp
endif
set nobackup
set noswapfile
set directory=~/.vim/.tmp,~/tmp,/tmp
set wildmenu
set wildmode=list:full
set wildignore=*.swp,*.bak,*.pyc,*.class
set title
set visualbell
set noerrorbells
set pastetoggle=<F2>
set showcmd
set nomodeline
set ttyfast
set cursorline   " underline the current line 
set bg=dark

if &t_Co >= 256 || has("gui_running")
        colorscheme mustang
    endif

if &t_Co > 2 || has("gui_running")
   syntax on                    " switch syntax highlighting on, when the terminal has colors
endif

cnoremap w!! w !sudo tee % >/dev/null

nnoremap <Tab> %
vnoremap <Tab> %
nnoremap <silent> ,n :nohlsearch<CR>   " press \n to clear the search
nnoremap ; :

"---- python setting
autocmd filetype python setlocal textwidth=78
autocmd filetype python match ErrorMsg '\%>120v.\+'
autocmd filetype python setlocal formatoptions-=t
autocmd filetype python noremap <buffer> <F5> :w<CR>:!python %<CR>
autocmd filetype python inoremap <buffer> <F5> <Esc>:w<CR>:!python %<CR>
autocmd filetype python noremap <buffer> <S-F5> :w<CR>:!ipython %<CR>
autocmd filetype python inoremap <buffer> <S-F5> <Esc>:w<CR>:!ipython %<CR>
" enable all Python syntax highlighting features
let python_highlight_all = 1

augroup vimrc_autocmds
    autocmd!
    " highlight characters past column 120
    autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType python match Excess /\%120v.*/
    " autocmd FileType python set nowrap
    augroup END
"-----------------------------

"-----for ssh connections
set nocp
filetype plugin indent on
autocmd filetype python set expandtab

"------markdown setting  enable all markdown file conversion
nmap ,md :!/Users/apple/markdown_to_html.sh >/tmp/out.txt 2>&1
let g:vim_markdown_folding_disabled=1 "disable markdown folding

"------- load all plugin using pathogen
execute pathogen#infect()
call pathogen#infect()
call pathogen#helptags()

"funny file search
set runtimepath^=~/.vim/bundle/ctrlp.vim

" ---python as ide http://unlogic.co.uk/2013/02/08/vim-as-a-python-ide/
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
" The bundles you install will be listed here
filetype plugin indent on
"----------------------------

"---- Powerline setup
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 9
"set term=xterm-256color

"----Neertree setup and shortcuts
map <F2> :NERDTreeToggle<CR>


"----Python-mode http://unlogic.co.uk/2013/02/08/vim-as-a-python-ide/
" Activate rope
" Keys:
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)
let g:pymode_rope = 0
let g:pymode_rope_lookup_project = 0  "---issue: https://github.com/klen/python-mode/issues/342

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

"Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
" Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all
let g:pymode_options=1
let g:pymode_run=1
let g:pymode_folding=1  "enable code block folding
let g:pymode_syntax_slow_sync=1
let g:pymode_trim_whitespaces=0


"----Goldenview window split plugin

" 1. split to tiled windows
"nmap <silent> <C-L>  <Plug>GoldenViewSplit

" 2. quickly switch current window with the main pane and toggle back
"nmap <silent> <F8>   <Plug>GoldenViewSwitchMain
"nmap <silent> <S-F8> <Plug>GoldenViewSwitchToggle

" 3. jump to next and previous window
"nmap <silent> <C-N>  <Plug>GoldenViewNext
"nmap <silent> <C-P>  <Plug>GoldenViewPrevious


" window
nmap <leader>sw<left>  :topleft  vnew<CR>
nmap <leader>sw<right> :botright vnew<CR>
nmap <leader>sw<up>    :topleft  new<CR>
nmap <leader>sw<down>  :botright new<CR>

" buffer
nmap <leader>s<left>   :leftabove  vnew<CR>
nmap <leader>s<right>  :rightbelow vnew<CR>
nmap <leader>s<up>     :leftabove  new<CR>
nmap <leader>s<down>   :rightbelow new<CR>


"----tagbar plugin setting
nmap <F3> :TagbarToggle<CR>
