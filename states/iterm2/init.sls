{% set absolute_home_path =  salt['cmd.shell']('echo $HOME') %}

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

iterm2-shell-integration:
  file.managed:
    - name: {{ absolute_home_path }}/.iterm2_shell_integration.zsh
    - source: https://iterm2.com/shell_integration/zsh
    - user: {{ grains['username'] }}
    - unless: {{ absolute_home_path }}/.iterm2_shell_integration.zsh
    - skip_verify: True
    # - source_hash: sha256=ba64a23ecd849290dda1a5d9c0b58b8359499485acc9724dd26632ab5fb9a6ee
