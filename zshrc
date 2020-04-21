PROMPT='%B%F{cyan}%~%f%b '

autoload edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line
bindkey -v

alias vim=nvim
alias ls="ls -G"
