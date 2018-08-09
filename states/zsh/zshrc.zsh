source ~/.zsh/aliases.zsh
source ~/.zsh/common.zsh
source ~/.zsh/docker.zsh
source ~/.zsh/history.zsh
source ~/.zsh/keybindings.zsh
source ~/.zsh/paths.zsh

source ~/.zsh/zplug.zsh

#source ~/.zsh/powerlevel9k.zsh

# fzf Fuzzy Finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Load local overrides last
[ -f ~/.zshrc.local ] && source ~/.zshrc.local
