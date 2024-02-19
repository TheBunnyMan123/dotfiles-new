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

zstyle ':vcs_info:git:*' formats '%b '
NEWLINE=$'\n'

prompt() {
  if git rev-parse --git-dir > /dev/null 2>&1; then
    setopt PROMPT_SUBST
    PROMPT='%F{blue}%n%f%F{white}%f@%F{green}%m%f %B%F{white}:%f%b %F{magenta}%d%f %B%F{white}:%f%b %F{yellow} ${vcs_info_msg_0_}%f${NEWLINE}> '
  else
    setopt PROMPT_SUBST
    PROMPT='%F{blue}%n%f%F{white}%f@%F{green}%m%f %B%F{white}:%f%b %F{magenta}%d%f${NEWLINE}> '
  fi
}

precmd_functions=($precmd_functions prompt)

if (( $+commands[zoxide] ))
then
  eval "$(zoxide init zsh --cmd cd)"
fi
