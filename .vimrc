set ts=2
set sw=2
set smartindent
set et
set foldmethod=indent
set hlsearch

filetype off
filetype plugin indent off
set runtimepath+=/usr/local/go/misc/vim
filetype plugin indent on
syntax on

au BufRead,BufNewFile *.go set filetype=go
au BufRead,BufNewFile *.go set noet

set hidden

" Setup Pathogen, ala https://github.com/tpope/vim-pathogen
" to make use of https://github.com/fatih/vim-go easy
execute pathogen#infect()

let g:go_fmt_command = "goimports"
let g:go_auto_sameids = 1
let go_metalinter_autosave = 1

" Fix folds being closed by go_fmt! :-D
" https://github.com/fatih/vim-go/issues/502
let g:go_fmt_experimental = 1

let mapleader = ","
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd FileType go nmap <leader>c  <Plug>(go-coverage)
"autocmd FileType go nmap <leader>m  <Plug>(go-metalinter)
":GoMetaLinter calls all of:
":GoErrCheck, :GoLint, :GoBuild, :GoVet

" jump between the entries displayed in the quickfix window
" using ctrl-n and ctrl-p
map <C-n> :cnext<CR>
map <C-p> :cprevious<CR>

" close the quickfix window with leader-a
nnoremap <leader>a :close<CR>

" automatically save before :GoBuild, :make, etc
set autowrite
