########################
# MANAGED by SALTSTACK
########################
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

zplug "paulmelnikow/zsh-startup-timer"

#if [[ "$OSTYPE" == darwin* ]] && [[ -n "$ITERM_SESSION_ID" ]] ; then
#  zplug "tysonwolker/iterm-tab-colors"
#fi

# zplug "plugins/command-not-found",      from:oh-my-zsh
zplug "plugins/colored-man-pages",      from:oh-my-zsh
zplug "plugins/colorize",               from:oh-my-zsh
zplug "plugins/history",               from:oh-my-zsh
zplug "plugins/z",                      from:oh-my-zsh
zplug "plugins/wd",                      from:oh-my-zsh
zplug "plugins/per-directory-history",  from:oh-my-zsh
zplug "hlissner/zsh-autopair", defer:2
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-history-substring-search", defer:3
zplug "desyncr/auto-ls"
zplug "EslamElHusseiny/aws_manager_plugin", from:github, use:"_aws_manager"
zplug "plugins/git",                    from:oh-my-zsh

#zplug "plugins/docker",                 from:oh-my-zsh, if:"(( $+commands[docker] ))"
#zplug "plugins/docker-compose",         from:oh-my-zsh, if:"(( $+commands[docker-compose] ))"
# zplug "plugins/dotenv",                 from:oh-my-zsh
#zplug "plugins/python",                 from:oh-my-zsh
# zplug "plugins/xcode",                  from:oh-my-zsh
# zplug "plugins/brew",                  from:oh-my-zsh
#zplug "plugins/vagrant",                  from:oh-my-zsh
#zplug "plugins/vagrant-prompt",                  from:oh-my-zsh
#zplug "plugins/heroku",                  from:oh-my-zsh, if:"(( $+commands[heroku] ))"
#zplug "plugins/jira",                  from:oh-my-zsh
#zplug "plugins/terraform",                from:oh-my-zsh
# zplug "plugins/sublime",                from:oh-my-zsh
# zplug "plugins/dash",                from:oh-my-zsh
#zplug "plugins/gitignore",                    from:oh-my-zsh
# zplug "mafredri/zsh-async", from:"github", use:"async.zsh"
#zplug "junegunn/fzf", use:"shell/*.zsh", as:plugin, if:"(( $+commands[fzf] ))"

##
## themes
#zplug sindresorhus/pure, use:pure.zsh, from:github, as:theme
#zplug "themes/agnoster", from:oh-my-zsh, as:theme
#zplug "eendroroy/alien"
zplug "zakaziko99/agnosterzak-ohmyzsh-theme", use:agnosterzak.zsh-theme

zplug load

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install; zplug load
    fi
fi


## disabled plugins
# zplug "plugins/kubectl",                from:oh-my-zsh
# zplug "plugins/kube-ps1",                from:oh-my-zsh
#zplug "rawkode/zsh-kubectl-context-switcher", from:gitlab
# zplug "plugins/minikube",                from:oh-my-zsh
#zplug "djui/alias-tips"
# zplug "plugins/github",                    from:oh-my-zsh, if:"(( $+commands[hub] ))"
# zplug "powerline/fonts",                from:github, lazy:true
# zplug "plugins/git-flow",                    from:oh-my-zsh, if:"$(git flow  > /dev/null 2>&1)"
# zplug "plugins/urltools",                from:oh-my-zsh
# zplug "plugins/sudo",                   from:oh-my-zsh
# zplug "plugins/forklift",                from:oh-my-zsh
# zplug "plugins/screen",                  from:oh-my-zsh
# zplug "plugins/osx",                  from:oh-my-zsh
# zplug "plugins/golang",                  from:oh-my-zsh
# zplug "plugins/swiftpm",                from:oh-my-zsh
# zplug "plugins/vault",                  from:oh-my-zsh
# zplug "plugins/pip",                 from:oh-my-zsh
# zplug "plugins/pep8",                 from:oh-my-zsh
# zplug "plugins/autopep8",                 from:oh-my-zsh
# zplug "plugins/django",                 from:oh-my-zsh
# zplug "Valiev/almostontop"
