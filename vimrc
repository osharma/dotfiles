:syntax enable
:set ruler

nnoremap <C-H> :Hexmode<CR>
inoremap <C-H> <Esc>:Hexmode<CR>
vnoremap <C-H> :<C-U>Hexmode<CR>

" As recommended by
"   http://www.swaroopch.com/notes/Vim_en:Editing_Basics#Marking_your_territory
:set incsearch
:set smartcase

" Tabs and indentation taken from
"   http://gergap.wordpress.com/2009/05/29/minimal-vimrc-for-cc-developers
set tabstop=4        " tab width is 4 spaces
set shiftwidth=4     " indent also with 4 spaces
set expandtab        " expand tabs to spaces
set autoindent       " use indentation of previous line 
set smartindent      " use intelligent indentation for C 

" Encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

" Fold based on syntax
"set foldmethod=syntax

" Turn on line numbering
set number

" Soft wrap
:set wrap linebreak textwidth=0

" Make the colors a bit brighter
:colorscheme jellybeans
:hi LineNr        ctermfg=grey
:highlight LineNr guifg=#050501

" Needed to get snippetsEmu working, thanks to
"   http://code.google.com/p/snippetsemu/issues/detail?id=50
"set nocompatible
filetype on
filetype plugin on
filetype indent on

" Misc
set ignorecase

" Switch between .h and .m files
function! SwitchSourceHeader()
    "update!
    if (expand ("%:e") == "m")
        find %:t:r.h
    else
        find %:t:r.m
    endif
endfunction

nmap ,s :call SwitchSourceHeader()<CR>

" Open files at the same line where we left off
au BufWinLeave * mkview

command Md execute "silent !multimarkdown % > tmp_mvim_markdown.html && open tmp_mvim_markdown.html && sleep 1 && rm tmp_mvim_markdown.html"

map <F5> :Md<CR>

" Go syntax highlighting
filetype off
filetype plugin indent off
set runtimepath+=$GOROOT/misc/vim
filetype plugin indent on
syntax on
autocmd BufNewFile,BufReadPost *.go set filetype=go

" Auto-format on save
autocmd BufWritePre *.go :silent Fmt

" Compile command for go
autocmd Filetype go set makeprg=go\ build

" Enable mouse in terminal vim
set mouse=a
