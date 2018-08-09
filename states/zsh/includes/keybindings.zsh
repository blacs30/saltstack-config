zsh-forward-word () {
      local WORDCHARS="${WORDCHARS:s#/#}"
      WORDCHARS="${WORDCHARS:s#.#}"
      zle forward-word
    }
zle -N zsh-forward-word
bindkey '^[f' zsh-forward-word

zsh-backward-word () {
      local WORDCHARS="${WORDCHARS:s#/#}"
      WORDCHARS="${WORDCHARS:s#.#}"
      zle backward-word
    }
zle -N zsh-backward-word

bindkey '^[b' zsh-backward-word
bindkey '^[[3~' delete-char

backward-kill-not-greedy () {
    local WORDCHARS="${WORDCHARS:s#/#}"
    WORDCHARS="${WORDCHARS:s#.#}"
    zle backward-kill-word
}
zle -N backward-kill-not-greedy
bindkey \^W backward-kill-not-greedy
bindkey \^U backward-kill-line
