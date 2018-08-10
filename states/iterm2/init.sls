{% set absolute_home_path =  salt['cmd.shell']('realpath $HOME') %}

{% if grains['os'] == 'MacOS' %}
include:
  - .install-macos
{% endif %}

iterm2-includes:
  file.recurse:
    - name: {{ absolute_home_path }}/.iterm2/
    - source: salt://{{ slspath }}/files/
    - clean: True
    - user: {{ grains['username'] }}
    - group: {{ grains['groupname'] }}

iterm2-shell-integration:
  file.managed:
    - name: {{ absolute_home_path }}/.iterm2_shell_integration.zsh
    - source: https://iterm2.com/shell_integration/zsh
    - user: {{ grains['username'] }}
    - group: {{ grains['groupname'] }}
    - unless: {{ absolute_home_path }}/.iterm2_shell_integration.zsh
