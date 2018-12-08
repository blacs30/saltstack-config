{% set absolute_home_path =  salt['cmd.shell']('echo $HOME') %}

{% if grains['os'] == 'MacOS' %}
install or upgrade hyper:
  cmd.run:
    - name: brew install caskroom/cask/hyper
    - onlyif: if brew cask ls --versions | grep -q hyper; then return 1; fi
{% endif %}

hyper-config-file:
  file.managed:
    - name: {{ absolute_home_path }}/.hyper.js
    - source: salt://{{ slspath }}/files/hyper.js
    - user: {{ grains['username'] }}
