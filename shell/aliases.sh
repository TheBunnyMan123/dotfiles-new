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
