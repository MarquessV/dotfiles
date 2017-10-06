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

Plugin 'fugitive.vim'

" syntax checking with syntastic
Plugin 'vim-syntastic/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_cpp_compiler_options=' -std=c++11'
let g:syntastic_cpp_check_header=1

" vim-airline
Plugin 'vim-airline/vim-airline'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
"let g:hybrid_custom_term_colors = 1

Plugin 'kien/ctrlp.vim'
nmap ; :CtrlPBuffer<cr>
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_switch_buffer = 0

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Display settings
syntax on
color dracula
set number
set ruler
" Always show statusline
set laststatus=2
highlight StatusLine ctermbg=20
" Highlight currentline
set cursorline
highlight CursorLine ctermbg=20
highlight CursorLineNr ctermbg=20 ctermfg=4
set colorcolumn=80
highlight ColorColumn ctermbg=20

"Highlighting of vertical split and status line
hi VertSplit ctermbg=20 ctermfg=20
hi StatusLineNC ctermbg=21

" Syntastic highlighting colors
hi SignColumn ctermbg=20
hi SpellBad ctermbg=1
hi SpellCap ctermbg=1

set t_Co=256

" Tab settings
set tabstop=2		" 2 space tab
set shiftwidth=2	" > fucntion indents by 2 spaces
set expandtab		" Replaces tab with spaces.

"set colorcolumn=110

let mapleader=","

nnoremap <leader>ev :e ~/.vimrc<cr>

" Make with f4
nnoremap <F4> :make!<cr>

" Run unit tests with f5, assumes compiled as tests.o
nnoremap <F5> :!./tests.o --gtest_color=yes<cr>

" navigation
nmap j gj
nmap k gk

" search settings
set incsearch
set ignorecase
set smartcase
set hlsearch
nmap <leader><space> :nohlsearch<cr>

" switch between previous and current buffer
nmap <C-e> :e#<cr>
