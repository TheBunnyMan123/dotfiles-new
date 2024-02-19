#!/usr/bin/env zsh

export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=1000
export SAVEHIST=1000
setopt appendhistory

test -z "$TMUX" && (tmux attach || tmux new-session)

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

alias ls="eza --color=always --color-scale=all --color-scale-mode=fixed --icons=always"
alias ll="ls -alh"

alias tree="ls --tree"

alias cat="bat"

alias grep="grep --color=always"

eval "$(zoxide init zsh --cmd cd)"
