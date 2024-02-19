#!/usr/bin/env zsh

if (( $+commands[nvim] ))
then
  export EDITOR="nvim"
fi

export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=1000
export SAVEHIST=1000
setopt appendhistory
