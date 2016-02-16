"""""""""""""""""""""""""
"  generic 
"""""""""""""""""""""""""
syntax on                   " Enable syntax highlighting
set hlsearch                " Highligh searches
set tabstop=4               " Tabs width in spaces
set shiftwidth=4            " Amount of spaces when shifting in visual mode
set cursorline              " Highlight the line the cursor is on
set expandtab               " expand tabs to 'tabstop'
set scrolloff=999           " Keep the cursor centered in the screen

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
"  Key remappings
"""""""""""""""""""""""""

"Breaking habbits :D
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

"NERDTree
noremap <silent> <C-L>  :NERDTreeToggle<CR>

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
noremap <silent> <C-S>          :update<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>
inoremap <silent> <C-S>         <C-O>:update<CR>

"""""""""""""""""""""""""
" load c, cpp specifics
"""""""""""""""""""""""""
au Filetype c source ~/.config/vim/c.vim
au Filetype cpp source ~/.config/vim/cpp.vim
au Filetype tex,latex source ~/.config/vim/tex.vim
autocmd BufWinEnter *.td source ~/.config/vim/tablegen.vim
