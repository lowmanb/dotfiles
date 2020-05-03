PROMPT='%B%F{cyan}%~%f%b '

autoload edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line
bindkey -v

export EDITOR=nvim

alias vim=nvim
alias ls="ls -G"
alias no="$EDITOR ~/notes.md"

# homebrew zsh completions
if type brew &>/dev/null; then
  FPATH=/usr/local/share/zsh-completions:$FPATH
  autoload -Uz compinit
  compinit
fi
