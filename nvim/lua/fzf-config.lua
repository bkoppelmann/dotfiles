require'fzf-lua'.setup {
  -- ignore all '.lua' and '.vim' files
  grep = {
    rg_opts = "--column --line-number --no-heading --color=always --smart-case --max-columns=512 -g '!{.ccls-cache,.git}/*' -g '!tags'"
  }
}
