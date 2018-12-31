base:
  'G@os:MacOs':
    - setup
    - dotfiles
    - packages
    - wifi-toggle
    # Profiles can only be installed by running sudo salt-call ...
    #- profiles
  'G@os:Raspbian':
    - setup
