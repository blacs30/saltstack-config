d12frosted/emacs-plus/emacs-plus:
  pkg.installed

railwaycat/emacsmacport/emacs-mac:
  pkg.installed

link emacs-mac to applications:
  cmd.run:
  - name: ln -s /usr/local/opt/emacs-mac/Emacs.app /Applications
  - require:
    - pkg: railwaycat/emacsmacport/emacs-mac
