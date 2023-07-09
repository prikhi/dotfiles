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
let $VIMFILES = expand('<sfile>:p:h')

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

" Remove trailing whitespace on <leader>s
nnoremap <leader>s :%s/\s\+$//<cr>:let @/=''<CR>

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

if has('nvim')
    " Write a file as a super-user
    command! SW SudaWrite
    " Write a file as a super-user, then close the window
    command! SWQ SW|q
    " Read a file as a super-user
    command! SR SudaRead
else
    " Write a file as a super-user
    command! SW SudoWrite
    " Write a file as a super-user, then close the window
    command! SWQ SudoWrite|q
    " Read a file as a super-user
    command! SR SudoRead
endif

" ==========================================================
" vim-plug - Allows us to organize our vim plugins
" ==========================================================
filetype off
call plug#begin('~/.vim/plugged')

" General
Plug 'Raimondi/delimitMate'
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'vim-scripts/The-NERD-tree', { 'on': 'NERDTreeToggle' }
if has('nvim')
    Plug 'lambdalisue/suda.vim'
else
    Plug 'chrisbra/SudoEdit.vim'
endif

" Development
Plug 'w0rp/ale'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'bling/vim-airline'
Plug 'ctrlpvim/ctrlp.vim'
if has('nvim')
else
    Plug 'Shougo/neocomplete.vim'
endif

" Haskell
Plug 'dag/vim2hs', { 'for': 'haskell' }
Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }
Plug 'alx741/vim-stylishask', { 'for': 'haskell' }


" Web Development
Plug 'andys8/vim-elm-syntax', { 'for': ['elm'] }
Plug 'antew/vim-elm-language-server', { 'for': ['elm'] }
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'html', 'htmldjango'] }
Plug 'peitalin/vim-jsx-typescript', { 'for': ['javascript', 'typescript', 'typescript.tsx', 'typescriptreact'] }
Plug 'purescript-contrib/purescript-vim', { 'for': ['purescript'] }
Plug 'frigoeu/psc-ide-vim', { 'for': ['purescript'] }

" Web Design
Plug 'hail2u/vim-css3-syntax', { 'for': ['css', 'scss', 'less'] }
Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' }


" Other FileTypes
Plug 'pearofducks/ansible-vim', { 'for': 'ansible' }
Plug 'preservim/vim-markdown', { 'for': ['mkd', 'markdown'] }
Plug 'cypok/vim-sml', { 'for': 'sml' }
Plug 'tikhomirov/vim-glsl', { 'for': 'glsl' }
Plug 'vmchale/dhall-vim', { 'for': 'dhall' }
Plug 'ledger/vim-ledger', { 'for': 'ledger' }
Plug 'tridactyl/vim-tridactyl', { 'for': 'tridactyl' }
Plug 'mickael-menu/zk-nvim'

" TODO: Investigate following plugins:
" https://github.com/parsonsmatt/intero-neovim

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
set exrc                      " Load .vimrc files in the current directory
set secure                    " Restrict command in non-default .vimrc files
set guifont=Droid\ Sans\ Mono\ 9

" don't bell or blink
set noerrorbells
set visualbell t_vb=

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
set colorcolumn=78          " vertical indicator at column 78

" don't outdent hashes
inoremap # #

" close preview window automatically when we move around
augroup PreviewClose
    autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
    autocmd InsertLeave * if pumvisible() == 0|pclose|endif
augroup end

"""" Reading/Writing
set noautowrite             " Never write a file unless I request it.
set noautowriteall          " NEVER.
set noautoread              " Don't automatically re-read changed files.
set modeline                " Allow vim options to be embedded in files;
set modelines=5             " they must be within the first or last 5 lines.
set fileformats=unix,dos,mac        " Try recognizing dos, unix, and mac line endings.

"""" Messages, Info, Status
set laststatus=2            " allways show status line
set visualbell t_vb=        " Disable all bells.  I hate ringing/flashing.
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
set directory^=~/.vim/swp//
set undodir^=~/.vim/undo//

"""" Display
if has('gui_running')
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
else
    let g:neocomplete#enable_at_startup = 1
endif

inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

" ==========================================================
" Ale - Asynchronous Linting
" ==========================================================
let g:ale_sign_column_always = 1
let g:ale_change_sign_column_color = 1
let g:ale_open_list = 'on_save'
let g:ale_list_window_size = 2
let g:ale_sign_error = '✖✖'
let g:ale_sign_warning = '⚑⚑'
let g:airline#extensions#ale#enabled = 1

let g:ale_linters = {'haskell': [], 'elm': [], 'c': [], 'cpp': [], 'python': []}

" Close location list on buffer close:
augroup CloseLoclistWindowGroup
    autocmd!
    autocmd QuitPre * if empty(&buftype) | lclose | endif
augroup end

let g:ale_fixers = {
    \   'haskell': ['remove_trailing_lines', 'trim_whitespace'],
    \   'purescript': ['remove_trailing_lines', 'trim_whitespace'],
    \   'sass': ['remove_trailing_lines', 'trim_whitespace'],
    \   'yaml': ['remove_trailing_lines', 'trim_whitespace'],
    \   'markdown': ['remove_trailing_lines', 'trim_whitespace'],
    \   'ansible': ['remove_trailing_lines', 'trim_whitespace'],
    \   'ledger': ['remove_trailing_lines', 'trim_whitespace'],
    \   'rst': ['remove_trailing_lines', 'trim_whitespace'],
    \ }
let g:ale_fix_on_save = 1

nmap <silent> <leader>k <Plug>(ale_previous_wrap)
nmap <silent> <leader>j <Plug>(ale_next_wrap)

augroup AVRAle
    " Fix ALE Linting for AVR GCC Projects
    " TODO: The includes and macros should be pulled from project specifics, might
    " not always be running an atmega168 at 1/8 clock & 9600 baud...
    " TODO: Move to .nvimrc files in projects
    au BufRead,BufNewFile */Projects/avr/* let b:ale_c_gcc_options =
        \ '-std=gnu99 -Wall -Os -g -I. -I/usr/avr/include/ -I/home/prikhi/Projects/avr/book/book-code/AVR-Programming-Library/ -DF_CPU=1000000UL -DBAUD=9600UL -mmcu=atmega168'
    au BufRead,BufNewFile */Projects/avr/* let b:ale_linters = { 'c': ['gcc'] }
    au BufRead,BufNewFile */Projects/avr/* let b:ale_c_gcc_executable = 'avr-gcc'

    " rave saber avr
    au BufRead,BufNewFile */Projects/avr/ravesaber/* let b:ale_c_gcc_options =
        \ '-std=gnu99 -Wall -Os -g -I/home/prikhi/Projects/avr/ravesaber/avr-apa102-lib/src -I. -I/usr/avr/include/ -I/home/prikhi/Projects/avr/book/book-code/AVR-Programming-Library/ -DBAUD=9600UL -DF_CPU=8000000UL -mmcu=atmega168 -DMOSI_DDR=DDRB -DMOSI=PB3 -DMOSI_PORT=PORTB -DSS=PB2 -DSS_DDR=DDRB -DSS_PORT=PORTB -DSCK=PB5 -DSCK_DDR=DDRB -DLED_COUNT=8U'

augroup end

" ==========================================================
" Coc.nvim
" ==========================================================

set hidden
set updatetime=300
set shortmess+=c
set signcolumn=yes
hi CocMenuSel term=reverse cterm=reverse gui=reverse

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
augroup CocHighlight
    autocmd CursorHold * silent call CocActionAsync('highlight')
augroup end

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Format entire file
xmap <leader>F  <Plug>(coc-format)
nmap <leader>F  <Plug>(coc-format)

" AutoFix current line
nmap <leader>f <Plug>(coc-fix-current)

" Open Code Actions menu for current buffer
nmap <leader>a <Plug>(coc-codeaction)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" ==========================================================
" Ctrl-P
" ==========================================================
let g:ctrlp_custom_ignore = {
    \ 'dir': '\v[\/](\.(git|hg|svn)|node_modules|bower_components|dist|tmp|elm-stuff|output|.stack-work)$',
    \ 'file': '\v\.(exe|so|dll|svg|hi|dyn_o)$',
    \ 'link': '',
\ }

" ==========================================================
" delimitMate
" ==========================================================
let g:delimitMate_expand_space = 1
imap <expr> <CR> pumvisible() ? "\<c-y>" : "\<Plug>delimitMateCR"
let g:delimitMate_excluded_regions = 'Comment,String'

augroup DelimitMate
    au FileType htmldjango let b:delimitMate_quotes = "\" ' ` %"
    au FileType racket let b:delimitMate_quotes = "\" `"
    au FileType redminewiki let b:delimitMate_quotes = "\" ' ` @"
    au FileType sml let b:delimitMate_quotes = "\" `"
    au FileType purescript let b:delimitMate_matchpairs = "(:),{:},[:]"
augroup end

" ==========================================================
" Tagbar
" ==========================================================

" TagBar Commands
nnoremap <F8> :TagbarToggle<CR>

" TagBar Settings
let g:tagbar_width = 35
let g:tagbar_autofocus = 1

" Support for reStructuredText, if available.
if executable('rst2ctags')
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
let g:ghc = '/usr/bin/ghc'

" Firefox for browsing Haddock
let g:haddock_browser = '/usr/bin/firefox'

let g:stylishask_on_save = 0


" ==========================================================
" Javascript
" ==========================================================

" ===========================================================
" FileType specific changes
" ============================================================

" Elm
let g:elm_make_output_file = '/dev/null'
let g:elm_format_autosave = 0
let g:elm_format_fail_silently = 1
let g:elm_format_detailed_complete = 1

" Purescript
let g:purescript_indent_if = 2
let g:purescript_indent_case = 2
let g:purescript_indent_where = 2
let g:purescript_indent_do = 2
let g:purescript_indent_in = 0

augroup AutoFS
    " HTML/CSS/JS
    au FileType html,xml,css,sass,javascript
        \ setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2

    " Nix
    au FileType nix setlocal expandtab sw=2 ts=2 sts=2
    au BufNewFile,BufRead *.nix setlocal ft=nix

    " RedmineWiki
    au BufNewFile,BufRead *.redmine setlocal ft=redminewiki

    " Elm
    au BufNewFile,BufRead *.elm setlocal ft=elm

    " StandardML
    au BufNewFile,BufRead *.sig setlocal ft=sml
augroup end
