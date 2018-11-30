install or upgrade emacs-plus:
  cmd.run:
    - name: brew install d12frosted/emacs-plus/emacs-plus
    - onlyif: if brew cask ls --versions | grep -q emacs-plus; then brew cask outdated | grep -q emacs-plus; else return 1; fi

install or upgrade emacs-mac:
  cmd.run:
    - name: brew install railwaycat/emacsmacport/emacs-mac
    - onlyif: if brew cask ls --versions | grep -q emacs-mac; then brew cask outdated | grep -q emacs-mac; else return 1; fi

link emacs-mac to applications:
  cmd.run:
  - name: ln -sf /usr/local/opt/emacs-mac/Emacs.app /Applications
  - require:
    - cmd: install or upgrade emacs-plus
