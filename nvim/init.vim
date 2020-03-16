"""""""""""""""""""""""""""""""""""""
"     Generic
"""""""""""""""""""""""""""""""""""""
syntax on                   " Enable syntax highlighting
set hlsearch                " Highlight searches
set tabstop=4
set shiftwidth=4
set cursorline
set lazyredraw
hi CursorLine cterm=NONE ctermbg=Black guibg=Black guifg=NONE
set expandtab
set number relativenumber
set scrolloff=999
set textwidth=80
set list lcs=tab:»·         " Show tabs
set backspace=2
set wildmenu
set wrapscan
set tags=tags;/
set mouse=
let g:tex_flavor = "latex"
colorscheme juander

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
match ErrorMsg '\%>80v.\+'

"""""""""""""""""""""""""""""""""""""
"     Plugins
"""""""""""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/plugged')
" Ultisnips
Plug 'SirVer/ultisnips'
" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Supertab
Plug 'ervandew/supertab'
" Scala stuff
Plug 'derekwyatt/vim-scala'
" Rainbow :D
Plug 'kien/rainbow_parentheses.vim'
call plug#end()

"""""""""""""""""""""""""
" Rainbow paranthesis
""""""""""""""""""""""""

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

"""""""""""""""""""""""""
"  airline
"""""""""""""""""""""""""
set ls=2                    " always show airline

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_theme='murmur'

"""""""""""""""""""""""""
"  supertab
"""""""""""""""""""""""""
let g:SuperTabDefaultCompletionType = "<c-n>"

"""""""""""""""""""""""""""""""""""""
"     Keymappings
"""""""""""""""""""""""""""""""""""""

let mapleader=","
"Breaking habbits :D
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

nnoremap ; :

"Breaking habbits again :DD
noremap h <NOP>
noremap l <NOP>

" Stay in visual mode when indenting.
vnoremap < <gv
vnoremap > >gv

" This makes j and k work on "screen lines" instead of on "file lines"; now, when
" we have a long line that wraps to multiple screen lines, j and k behave as we
" expect them to.
nnoremap j gj
nnoremap k gk

" Easy editing of .vimrc
noremap <Leader>v :tabnew ~/.config/nvim/init.vim<CR>
noremap <Leader>V :source ~/.config/nvim/init.vim<CR>:filetype detect<CR>

noremap <leader> t <C-W>T

"Split navigation
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" Remove search highlighting
map <space> :noh<CR>

" Tab keymaps
nnoremap tn :tabnew<Space>
nnoremap tl :tabnext<CR>
nnoremap th :tabprev<CR>
nnoremap tj :tabfirst<CR>
nnoremap tk :tablast<CR>

"Toggle Linenumbers
map <Leader>c :set number! relativenumber!<CR>

" Remove trailing whitespaces
map <Leader>w :%s/\s\+$//e<CR>

" ctrl-c to copy
map <C-c> "+y<CR>

" \m to remove annoying windows line breaks ^M
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

"-----------------------------
" UltiSnips: Snippets for Vim.
"-----------------------------
let g:snips_author='Bastian Koppelmann <kbastian@mail.upb.de'
let g:UltiSnipsEditSplit='vertical'
let g:UltiSnipsEnableSnipMate='no'
let g:UltiSnipsSnippetDirectories=[$HOME . '/.config/nvim/snippets']
let g:UltiSnipsExpandTrigger='<Tab>'
let g:UltiSnipsJumpForwardTrigger='<Tab>'
let g:UltiSnipsJumpBackwardTrigger='<S-Tab>'

"----------------------------------------------------------------------
" Swap settings
"----------------------------------------------------------------------
" Save your swp files to a less annoying place than the current directory.
" If you have .vim-swap in the current directory, it'll use that.
" Otherwise it saves it to ~/.vim/swap, ~/tmp or .

if isdirectory($HOME . '/.vim/swap') == 0
  :silent !mkdir -p ~/.vim/swap >/dev/null 2>&1
endif
set directory=./.vim-swap//
set directory+=~/.vim/swap//
set directory+=~/tmp//
set directory+=.

"----------------------------------------------------------------------
" Save session
"----------------------------------------------------------------------
" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.config/nvim/viminfo
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
