install or upgrade vscode:
  cmd.run:
    - name: brew upgrade homebrew/cask/visual-studio-code || brew install homebrew/cask/visual-studio-code
    - onlyif: if brew cask ls --versions | grep -q visual-studio-code; then brew cask outdated | grep -q visual-studio-code; else return 1; fi
