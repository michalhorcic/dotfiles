"ns {{{
call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'ajmwagar/vim-deus'
Plug 'catppuccin/nvim', {'as': 'catppuccin'}
Plug 'mhartington/oceanic-next'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'chrisbra/Colorizer'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'lewis6991/gitsigns.nvim'

Plug 'hoob3rt/lualine.nvim'
" Plug 'kristijanhusak/defx-git'
" Plug 'kristijanhusak/defx-icons'
" Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'neovim/nvim-lspconfig'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'MunifTanjim/prettier.nvim'

Plug 'David-Kunz/jester'

Plug 'tami5/lspsaga.nvim'
Plug 'folke/lsp-colors.nvim'
Plug 'L3MON4D3/LuaSnip'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'kyazdani42/nvim-web-devicons'
Plug 'onsails/lspkind-nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'jvgrootveld/telescope-zoxide'
Plug 'windwp/nvim-autopairs'

Plug 'vimwiki/vimwiki'

call plug#end()
" }}}

" General settings {{{
set encoding=utf-8
set clipboard=unnamedplus             " use system clipboard
set nocompatible                  " nocompatible is good for humans
syntax enable                     " enable syntax highlighting...
filetype plugin indent on         " depending on filetypes...
runtime macros/matchit.vim        " with advanced matching capabilities
set pastetoggle=<F12>             " for pasting code into Vim
set timeout tm=1000 ttm=10        " fix slight delay after pressing Esc then O
set autoread                      " auto load files if vim detects change
set autowrite                     " auto write files when moving around
set nobackup                      " disable backup files...
set noswapfile                    " and swap files
set updatetime=100
set lazyredraw

" Style
" let g:gruvbox_contrast_dark = 'hard'
" set background=dark
" let g:deus_termcolors=256

" colorscheme palenight

set t_Co=256
set termguicolors

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

set background=dark    " Setting dark mode
colorscheme palenight
" let g:catppuccin_flavour = "dusk" " latte, frappe, macchiato, mocha
" colorscheme catppuccin

let g:palenight_terminal_italics=1
" colorscheme oceanicnext
let g:deus_termcolors=256


let g:colorizer_auto_filetype='css,html,md,markdown'

" color gruvbox
" colorscheme afterglow
set number                        " line numbers are cool
set relativenumber                " relative numbers are cooler
set ruler                         " show the cursor position all the time
set nocursorline                  " disable cursor line
" set cursorcolumn
" set cursorline
set showcmd                       " display incomplete commands
set novisualbell                  " no flashes please
set scrolloff=3                   " provide some context whenThen move the cursor, and paste the text at the new position (press p to paste after the line with the cursor, or P to paste before). editing
set hidden                        " Allow backgrounding buffers without writing them, and
                                  " remember marks/undo for backgrounded buffers
" Mouse
set mouse=a                       " we love the mouse
if !has('nvim')
  set ttymouse=xterm2             " and we want it to be fast
endif
set mousehide                     " but hide it when we're writing

" Whitespace
set nowrap                        " don't wrap lines
set tabstop=2                     " a tab is two spaces
set shiftwidth=2                  " an autoindent (with <<) is two spaces
set softtabstop=2                 " when deleting, treat spaces as tabs
set expandtab                     " use spaces, not tabs
set list                          " show invisible characters
set backspace=indent,eol,start    " backspace through everything in insert mode
set autoindent                    " keep indentation level when no indent is found

" Wild life
set wildmenu                      " wildmenu gives autocompletion to vim
set wildmode=list:longest,full    " autocompletion shouldn't jump to the first match
set wildignore+=*.scssc,*.sassc,*.csv,*.pyc,*.xls
set wildignore+=tmp/**,node_modules/**,bower_components/**

" List chars
set listchars=""                  " reset the listchars
set listchars=tab:▸\ ,eol:¬       " a tab should display as "▸ ", end of lines as "¬"
set listchars+=trail:.            " show trailing spaces as dots
set listchars+=extends:>          " the character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen
set listchars+=precedes:<         " the character to show in the first column when wrap is
                                  " off and the line continues beyond the left of the screen
set fillchars+=vert:\             " set vertical divider to empty space

" Searching
set hlsearch                      " highlight matches...
nohlsearch                        " but don't highlight last search when reloading
set incsearch                     " incremental searching
set ignorecase                    " searches are case insensitive...
set smartcase                     " unless they contain at least one capital letter

" Windows
set splitright                    " create new horizontal split on the right
set splitbelow                    " create new vertical split below the current window

" Backup and status line
set backupdir=~/.vim/_backup    " where to put backup files.
set directory=~/.vim/_temp      " where to put swap files.
set laststatus=2
" }}}

" File types "{{{
" ---------------------------------------------------------------------
" JavaScript
au BufNewFile,BufRead *.es6 setf javascript
" TypeScript
au BufNewFile,BufRead *.tsx setf typescriptreact
" Markdown
au BufNewFile,BufRead *.md set filetype=markdown
au BufNewFile,BufRead *.mdx set filetype=markdown
" Flow
au BufNewFile,BufRead *.flow set filetype=javascript
" Fish
au BufNewFile,BufRead *.fish set filetype=fish

au BufNewFile,BufRead *.cpon set filetype=cpon

au BufNewFile,BufRead *.heex set filetype=html

set suffixesadd=.js,.es,.jsx,.json,.css,.less,.sass,.styl,.php,.py,.md

autocmd FileType coffee setlocal shiftwidth=2 tabstop=2
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2

autocmd FileType json setlocal makeprg=python3\ -mjson.tool\ 2>&1\ %\ >\ /dev/null
                     \| setlocal errorformat=%m:\ line\ %l\ column\ %c\ %.%#

" function! PrettyJSON()
"   silent %!python3 -mjson.tool | sed -e 's/\s*$//'
" endfunction

" command! Fjson call PrettyJSON()

autocmd BufWritePre *.tsx,*.ts,*.jsx,*.js EslintFixAll

"}}}

" Mappings {{{
let mapleader=','

" open vimrc and reload it
nnoremap <Leader>vv :vsplit $HOME/.vimrc<CR>
nnoremap <Leader>sv :source $HOME/.vimrc<CR>

" use ctrl+c as ESC
inoremap <C-c> <Esc>
nnoremap <C-c> :w!<cr>

" disable man page for word under cursor
nnoremap K <Nop>

" clear the search buffer when hitting return
nnoremap <CR> :nohlsearch<CR>

" expand %% to current directory
cnoremap %% <C-R>=expand('%:h').'/'<CR>
nmap <Leader>e :e %%

" easy way to switch between latest files
nnoremap <Leader><Leader> <C-^>
nnoremap <Leader>vs :execute "vsplit " . bufname("#")<CR>
nnoremap <Leader>sp :execute "split " . bufname("#")<CR>

" find merge conflict markers
nnoremap <silent> <Leader>cf <Esc>/\v^[<=>]{7}( .*\|$)<CR>

" show colorcolumn
nnoremap <silent> <Leader>sc :set colorcolumn=80<CR>

" copy current path
nnoremap <silent> <Leader>p :let @* = expand("%")<CR>

" easy substitutions
nnoremap <Leader>r :%s///gc<Left><Left><Left>
nnoremap <Leader>R :%s:::gc<Left><Left><Left>

" remove whitespaces and windows EOL
command! KillWhitespace :normal :%s/\s\+$//e<CR><C-O><CR>
command! KillControlM :normal :%s/<C-V><C-M>//e<CR><C-O><CR>
nnoremap <Leader>kw :KillWhitespace<CR>
nnoremap <Leader>kcm :KillControlM<CR>

" easier navigation between split windows
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-H> <C-W>h
nnoremap <C-L> <C-W>l

" disable cursor keys in normal mode
"nnoremap <Left>  :echo "no!"<CR>
"nnoremap <Right> :echo "no!"<CR>
"nnoremap <Up>    :echo "no!"<CR>
"nnoremap <Down>  :echo "no!"<CR>

" Fugitive
nnoremap <Leader>gs  :Gstatus<CR>
nnoremap <Leader>gd  :Gdiff<CR>
nnoremap <Leader>gci :Gcommit<CR>
nnoremap <Leader>gw  :Gwrite<CR>
nnoremap <Leader>gr  :Gread<CR>
nnoremap <Leader>gb  :Gblame<CR>

" Plugins mapping
" nnoremap <Leader>w :ALEDetail<CR>
" nnoremap <Leader>x :ALENextWrap<CR>
nnoremap <Leader>m :History<CR>
nnoremap <silent> <S-left> <Esc>:bp<CR>
nnoremap <silent> <S-right> <Esc>:bn<CR>
nnoremap <Leader>n :NERDTreeToggle<CR>

nnoremap <Leader>t :lua require("jester").run()<CR>
" nnoremap <Leader>jf :%python3 -m "json.tool"<CR>
nnoremap <Leader>jf :set ft=json<cr>:%!python3 -m json.tool<cr>gg=G<cr>

" nnoremap <Leader>t :wa<CR>\|:TestFile<CR>
" nnoremap <Leader>T :wa<CR>\|:TestNearest<CR>


" }}

" Plugins configuration {{{
let g:NERDTreeHighlightCursorline = 0
let g:NERDTreeMouseMode = 3
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
" let g:fzf_layout = { 'down': '~30%' }
" let g:goldenview__enable_default_mapping = 0
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"
" let g:lightline = { 'mode_fallback': { 'terminal': 'normal' } }
let g:lightline = { 'colorscheme': 'palenight' }
" let g:loaded_python3_provider = 1
let g:python3_host_prog = '/opt/homebrew/bin/python3'
let g:ruby_indent_access_modifier_style = 'normal'
let g:test#preserve_screen = 1
let g:test#strategy = "vimux"
let g:yankring_clipboard_monitor = 0
let g:yankring_history_dir = '$HOME/.vim'
let g:UltiSnipsSnippetsDir = '$HOME/.vim/UltiSnips'

let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'javascript', 'c']

" }}}

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


"let g:neomake_elixir_enabled_makers = ['credo']
"autocmd! BufWritePost * Neomake

" command! -bang -nargs=* Ag
"   \ call fzf#vim#ag(<q-args>,
"   \                 <bang>0 ? fzf#vim#with_preview({ 'options': '--bind ctrl-a:select-all,ctrl-d:deselect-all' }, 'up:60%')
"   \                         : fzf#vim#with_preview({ 'options': '--bind ctrl-a:select-all,ctrl-d:deselect-all' }, 'right:50%:hidden', '?'),
"   \                 <bang>0)
let g:gitgutter_terminal_reports_focus=0
