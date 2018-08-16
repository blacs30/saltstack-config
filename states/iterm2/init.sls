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
    - source_hash: sha256=f401d20df00873bcc4bebef5fcf4471ecbcffe2370c6a0871ee8957783d6e6fc
