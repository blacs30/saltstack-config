install or upgrade sublime-text:
  cmd.run:
    - name: brew install caskroom/cask/sublime-text
    - onlyif: if brew cask ls --versions | grep -q sublime-text; then brew cask outdated | grep -q sublime-text; else return 1; fi 
