# /etc/bash.bashrc
#
# https://wiki.archlinux.org/index.php/Color_Bash_Prompt
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output. So make sure this doesn't display
# anything or bad things will happen !

# Test for an interactive shell. There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.

# If not running interactively, don't do anything!
[[ $- != *i* ]] && return

# Bash won't get SIGWINCH if another process is in the foreground.
# Enable checkwinsize so that bash will check the terminal size when
# it regains control.
# http://cnswww.cns.cwru.edu/~chet/bash/FAQ (E11)
shopt -s checkwinsize

# Enable history appending instead of overwriting.
shopt -s histappend

# fortune is a simple program that displays a pseudorandom message
# from a database of quotations at logon and/or logout.
# If you wish to use it, please install "fortune-mod" from the
# official repositories, then uncomment the following line:

[[ "$PS1" ]] && /usr/bin/fortune -a

# Enable colors for ls, etc. Prefer ~/.dir_colors
if type -P dircolors >/dev/null ; then
    if [[ -f ~/.dir_colors ]] ; then
        eval $(dircolors -b ~/.dir_colors)
    elif [[ -f /etc/DIR_COLORS ]] ; then
        eval $(dircolors -b /etc/DIR_COLORS)
    fi
fi

PS1="\[\033[0;37m\]\342\224\214\342\224\200\$([[ \$? != 0 ]] && echo \"[\[\033[0;31m\]\342\234\227\[\033[0;37m\]]\342\224\200\")[$(if [[ ${EUID} == 0 ]]; then echo '\[\033[0;31m\]\h'; else echo '\[\033[1;32m\]\u\[\033[0;37m\]@\[\033[1;34m\]\h';fi)\[\033[0;37m\]]\342\224\200[\[\033[1;31m\]\w\[\033[0;37m\]]\n\[\033[0;37m\]\342\224\224\342\224\200\342\224\200\342\225\274 \[\033[0m\]"


alias ls="ls --color=auto"
alias dir="dir --color=auto"
alias grep="grep --color=auto --exclude=tags"
alias dmesg='dmesg --color'
alias pacman="pacman --color=auto"
alias videv="nvim -u ~/.config/nvim/dev.lua"

PS2="> "
PS3="> "
PS4="+ "

stty -ixon
# c-w deletes words
stty werase undef
bind '\C-w:unix-filename-rubout'

if [ "$PS1" ]; then
complete -cf sudo
fi

set -o vi

man() {
    env LESS_TERMCAP_mb=$'\E[01;31m' \
    LESS_TERMCAP_md=$'\E[01;38;5;74m' \
    LESS_TERMCAP_me=$'\E[0m' \
    LESS_TERMCAP_se=$'\E[0m' \
    LESS_TERMCAP_so=$'\E[38;5;246m' \
    LESS_TERMCAP_ue=$'\E[0m' \
    LESS_TERMCAP_us=$'\E[04;38;5;146m' \
    man "$@"
}

export TERM=xterm-256color

alias ls="ls -la --color=auto"
alias pu="sudo pacman -Syu"
alias ducks='du -cks * | sort -rn | head'
alias vi='nvim'
alias kw='date +"%V"'

export SWT_GTK3=0
export EDITOR=nvim
source /usr/share/git/completion/git-completion.bash
