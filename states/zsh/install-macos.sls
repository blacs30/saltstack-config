install or upgrade zplug:
  cmd.run:
    - name: brew install zplug
    - onlyif: if brew cask ls --versions | grep -q zplug; then brew cask outdated | grep -q zplug; else return 1; fi

install or upgrade zsh:
  cmd.run:
    - name: brew install zsh
    - onlyif: if brew cask ls --versions | grep -q zsh; then brew cask outdated | grep -q zsh; else return 1; fi

{% set absolute_home_path =  salt['cmd.shell']('echo $HOME') %}

backup-existing-zsh-config:
  file.rename:
    - name: {{ absolute_home_path }}/.zshrc.bkp
    - source: $HOME/.zshrc
    - unless:
        - test -f {{ absolute_home_path }}/.zshrc.bkp
        - test -f {{ absolute_home_path }}/.zshrc

{% if grains['shell'] != '/bin/zsh' %}
make-zsh-default-shell:
  cmd.run:
    - name: chsh -s $(grep /zsh$ /etc/shells | tail -1)
{% endif %}
