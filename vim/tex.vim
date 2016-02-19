"Highlight chars over 80
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
match ErrorMsg '\%>80v.\+'
