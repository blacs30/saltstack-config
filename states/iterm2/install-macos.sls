install or upgrade iterm2:
  cmd.run:
    - name: brew install caskroom/cask/iterm2
    - onlyif: if brew cask ls --versions | grep -q iterm2; then brew cask outdated | grep -q iterm2; else return 1; fi
