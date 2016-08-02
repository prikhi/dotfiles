" https://github.com/sontek/dotfiles/
" ==========================================================
" Dependencies - Libraries/Applications outside of vim
" ==========================================================
" pip install pep8 pylint mccabe pep257
" cabal install hlint ghc-mod hdevtools fast-tags pointfree
"

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
let mapleader=","             " change the leader to be a comma vs slash

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

" Select the item in the list with enter
"inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" F2 toggles paste mode
noremap <F2> :set paste!

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
Plug 'Valloric/YouCompleteMe', { 'do': './install.sh' }
Plug 'benekastah/neomake'
Plug 'bling/vim-airline'
Plug 'ctrlpvim/ctrlp.vim'

" Haskell
Plug 'dag/vim2hs', { 'for': 'haskell' }
Plug 'eagletmt/neco-ghc', { 'for': 'haskell' }
Plug 'raichoo/haskell-vim', { 'for': 'haskell' }
Plug 'godlygeek/tabular', {'for': 'haskell'}
Plug 'itchyny/vim-haskell-indent', {'for': 'haskell'}

" Web Development
Plug 'lambdatoast/elm.vim', { 'for': ['elm'] }
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'html', 'htmldjango'] }
Plug 'posva/vim-vue', { 'for': ['vue'] }
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
" YouCompleteMe
" ==========================================================
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_filepath_completion_use_working_dir = 1
"let g:ycm_semantic_triggers = {'haskell' : ['.']}
let g:ycm_complete_in_comments = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_collect_identifiers_from_tag_files = 1
let g:ycm_seed_identifiers_with_syntax = 1

" ==========================================================
" Python-mode
" ==========================================================

let g:pymode_lint_ignore = "E1101,E1103,E0202,W0232,R0904,C0103,C0111"
let g:pymode_rope_completion = 0
let g:pymode_lint_checkers = ['pylint', 'pep8', 'mccabe']
let g:pymode_lint_on_write = 1
" let g:pymode_lint_checkers = ['pylint', 'pep8', 'mccabe', 'pep257']
let g:pymode_options_max_line_length = 79

" ==========================================================
" Neomake - Asynchronous Linting
" ==========================================================
let g:neomake_python_prospector_maker = {
    \ 'args': ['-o', 'pylint', '-M', '--absolute-paths', '%:p'],
    \ 'errorformat':
        \ '%-G%.%#module named%.%#,' .
        \ '%f:%l:%c [%t%n%.%#] %m,' .
        \ '%f:%l: [%t%n%.%#] %m,' .
        \ '%f:%l: [%.%#] %m,' .
        \ '%f:%l:%c [%.%#] %m',
    \ }
let g:neomake_sml_smlnj_maker = {
    \ 'exe': 'sml',
    \ 'args': ['-Ccontrol.poly-eq-warn=false'],
    \ 'errorformat':
        \ '%E%f:%l%\%.%c %trror: %m,' .
        \ '%E%f:%l%\%.%c-%\d%\+%\%.%\d%\+ %trror: %m,' .
        \ '%W%f:%l%\%.%c %tarning: %m,' .
        \ '%W%f:%l%\%.%c-%\d%\+%\%.%\d%\+ %tarning: %m,' .
        \ '%C%\s%\+%m,' .
        \ '%-G%.%#'
    \ }
let g:neomake_c_make_maker = {
    \ 'errorformat':
        \ '%-G%f:%s:,' .
        \ '%-G%f:%l: %#error: %#(Each undeclared identifier is reported only%.%#,' .
        \ '%-G%f:%l: %#error: %#for each function it appears%.%#,' .
        \ '%-GIn file included%.%#,' .
        \ '%-G %#from %f:%l\,,' .
        \ '%f:%l:%c: %trror: %m,' .
        \ '%f:%l:%c: %tarning: %m,' .
        \ '%f:%l:%c: %m,' .
        \ '%f:%l: %trror: %m,' .
        \ '%f:%l: %tarning: %m,'.
        \ '%f:%l: %m'
    \ }
let g:neomake_c_enabled_makers = ['make']
let g:neomake_cpp_enabled_makers = ['make']
let g:neomake_python_enabled_makers = ['pylint', 'prospector']
let g:neomake_sml_enabled_makers = ['smlnj']
let g:neomake_error_sign = {'text': "✖✖"}
let g:neomake_warning_sign = {'text': "⚑⚑"}
let g:neomake_make_modified = 1
let g:neomake_open_list = 1
autocmd BufWritePost *.py,*.js,*.css,*.hs,*.c,*.h,*.sml Neomake

" ==========================================================
" Ctrl-P
" ==========================================================
let g:ctrlp_custom_ignore = {
    \ 'dir': '\v[\/](\.(git|hg|svn)|node_modules|bower_components|dist|tmp)$',
    \ 'file': '\v\.(exe|so|dll|svg|hi|dyn_o)$',
    \ 'link': '',
\ }

" ==========================================================
" delimitMate
" ==========================================================
let delimitMate_expand_space = 1
imap <expr> <CR> pumvisible() ? "\<c-y>" : "<Plug>delimitMateCR"

au FileType htmldjango let b:delimitMate_quotes = "\" ' ` %"
au FileType racket let b:delimitMate_quotes = "\" `"
au FileType redminewiki let b:delimitMate_quotes = "\" ' ` @"
au FileType sml let b:delimitMate_quotes = "\" `"

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
au BufRead *.js set makeprg=jshint\ %
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

" XULRunner
au BufNewFile,BufRead *.xul setlocal ft=xul
au BufNewFile,BufRead *.xbl setlocal ft=xbl


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
