set undofile
set ts=4
set rnu
set nu
set tabstop=4           " width that a <TAB> character displays as
set expandtab           " convert <TAB> key-presses to spaces
set shiftwidth=4        " number of spaces to use for each step of (auto)indent
set softtabstop=4       " backspace after pressing <TAB> will remove up to this many spaces
set clipboard=unnamedplus

set wrap                " wrap lines
set encoding=utf-8      " set encoding to UTF-8 (default was "latin1")
" set mouse=a             " enable mouse support (might not work well on Mac OS X)
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw screen only when we need to
set showmatch           " highlight matching parentheses / brackets [{()}]
set laststatus=2        " always show statusline (even with only single window)
set ruler               " show line and column number of the cursor on right side of statusline
set visualbell          " blink cursor on error, instead of beeping

"""" Vim Appearance
" put colorscheme files in ~/.vim/colors/
" colorscheme murphy      " good colorschemes: murphy, slate, molokai, badwolf, solarized
" use filetype-based syntax highlighting, ftplugins, and indentation
syntax enable
filetype plugin indent on
"""" Tab settings
set tabstop=4           " width that a <TAB> character displays as
set expandtab           " convert <TAB> key-presses to spaces
set shiftwidth=4        " number of spaces to use for each step of (auto)indent
set softtabstop=4       " backspace after pressing <TAB> will remove up to this many spaces
set autoindent          " copy indent from current line when starting a new line
set smartindent         " even better autoindent (e.g. add indent after '{')
"""" Search settings
set incsearch           " search as characters are entered
set hlsearch            " highlight matches

" for enabling clipboard support in sway session
if has('clipboard')
    set clipboard=unnamedplus
    let g:clipboard = {
        \   'name': 'wl-clipboard',
        \   'copy': {
        \      '+': 'wl-copy --foreground --type text/plain',
        \      '*': 'wl-copy --foreground --type text/plain',
        \    },
        \   'paste': {
        \      '+': 'wl-paste --no-newline',
        \      '*': 'wl-paste --no-newline',
        \   },
        \   'cache_enabled': 1,
        \ }
endif


  set rtp+=/home/linuxbrew/.linuxbrew/opt/fzf

" set cursorline "highlight current line




