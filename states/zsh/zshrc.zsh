source ~/.zsh/aliases.zsh
source ~/.zsh/common.zsh
source ~/.zsh/docker.zsh
source ~/.zsh/history.zsh
source ~/.zsh/keybindings.zsh
source ~/.zsh/paths.zsh

#zmodload zsh/zprof
source ~/.zsh/zplug.zsh
#zprof

# fzf Fuzzy Finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Load local overrides last
[ -f ~/.zshrc.local ] && source ~/.zshrc.local
