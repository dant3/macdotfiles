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
"set ruler
"set rulerformat=[L:%l,C:%v]

" mac-book bro/emacs key bindings workaround:
nmap <C-e> $
imap <C-e> <Esc>$i<Right>
nmap <C-a> 0
imap <C-a> <Esc>0i

" enable pathogen
call pathogen#infect()

" airline tuneup
" no more default mode required
set noshowmode
set laststatus=2
" might require fonts installation, see
" https://powerline.readthedocs.org/en/latest/installation.html#fonts-installation
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

" tabs on top
let g:airline#extensions#tabline#enabled = 1
