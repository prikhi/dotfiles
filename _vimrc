" TODO: Switch out w/ relevant docs
" https://github.com/prikhi/dotfiles/
" ==========================================================
" Dependencies - Libraries/Applications outside of vim
" ==========================================================
" pip install pep8 pylint mccabe pep257
" cabal install hlint ghc-mod hdevtools fast-tags pointfree

scriptencoding utf-8

" ==========================================================
" Plugins included
" ==========================================================
" Pathogen
"     Better Management of VIM plugins
"
" GunDo
"     Visual Undo in vim with diff's to check the differences
"
" Fugitive
"    Interface with git from vim
"
" Git
"    Syntax highlighting for git config files
"
" Surround
"    Allows you to surround text with open/close tags
"
" ==========================================================
" Shortcuts
" ==========================================================
set nocompatible              " Don't be compatible with vi
let g:mapleader=' '           " change the leader to be space instead of slash

" Set environment variable to directory containing this vimrc. Expect absolute
" directory $HOME on Unix or %USERPROFILE% on Windows.
let $VIMFILES = expand("<sfile>:p:h")

" Reload Vimrc
noremap <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" ;; to exit Insert Mode
inoremap ;; <Esc>
inoremap jj <Esc>

" Ctrl-E to jump to end of line in Insert Mode
inoremap <c-e> <c-o>$
" Ctrl-A to jump to start of line in Insert Mode
inoremap <c-a> <c-o>^


" For when you forget to let go of SHIFT...
command! W :w

" ctrl-hjkl switches to a split by direction
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-l> <c-w>l
noremap <c-h> <c-w>h

" Paste from global buffer
noremap <leader>p "+p
noremap <leader>P "+P

" Yank to global buffer
noremap <leader>y "+y
noremap <leader>Y "+Y

" Quit window on <leader>q
nnoremap <leader>q :q<CR>

" hide matches on <leader>space
nnoremap <leader><space> :nohlsearch<cr>

" Remove trailing whitespace on <leader>S
nnoremap <leader>S :%s/\s\+$//<cr>:let @/=''<CR>

" F2 toggles paste mode
noremap <F2> :set paste!<CR>

" open/close the quickfix window
nnoremap <leader>c  :copen<CR>
nnoremap <leader>cc :cclose<CR>
" open/close the location window (where syntastic puts its feedback)
nnoremap <leader>l  :lopen<CR>
nnoremap <leader>ll :lclose<CR>


" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

" ==========================================================
" Plugin Shortcuts
" ==========================================================
" Open NerdTree
noremap <leader>n :NERDTreeToggle<CR>

" Load the Gundo window
noremap <leader>g :UndotreeToggle<CR>

"" TODO: Make these Rope keybinds only in Python files
" Jump to the definition of whatever the cursor is on
noremap <leader>j :RopeGotoDefinition<CR>

" Rename whatever the cursor is on (including references to it)
noremap <leader>R :RopeRename<CR>

" Write a file as a super-user
command! SW SudoWrite
" Write a file as a super-user, then close the window
command! SWQ SudoWrite|q
" Read a file as a super-user
command! SR SudoRead

" ==========================================================
" vim-plug - Allows us to organize our vim plugins
" ==========================================================
filetype off
call plug#begin('~/.vim/plugged')

" General
Plug 'Raimondi/delimitMate'
Plug 'chrisbra/SudoEdit.vim'
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'vim-scripts/The-NERD-tree', { 'on': 'NERDTreeToggle' }

" Development
Plug 'w0rp/ale'
Plug 'bling/vim-airline'
Plug 'ctrlpvim/ctrlp.vim'
if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
    Plug 'Shougo/neocomplete.vim'
endif

" Haskell
Plug 'dag/vim2hs', { 'for': 'haskell' }
Plug 'godlygeek/tabular', { 'for': 'haskell' }
Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }
" Better Haskell Completions
Plug 'mkasa/lushtags', { 'for': 'haskell' }
Plug 'mkasa/neco-ghc-lushtags', { 'for': 'haskell' }


" Web Development
Plug 'ElmCast/elm-vim', { 'for': ['elm'] }
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'html', 'htmldjango'] }
Plug 'posva/vim-vue', { 'for': ['vue'] }
Plug 'raichoo/purescript-vim'
Plug 'FrigoEU/psc-ide-vim'
" Web Templates
Plug 'digitaltoad/vim-pug', { 'for': ['jade', 'pug']  }
Plug 'mustache/vim-mustache-handlebars', { 'for': ['moustache', 'html.handlebars'] }
Plug 'pbrisbin/vim-syntax-shakespeare',
    \ { 'for': ['haskell', 'shakespeare', 'cassius', 'hamlet', 'julius'] }
" Web Design
Plug 'hail2u/vim-css3-syntax', { 'for': ['css', 'scss', 'less'] }
Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' }


" Other FileTypes
Plug 'chase/vim-ansible-yaml', { 'for': 'ansible' }
Plug 'plasticboy/vim-markdown', { 'for': 'mkd' }
Plug 'klen/python-mode', { 'for': 'python' }
Plug 'wlangstroth/vim-racket', { 'for': 'racket' }
Plug 'cypok/vim-sml', { 'for': 'sml' }
Plug 'JesseKPhillips/d.vim', { 'for': 'd' }

" Music Creation
Plug 'munshkr/vim-tidal', { 'for': 'haskell.tidal' }
Plug 'wilsaj/chuck.vim', { 'for': 'chuck' }

call plug#end()

" ==========================================================
" Basic Settings
" ==========================================================
syntax on                     " syntax highlighing
filetype on                   " try to detect filetypes
filetype plugin indent on     " enable loading indent file for filetype
set synmaxcol=300             " improve speed in large files
set number                    " Display line numbers
set numberwidth=1             " using only 1 column (and 1 space) while possible
set background=dark           " We are using dark background in vim
set title                     " show title in console title bar
set wildmenu                  " Menu completion in command mode on <Tab>
set wildmode=full             " <Tab> cycles between all matching choices.
set guifont=Dina\ 10

" don't bell or blink
set noerrorbells
set vb t_vb=

" Ignore these files when completing
set wildignore+=*.o,*.obj,.git,*.pyc
set wildignore+=eggs/**
set wildignore+=*.egg-info/**

set grepprg=ack         " replace the default grep program with ack


""" Insert completion
" don't select first item, follow typing in autocomplete
set completeopt=menuone,longest,preview
set pumheight=10             " 10 item completion window


""" Moving Around/Editing
set cursorline              " have a line indicate the cursor location
set ruler                   " show the cursor position all the time
set nostartofline           " Avoid moving cursor to BOL when jumping around
set virtualedit=block       " Let cursor move past the last char in <C-v> mode
set scrolloff=3             " Keep 3 context lines above and below the cursor
set backspace=2             " Allow backspacing over autoindent, EOL, and BOL
set showmatch               " Briefly jump to a paren once it's balanced
set nowrap                  " don't wrap text
set linebreak               " don't wrap textin the middle of a word
set autoindent              " always set autoindenting on
set smartindent             " use smart indent if there is no indent file
set tabstop=4               " <tab> inserts 4 spaces
set shiftwidth=4            " but an indent level is 2 spaces wide.
set softtabstop=4           " <BS> over an autoindent deletes both spaces.
set expandtab               " Use spaces, not tabs, for autoindent/tab key.
set shiftround              " rounds indent to a multiple of shiftwidth
set matchpairs+=<:>         " show matching <> (html mainly) as well
set foldmethod=indent       " allow us to fold on indents
set foldlevel=99            " don't fold by default

" don't outdent hashes
inoremap # #

" close preview window automatically when we move around
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

"""" Reading/Writing
set noautowrite             " Never write a file unless I request it.
set noautowriteall          " NEVER.
set noautoread              " Don't automatically re-read changed files.
set modeline                " Allow vim options to be embedded in files;
set modelines=5             " they must be within the first or last 5 lines.
set ffs=unix,dos,mac        " Try recognizing dos, unix, and mac line endings.

"""" Messages, Info, Status
set ls=2                    " allways show status line
set vb t_vb=                " Disable all bells.  I hate ringing/flashing.
set confirm                 " Y-N-C prompt if closing with unsaved changes.
set showcmd                 " Show incomplete normal mode commands as I type.
set report=0                " : commands always print changed line count.
set shortmess+=a            " Use [+]/[RO]/[w] for modified/readonly/written.
set ruler                   " Show some info, even without statuslines.
set laststatus=2            " Always show statusline, even if only 1 window.
set statusline=[%l,%v\ %P%M]\ %f\ %r%h%w\ (%{&ff})\ %{fugitive#statusline()}

" displays tabs with :set list & displays when a line runs off-screen
set listchars=tab:>-,eol:$,trail:-,precedes:<,extends:>
"set list

""" Searching and Patterns
set ignorecase              " Default to using case insensitive searches,
set smartcase               " unless uppercase letters are used in the regex.
set smarttab                " Handle tabs more intelligently
set hlsearch                " Highlight searches by default.
set incsearch               " Incrementally search while typing a /regex

""" Backups
set backup
set backupdir^=~/.vim/bak//
set dir^=~/.vim/swp//

"""" Display
if has("gui_running")
    " Remove menu bar
    set guioptions-=m

    " Remove toolbar
    set guioptions-=T
endif

colorscheme molokai

" ==========================================================
" Plugin Settings
" ==========================================================
"
" ==========================================================
" Airline - lightweight Powerline
" ==========================================================
let g:airline_theme='dark'
let g:airline_powerline_fonts = 1
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols = {}
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'
let g:airline_symbols.linenr = '⭡'

" Remove the filetype section
"let g:airline_section_x="%{airline#util#wrap(airline#extensions#tagbar#currenttag(), 0)}"

" ==========================================================
" Deoplete  - Completion Engine (Neocomplete for Vim)
" ==========================================================
if has('nvim')
    let g:deoplete#enable_at_startup = 1
    call deoplete#custom#source('_', 'matchers', ['matcher_fuzzy', 'matcher_full_fuzzy'])
else
    let g:neocomplete#enable_at_startup = 1
endif

let g:deoplete#auto_complete_start_length = 1
let g:deoplete#enable_camel_case = 1
let g:deoplete#max_menu_width = 100
let g:deoplete#tag#cache_limit_size = 7500000   " 7.5MB

inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

" ==========================================================
" Python-mode
" ==========================================================

let g:pymode_lint_ignore = "E1101,E1103,E0202,W0232,R0904,C0103,C0111"
let g:pymode_rope_completion = 0
let g:pymode_lint_checkers = ['pep8', 'mccabe', 'prospector']
let g:pymode_lint_on_write = 1
" let g:pymode_lint_checkers = ['pylint', 'pep8', 'mccabe', 'pep257']
let g:pymode_options_max_line_length = 79

" ==========================================================
" Ale - Asynchronous Linting
" ==========================================================
let g:ale_sign_column_always = 1
let g:ale_change_sign_column_color = 1
let g:ale_open_list = 1
let g:ale_list_window_size = 2
let g:ale_sign_error = '✖✖'
let g:ale_sign_warning = '⚑⚑'
let g:airline#extensions#ale#enabled = 1

let g:ale_linters = {
    \   'haskell': ['hlint', 'hdevtools' ],
    \ }
au BufRead *.elm let g:ale_lint_delay=1000

let g:ale_fixers = {
    \   'elm': ['format'],
    \   'haskell': ['remove_trailing_lines', 'trim_whitespace'],
    \ }
let g:ale_fix_on_save = 1

nmap <silent> <leader>k <Plug>(ale_previous_wrap)
nmap <silent> <leader>j <Plug>(ale_next_wrap)

" ==========================================================
" Ctrl-P
" ==========================================================
let g:ctrlp_custom_ignore = {
    \ 'dir': '\v[\/](\.(git|hg|svn)|node_modules|bower_components|dist|tmp|elm-stuff|output)$',
    \ 'file': '\v\.(exe|so|dll|svg|hi|dyn_o)$',
    \ 'link': '',
\ }

" ==========================================================
" delimitMate
" ==========================================================
let delimitMate_expand_space = 1
imap <expr> <CR> pumvisible() ? "\<c-y>" : "\<Plug>delimitMateCR"
let g:delimitMate_excluded_ft = 'haskell'
let g:delimitMate_excluded_regions = "Comment,String"

au FileType htmldjango let b:delimitMate_quotes = "\" ' ` %"
au FileType racket let b:delimitMate_quotes = "\" `"
au FileType redminewiki let b:delimitMate_quotes = "\" ' ` @"
au FileType sml let b:delimitMate_quotes = "\" `"
au FileType purescript let b:delimitMate_matchpairs = "(:),{:},[:]"

" ==========================================================
" Tagbar
" ==========================================================

" TagBar Commands
nnoremap <F8> :TagbarToggle<CR>

" TagBar Settings
let g:tagbar_width = 35
let g:tagbar_autofocus = 1

" Support for reStructuredText, if available.
if executable("rst2ctags")
    let g:rst2ctags = 'rst2ctags'
else
    let g:rst2ctags = $VIMFILES . '/.vim/tool/rst2ctags/rst2ctags.py'
endif

" Local tagbar settings. Assign g:tagbar_type_rst to this value to enable
" support for .rst files in tagbar.
let g:local_tagbar_type_rst = {
    \ 'ctagstype': 'rst',
    \ 'ctagsbin' : g:rst2ctags,
    \ 'ctagsargs' : '-f - --sort=yes',
    \ 'kinds' : [
        \ 's:sections',
        \ 'i:images'
    \ ],
    \ 'sro' : '|',
    \ 'kind2scope' : {
        \ 's' : 'section',
    \ },
\ }

" Enable support for .rst files in tagbar by default. Disable if desired in
" your per-user "-after.vim" file via:
" unlet g:tagbar_type_rst.
let g:tagbar_type_rst = g:local_tagbar_type_rst


" ==========================================================
" Haskell
" ==========================================================

" GHC is our Haskell compiler
let g:ghc = "/usr/bin/ghc"

" Firefox for browsing Haddock
let g:haddock_browser = "/usr/bin/firefox"


" Show the Types of Symbols in the autocomplete menu
let g:necoghc_enable_detailed_browse = 1

" Generate a tags file when cabal file present
let g:haskell_autotags = 1

" Deactivate delimitMate
au FileType haskell let b:loaded_delimitMate = 1
" Run Check and Lint Asynchronously
" autocmd BufWritePost *.hs GhcModCheckAndLintAsync


" ==========================================================
" Javascript
" ==========================================================
au BufRead *.js set makeprg=eslint\ %
au FileType coffee setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with

" ===========================================================
" FileType specific changes
" ============================================================
" Mako/HTML
autocmd BufNewFile,BufRead *.mako,*.mak,*.jinja2 setlocal ft=html
autocmd FileType html,htmldjango,html.handlebars,xhtml,xml,css,less,javascript
    \ setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2

" Shaksperean Templates
autocmd FileType cassius,julius,hamlet,lucius setlocal expandtab sw=2 ts=2 sts=2

" Nix
autocmd FileType nix setlocal expandtab sw=2 ts=2 sts=2
au BufNewFile,BufRead *.nix setlocal ft=nix

" LESS
au BufNewFile,BufRead *.less setlocal ft=less

" RedmineWiki
au BufNewFile,BufRead *.redmine setlocal ft=redminewiki

" Elm
au BufNewFile,BufRead *.elm setlocal ft=elm
let g:elm_make_output_file = '/dev/null'
let g:elm_format_autosave = 0
let g:elm_format_fail_silently = 1
let g:elm_format_detailed_complete = 1

" Purescript
let g:purescript_indent_if = 4
let g:purescript_indent_case = 4

" XULRunner
au BufNewFile,BufRead *.xul setlocal ft=xul
au BufNewFile,BufRead *.xbl setlocal ft=xbl

" StandardML
au BufNewFile,BufRead *.sig setlocal ft=sml


" ==========================================================
" Python
" ==========================================================
au BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
autocmd BufWritePost *.py PymodeLint

" Lettuce - Python BDD
au BufRead,BufNewFile *.feature set filetype=lettuce

" Add the virtualenv's site-packages to vim path
if has('python')
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF
endif

" Load up virtualenv's vimrc if it exists
if filereadable($VIRTUAL_ENV . '/.vimrc')
    source $VIRTUAL_ENV/.vimrc
endif

if exists("&colorcolumn")
   set colorcolumn=78
endif
