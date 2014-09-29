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
map <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" ;; to exit Insert Mode
imap ;; <Esc>

" For when you forget to let go of SHIFT...
command! W :w

" ctrl-hjkl switches to a split by direction
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" and lets make these all work in insert mode too ( <C-O> makes next cmd
"  happen as if in command mode )
imap <C-W> <C-O><C-W>

" Paste from global buffer
map <leader>p "+p
map <leader>P "+P

" Yank to global buffer
map <leader>y "+y
map <leader>Y "+Y

" Quit window on <leader>q
nnoremap <leader>q :q<CR>

" hide matches on <leader>space
nnoremap <leader><space> :nohlsearch<cr>

" Remove trailing whitespace on <leader>S
nnoremap <leader>S :%s/\s\+$//<cr>:let @/=''<CR>

" Select the item in the list with enter
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" open/close the quickfix window
nmap <leader>c  :copen<CR>
nmap <leader>cc :cclose<CR>
" open/close the location window (where syntastic puts its feedback)
nmap <leader>l  :lopen<CR>
nmap <leader>ll :lclose<CR>


" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

" ==========================================================
" Plugin Shortcuts
" ==========================================================
" Open NerdTree
map <leader>n :NERDTreeToggle<CR>

" Load the Gundo window
map <leader>g :GundoToggle<CR>

" Jump to the definition of whatever the cursor is on
map <leader>j :RopeGotoDefinition<CR>

" Rename whatever the cursor is on (including references to it)
noremap <leader>R :RopeRename<CR>

" Write a file as a super-user
command SW SudoWrite
" Write a file as a super-user, then close the window
command SWQ SudoWrite|q

" ==========================================================
" Pathogen - Allows us to organize our vim plugins
" ==========================================================
" Load pathogen with docs for all plugins
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" ==========================================================
" Basic Settings
" ==========================================================
syntax on                     " syntax highlighing
filetype on                   " try to detect filetypes
filetype plugin indent on     " enable loading indent file for filetype
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
let g:airline_section_x="%{airline#util#wrap(airline#extensions#tagbar#currenttag(), 0)}"

" ==========================================================
" YouCompleteMe
" ==========================================================
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_filepath_completion_use_working_dir = 1
let g:ycm_semantic_triggers = {'haskell' : ['.']}
let g:ycm_complete_in_comments = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1

" ==========================================================
" Python-mode
" ==========================================================

let g:pymode_lint_ignore = "E1101,W0232,C0111,E1103,R0904,C0103"
let g:pymode_rope_completion = 0
let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'mccabe', 'pep257']

" ==========================================================
" Syntastic - Syntax Checking
" ==========================================================
let g:syntastic_error_symbol = "✖✖"
let g:syntastic_style_error_symbol = '⚑⚑'
let g:syntastic_warning_symbol = '∆∆'
let g:syntastic_style_warning_symbol = '≈≈'

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_loc_list_height = 5

let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': [],
                           \ 'passive_filetypes': ['python'] }

" ==========================================================
" Tagbar
" ==========================================================

" TagBar Commands
nmap <F8> :TagbarToggle<CR>

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

" Run Check and Lint Asynchronously
" autocmd BufWritePost *.hs GhcModCheckAndLintAsync


" ==========================================================
" Javascript
" ==========================================================
au BufRead *.js set makeprg=jslint\ %
au FileType coffee setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with

" ===========================================================
" FileType specific changes
" ============================================================
" Mako/HTML
autocmd BufNewFile,BufRead *.mako,*.mak,*.jinja2 setlocal ft=html
autocmd FileType html,xhtml,xml,css setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2

" RedmineWiki
au BufNewFile,BufRead *.redmine set ft=redminewiki

" ==========================================================
" Python
" ==========================================================
au BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m

" ==========================================================
" Python VirtualEnv
" ==========================================================
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
   set colorcolumn=79
endif
