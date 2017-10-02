set nocompatible              " be iMproved, required
filetype off                  " required

set exrc
set secure

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" dracula colorscheme
Plugin 'dracula/vim'

" better C++ syntax highlighting
Plugin 'octol/vim-cpp-enhanced-highlight'
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1

" 
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" test display

syntax on
color dracula
set number

" Tab settings
set tabstop=2		" 2 space tab
set shiftwidth=2	" > fucntion indents by 2 spaces
set expandtab		" Replaces tab with spaces.

"set colorcolumn=110

" Make with f4
nnoremap <F4> :make!<cr>

" Run unit tests with f5, assumes compiled as tests.o
nnoremap <F4> :!./tests.o<cr>

