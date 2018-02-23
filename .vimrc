" Essential
set nocompatible              " be iMproved, required
filetype off                  " required for Vundle

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" ------
" Visual
" ------
" dracula colorscheme
Plugin 'dracula/vim'

" Fast, cool looking statusline
Plugin 'vim-airline/vim-airline'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" Display indentation levels
Plugin 'Yggdroot/indentLine'
let g:indentLine_color_term = 0
let g:indetLine_char = '|'
let g:indentLine_bgcolor_term = 0
let g:indentLine_noConcealCursor=1

" ------------
" C++ Specific
" ------------
" better C++ syntax highlighting
Plugin 'octol/vim-cpp-enhanced-highlight'
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_template_highlight = 1

" ---------------------------------
" LaTeX, Markdown, English specific
" ---------------------------------
" Highlight overused words
Plugin 'dbmrq/vim-ditto'
au FileType markdown,text,tex DittoOn  " Turn on Ditto's autocmds
nmap <leader>di <Plug>ToggleDitto      " Turn it on and off
nmap =d <Plug>DittoNext                " Jump to the next word
nmap -d <Plug>DittoPrev                " Jump to the previous word
nmap +d <Plug>DittoGood                " Ignore the word under the cursor
nmap _d <Plug>DittoBad                 " Stop ignoring the word under the cursor
nmap ]d <Plug>DittoMore                " Show the next matches
nmap [d <Plug>DittoLess                " Show the previous matches

" LaTeX support 
Plugin 'lervag/vimtex'
let g:vimtex_compiler_latexmk = {'callback' : 0}
let g:tex_conceal = "0"
let g:vimtex_view_method='zathura'

" Highlight commonly misused words and phrases
Plugin 'reedes/vim-wordy'

" English grammar checking
Plugin 'rhysd/vim-grammarous'
let g:grammarous#default_comments_only_filetypes = {
	\ '*' : 1, 'markdown': 0,
	\}

" --------------
" Vim Extensions
" --------------
" Quickly and easily switch between open buffers
Plugin 'Buffergator'
nmap <silent> <F4> :BuffergatorToggle<CR>

" Git support in Vim
Plugin 'fugitive.vim'

" Fuzzy file searching
Plugin 'kien/ctrlp.vim'
nmap ; :CtrlPBuffer<cr>
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr|bin|lib)($|[/\\])|__init__\.py'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_switch_buffer = 0

" Sensible default settings for Vim
Plugin 'tpope/vim-sensible'

" An enhanced netrw
Plugin 'tpope/vim-vinegar'

" -------------------
" Programming Support
" -------------------
" Browse the tags of the current file
Plugin 'majutsushi/tagbar' 
nmap <F8> :TagbarToggle<CR>

" Syntax checking with syntastic
Plugin 'vim-syntastic/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_cpp_checkers = ['gcc', 'cppcheck']
let g:syntastic_cpp_compiler='g++'
let g:syntastic_cpp_compiler_options=' -std=c++17 -pedantic-errors -Wall -Wextra'
let g:syntastic_cpp_check_header=1
let g:syntastic_quiet_messages = { "regex": 'has a constructor with 1 argument that is not explicit' }

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" ----------------
" Display settings
" ----------------
syntax on
color dracula
set t_Co=256 " force 256 colors
set number
set ruler

" Always show statusline
set laststatus=2
highlight StatusLine ctermbg=0

" Highlight currentline
set cursorline
highlight CursorLine ctermbg=0
highlight CursorLineNr ctermbg=0 ctermfg=4
set colorcolumn=120
highlight ColorColumn ctermbg=0

"Highlighting of vertical split and status line
hi VertSplit ctermbg=0 ctermfg=0
hi StatusLineNC ctermbg=0

" Syntastic highlighting colors
hi SignColumn ctermbg=0
hi SpellBad ctermbg=1
hi SpellCap ctermbg=1

" -------------
" Configuration
" -------------
" Use x clipboard
set clipboard=unnamedplus

" Tab settings
set tabstop=2		" 2 space tab
set shiftwidth=2	" > fucntion indents by 2 spaces
set expandtab		" Replaces tab with spaces.

" Search settings
set incsearch
set ignorecase
set smartcase
set hlsearch

" More natural left to right split opening
set splitbelow
set splitright

" -----------------
" Keyboard Mappings
" -----------------
let mapleader=","

" Quickly open vimrc with ,ev
nnoremap <leader>ev :e ~/.vimrc<cr>

" Make with f5, run with f6
nnoremap <F5> :make!<cr>
nnoremap <F6> :make run!<cr>

" Ignore word wrapping when navigating vertically
nmap j gj
nmap k gk

" Clear search hl with ,<space>
nmap <leader><space> :nohlsearch<cr>

" Switch between previous and current buffer
nmap <C-e> :e#<cr>

" Simpler split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
