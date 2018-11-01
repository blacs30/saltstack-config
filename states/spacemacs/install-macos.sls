install or upgrade emacs-plus:
  cmd.run:
    - name: brew upgrade d12frosted/emacs-plus/emacs-plus || brew install d12frosted/emacs-plus/emacs-plus

install or upgrade emacs-mac:
  cmd.run:
    - name: brew upgrade railwaycat/emacsmacport/emacs-mac || brew install railwaycat/emacsmacport/emacs-mac

link emacs-mac to applications:
  cmd.run:
  - name: ln -sf /usr/local/opt/emacs-mac/Emacs.app /Applications
  - require:
    - cmd: install or upgrade emacs-plus
