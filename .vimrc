" highlight current search pattern
highlight Search term=underline cterm=underline ctermbg=Brown gui=underline guibg=Brown
set hlsearch

" Current line line highlight
highlight CursorLineNr cterm=underline
set cursorline

" Line numbers
highlight LineNr ctermbg=Black ctermfg=White cterm=bold
set number

" handle tabulation/indent
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

" highlight files by type
filetype on
filetype plugin indent on

" chars highlight
syntax on
set listchars=trail:·,precedes:⇄,extends:⇄,eol:↵,tab:⇥ ,conceal:…,nbsp:⎵
set list

" bottom-right line and column info
set ruler
set rulerformat=[L:%l,C:%v]

" mac-book bro/emacs key bindings workaround:
nmap <C-e> $
imap <C-e> <Esc>$i<Right>
nmap <C-a> 0
imap <C-a> <Esc>0i

" enable pathogen
call pathogen#infect()
