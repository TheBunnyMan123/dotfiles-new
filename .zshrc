#!/usr/bin/env zsh

if (( $+commands[tmux] ))
then
  test -z "$TMUX" && (tmux attach &> /dev/null || tmux new-session)
fi

for file in ~/shell/*
do
  FULLPATH=$(realpath $file)
  source $FULLPATH
done

autoload -Uz vcs_info
precmd() { vcs_info }
