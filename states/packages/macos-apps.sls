{% from "packages/packages.jinja" import mas_apps with context %}
{% from "packages/packages.jinja" import mac_cask_packages with context %}
{% set absolute_home_path =  salt['cmd.shell']('echo $HOME') %}

{% for app in mas_apps %}
mas-{{ app }}:
  cmd.run:
    - name: mas install  {{ mas_apps[app] }}
    - unless: mas list | grep -q {{ mas_apps[app] }}
    - require:
        - pkg: mas
{% endfor %}


{% for package in mac_cask_packages %}
brew-{{ package }}:
  pkg.installed:
    - name: {{ package }}
    - unless: if [[ {{ package }} == *"cask"* ]]; then brew cask list | grep $(basename {{ package }}); else brew list | grewp $(basename package);fi
{% endfor %}
