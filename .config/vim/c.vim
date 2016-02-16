" show red lines if over 80 chars
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
match ErrorMsg '\%>80v.\+'
" delete trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e
" clean up var,var => var, var
map <Leader>c :%s/, \@!/, /g<CR>
