{% set absolute_home_path =  salt['cmd.shell']('echo $HOME') %}

{% if grains['os'] == 'MacOS' %}
include:
  - .install-macos
{% endif %}

vscode-config:
  file.managed:
    - name: {{ absolute_home_path }}/Library/Application Support/Code/User/settings.json
    - source: salt://{{ slspath }}/files/settings.json
    - user: {{ grains['username'] }}
    - makedirs: True

{% from "vscode/extensions.jinja" import extensions with context %}
{% for ext in extensions %}
install-vscode-extension-{{ ext }}:
  cmd.run:
    - name: code --install-extension {{ ext }}
{% endfor %}