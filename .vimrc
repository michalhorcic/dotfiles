"ns {{{
call plug#begin('~/.vim/plugged')

Plug 'danilo-augusto/vim-afterglow'
Plug 'mhartington/oceanic-next'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'morhetz/gruvbox'
Plug 'jnurmine/Zenburn'
Plug 'franbach/miramare'
Plug 'jonathanfilip/lucius'
Plug 'nanotech/jellybeans.vim', { 'tag': 'v1.7' }
Plug 'cocopon/iceberg.vim'
Plug 'ajmwagar/vim-deus'
Plug 'ghifarit53/tokyonight-vim'
Plug 'jacoborus/tender.vim'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'drewtempelmeyer/palenight.vim'
Plug 'elixir-lang/vim-elixir'
Plug 'godlygeek/tabular'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all --no-update-rc' }
Plug 'junegunn/fzf.vim'
Plug 'pangloss/vim-javascript'
Plug 'jesseleite/vim-agriculture'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'slashmili/alchemist.vim'
Plug 'andys8/vim-elm-syntax'
Plug 'stefandtw/quickfix-reflector.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'leafgarland/typescript-vim'
Plug 'neomake/neomake'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'diepm/vim-rest-console'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-ruby/vim-ruby'
" Plug 'Yggdroot/indentLine'
Plug 'zhaocai/GoldenView.Vim'
Plug 'posva/vim-vue'
Plug 'airblade/vim-gitgutter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'yuttie/comfortable-motion.vim'
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

" COC
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <c-space> coc#refresh()

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
colorscheme deus
let g:deus_termcolors=256

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

" FileType settings {{{
if has("autocmd")
  " in Makefiles use real tabs, not tabs expanded to spaces
  augroup filetype_make
    au!
    au FileType make setl ts=8 sts=8 sw=8 noet
  augroup END

  " make sure all markdown files have the correct filetype set and setup wrapping
  augroup filetype_markdown
    au!
    au FileType markdown setl tw=80
    au BufRead,BufNewFile *.{md,markdown,mdown,mkd,mkdn,txt} setf markdown
  augroup END

  " treat JSON files like JavaScript
  augroup filetype_json
    au!
    au BufNewFile,BufRead *.json setf javascript
  augroup END

  " treat JSON files like JavaScript
  augroup filetype_typescript
    au!
    au BufNewFile,BufRead *.ts setf javascript
  augroup END

  " disable endwise for anonymous functions
  augroup filetype_elixir_endwise
    au!
    au BufNewFile,BufRead *.{ex,exs}
          \ let b:endwise_addition = '\=submatch(0)=="fn" ? "end)" : "end"'
  augroup END

  " make Python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
  augroup filetype_python
    au!
    au FileType python setl sts=4 ts=4 sw=4
  augroup END

  " follow Elm conventions
  augroup filetype_elm
    au!
    au FileType elm setl sts=4 ts=4 sw=4 et
  augroup END

  " delete Fugitive buffers when they become inactive
  augroup filetype_fugitive
    au!
    au BufReadPost fugitive://* set bufhidden=delete
  augroup END

  " fold automatically with triple {
  augroup filetype_vim
    au!
    au FileType vim,javascript,python,c setlocal foldmethod=marker nofoldenable
  augroup END

  " enable <CR> in command line window and quickfix
  augroup enable_cr
    au!
    au CmdwinEnter * nnoremap <buffer> <CR> <CR>
    au BufWinEnter quickfix nnoremap <buffer> <CR> <CR>
  augroup END

  " disable automatic comment insertion
  augroup auto_comments
    au!
    au FileType * setlocal formatoptions-=ro
  augroup END

  " disable numbers in terminal windows
  augroup terminal_numbers
    au!
    autocmd TermOpen * setlocal nonumber norelativenumber
  augroup END

  " remember last location in file, but not for commit messages,
  " or when the position is invalid or inside an event handler,
  " or when the mark is in the first line, that is the default
  " position when opening a file. See :help last-position-jump
  augroup last_position
    au!
    au BufReadPost *
      \ if &filetype !~ '^git\c' && line("'\"") > 1 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif
  augroup END
endif
" }}}

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
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>m :History<CR>
nnoremap <silent> <S-left> <Esc>:bp<CR>
nnoremap <silent> <S-right> <Esc>:bn<CR>
nnoremap <Leader>a <Esc>:AgRaw<space>
nnoremap <Leader>n :NERDTreeToggle<CR>
nnoremap <Leader>t :wa<CR>\|:TestFile<CR>
nnoremap <Leader>T :wa<CR>\|:TestNearest<CR>


" Keybindings
nmap <leader>r <Plug>(coc-rename)
nmap <silent> <leader>s <Plug>(coc-fix-current)
nmap <silent> <leader>S <Plug>(coc-codeaction)
" nmap <silent> <leader>a <Plug>(coc-diagnostic-next)
" nmap <silent> <leader>A <Plug>(coc-diagnostic-next-error)
nmap <silent> <leader>d <Plug>(coc-definition)
nmap <silent> <leader>g :call CocAction('doHover')<CR>
nmap <silent> <leader>u <Plug>(coc-references)
nmap <silent> <leader>p :call CocActionAsync('format')<CR>

" }}

" Plugins configuration {{{
let g:NERDTreeHighlightCursorline = 0
let g:NERDTreeMouseMode = 3
let g:elixir_use_markdown_for_docs = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:fzf_layout = { 'down': '~30%' }
let g:goldenview__enable_default_mapping = 0
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"
" let g:lightline = { 'mode_fallback': { 'terminal': 'normal' } }
let g:lightline = { 'colorscheme': 'deus' }
let g:loaded_python3_provider = 1
let g:ruby_indent_access_modifier_style = 'normal'
let g:test#preserve_screen = 1
let g:test#strategy = "vimux"
let g:yankring_clipboard_monitor = 0
let g:yankring_history_dir = '$HOME/.vim'
let g:UltiSnipsSnippetsDir = '$HOME/.vim/UltiSnips'
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


let g:neomake_elixir_enabled_makers = ['credo']
autocmd! BufWritePost * Neomake

command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview({ 'options': '--bind ctrl-a:select-all,ctrl-d:deselect-all' }, 'up:60%')
  \                         : fzf#vim#with_preview({ 'options': '--bind ctrl-a:select-all,ctrl-d:deselect-all' }, 'right:50%:hidden', '?'),
  \                 <bang>0)
let g:gitgutter_terminal_reports_focus=0
