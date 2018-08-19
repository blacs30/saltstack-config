d12frosted/emacs-plus/emacs-plus:
  pkg.installed

brew link emacs-plus:
  cmd.run:
    - onchanges:
      - pkg: d12frosted/emacs-plus/emacs-plus
