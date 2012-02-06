source ~/.bash/aliases
source ~/.bash/completions
source ~/.bash/paths
source ~/.bash/config
source ~/.bash/prompt
source ~/.bash/rvm

if [ -f ~/.localrc ]; then
  source ~/.localrc
fi
