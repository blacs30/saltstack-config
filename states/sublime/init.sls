{% set absolute_home_path =  salt['cmd.shell']('echo $HOME') %}

{% if grains['os'] == 'MacOS' %}
include:
  - .install-macos
{% endif %}

sublime-config:
  file.recurse:
    - name: {{ absolute_home_path }}/Library/Application Support/Sublime Text 3/Packages/User/
    - source: salt://{{ slspath }}/files/
    - user: {{ grains['username'] }}
    - makedirs: True

install-package-control:
  file.managed:
    - name: {{ absolute_home_path }}/Library/Application Support/Sublime Text 3/Installed Packages/Package Control.sublime-package
    - source: https://packagecontrol.io/Package%20Control.sublime-package
    - user: {{ grains['username'] }}
    - makedirs: True
    - skip_verify: True
    # - source_hash: sha256=6f4c264a24d933ce70df5dedcf1dcaeeebe013ee18cced0ef93d5f746d80ef60
