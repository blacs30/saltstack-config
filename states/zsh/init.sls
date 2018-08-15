{% set absolute_home_path =  salt['cmd.shell']('realpath $HOME') %}

{% if grains['os'] == 'MacOS' %}
include:
  - .install-macos

zsh-zshrc:
  file.managed:
    - name: {{ absolute_home_path }}/.zshrc
    - source: salt://{{ slspath }}/zshrc.zsh
    - user: {{ grains['username'] }}
    - group: {{ grains['groupname'] }}


zsh-zshenv:
  file.managed:
    - name: {{ absolute_home_path }}/.zshenv
    - source: salt://{{ slspath }}/zshenv.zsh
    - user: {{ grains['username'] }}
    - group: {{ grains['groupname'] }}


zsh-zshlogin:
  file.managed:
    - name: {{ absolute_home_path }}/.zlogin
    - source: salt://{{ slspath }}/zlogin.zsh
    - user: {{ grains['username'] }}
    - group: {{ grains['groupname'] }}

{% else %}

zsh-zplug-install:
  git.latest:
    - name: https://github.com/zplug/zplug
    - target: {{ absolute_home_path }}/.zplug
    - depth: 1
    - rev: master
    - force_reset: True
    - user: {{ grains['username'] }}
    - unless: test -d {{ absolute_home_path }}/.zplug

{% endif %}

zsh-zshrc-includes:
  file.recurse:
    - name: {{ absolute_home_path }}/.zsh
    - source: salt://zsh/includes/
    - clean: True
    - user: {{ grains['username'] }}
    - group: {{ grains['groupname'] }}
