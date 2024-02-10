# Auto tmux
test -z "$TMUX" && (tmux attach || tmux new-session)

# Prompt command
prompt() {
  PS1=$(bunny-prompt)
}

# Set prompt command
PROMPT_COMMAND=prompt

# GNU Coreutil config
alias ls="ls -p -F --color\=auto"
alias grep="grep --color\=auto"
