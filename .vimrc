set nocompatible
set nowrap
set tabstop=2
set expandtab

set backspace=indent,eol,start
set autoindent
set copyindent
set number
set shiftwidth=2
set shiftround
set showmatch
set ignorecase
set smartcase
set smarttab
set hlsearch
set incsearch
set mouse=a
set signcolumn=yes
set hidden
" do not add EOF automatically when file is opened (messing with git)
set nofixendofline

filetype plugin on

set omnifunc=syntaxcomplete#Complete
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'

"Plug 'NLKNguyen/papercolor-theme'
"Plug 'jacoborus/tender.vim'
"Plug 'felixhummel/setcolors.vim'
"Plug 'flazz/vim-colorschemes'
"Plug 'chriskempson/base16-vim'
Plug 'morhetz/gruvbox'
"Plug 'kristijanhusak/vim-hybrid-material'
"Plug 'dracula/vim', { 'as': 'dracula' }
"Plug 'ayu-theme/ayu-vim'
"Plug 'crusoexia/vim-monokai'
"Plug 'mhartington/oceanic-next'
"Plug 'nanotech/jellybeans.vim'
"Plug 'dikiaap/minimalist'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'bronson/vim-trailing-whitespace'
Plug 'Shougo/vimproc.vim'
Plug 'Shougo/unite.vim'
Plug 'mileszs/ack.vim'
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'

Plug 'tpope/vim-fugitive'

Plug 'Yggdroot/indentLine'

Plug 'vim-scripts/dbext.vim'

Plug 'w0rp/ale'

Plug 'tpope/vim-commentary'

" Plug 'diepm/vim-rest-console'
Plug 'baverman/vial'
Plug 'baverman/vial-http'

" Syntax highlighting
Plug 'slashmili/alchemist.vim'
Plug 'elixir-lang/vim-elixir'
" Plug 'sheerun/vim-polyglot'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-rails'
Plug 'elzr/vim-json'
Plug 'godlygeek/tabular'
Plug 'posva/vim-vue'
" Plug 'jelera/vim-javascript-syntax'
Plug 'plasticboy/vim-markdown'
Plug 'pangloss/vim-javascript'
"Plug 'Quramy/vim-js-pretty-template'
"Plug 'mxw/vim-jsx'
"Plug 'jparise/vim-graphql'
Plug 'leafgarland/typescript-vim'
" Plug 'othree/es.next.syntax.vim'
" Plug 'HerringtonDarkholme/yats'
Plug 'othree/yajs.vim'
" Plug 'Quramy/tsuquyomi'
" Syntax errors
Plug 'ntpeters/vim-better-whitespace'


call plug#end()
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_bold = 1
let g:gruvbox_italic = 1
let g:gruvbox_underline = 0

"let g:indentLine_char = 'c'

let g:ackprg = 'ag --vimgrep --smart-case'
cnoreabbrev ag Ack
cnoreabbrev aG Ack
cnoreabbrev Ag Ack
cnoreabbrev AG Ack
" let g:gitgutter_terminal_reports_focus=0
if (has("termguicolors"))
 set termguicolors
endif

" Theme
let g:airline_powerline_fonts = 1
syntax enable
set background=dark
colorscheme gruvbox
let g:airline_theme='gruvbox'
if (exists('+colorcolumn'))
    set colorcolumn=100
    highlight ColorColumn ctermbg=3
endif
nmap í :Ag -A5 -B5 <c-r>=expand("<cword>")<cr><cr>
nnoremap <space>/ :Ag
" let g:alchemist#elixir_erlang_src = "~/projects/ELIXIR/source/combined"
" Setup some default ignores
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site|_build|dist|node_modules)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}

let &l:winheight = &lines / 2

" Autocomplete - seems to use lot of CPU - check later
" let g:deoplete#enable_at_startup = 1
" let g:ale_completion_enabled = 1

set list
set listchars=tab:▸\ ,eol:¬

" Use the nearest .git directory as the cwd
" This makes a lot of sense if you are working on a project that is in version
" control. It also supports works with .svn, .hg, .bzr.
let g:ctrlp_working_path_mode = 'r'
let mapleader = "\\"
" Use a leader instead of the actual named binding
nmap <leader>p :CtrlP<cr>
" Easy bindings for its various modes
nmap <leader>bb :CtrlPBuffer<cr>
nmap <leader>bm :CtrlPMixed<cr>
nmap <leader>bs :CtrlPMRU<cr>

nmap <leader>dd :ALEGoToDefinition<cr>
nmap <leader>dr :ALEFindReferences<cr>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nmap <leader>s :VialHttp<cr>

" Use the right side of the screen
let g:buffergator_viewport_split_policy = 'R'
" temporary solution before better syntax highlighting will be found for ts
autocmd BufNewFile,BufRead *.ts set syntax=javascript

" Setting for dbext plugin - used for accessing any database
let g:dbext_default_profile_psql = 'type=PGSQL:host=localhost:port=5432:dbname=observer:user=observer'
let g:dbext_default_profile = 'psql'
