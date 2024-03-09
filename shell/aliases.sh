#!/usr/bin/env zsh

if (( $+commands[eza] ))
then
  alias ls="eza --color=always --color-scale=all --color-scale-mode=fixed --icons=always"
  alias tree="ls --tree"

  alias gls="/dev/ls"
fi
alias ll="ls -alh"

if (( $+commands[bat] ))
then
  alias cat="bat"
  alias gcat="/bin/cat"
fi

alias grep="grep --color=always"

alias archwiki="w3m \"wiki.archlinux.org\""

alias rm="mvtotrash"

alias espeak="espeak -a 200 -g 0 -k 16 -p 46"
alias espeak-ng="espeak-ng -a 200 -g 0 -k 16 -p 46"
