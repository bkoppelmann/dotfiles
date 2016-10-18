"Highlight chars over 80
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
match ErrorMsg '\%>80v.\+'

" Always assume latex
let g:tex_flavor = "latex"
