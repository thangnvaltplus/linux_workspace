augroup HighlightTrailingSpaces
    autocmd!
    autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=Red ctermbg=Red
    autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
augroup END

" Auto delete vim/.netrwhist
au VimLeave * if filereadable("~/.vim/.netrwhist")|call delete("~/.vim/.netrwhist")|endif
"--------------------------------
"" Vundle setting
set nocompatible
filetype off

if isdirectory("~/.vim/bundle/Vundle.vim")
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()

    Plugin 'gmarik/Vundle.vim'

    Plugin 'joonty/vim-phpqa'
    " Plugin 'altercation/solarized'
    Plugin 'altercation/vim-colors-solarized'
    Plugin 'chrisbra/csv.vim'
    Plugin 'scrooloose/nerdtree'

    Plugin 'kien/ctrlp.vim'
    Plugin 'tpope/vim-surround'
    Plugin 'scrooloose/nerdcommenter'
    Plugin 'Shougo/neocomplcache.vim'
    Plugin 'tpope/vim-fugitive'
""    Plugin 'majutsushi/tagbar'

    call vundle#end()
endif

" End Vundle setting
" "--------------------------------
" Other setting:
" "
"" set mouse=a                     " Enable mouse
set t_Co=256
set clipboard=unnamed
set noswapfile
set fileformat=unix
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab                   " Use spaces instead of tabs
set smarttab                    " Be smart when using tabs ;)
set wildmenu                    " show list instead of just completing
" set spell                       " spell checking on
set ffs=unix,dos,mac            " Use Unix as the standard file type
" set showcmd                     " show (partial) commands
set autoread                    " Set to auto read when a file is changed from the outside
set wildignore=*.o,*~,*.pyc     " Ignore compiled files
set whichwrap+=<,>,h,l
let g:reload_on_write = 0
set shiftround
set autoindent
set smartindent
set number
set ruler
set backspace=indent,eol,start
set laststatus=2

"File encoding
"set fileencoding utf-8
"
set fileformats=dos
set ffs=unix,dos,mac            " Use Unix as the standard file type
" Encode setting
set encoding=utf-8
set fileencoding=utf-8
" set fileencodings=ucs-bom,korea,utf-8,sjis,default
set fileencodings=ucs-bom,utf-8,sjis,default
set fileencodings=ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932,utf-8
set fenc=utf-8                  " fix unicode error while saving file
" colorscheme koehler
" set cc=81
hi ColorColumn guibg=#2d2d2d ctermbg=246
filetype plugin indent on
filetype on
filetype plugin on
syntax on

"---------------------------------------------------------------------------
"" Config for tab
"
""map <F3> :tabN<CR>
"map <F4> :tabn<CR>
"
""---------------------------------------------------------------------------
" Config for python
" "
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd BufRead *.py set tabstop=4
autocmd BufRead *.py set shiftwidth=4
autocmd BufRead *.py set smarttab
autocmd BufRead *.py set expandtab
autocmd BufRead *.py set softtabstop=4
autocmd BufRead *.py set autoindent
autocmd BufRead *.py if &modifiable | retab | endif
autocmd BufWritePre *.py normal m`:%s/\s\+$//e``

"---------------------------------------------------------------------------
"" Config for php
"
"
autocmd FileType php set noro
autocmd FileType html set noro
"---------------------------------------------------------------------------
"" Format coding:
"
"" Pass arguments to phpcs binary
let g:phpqa_codesniffer_args = "--standard=Zend"
" Another example
""let g:phpqa_codesniffer_args = "--standard=/path/to/xml/file.xml
" --tab-width=4"
"  " PHP codesniffer binary (default = phpcs)
let g:phpqa_codesniffer_cmd='/path/to/phpcs'
"  " Run codesniffer on save (default = 1)
let g:phpqa_codesniffer_autorun = 0
let g:phpqa_messdetector_ruleset = "/path/to/phpmd.xml"
"  " PHP mess detector binary (default = phpmd)
let g:phpqa_messdetector_cmd='/path/to/phpmd'
"  " Run mess detector on save (default = 1)
let g:phpqa_messdetector_autorun = 0

"---------------------------------------------------------------------------
"" Search:
"
"" Ignore the case of normal letters.
set ignorecase
" If the search pattern contains upper case characters, override ignorecase
" option.
set smartcase
"
" " Enable incremental search.
set incsearch
" " Don't highlight search result.
set nohlsearch
"
" " Searches wrap around the end of the file.
set wrapscan
"
" "---------------------------------------------------------------------------
" " Load plugin by pathogen
" "
""execute pathogen#infect()
""filetype plugin indent on

"---------------------------------------------------------------------------
"" Config NERDTree
"
if isdirectory($HOME."/.vim/bundle/nerdtree")
    " Always display NERDTree on vim enter
    " autocmd vimenter * NERDTree
    autocmd vimenter * if !argc() | NERDTree | endif
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
    map <C-n> :NERDTreeToggle<CR>
    map <F5> :NERDTreeToggle<CR>
endif

"---------------------------------------------------------------------------
"" Config Color theme
"
if isdirectory($HOME."/.vim/bundle/vim-colors-solarized")
    set background=dark
    let g:solarized_termcolors=256
""    colorscheme solarized
endif
