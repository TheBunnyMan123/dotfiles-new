#!/usr/bin/env zsh

if (( $+commands[eza] ))
then
  alias ls="eza --color=always --color-scale=all --color-scale-mode=fixed --icons=always"
  alias tree="ls --tree"
fi
alias ll="ls -alh"

if (( $+commands[bat] ))
then
  alias cat="bat"
fi

alias grep="grep --color=always"
