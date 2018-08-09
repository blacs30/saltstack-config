zsh:
  pkg.installed

zplug:
  pkg.installed

{% set absolute_home_path =  salt['cmd.shell']('realpath $HOME') %}

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
