"""""""""""""""""""""""""
"  generic 
"""""""""""""""""""""""""
syntax on                   " Enable syntax highlighting
set hlsearch                " Highligh searches
set tabstop=4               " Tabs width in spaces
set shiftwidth=4            " Amount of spaces when shifting in visual mode
set cursorline              " Highlight the line the cursor is on
set expandtab               " expand tabs to 'tabstop'
set relativenumber          " set relative line numbers
set scrolloff=999           " Keep the cursor centered in the screen
set list lcs=tab:»·         " Show tabs
set backspace=2             " Backspace deletes like most programs in insert mode
set wildmenu                " Enhance command-line completion
set wrapscan                " set the search scan to wrap lines
set tags=tags;/             " Search for tags file until found

hi Search cterm=NONE ctermfg=red ctermbg=green
let mapleader = "ö"
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
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_theme='murmur'

"""""""""""""""""""""""""
"  CtrlP ignores
"""""""""""""""""""""""""

let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]((\.(git|hg|svn))|target$)',
    \ 'file': '\v((\.(exe|so|dll|class|cache|jar|))|tags)$',
    \ }

"""""""""""""""""""""""""
"  Key remappings
"""""""""""""""""""""""""

"Breaking habbits :D
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

"NERDTree
noremap <silent> <Leader>l  :NERDTreeToggle<CR>
"Toggle Linenumbers
map <Leader>c :set relativenumber!<CR>
" Remove diff +
map <Leader>+ :%s/^[+]//<CR>
" Remove trailing whitespaces
map <Leader>w :%s/\s\+$//e<CR>
" ctrl-c to copy
map <C-c> "+y<CR>      

" \m to remove annoying windows line breaks ^M
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" If the current buffer has never been saved, it will have no name,
" call the file browser to save it, otherwise just save it.
command -nargs=0 -bar Update if &modified 
                           \|    if empty(bufname('%'))
                           \|        browse confirm write
                           \|    else
                           \|        confirm write
                           \|    endif
                           \|endif
" ctrl-s to save keeping the current mode
noremap <silent> <Leader>s          :update<CR>
vnoremap <silent> <Leader>s         <C-C>:update<CR>
inoremap <silent> <Leader>s         <C-O>:update<CR>
""""""""""""""""""""""""
" load c, cpp specifics
"""""""""""""""""""""""""
au Filetype c source ~/.config/vim/c.vim
au Filetype cpp source ~/.config/vim/cpp.vim
au Filetype tex,latex source ~/.config/vim/tex.vim
au Filetype lua source ~/.config/vim/lua.vim
autocmd BufWinEnter *.td source ~/.config/vim/tablegen.vim

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
set viminfo='10,\"100,:20,%,n~/.vim/viminfo
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

if exists("+undofile")
  " undofile - This allows you to use undos after exiting and restarting
  " This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
  " :help undo-persistence
  " This is only present in 7.3+
  if isdirectory($HOME . '/.vim/undo') == 0
    :silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
  endif
  set undodir=./.vim-undo//
  set undodir+=~/.vim/undo//
  set undofile
endif
