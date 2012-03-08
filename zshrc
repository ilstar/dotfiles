. ~/.zsh/config
. ~/.zsh/aliases
. ~/.zsh/completion

# use .localrc for settings specific to one system
[[ -f ~/.localrc ]] && . ~/.localrc

# use oh-my-zsh template if it exists
[[ -f ~/.oh-my-zsh/templates/zshrc.zsh-template ]] && . ~/.oh-my-zsh/templates/zshrc.zsh-template
