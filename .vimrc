highlight Search term=underline cterm=underline ctermbg=Brown gui=underline guibg=Brown
set hlsearch

highlight CursorLineNr cterm=underline
highlight LineNr ctermbg=Black ctermfg=White cterm=bold
set number
set cursorline

set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

filetype on
filetype plugin indent on

syntax on
set listchars=trail:·,precedes:⇄,extends:⇄,eol:↵,tab:⇥ ,conceal:…,nbsp:⎵
set list

set ruler
set rulerformat=[L:%l,C:%v]

" mac-book bro/emacs key bindings workaround:
nmap <C-e> $
imap <C-e> <Esc>$i<Right>
nmap <C-a> 0
imap <C-a> <Esc>0i
