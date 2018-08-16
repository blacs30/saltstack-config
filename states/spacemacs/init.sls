{% set absolute_home_path =  salt['cmd.shell']('echo $HOME') %}

{% if grains['os'] == 'MacOS' %}
include:
  - .install-macos
{% endif %}

spacemacs-config:
  file.managed:
    - name: {{ absolute_home_path }}/.spacemacs
    - source: salt://{{ slspath }}/files/spacemacs
    - user: {{ grains['username'] }}

spacemacs-install:
  git.latest:
    - name: https://github.com/syl20bnr/spacemacs
    - target: {{ absolute_home_path }}/.emacs.d
    - force_reset: True
    - user: {{ grains['username'] }}
    - unless: test -d {{ absolute_home_path }}/.emacs.d
